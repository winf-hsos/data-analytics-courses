# =====================================================================
#  new_paper.R: copies the report template of a module to my-code/paper
#
#  Used by the course assistant for /paper. Call from the course folder:
#
#    Rscript .opencode/scripts/new_paper.R
#
#  - Reads the module from my-code/about-me.md (line "- module:").
#  - Copies course/modules/<module>/paper-template/ to my-code/paper/.
#  - Never overwrites: if my-code/paper/ exists, it stops and says so.
#
#  Messages are German, like everything the students read.
# =====================================================================

about <- "my-code/about-me.md"
module <- NA_character_
if (file.exists(about)) {
  lines <- readLines(about, encoding = "UTF-8", warn = FALSE)
  hit <- grep("^\\s*-\\s*module:", lines, value = TRUE)
  if (length(hit)) module <- trimws(gsub("[*_`\"']", "", sub("^\\s*-\\s*module:", "", hit[1])))
}
if (is.na(module) || !nzchar(module)) {
  cat("PROBLEM: In my-code/about-me.md steht kein Modul (Zeile \"- module:\").\n")
  cat("WAS TUN: Modul erfragen und eintragen, dann noch einmal ausführen.\n")
  quit(status = 1)
}

source_dir <- file.path("course", "modules", module, "paper-template")
if (!dir.exists(source_dir)) {
  cat("PROBLEM: Für das Modul ", module, " gibt es keine Vorlage für einen Bericht.\n", sep = "")
  quit(status = 1)
}

target <- file.path("my-code", "paper")
if (file.exists(target)) {
  cat("SCHON DA: my-code/paper/ gibt es bereits. Ich überschreibe nichts.\n")
  cat("WAS TUN: Mit dem vorhandenen Bericht weiterarbeiten. Wer neu anfangen will,\n")
  cat("benennt den Ordner selbst um und ruft /paper noch einmal auf.\n")
  quit(status = 1)
}

files <- list.files(source_dir, recursive = TRUE, all.files = TRUE, no.. = TRUE)
for (f in files) {
  to <- file.path(target, f)
  dir.create(dirname(to), recursive = TRUE, showWarnings = FALSE)
  # copy bytes, so umlauts in the template survive on every system
  ok <- file.copy(file.path(source_dir, f), to, overwrite = FALSE)
  if (!ok) {
    cat("PROBLEM: ", to, " ließ sich nicht anlegen.\n", sep = "")
    quit(status = 1)
  }
}

cat("ANGELEGT: my-code/paper/ mit ", length(files), " Dateien:\n", sep = "")
for (f in sort(files)) cat("  my-code/paper/", f, "\n", sep = "")
if (!file.exists("data/mds12_schoko_milch.csv")) {
  cat("HINWEIS: data/mds12_schoko_milch.csv fehlt. Ohne die Daten lässt sich der Bericht nicht rendern.\n")
}
