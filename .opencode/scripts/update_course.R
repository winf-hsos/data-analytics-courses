# Brings this course folder up to date with the newest course version.
#
# Run it from the course folder (this is how the command in OpenCode calls it):
#
#     Rscript .opencode/scripts/update_course.R
#
# or in Positron/RStudio with getwd() = course folder:
#
#     source(".opencode/scripts/update_course.R")
#
# Works for both ways in which the course folder can have been created:
#
# - downloaded as a ZIP (the usual case): the newest ZIP is downloaded and
#   unpacked over the folder. Git is not needed for this.
# - cloned with Git (the alternative): the folder is reset to the newest
#   version with Git.
#
# Rules of the course folder, the same for both ways:
#
# - my-code/ and data/ belong to the students. Nothing in there is ever
#   changed or deleted - except my-code/README.md and data/README.md, which
#   belong to the course and are updated.
# - Everything else belongs to the course and is read-only for students.
#   Changed course files are overwritten, foreign files in course/,
#   .opencode/commands, .opencode/procedures and .opencode/scripts are
#   removed, and in a Git clone the student's own commits are removed.
# - The module comes from the line "- module: <id>" in my-code/about-me.md.
#   Templates from course/modules/<id>/templates/<name>/ are copied to
#   my-code/<name>/ if that does not exist yet. Never overwritten.
# - R packages listed in course/packages.txt and, if present, in
#   course/modules/<id>/packages.txt (one name per line, # starts a
#   comment) are installed if missing.
# - Without a known module no templates are copied and only
#   course/packages.txt is used.
#
# The output is plain text so that the course assistant can explain the
# result. The environment variable COURSE_ZIP overrides the ZIP address
# (for tests; a local path or a file: URL also works).
#
# Everything is wrapped in local({ ... }) so that source() leaves nothing in
# the global environment, and so that R reads the whole script before it
# runs (the script may overwrite itself while updating).

