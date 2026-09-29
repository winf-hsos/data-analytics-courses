# =====================================================================
#  run_script.R: runs a student's R script the way Positron would
#
#  Used by the course assistant for the chapter check in /self-study
#  and for /final-check. Call from the course folder:
#
#    Rscript .opencode/scripts/run_script.R my-code/self-study/chapter_2.R
#
#  - Runs the file top to bottom in a fresh environment, one top-level
#    expression at a time, and prints what the console would print.
#  - Plots go to a null device: nothing is written to disk.
#  - On the first error it stops and names the line, so the assistant
#    can point the student to it.
#  - Only files inside my-code/ are run.
#
#  Messages are German, like everything the students read.
# =====================================================================

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  cat("Aufruf: Rscript .opencode/scripts/run_script.R my-code/<datei>.R\n")
  quit(status = 2)
}
path <- gsub("\\\\", "/", args[1])
if (!startsWith(path, "my-code/") || !grepl("\\.R$", path, ignore.case = TRUE)) {
  cat("Ich führe nur R-Skripte aus my-code/ aus, relativ zum Kursordner angegeben.\n")
  quit(status = 2)
}
if (!file.exists(path)) {
  cat("Die Datei ", path, " gibt es nicht.\n", sep = "")
  quit(status = 2)
}

# plots: draw them (ggplot errors only show up when drawing), but keep nothing
grDevices::pdf(NULL)
options(width = 100, tibble.print_max = 30, tibble.width = 100)

exprs <- tryCatch(parse(path, keep.source = TRUE, encoding = "UTF-8"), error = function(e) e)
if (inherits(exprs, "error")) {
  cat("SYNTAXFEHLER: Die Datei lässt sich nicht lesen, R versteht eine Stelle nicht.\n")
  cat(conditionMessage(exprs), "\n")
  quit(status = 1)
}

env <- new.env(parent = globalenv())
lines_of <- function(i) {
  ref <- attr(exprs, "srcref")[[i]]
  if (is.null(ref)) return("?")
  if (ref[1] == ref[3]) as.character(ref[1]) else paste0(ref[1], " bis ", ref[3])
}
n_warnings <- 0

cat("Datei: ", path, "\n", sep = "")
cat("Ausdrücke: ", length(exprs), "\n\n", sep = "")

for (i in seq_along(exprs)) {
  code <- paste(as.character(attr(exprs, "srcref")[[i]]), collapse = "\n")
  cat("> [Zeile ", lines_of(i), "]\n", code, "\n", sep = "")
  result <- tryCatch(
    withCallingHandlers(
      {
        out <- withVisible(eval(exprs[[i]], envir = env))
        if (out$visible) print(out$value)
        "ok"
      },
      message = function(m) {
        cat(conditionMessage(m))
        invokeRestart("muffleMessage")
      },
      warning = function(w) {
        n_warnings <<- n_warnings + 1
        cat("WARNUNG: ", conditionMessage(w), "\n", sep = "")
        invokeRestart("muffleWarning")
      }
    ),
    error = function(e) e
  )
  if (inherits(result, "error")) {
    cat("\nFEHLER in Zeile ", lines_of(i), ":\n", conditionMessage(result), "\n", sep = "")
    cat("\nERGEBNIS: Die Datei läuft bis Zeile ", lines_of(i), " und bricht dort ab.\n", sep = "")
    quit(status = 1)
  }
  cat("\n")
}

cat("ERGEBNIS: Die Datei läuft von oben bis unten ohne Fehler durch",
    if (n_warnings > 0) paste0(", mit ", n_warnings, " Warnung(en)") else "", ".\n", sep = "")
