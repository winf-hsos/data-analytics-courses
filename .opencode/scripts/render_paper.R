# =====================================================================
#  render_paper.R: renders my-code/paper/paper.qmd to PDF with Quarto
#
#  Used by the course assistant for /paper and whenever a student asks
#  it to render the report. Call from the course folder:
#
#    Rscript .opencode/scripts/render_paper.R
#
#  - Finds Quarto the same way the system check does.
#  - Tells Quarto to use this R (QUARTO_R), so it does not pick another
#    installation.
#  - Prints the end of Quarto's output and where the PDF is, or the
#    error, so the assistant can explain it.
#
#  Messages are German, like everything the students read.
# =====================================================================

qmd <- file.path("my-code", "paper", "paper.qmd")
if (!file.exists(qmd)) {
  cat("PROBLEM: my-code/paper/paper.qmd gibt es nicht.\n")
  cat("WAS TUN: Erst mit /paper die Vorlage anlegen.\n")
  quit(status = 1)
}

candidates <- c(Sys.getenv("QUARTO_PATH"), Sys.which("quarto"))
if (.Platform$OS.type == "windows") {
  candidates <- c(candidates,
    file.path(Sys.getenv("LOCALAPPDATA"), "Programs", "Quarto", "bin", "quarto.exe"),
    file.path(Sys.getenv("ProgramFiles"), "Quarto", "bin", "quarto.exe"),
    file.path(Sys.getenv("LOCALAPPDATA"), "Programs", "Positron", "resources", "app", "quarto", "bin", "quarto.exe"),
    file.path(Sys.getenv("ProgramFiles"), "Positron", "resources", "app", "quarto", "bin", "quarto.exe"))
} else {
  candidates <- c(candidates, "/Applications/quarto/bin/quarto", "/usr/local/bin/quarto", "/opt/homebrew/bin/quarto",
    "/Applications/Positron.app/Contents/Resources/app/quarto/bin/quarto",
    "/opt/quarto/bin/quarto", "/usr/share/positron/resources/app/quarto/bin/quarto")
}
candidates <- candidates[nzchar(candidates) & file.exists(candidates)]
if (!length(candidates)) {
  cat("PROBLEM: Quarto nicht gefunden.\n")
  cat("WAS TUN: Den Systemcheck laufen lassen (.opencode/scripts/systemcheck.R).\n")
  quit(status = 1)
}
quarto <- candidates[1]

rscript <- file.path(R.home("bin"), if (.Platform$OS.type == "windows") "Rscript.exe" else "Rscript")
if (file.exists(rscript)) Sys.setenv(QUARTO_R = rscript)

cat("Rendere my-code/paper/paper.qmd ...\n")
out <- suppressWarnings(system2(quarto, c("render", shQuote(qmd)), stdout = TRUE, stderr = TRUE))
status <- attr(out, "status")
pdf <- file.path("my-code", "paper", "paper.pdf")

if (is.null(status) && file.exists(pdf)) {
  cat("FERTIG: ", pdf, "\n", sep = "")
} else {
  cat("FEHLER: Das Rendern ist gescheitert. Die letzten Zeilen von Quarto:\n\n")
  cat(tail(out, 40), sep = "\n")
  if (any(grepl("cairo", out, ignore.case = TRUE))) {
    cat("\nHINWEIS: cairo fehlt, auf dem Mac XQuartz installieren (.opencode/procedures/xquartz.md).\n")
  }
  quit(status = 1)
}