local({

  SCRIPT_NAME <- "update_course.R"
  COURSE_ZIP_DEFAULT <- "https://github.com/winf-hsos/data-analytics-courses/archive/refs/heads/main.zip"
  BRANCH <- "main"
  CRAN <- "https://cloud.r-project.org"
  # Folders that belong entirely to the course; files in there that are not
  # part of the course are removed. .opencode/ itself is not in the list
  # because OpenCode keeps its own files there.
  COURSE_ONLY <- c("course", ".opencode/commands", ".opencode/procedures", ".opencode/scripts")
  # Student areas, and the files in them that belong to the course anyway.
  STUDENT_AREAS <- c("my-code", "data")
  EXCEPTIONS <- c("my-code/README.md", "data/README.md")
  # ZIP way only: checksums of the course files unpacked last time, in .opencode/
  STATE_FILE <- ".course-state"
  # Where the student's module is recorded
  ABOUT_ME <- "my-code/about-me.md"

  # --- Output and aborting ----------------------------------------------------

  say <- function(...) {
    cat(..., "\n", sep = "")
    utils::flush.console()
  }

  # Abort at a point where certainly nothing has been changed yet.
  abort <- function(problem, advice) {
    stop(structure(class = c("course_abort", "error", "condition"),
                   list(message = problem, call = NULL, advice = advice)))
  }

  # Error in the middle of the work (corresponds to RuntimeError in the Python original).
  fail <- function(text) {
    stop(structure(class = c("course_error", "error", "condition"),
                   list(message = text, call = NULL)))
  }

  # --- Find the root folder ---------------------------------------------------

  # Returns list(file = path of the script or NA, rscript = TRUE/FALSE).
  find_script <- function() {
    # 1. via source(): the innermost source() level that reads this script
    for (r in rev(sys.frames())) {
      of <- get0("ofile", envir = r, inherits = FALSE)
      if (is.character(of) && length(of) == 1 && basename(of) == SCRIPT_NAME &&
          file.exists(of)) {
        return(list(file = of, rscript = FALSE))
      }
    }
    # 2. via Rscript: the argument --file=
    args <- commandArgs(trailingOnly = FALSE)
    file <- sub("^--file=", "", args[grepl("^--file=", args)])
    if (length(file) == 1) {
      # Rscript sometimes encodes spaces in the path as ~+~
      if (!file.exists(file)) file <- gsub("~+~", " ", file, fixed = TRUE)
      if (basename(file) == SCRIPT_NAME && file.exists(file)) {
        return(list(file = file, rscript = TRUE))
      }
    }
    # 3. fallback: the working directory is the course folder
    candidate <- file.path(getwd(), ".opencode", "scripts", SCRIPT_NAME)
    if (file.exists(candidate)) return(list(file = candidate, rscript = FALSE))
    list(file = NA_character_, rscript = FALSE)
  }

  # --- File helpers -----------------------------------------------------------

  # Append a relative path with / to a folder.
  join_path <- function(base, rel) {
    do.call(file.path, as.list(c(base, strsplit(rel, "/", fixed = TRUE)[[1]])))
  }

  is_student_path <- function(p) {
    p %in% STUDENT_AREAS | startsWith(p, "my-code/") | startsWith(p, "data/")
  }

  # Copy byte by byte so that line endings and UTF-8 stay unchanged.
  copy_bytes <- function(from, to) {
    dir.create(dirname(to), recursive = TRUE, showWarnings = FALSE)
    n <- file.size(from)
    content <- if (is.na(n) || n == 0) raw(0) else readBin(from, "raw", n)
    writeBin(content, to)
  }

  same_file <- function(a, b) {
    if (!file.exists(b) || dir.exists(b)) return(FALSE)
    if (!identical(file.size(a), file.size(b))) return(FALSE)
    identical(unname(tools::md5sum(a)), unname(tools::md5sum(b)))
  }

  short_list <- function(x, max = 10) {
    if (length(x) <= max) return(paste(x, collapse = ", "))
    paste0(paste(x[seq_len(max)], collapse = ", "), " und ", length(x) - max, " weitere")
  }

  # --- Download ---------------------------------------------------------------

  ADVICE_NETWORK <- "Pr\u00fcfe deine Internetverbindung und versuche es noch einmal. Details: "

  # Returns the path of a local ZIP file.
  fetch_zip <- function(address, target) {
    if (!grepl("^[A-Za-z][A-Za-z0-9+.-]*://", address) && !grepl("^file:", address)) {
      # local path (tests only)
      if (!file.exists(address)) {
        abort("Die neueste Kursversion konnte nicht heruntergeladen werden.",
              paste0(ADVICE_NETWORK, "Datei nicht gefunden: ", address))
      }
      return(address)
    }
    old <- options(timeout = max(120, getOption("timeout")))
    on.exit(options(old), add = TRUE)
    messages <- character()
    ok <- withCallingHandlers(
      tryCatch({
        status <- utils::download.file(address, target, mode = "wb", quiet = TRUE)
        identical(as.integer(status), 0L)
      }, error = function(e) {
        messages <<- c(messages, conditionMessage(e))
        FALSE
      }),
      warning = function(w) {
        messages <<- c(messages, conditionMessage(w))
        invokeRestart("muffleWarning")
      })
    if (!ok || !file.exists(target) || is.na(file.size(target)) || file.size(target) == 0) {
      details <- paste(unique(messages), collapse = " ")
      if (!nzchar(details)) details <- "keine Daten empfangen"
      abort("Die neueste Kursversion konnte nicht heruntergeladen werden.",
            paste0(ADVICE_NETWORK, substr(details, 1, 300)))
    }
    target
  }

  # --- The ZIP way ------------------------------------------------------------

  update_from_zip <- function(root) {
    work <- tempfile("update_course_")
    dir.create(work)
    on.exit(unlink(work, recursive = TRUE, force = TRUE), add = TRUE)

    address <- Sys.getenv("COURSE_ZIP", COURSE_ZIP_DEFAULT)
    if (!nzchar(address)) address <- COURSE_ZIP_DEFAULT
    zip_file <- fetch_zip(address, file.path(work, "course.zip"))

    damaged <- function() {
      abort("Die heruntergeladene Kursversion ist besch\u00e4digt.",
            "Versuche es in ein paar Minuten noch einmal.")
    }
    listing <- tryCatch(suppressWarnings(utils::unzip(zip_file, list = TRUE)),
                        error = function(e) NULL)
    if (is.null(listing) || !nrow(listing)) damaged()
    names_zip <- listing$Name[!endsWith(listing$Name, "/")]

    # Unpack; on problems (e.g. non-ASCII names) file by file.
    unpacked <- file.path(work, "unpacked")
    dir.create(unpacked)
    all_at_once <- tryCatch({
      suppressWarnings(utils::unzip(zip_file, exdir = unpacked))
      TRUE
    }, error = function(e) FALSE)
    if (!all_at_once) {
      for (n in names_zip) {
        try(suppressWarnings(utils::unzip(zip_file, files = n, exdir = unpacked)),
            silent = TRUE)
      }
    }

    # cut off the top folder ("data-analytics-courses-main/")
    inner <- ifelse(grepl("/", names_zip, fixed = TRUE), sub("^[^/]*/", "", names_zip), names_zip)
    keep <- nzchar(inner) & (!is_student_path(inner) | inner %in% EXCEPTIONS)
    names_zip <- names_zip[keep]
    inner <- inner[keep]
    if (!length(inner)) damaged()

    # State of the last update (checksums), to tell the student's own changes
    # to course files apart from new course material. The Python original
    # does not have this; without a state file (first run) every differing
    # file counts as new course material.
    state_file <- file.path(root, ".opencode", STATE_FILE)
    old_state <- read_state(state_file)
    new_state <- character()

    changed <- character()
    own_edits <- character()
    not_unpacked <- character()
    for (i in order(inner)) {
      source_file <- join_path(unpacked, names_zip[i])
      if (!file.exists(source_file)) {
        not_unpacked <- c(not_unpacked, inner[i])
        next
      }
      checksum <- unname(tools::md5sum(source_file))
      new_state[inner[i]] <- checksum
      target <- join_path(root, inner[i])
      if (same_file(source_file, target)) next
      before <- old_state[inner[i]]
      if (!is.na(before) && file.exists(target) && !dir.exists(target) &&
          !identical(unname(tools::md5sum(target)), unname(before))) {
        own_edits <- c(own_edits, inner[i])   # changed by the student
      }
      copy_bytes(source_file, target)
      if (is.na(before) || !identical(checksum, unname(before))) {
        changed <- c(changed, inner[i])   # new from the course
      }
    }
    write_state(state_file, new_state)

    removed <- character()
    for (area in COURSE_ONLY) {
      base <- join_path(root, area)
      if (!dir.exists(base)) next
      files <- list.files(base, recursive = TRUE, all.files = TRUE, no.. = TRUE)
      for (f in sort(files)) {
        rel <- paste0(area, "/", f)
        if (!(rel %in% inner)) {
          unlink(join_path(root, rel), force = TRUE)
          removed <- c(removed, rel)
        }
      }
      # remove subfolders that became empty, deepest first
      dirs <- setdiff(list.dirs(base, recursive = TRUE, full.names = TRUE), base)
      dirs <- dirs[order(nchar(dirs), decreasing = TRUE)]
      for (d in dirs) {
        if (!length(list.files(d, all.files = TRUE, no.. = TRUE))) {
          unlink(d, recursive = TRUE, force = TRUE)
        }
      }
    }

    known_top <- inner[!grepl("/", inner, fixed = TRUE)]
    top <- list.files(root, all.files = FALSE)
    loose <- top[!dir.exists(file.path(root, top)) & !(top %in% known_top) &
                   !startsWith(top, ".")]

    list(changed = changed, reset = c(own_edits, removed), loose = sort(loose),
         commits = character(), kept = character(), not_unpacked = not_unpacked)
  }

  # State file: one line per file, checksum, tab, path.
  read_state <- function(path) {
    if (!file.exists(path)) return(character())
    lines <- tryCatch(readLines(path, warn = FALSE, encoding = "UTF-8"),
                      error = function(e) character())
    parts <- strsplit(lines[grepl("\t", lines, fixed = TRUE)], "\t", fixed = TRUE)
    parts <- parts[lengths(parts) == 2]
    stats::setNames(vapply(parts, `[`, "", 1), vapply(parts, `[`, "", 2))
  }

  write_state <- function(path, state) {
    try({
      dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
      con <- file(path, open = "wb")
      on.exit(close(con), add = TRUE)
      writeLines(enc2utf8(paste0(unname(state), "\t", names(state))), con, sep = "\n",
                 useBytes = TRUE)
    }, silent = TRUE)
  }

  # --- The Git way ------------------------------------------------------------

  git_exe <- ""

  # Runs git; returns list(status, out, err). system2 quotes the command
  # itself; arguments containing paths are quoted with shQuote().
  # With out_file the output goes byte for byte into that file.
  git_raw <- function(root, ..., out_file = NULL) {
    # core.longpaths: allow long paths (e.g. deep in OneDrive) on Windows
    args <- c("-c", "core.quotePath=false", "-c", "core.longpaths=true",
              "-C", shQuote(root), ...)
    err_file <- tempfile("git_err_")
    on.exit(unlink(err_file), add = TRUE)
    if (is.null(out_file)) {
      out <- suppressWarnings(system2(git_exe, args, stdout = TRUE, stderr = err_file))
      status <- attr(out, "status")
      if (is.null(status)) status <- 0L
    } else {
      status <- suppressWarnings(system2(git_exe, args, stdout = out_file,
                                         stderr = err_file))
      out <- character()
    }
    err <- if (file.exists(err_file)) readLines(err_file, warn = FALSE) else character()
    out <- as.character(out)
    Encoding(out) <- "UTF-8"
    Encoding(err) <- "UTF-8"
    list(status = status, out = out, err = paste(err, collapse = "\n"))
  }

  git <- function(root, ..., check = TRUE) {
    r <- git_raw(root, ...)
    if (check && r$status != 0) {
      fail(paste0("git ", paste(c(...), collapse = " "), " ist fehlgeschlagen:\n",
                  trimws(r$err)))
    }
    r$out[nzchar(r$out)]
  }

  # On Windows Rscript keeps the running script open; git reset then cannot
  # delete and recreate it and aborts halfway. So bring the script to the
  # target state ourselves first (overwriting the content works) and add it
  # to the index - then reset --hard leaves the file alone.
  update_script_first <- function(root, target) {
    rel <- paste0(".opencode/scripts/", SCRIPT_NAME)
    object <- paste0(target, ":", rel)
    if (git_raw(root, "cat-file", "-e", shQuote(object))$status != 0) return(invisible())
    new_file <- tempfile("course_script_")
    on.exit(unlink(new_file), add = TRUE)
    r <- git_raw(root, "cat-file", "--filters", shQuote(object), out_file = new_file)
    if (r$status != 0 || !file.exists(new_file)) return(invisible())
    local_file <- join_path(root, rel)
    if (!same_file(new_file, local_file)) copy_bytes(new_file, local_file)
    git(root, "add", "--", shQuote(rel), check = FALSE)
    invisible()
  }

  update_from_git <- function(root) {
    git_exe <<- unname(Sys.which("git"))
    if (!nzchar(git_exe)) {
      abort("Dieser Ordner wurde mit Git geklont, aber Git wurde nicht gefunden.",
            "Installiere Git neu (siehe Installationsanleitung) und starte OpenCode danach neu.")
    }
    fetched <- git_raw(root, "fetch", "--quiet", "origin", BRANCH)
    if (fetched$status != 0) {
      details <- trimws(fetched$err)
      details <- substr(details, max(1, nchar(details) - 299), nchar(details))
      abort("Die neueste Kursversion konnte nicht heruntergeladen werden.",
            paste0(ADVICE_NETWORK, details))
    }
    target <- paste0("origin/", BRANCH)
    before <- git(root, "rev-parse", "HEAD")
    commits <- git(root, "rev-list", paste0(target, "..HEAD"), check = FALSE)
    touched <- git(root, "diff", "--name-only", "HEAD")
    extra <- git(root, "ls-files", "--others", "--exclude-standard", "--", shQuote(COURSE_ONLY))
    # Unlike the Python original: count new course material from the common
    # ancestor, so that the student's own commits do not count as course
    # material; the files from those commits are reported as reset.
    base <- git(root, "merge-base", "HEAD", target, check = FALSE)
    if (length(base) != 1) base <- before
    changed <- git(root, "diff", "--name-only", base, target, check = FALSE)
    if (length(commits)) {
      touched <- c(git(root, "diff", "--name-only", base, "HEAD", check = FALSE), touched)
    }

    # Protection for my-code/ and data/: files in there that were added to
    # Git (e.g. with git add -f) would be deleted or reset by reset --hard.
    # Back them up first and restore them afterwards.
    tracked <- setdiff(git(root, "ls-files", "--", shQuote(STUDENT_AREAS)), EXCEPTIONS)
    tracked <- tracked[vapply(tracked, function(p) {
      file.exists(join_path(root, p)) && !dir.exists(join_path(root, p))
    }, logical(1))]
    backup <- tempfile("course_backup_")
    on.exit(unlink(backup, recursive = TRUE, force = TRUE), add = TRUE)
    for (p in tracked) copy_bytes(join_path(root, p), join_path(backup, p))

    kept <- character()
    tryCatch({
      update_script_first(root, target)
      git(root, "reset", "--quiet", "--hard", target)
      git(root, "clean", "--quiet", "-f", "-d", "--", shQuote(COURSE_ONLY))
    }, finally = {
      # even if git fails: restore the students' files
      for (p in tracked) {
        if (!same_file(join_path(backup, p), join_path(root, p))) {
          copy_bytes(join_path(backup, p), join_path(root, p))
          kept <- c(kept, p)
        }
      }
    })

    loose <- git(root, "ls-files", "--others", "--exclude-standard")
    loose <- loose[!is_student_path(loose)]
    touched <- unique(touched[!is_student_path(touched) | touched %in% EXCEPTIONS])
    list(changed = changed, reset = unique(c(touched, extra)), loose = loose,
         commits = commits, kept = kept, not_unpacked = character())
  }

  # --- After both ways --------------------------------------------------------

  # Reads the module from my-code/about-me.md. Returns list(id, state, modules):
  # state is "known", "no_file", "no_line" or "not_in_course"; modules lists
  # the module folders that exist in the course.
  find_module <- function(root) {
    modules_dir <- file.path(root, "course", "modules")
    modules <- if (dir.exists(modules_dir)) sort(basename(list.dirs(modules_dir, recursive = FALSE))) else character()
    about_me <- join_path(root, ABOUT_ME)
    if (!file.exists(about_me) || dir.exists(about_me)) {
      return(list(id = NA_character_, state = "no_file", modules = modules))
    }
    lines <- tryCatch(readLines(about_me, warn = FALSE, encoding = "UTF-8"),
                      error = function(e) character())
    # drop invalid bytes (e.g. a file saved as Latin-1) and a byte order mark
    lines <- sub("^\ufeff", "", iconv(lines, "UTF-8", "UTF-8", sub = ""))
    # tolerant: "- module: x", "* Module : X", "**module:** x", "module: `x`"
    hits <- lines[grepl("^\\s*([-*+]\\s*)?[*_]*\\s*module\\s*[*_]*\\s*:", lines,
                        ignore.case = TRUE, perl = TRUE)]
    id <- if (length(hits)) sub("^[^:]*:", "", hits[1]) else ""
    id <- substr(tolower(trimws(gsub("[*_`\"'<>]", "", id))), 1, 60)
    if (!nzchar(id)) {
      return(list(id = NA_character_, state = "no_line", modules = modules))
    }
    if (!grepl("^[a-z0-9-]+$", id) || !(id %in% modules)) {
      return(list(id = id, state = "not_in_course", modules = modules))
    }
    list(id = id, state = "known", modules = modules)
  }

  # Copy the module's templates to my-code/; never overwrite what is there.
  copy_templates <- function(root, module, changed) {
    mine <- file.path(root, "my-code")
    dir.create(mine, showWarnings = FALSE)
    new_copies <- character()
    improved <- character()
    if (module$state != "known") return(list(new = new_copies, improved = improved))
    templates <- file.path(root, "course", "modules", module$id, "templates")
    names_tpl <- if (dir.exists(templates)) sort(list.files(templates)) else character()
    for (name in names_tpl) {
      source_dir <- file.path(templates, name)
      target <- file.path(mine, name)
      if (!dir.exists(source_dir)) next
      if (!file.exists(target)) {
        dir.create(target, recursive = TRUE, showWarnings = FALSE)
        files <- list.files(source_dir, recursive = TRUE, all.files = TRUE, no.. = TRUE)
        files <- files[!grepl("(^|/)(\\.Rhistory|\\.RData|\\.Rproj\\.user)(/|$)", files)]
        for (f in files) copy_bytes(join_path(source_dir, f), join_path(target, f))
        new_copies <- c(new_copies, name)
      } else if (any(startsWith(changed, paste0("course/modules/", module$id, "/templates/", name, "/")))) {
        improved <- c(improved, name)
      }
    }
    list(new = new_copies, improved = improved)
  }

  # First writable library folder, otherwise the personal library.
  install_location <- function() {
    writable <- function(dir) {
      if (!dir.exists(dir)) return(FALSE)
      probe <- file.path(dir, paste0("_probe_", Sys.getpid()))
      ok <- suppressWarnings(dir.create(probe, showWarnings = FALSE))
      if (ok) unlink(probe, recursive = TRUE, force = TRUE)
      ok
    }
    for (dir in .libPaths()) if (writable(dir)) return(dir)
    personal <- strsplit(Sys.getenv("R_LIBS_USER"), .Platform$path.sep, fixed = TRUE)[[1]][1]
    if (is.na(personal) || !nzchar(personal)) return(.libPaths()[1])
    personal <- path.expand(personal)
    dir.create(personal, recursive = TRUE, showWarnings = FALSE)
    .libPaths(c(personal, .libPaths()))
    personal
  }

  # Returns list(lines = result lines, problem = TRUE/FALSE).
  check_packages <- function(root, module) {
    lists <- "course/packages.txt"
    if (module$state == "known") {
      lists <- c(lists, paste0("course/modules/", module$id, "/packages.txt"))
    }
    lists <- lists[file.exists(vapply(lists, function(l) join_path(root, l), ""))]
    lines <- character()
    problem <- FALSE
    pkgs <- character()
    for (l in lists) {
      entries <- readLines(join_path(root, l), warn = FALSE, encoding = "UTF-8")
      entries <- trimws(sub("#.*$", "", entries))
      entries <- unique(entries[nzchar(entries)])
      invalid <- entries[!grepl("^[A-Za-z][A-Za-z0-9.]*[A-Za-z0-9]$", entries)]
      if (length(invalid)) {
        lines <- c(lines, paste0("PROBLEM: In ", l, " stehen ung\u00fcltige Paketnamen: ",
                                 paste(invalid, collapse = ", "), "."))
        problem <- TRUE
      }
      pkgs <- unique(c(pkgs, setdiff(entries, invalid)))
    }
    if (!length(pkgs)) return(list(lines = lines, problem = problem))
    installed <- function(p) nzchar(system.file(package = p))
    present <- pkgs[vapply(pkgs, installed, logical(1))]
    missing <- setdiff(pkgs, present)
    if (length(present)) {
      lines <- c(lines, paste0("R-Pakete bereits installiert: ",
                               paste(present, collapse = ", "), "."))
    }
    if (length(missing)) {
      say("Installiere R-Pakete: ", paste(missing, collapse = ", "),
          " (das kann einige Minuten dauern) ...")
      messages <- character()
      withCallingHandlers(
        tryCatch({
          location <- install_location()
          utils::capture.output(
            utils::install.packages(missing, lib = location, repos = CRAN, quiet = TRUE))
        }, error = function(e) {
          messages <<- c(messages, conditionMessage(e))
        }),
        warning = function(w) {
          messages <<- c(messages, conditionMessage(w))
          invokeRestart("muffleWarning")
        },
        message = function(m) invokeRestart("muffleMessage"))
      new_pkgs <- missing[vapply(missing, installed, logical(1))]
      not_installed <- setdiff(missing, new_pkgs)
      if (length(new_pkgs)) {
        lines <- c(lines, paste0("NEU installierte R-Pakete: ", paste(new_pkgs, collapse = ", "), "."))
      }
      if (length(not_installed)) {
        details <- trimws(paste(unique(messages), collapse = " "))
        details <- substr(gsub("[[:space:]]+", " ", details), 1, 1500)
        lines <- c(lines, paste0("PROBLEM: Diese R-Pakete konnten nicht installiert werden: ",
                                 paste(not_installed, collapse = ", "), ".",
                                 if (nzchar(details)) paste0(" R meldete: ", details) else ""))
        problem <- TRUE
      }
    }
    list(lines = lines, problem = problem)
  }

  # --- Main program -----------------------------------------------------------

  # Returns TRUE if everything worked.
  main <- function(root) {
    say("Dein Kursordner wird aktualisiert ...")
    if (dir.exists(file.path(root, ".git"))) {
      way <- "Git"
      e <- update_from_git(root)
    } else {
      way <- "ZIP"
      e <- update_from_zip(root)
    }
    module <- find_module(root)
    templates <- copy_templates(root, module, e$changed)
    packages <- check_packages(root, module)

    say()
    say("ERGEBNIS (Kursordner aus ", way, ")")
    if (length(e$changed)) {
      say("- Neues Kursmaterial: ", length(e$changed),
          " Kursdatei(en) hinzugef\u00fcgt oder ge\u00e4ndert.")
    } else {
      say("- Es gab kein neues Kursmaterial; dein Kursordner ist auf dem neuesten Stand.")
    }
    if (length(e$commits)) {
      say("- NICHT ERLAUBT: ", length(e$commits), " Git-Commit(s) waren in diesem Ordner ",
          "angelegt worden. Sie wurden entfernt. Im Kursordner wird nicht committet; ",
          "deine Arbeit geh\u00f6rt nach my-code/.")
    }
    if (length(e$reset)) {
      say("- ", length(e$reset), " Datei(en) au\u00dferhalb von my-code/ und data/ ",
          "waren ge\u00e4ndert oder hinzugef\u00fcgt worden und wurden zur\u00fcckgesetzt: ",
          short_list(e$reset), ". Kursdateien sind schreibgesch\u00fctzt; ",
          "eigene Dateien geh\u00f6ren nach my-code/.")
    }
    if (length(e$kept)) {
      say("- Diese Dateien in my-code/ bzw. data/ waren in Git eingetragen worden: ",
          short_list(e$kept), ". Sie wurden behalten und nicht ver\u00e4ndert.")
    }
    if (length(e$loose)) {
      say("- Diese Dateien von dir liegen au\u00dferhalb von my-code/: ",
          short_list(e$loose), ". Sie wurden nicht angefasst, aber verschiebe sie bitte ",
          "nach my-code/.")
    }
    if (length(e$not_unpacked)) {
      say("- Diese Kursdateien konnten nicht entpackt werden und wurden \u00fcbersprungen: ",
          short_list(e$not_unpacked), ". Melde das bitte Nicolas.")
    }
    available <- if (length(module$modules)) paste(module$modules, collapse = ", ") else "keine"
    without_module <- paste0("Bis dahin wurden keine Vorlagen kopiert und nur die Pakete aus ",
                             "course/packages.txt gepr\u00fcft.")
    if (module$state == "known") {
      say("- Modul: ", module$id, " (aus ", ABOUT_ME, ").")
    } else if (module$state == "no_file") {
      say("- MODUL UNBEKANNT: ", ABOUT_ME, " fehlt, deshalb ist dein Modul nicht bekannt. ",
          "/onboarding legt es fest. ", without_module)
    } else if (module$state == "no_line") {
      say("- MODUL UNBEKANNT: In ", ABOUT_ME, " fehlt die Zeile \"- module: ...\" (oder sie ",
          "ist leer), deshalb ist dein Modul nicht bekannt. /onboarding legt es fest. ", without_module)
    } else {
      say("- MODUL UNBEKANNT: Das Modul \"", module$id, "\" aus ", ABOUT_ME,
          " gibt es im Kurs nicht. Vorhandene Module: ", available, ". ",
          "Korrigiere die Zeile \"- module: ...\" oder lass /onboarding das Modul festlegen. ",
          without_module)
    }
    for (name in templates$new) {
      say("- NEU: my-code/", name, "/ ist bereit, darin kannst du arbeiten.")
    }
    for (name in templates$improved) {
      say("- Die Vorlage course/modules/", module$id, "/templates/", name, "/ wurde verbessert. ",
          "Deine Kopie in my-code/", name, "/ wurde NICHT ge\u00e4ndert; vergleiche beide, wenn du ",
          "die Verbesserungen \u00fcbernehmen willst.")
    }
    for (z in packages$lines) say("- ", z)
    if (module$state == "known") {
      now_rel <- paste0("course/modules/", module$id, "/NOW.md")
      now_file <- join_path(root, now_rel)
      if (file.exists(now_file)) {
        lines <- readLines(now_file, warn = FALSE, encoding = "UTF-8")
        state_line <- lines[startsWith(lines, "Stand:")]
        if (length(state_line)) say("- ", now_rel, ": ", trimws(state_line[1]))
      }
    }
    !packages$problem
  }

  # --- Start ------------------------------------------------------------------

  script <- find_script()
  ok <- tryCatch({
    if (is.na(script$file)) {
      abort("Der Kursordner wurde nicht gefunden.",
            paste0("Starte das Skript im Kursordner: Rscript .opencode/scripts/", SCRIPT_NAME))
    }
    root <- normalizePath(file.path(dirname(normalizePath(script$file, winslash = "/")),
                                    "..", ".."), winslash = "/", mustWork = TRUE)
    main(root)
  }, course_abort = function(p) {
    say("PROBLEM: ", conditionMessage(p))
    say("WAS TUN: ", p$advice)
    say("Im Ordner wurde nichts ver\u00e4ndert.")
    FALSE
  }, error = function(e) {
    say("PROBLEM: ", conditionMessage(e))
    say("WAS TUN: Zeig diese Meldung dem Kursassistenten oder Nicolas.")
    FALSE
  })

  # Via Rscript: exit code 1 on PROBLEM, and always quit here - otherwise
  # Rscript keeps reading the file at the old position, although it may have
  # been replaced by the new version in the meantime. Via source(): only the
  # message.
  if (script$rscript) quit(save = "no", status = if (isTRUE(ok)) 0L else 1L)
  invisible(isTRUE(ok))
})
