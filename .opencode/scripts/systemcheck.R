# =====================================================================
#  systemcheck.R
#  Praxis der Markt- und Gesellschaftsforschung, part Meseth
#
#  What the script does
#    1. installs the package tidyverse if it is missing
#    2. checks R, Quarto and Typst and renders a test PDF
#    3. records operating system, processor, memory and disk space
#    4. writes everything to a text file in the current folder:
#       systemcheck.txt
#
#  Course folder version: the course assistant runs it with Rscript from
#  the course folder (/onboarding) and then reads the text file. The file
#  goes to my-code/ so that course updates never touch it. Because the
#  script runs outside of Positron in that case, it looks for Positron in
#  its usual install location instead of detecting it from the environment.
#
#  By hand: open it in Positron and click "Source" at the top right.
#
#  Privacy
#    The script records no name, no user name and no computer name. It
#    only reads technical information. The location of the project folder
#    is only checked for special characters or OneDrive; the path itself
#    is not written to the file.
#
#  Note on the code: all texts with umlauts are written as \u escapes,
#  so the script runs without errors on older R versions and with any
#  character encoding. The code itself is plain ASCII.
# =====================================================================

local({

  # ------------------------------------------------------------------
  # Thresholds: below these the check reports a warning
  # ------------------------------------------------------------------
  MIN_R       <- "4.4.0"
  MIN_QUARTO  <- "1.5.0"
  MIN_RAM_GB  <- 8
  MIN_FREE_GB <- 5
  CRAN        <- "https://cloud.r-project.org"

  ae <- "\u00e4"; oe <- "\u00f6"; ue <- "\u00fc"; ss <- "\u00df"

  # ------------------------------------------------------------------
  # Helper functions
  # ------------------------------------------------------------------
  status  <- data.frame(level = character(), check = character(),
                        value = character(), stringsAsFactors = FALSE)
  todo    <- character()
  details <- character()

  report <- function(level, check, value, action = NULL) {
    status[nrow(status) + 1, ] <<- c(level, check, as.character(value))
    if (!is.null(action)) todo <<- c(todo, paste0(check, ": ", action))
  }
  add_detail <- function(name, value) {
    value <- if (length(value) == 0 || all(is.na(value))) "(unbekannt)" else paste(value, collapse = " | ")
    details <<- c(details, sprintf("  %-28s %s", name, value))
  }
  add_section <- function(title) details <<- c(details, "", paste0("  ", title))

  is_win <- .Platform$OS.type == "windows"
  os_name <- Sys.info()[["sysname"]]
  is_mac <- identical(os_name, "Darwin")

  q <- function(x) shQuote(x, type = if (is_win) "cmd" else "sh")

  # Run a command; returns its output as a character vector, or NA.
  # system2() quotes the program path itself with shQuote() on every
  # platform; a second pair of quotes makes it impossible to find (on macOS
  # "sh: '/Applications/quarto/bin/quarto': No such file or directory",
  # reported on 2026-09-29). So never quote the path, only the arguments.
  run <- function(cmd, args = character()) {
    out <- tryCatch(
      suppressWarnings(system2(cmd, args, stdout = TRUE, stderr = TRUE)),
      error = function(e) NA_character_)
    if (length(out) == 0) return(NA_character_)
    # output in another encoding (on Windows often CP850 or CP1252, e.g. an
    # umlaut in a path) is not valid UTF-8 and would stop trimws(); read such
    # lines as Latin-1 instead (found with a test on 2026-09-29)
    bad <- !is.na(out) & !validUTF8(out)
    if (any(bad)) out[bad] <- iconv(out[bad], from = "latin1", to = "UTF-8", sub = "?")
    trimws(out)
  }
  ps <- function(command) run("powershell", c("-NoProfile", "-NonInteractive", "-Command", q(command)))

  version_from <- function(txt) {
    v <- regmatches(txt, regexpr("[0-9]+\\.[0-9]+(\\.[0-9]+)?", txt))
    if (length(v) == 0) NA_character_ else v[1]
  }
  at_least <- function(v, min) !is.na(v) && utils::compareVersion(v, min) >= 0
  non_ascii <- function(x) grepl("[^ -~]", x)

  step <- function(txt) message("  ", txt)
  message("")
  message("Systemcheck l", ae, "uft ...")

  # ------------------------------------------------------------------
  # 1. R
  # ------------------------------------------------------------------
  step("R")
  r_ver <- paste(R.version$major, R.version$minor, sep = ".")
  if (at_least(r_ver, MIN_R)) {
    report("OK", "R-Version", r_ver)
  } else {
    report("WARNUNG", "R-Version", r_ver,
           paste0("R ist ", ae, "lter als ", MIN_R, ". Bitte die aktuelle Version von cran.r-project.org installieren."))
  }
  add_section("R")
  add_detail("Version", R.version.string)
  add_detail("Plattform", R.version$platform)
  add_detail("Umgebung", if (identical(Sys.getenv("POSITRON"), "1")) paste("Positron", Sys.getenv("POSITRON_VERSION"))
                         else if (identical(Sys.getenv("RSTUDIO"), "1")) "RStudio" else .Platform$GUI)
  add_detail("UTF-8-Zeichensatz", if (isTRUE(l10n_info()[["UTF-8"]])) "ja" else "nein")
  add_detail("Spracheinstellung", Sys.getlocale("LC_CTYPE"))

  lib <- .libPaths()[1]
  lib_ok <- file.access(lib, 2) == 0
  add_detail("Paketbibliothek beschreibbar", if (lib_ok) "ja" else "nein")
  if (!lib_ok) report("WARNUNG", "Paketbibliothek", "nicht beschreibbar",
                      "R darf keine Pakete installieren. R nicht als Administrator starten und die Frage nach einer pers\u00f6nlichen Bibliothek mit Ja beantworten.")

  if (identical(Sys.getenv("POSITRON"), "1")) {
    report("OK", "Positron", Sys.getenv("POSITRON_VERSION"))
  } else {
    # Run via Rscript by the course assistant: look for Positron where it is usually installed
    locations <- if (is_win) c(file.path(Sys.getenv("LOCALAPPDATA"), "Programs", "Positron", "Positron.exe"),
                               file.path(Sys.getenv("ProgramFiles"), "Positron", "Positron.exe"))
                 else if (is_mac) c("/Applications/Positron.app", path.expand("~/Applications/Positron.app"))
                 else c("/usr/share/positron/positron", "/usr/bin/positron", "/opt/Positron/positron")
    if (any(file.exists(locations))) {
      report("OK", "Positron", "installiert")
    } else {
      report("FEHLT", "Positron", "nicht gefunden",
             "Positron von positron.posit.co installieren und danach den Kursordner darin \u00f6ffnen.")
    }
  }

  # ------------------------------------------------------------------
  # 2. tidyverse
  # ------------------------------------------------------------------
  step("tidyverse")
  if (!requireNamespace("tidyverse", quietly = TRUE) && lib_ok) {
    message("    tidyverse wird installiert, das kann einige Minuten dauern ...")
    tryCatch(utils::install.packages("tidyverse", repos = CRAN, quiet = TRUE),
             error = function(e) message("    Installation fehlgeschlagen: ", conditionMessage(e)))
  }
  tv_loads <- tryCatch({
    suppressPackageStartupMessages(library(tidyverse))
    TRUE
  }, error = function(e) conditionMessage(e))

  add_section("Pakete")
  if (isTRUE(tv_loads)) {
    report("OK", "tidyverse", as.character(utils::packageVersion("tidyverse")))
  } else {
    report("FEHLT", "tidyverse", "nicht installiert oder l\u00e4dt nicht",
           "In der Konsole install.packages(\"tidyverse\") ausf\u00fchren und die Fehlermeldung beachten. Ohne Internetverbindung geht das nicht.")
    if (is.character(tv_loads)) add_detail("Fehler beim Laden", tv_loads)
  }
  for (p in c("dplyr", "ggplot2", "readr", "readxl", "tidyr", "knitr", "rmarkdown")) {
    add_detail(p, if (requireNamespace(p, quietly = TRUE)) as.character(utils::packageVersion(p)) else "fehlt")
  }

  # Graphics test: write a plot to a file
  graphics_ok <- FALSE
  if (isTRUE(tv_loads)) {
    graphics_ok <- tryCatch({
      f <- tempfile(fileext = ".png")
      grDevices::png(f, width = 400, height = 300)
      print(ggplot2::ggplot(data.frame(x = 1:3, y = c(2, 3, 1)), ggplot2::aes(x, y)) + ggplot2::geom_col())
      grDevices::dev.off()
      file.exists(f) && file.size(f) > 0
    }, error = function(e) FALSE)
    if (graphics_ok) report("OK", "Grafik (ggplot2)", "Testbild erzeugt")
    else report("WARNUNG", "Grafik (ggplot2)", "Testbild fehlgeschlagen",
                "ggplot2 konnte kein Bild erzeugen. Bitte die Ausgabedatei mitbringen, wir schauen es in Sitzung 1 an.")
  }

  # ------------------------------------------------------------------
  # 3. Quarto and Typst
  # ------------------------------------------------------------------
  step("Quarto")
  candidates <- c(Sys.getenv("QUARTO_PATH"), Sys.which("quarto"))
  if (is_win) {
    candidates <- c(candidates,
      file.path(Sys.getenv("LOCALAPPDATA"), "Programs", "Quarto", "bin", "quarto.exe"),
      file.path(Sys.getenv("ProgramFiles"), "Quarto", "bin", "quarto.exe"),
      file.path(Sys.getenv("LOCALAPPDATA"), "Programs", "Positron", "resources", "app", "quarto", "bin", "quarto.exe"),
      file.path(Sys.getenv("ProgramFiles"), "Positron", "resources", "app", "quarto", "bin", "quarto.exe"),
      file.path(Sys.getenv("ProgramFiles"), "RStudio", "resources", "app", "bin", "quarto", "bin", "quarto.exe"))
  } else if (is_mac) {
    candidates <- c(candidates, "/Applications/quarto/bin/quarto", "/usr/local/bin/quarto", "/opt/homebrew/bin/quarto",
      "/Applications/Positron.app/Contents/Resources/app/quarto/bin/quarto",
      "/Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto")
  } else {
    candidates <- c(candidates, "/opt/quarto/bin/quarto", "/usr/local/bin/quarto",
      "/usr/share/positron/resources/app/quarto/bin/quarto",
      "/usr/lib/rstudio/resources/app/bin/quarto/bin/quarto")
  }
  candidates <- unique(candidates[nzchar(candidates) & file.exists(candidates)])
  quarto <- if (length(candidates)) candidates[1] else NA_character_

  add_section("Quarto")
  q_ver <- NA_character_
  if (!is.na(quarto)) {
    q_ver <- version_from(run(quarto, "--version"))
    origin <- if (grepl("Positron", quarto, ignore.case = TRUE)) "mit Positron mitgeliefert" else "eigenst\u00e4ndig installiert"
    add_detail("Version", q_ver)
    add_detail("Herkunft", origin)
    add_detail("Gefundene Installationen", length(candidates))
    # No version means Quarto did not answer. That is different from an old
    # version and therefore gets its own message.
    if (is.na(q_ver)) report("WARNUNG", "Quarto", "antwortet nicht",
                             "Quarto ist installiert, lie\u00df sich aber nicht starten. Bitte in Sitzung 1 zeigen.")
    else if (at_least(q_ver, MIN_QUARTO)) report("OK", "Quarto", q_ver)
    else report("WARNUNG", "Quarto", q_ver, paste0("Quarto ist \u00e4lter als ", MIN_QUARTO, ". Bitte von quarto.org aktualisieren."))

    typst <- version_from(run(quarto, c("typst", "--version")))
    add_detail("Typst (in Quarto)", typst)
  } else {
    report("FEHLT", "Quarto", "nicht gefunden",
           "Quarto kommt mit Positron mit. Fehlt es, bitte von quarto.org installieren.")
  }

  # Render test: a small Quarto document with R code and a figure, rendered
  # to PDF via Typst - exactly the way reports and PDFs are made in the module
  if (!is.na(quarto) && isTRUE(tv_loads)) {
    step("Quarto-Rendertest")
    rscript_on_path <- Sys.which("Rscript")
    add_detail("Rscript im Suchpfad", if (nzchar(rscript_on_path)) "ja" else "nein")

    # One render attempt in a fresh temp folder. Without --quiet: that flag
    # also hides Quarto's error messages (reported from macOS on 2026-09-29,
    # the details only said "unknown"). With dev, knitr draws the figure with
    # that device; with quarto_r, Quarto is told where R is via QUARTO_R
    # instead of searching PATH.
    render_attempt <- function(dev = NULL, quarto_r = NULL) {
      tmp <- tempfile("qtest"); dir.create(tmp)
      qmd <- file.path(tmp, "test.qmd")
      knitr_opts <- if (is.null(dev)) character() else c("knitr:", "  opts_chunk:", paste0("    dev: ", dev))
      writeLines(c("---", "title: Test", "format: typst", "lang: de", knitr_opts, "---", "",
                   "```{r}", "#| label: fig-test", "#| fig-cap: Test", "plot(1:3)", "```"), qmd)
      old_quarto_r <- Sys.getenv("QUARTO_R", unset = NA)
      if (!is.null(quarto_r)) Sys.setenv(QUARTO_R = quarto_r)
      out <- run(quarto, c("render", q(qmd)))
      if (!is.null(quarto_r)) {
        if (is.na(old_quarto_r)) Sys.unsetenv("QUARTO_R") else Sys.setenv(QUARTO_R = old_quarto_r)
      }
      ok <- file.exists(file.path(tmp, "test.pdf"))
      # keep the last lines of the log, without colour codes and without
      # paths that would reveal the user name
      log <- out[!is.na(out) & nzchar(out)]
      log <- gsub("\033\\[[0-9;]*m", "", log)
      log <- gsub(tmp, "<temp>", log, fixed = TRUE)
      log <- gsub(normalizePath(tmp, winslash = "/", mustWork = FALSE), "<temp>", log, fixed = TRUE)
      homes <- unique(c(path.expand("~"), Sys.getenv("HOME"), Sys.getenv("USERPROFILE")))
      for (home in homes[nzchar(homes)]) {
        log <- gsub(home, "~", log, fixed = TRUE)
        log <- gsub(gsub("\\", "/", home, fixed = TRUE), "~", log, fixed = TRUE)
      }
      user <- Sys.info()[["user"]]
      if (!is.na(user) && nchar(user) >= 3) log <- gsub(user, "<user>", log, fixed = TRUE)
      log <- substr(utils::tail(log, 5), 1, 160)
      unlink(tmp, recursive = TRUE)
      list(ok = ok, log = log)
    }

    # XQuartz: R's cairo devices need it on macOS; knitr uses them when Quarto renders
    xquartz_here <- is_mac && (dir.exists("/Applications/Utilities/XQuartz.app") || dir.exists("/opt/X11/lib"))
    if (is_mac) add_detail("XQuartz", if (xquartz_here) "installiert" else "fehlt")

    first <- render_attempt()
    if (first$ok) {
      report("OK", "Quarto-Rendertest", "PDF mit R-Code \u00fcber Typst erzeugt")
    } else if (is.na(q_ver)) {
      report("WARNUNG", "Quarto-Rendertest", "fehlgeschlagen", "Quarto lie\u00df sich nicht starten (siehe oben).")
      add_detail("Meldung Rendertest", first$log)
    } else {
      add_detail("Meldung Rendertest", first$log)
      # second attempt with the ragg device. On macOS without XQuartz, knitr's
      # default png device needs cairo and fails with "failed to load cairo
      # DLL" (reported on 2026-09-29, Apple M3); ragg comes with the tidyverse
      # and draws without cairo. The course template sets it for every document.
      has_ragg <- requireNamespace("ragg", quietly = TRUE)
      second <- if (has_ragg) render_attempt(dev = "ragg_png") else list(ok = FALSE, log = "ragg nicht installiert")
      cairo_failed <- any(grepl("cairo", first$log, ignore.case = TRUE))
      if (second$ok && is_mac && (cairo_failed || !xquartz_here)) {
        # on a Mac this is XQuartz missing: install it once, then every
        # document renders without any entry in its header
        report("WARNUNG", "Quarto-Rendertest", "XQuartz fehlt (macOS)", "In OpenCode euren Kursassistenten bitten: \u201eInstallier bitte XQuartz\u201c. Danach den Systemcheck wiederholen.")
        add_detail("Rendertest mit ragg", "PDF erzeugt: au\u00dfer XQuartz fehlt nichts")
      } else if (second$ok) {
        report("HINWEIS", "Quarto-Rendertest", "klappt mit dem Grafikger\u00e4t ragg",
               paste0("Abbildungen in Quarto brauchen auf diesem Rechner das Grafikger\u00e4t ragg statt cairo: ",
                      "im Kopf des Dokuments knitr: opts_chunk: dev: ragg_png eintragen."))
        add_detail("Rendertest mit ragg", "PDF erzeugt")
      } else {
        # third attempt: ragg and the path to this R
        rscript_here <- file.path(R.home("bin"), if (is_win) "Rscript.exe" else "Rscript")
        third <- render_attempt(dev = if (has_ragg) "ragg_png" else NULL, quarto_r = rscript_here)
        add_detail("Rendertest mit ragg", second$log)
        if (third$ok) {
          report("HINWEIS", "Quarto-Rendertest", "klappt, wenn Quarto den Pfad zu R bekommt",
                 "Quarto findet R nicht von selbst. Mit dem Pfad zu R entsteht das PDF. Das richten wir in Sitzung 2 ein; jetzt ist nichts zu tun.")
          add_detail("Rendertest mit QUARTO_R", "PDF erzeugt")
        } else {
          report("WARNUNG", "Quarto-Rendertest", "fehlgeschlagen",
                 "Das Test-PDF lie\u00df sich nicht erzeugen, auch nicht mit ragg und dem Pfad zu R. Die Meldung steht unten in den Details; bitte in Sitzung 2 zeigen.")
          add_detail("Rendertest mit QUARTO_R", third$log)
        }
      }
    }
  }

  # ------------------------------------------------------------------
  # 4. LaTeX
  # ------------------------------------------------------------------
  step("LaTeX")
  add_section("LaTeX (nicht n\u00f6tig)")
  # PDFs in the module are made via Typst, which comes with Quarto. LaTeX is
  # therefore only recorded for information and not rated.
  tex_bin <- Sys.which(c("pdflatex", "xelatex", "lualatex"))
  tex_bin <- tex_bin[nzchar(tex_bin)]
  tinytex_dir <- if (is_win) file.path(Sys.getenv("APPDATA"), "TinyTeX")
                 else if (is_mac) path.expand("~/Library/TinyTeX") else path.expand("~/.TinyTeX")
  dist <- if (dir.exists(tinytex_dir)) "TinyTeX"
          else if (any(grepl("miktex", tex_bin, ignore.case = TRUE))) "MiKTeX"
          else if (any(grepl("texlive|/Library/TeX", tex_bin, ignore.case = TRUE))) "TeX Live / MacTeX"
          else if (length(tex_bin)) "andere LaTeX-Distribution" else "keine"
  add_detail("Distribution", dist)

  # ------------------------------------------------------------------
  # 5. Computer
  # ------------------------------------------------------------------
  step("Rechner")
  add_section("Rechner")

  os_txt <- tryCatch(utils::osVersion, error = function(e) NA_character_)
  if (is.null(os_txt)) os_txt <- NA_character_
  report("INFO", "Betriebssystem", os_txt)

  # Processor
  cpu <- if (is_win) ps("(Get-CimInstance Win32_Processor).Name")[1]
         else if (is_mac) run("sysctl", c("-n", "machdep.cpu.brand_string"))[1]
         else tryCatch(sub(".*:\\s*", "", grep("^model name", readLines("/proc/cpuinfo"), value = TRUE)[1]),
                       error = function(e) NA_character_)
  cores_phys <- tryCatch(parallel::detectCores(logical = FALSE), error = function(e) NA)
  cores_log  <- tryCatch(parallel::detectCores(logical = TRUE),  error = function(e) NA)
  report("INFO", "Prozessor", cpu)
  add_detail("Kerne (physisch / logisch)", paste(cores_phys, "/", cores_log))

  # Architecture: does the R build match the processor?
  machine <- Sys.info()[["machine"]]
  if (is_win && nzchar(Sys.getenv("PROCESSOR_ARCHITEW6432"))) machine <- Sys.getenv("PROCESSOR_ARCHITEW6432")
  if (is_win && identical(Sys.getenv("PROCESSOR_ARCHITECTURE"), "ARM64")) machine <- "ARM64"
  add_detail("Architektur Rechner", machine)
  add_detail("Architektur R", R.version$arch)
  if (is_mac) {
    rosetta <- identical(run("sysctl", c("-in", "sysctl.proc_translated"))[1], "1")
    add_detail("R unter Rosetta", if (rosetta) "ja" else "nein")
    if (rosetta) report("WARNUNG", "R-Architektur", "Intel-R auf Apple-Chip",
                        "Diese R-Version l\u00e4uft \u00fcber Rosetta und ist langsam. Bitte die arm64-Version von R installieren.")
  }

  # Memory
  ram_bytes <- if (is_win) suppressWarnings(as.numeric(ps("(Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory")[1]))
               else if (is_mac) suppressWarnings(as.numeric(run("sysctl", c("-n", "hw.memsize"))[1]))
               else tryCatch(as.numeric(gsub("[^0-9]", "", grep("^MemTotal", readLines("/proc/meminfo"), value = TRUE))) * 1024,
                             error = function(e) NA)
  ram_gb <- round(ram_bytes / 1024^3, 1)
  if (is.na(ram_gb)) report("HINWEIS", "Arbeitsspeicher", "nicht ermittelbar")
  else if (ram_gb >= MIN_RAM_GB - 0.5) report("OK", "Arbeitsspeicher", paste(ram_gb, "GB"))
  else report("WARNUNG", "Arbeitsspeicher", paste(ram_gb, "GB"),
              paste0("Weniger als ", MIN_RAM_GB, " GB. Das reicht meist, aber beim Rendern bitte andere Programme schlie", ss, "en."))

  # Free disk space on the drive of the current folder
  free_bytes <- if (is_win) {
    drive <- substr(normalizePath(getwd(), winslash = "\\"), 1, 1)
    suppressWarnings(as.numeric(ps(paste0("(Get-PSDrive -Name ", drive, ").Free"))[1]))
  } else {
    tryCatch({
      z <- run("df", c("-k", q(getwd())))
      as.numeric(strsplit(z[length(z)], "\\s+")[[1]][4]) * 1024
    }, error = function(e) NA)
  }
  free_gb <- round(free_bytes / 1024^3, 1)
  if (is.na(free_gb)) report("HINWEIS", "Freier Speicher", "nicht ermittelbar")
  else if (free_gb >= MIN_FREE_GB) report("OK", "Freier Speicher", paste(free_gb, "GB"))
  else report("WARNUNG", "Freier Speicher", paste(free_gb, "GB"),
              paste0("Weniger als ", MIN_FREE_GB, " GB frei. Pakete und Quarto brauchen Platz; bitte aufr", ae, "umen."))

  # Location of the project (the path itself is not stored)
  wd <- getwd()
  if (non_ascii(wd) || non_ascii(path.expand("~"))) {
    report("WARNUNG", "Ordnerpfad", "enth\u00e4lt Umlaute oder Sonderzeichen",
           "Manche Werkzeuge scheitern an solchen Pfaden. Das Projekt besser in einem Ordner ohne Umlaute und Leerzeichen anlegen, z. B. C:/r-projekte.")
  }
  if (grepl("onedrive|dropbox|icloud|nextcloud", wd, ignore.case = TRUE)) {
    report("HINWEIS", "Ordnerpfad", "liegt in einem Cloud-Ordner",
           "Cloud-Synchronisation kann Dateien beim Rendern sperren. Bei merkw\u00fcrdigen Fehlern das Projekt in einen lokalen Ordner verschieben.")
  }

  # ------------------------------------------------------------------
  # Write the file
  # ------------------------------------------------------------------
  # Problems first, so that anyone skimming many files sees at once where it fails
  sort_order <- c("FEHLT" = 1, "WARNUNG" = 2, "HINWEIS" = 3, "OK" = 4, "INFO" = 5)
  status <- status[order(sort_order[status$level], seq_len(nrow(status))), ]
  header <- c(
    "SYSTEMCHECK \u00b7 Datenanalyse mit R",
    paste0("Erstellt: ", format(Sys.time(), "%Y-%m-%d %H:%M"), "  (Skriptfassung 2026-09-30d)"),
    "",
    "ZUSAMMENFASSUNG",
    sprintf("  %-8s %-22s %s", status$level, status$check, status$value),
    "",
    "WAS ZU TUN IST",
    if (length(todo)) paste0("  - ", todo) else "  Nichts. Alles bereit f\u00fcr Sitzung 1.",
    "",
    "DETAILS",
    details,
    "")
  n_missing <- sum(status$level == "FEHLT"); n_warn <- sum(status$level == "WARNUNG")
  traffic_light <- if (n_missing > 0) "ROT" else if (n_warn > 0) "GELB" else "GR\u00dcN"
  header <- append(header, paste0("Gesamt: ", traffic_light, "  (", n_missing, " fehlt, ", n_warn, " Warnung)"), after = 2)

  # fixed name, as on the slide; the date is inside the file
  # in the course folder into my-code/, otherwise into the current folder
  out_dir <- if (dir.exists("my-code")) file.path(getwd(), "my-code") else getwd()
  out_file <- file.path(out_dir, "systemcheck.txt")
  con <- file(out_file, open = "w", encoding = "UTF-8")
  writeLines(header, con)
  close(con)

  # ------------------------------------------------------------------
  # Console
  # ------------------------------------------------------------------
  message("")
  message(paste(header[1:(which(header == "DETAILS") - 1)], collapse = "\n"))
  message("Fertig. Die Datei liegt hier:")
  message("  ", out_file)
  message("Bitte im ILIAS-Abgabeordner hochladen.")
  message("")
  invisible(out_file)
})
