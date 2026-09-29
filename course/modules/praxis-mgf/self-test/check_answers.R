# =====================================================================
#  check_answers.R: checks the answers of the self-test
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Sourced by my-code/self-test/self_test.R. Do not edit: this file
#  belongs to the course and is replaced by every /update-semester.
#
#  The correct answers are not stored in plain text, only as checksums
#  (rlang::hash). Checking an answer computes the same checksum and
#  compares. Numbers are rounded to one decimal first, letters are
#  lower-cased.
#
#  Messages to students are German; umlauts are written as \u escapes
#  so the file runs the same under any encoding.
# =====================================================================

.self_test <- new.env()
.self_test$results <- rep(NA, 11)

.self_test$tasks <- data.frame(
  number = 1:11,
  topic = c(
    "Daten laden und zählen",
    "eine Kennzahl berechnen",
    "Zeilen filtern",
    "gruppieren und zusammenfassen",
    "eine neue Spalte berechnen",
    "Anteile bei Mehrfachantworten",
    "fehlende Werte und Filterführung",
    "eine Abbildung mit ggplot2",
    "Code lesen: aufbereitete Variablen",
    "Code lesen: stille Fallausschlüsse",
    "Code lesen: die Basis eines Anteils"),
  # chapter of the self-study exercise (my-code/self-study/chapter_N.R)
  chapter = c(2, 2, 3, 3, 2, 2, 2, 4, 3, 2, 2),
  hint = c(
    "count() oder filter() mit nrow(); die Werte von D044stadtf stehen in course/datasets/mds12-schoko-milch.md.",
    "mean() innerhalb von summarise(), oder direkt auf die Spalte.",
    "filter() mit zwei Bedingungen, getrennt durch ein Komma.",
    "group_by() und summarise(); fehlende Angaben zur Ortsgröße zählen nicht mit.",
    "mutate() mit den neun Spalten von v008ort_1discount bis v008ort_9online, ohne v008ort_other.",
    "Die Basis sind die Befragten, nicht die Nennungen. Und: in Prozent.",
    "Wem wurde die Frage v007freq3_mi gestellt? Abschnitt „Fehlend heißt oft: nicht gefragt“ in course/datasets/mds12-schoko-milch.md.",
    "ggplot() mit geom_bar(), und labs() für beide Achsen.",
    "Vergleicht q004geschlecht mit Q004geschlechtf. Abschnitt „Zwei Menschen verschwinden“ in course/datasets/mds12-schoko-milch.md.",
    "Wie viele Werte hat v007freq3_mi, die nicht fehlen?",
    "Worauf bezieht sich sum(n_mentions), wenn jede Person mehrere Orte nennen kann?"),
  stringsAsFactors = FALSE
)

.self_test$study_page <- "my-code/self-study/"

# checksums of the correct answers, salted with the task number
.self_test$expected <- c(
  "1" = "1aabbbef4d78e437953b98619959fa99", "2" = "80d69d45767d0a7912896441646fe91d",
  "3" = "89a7c10d7af0da29c8de3a770256633a", "4" = "a7600d136b8129037d589ed07a0aa7e1",
  "5" = "d2b2d6381822b89c9d39942109f20524", "6" = "c68c4c03d6c75f4069735f9721a51f2e",
  "7" = "736ebcd19cfff756de95c7e1cda57cf0", "9" = "dfe5a68d70014ae4d173dc58a6405b34",
  "10" = "2785354e6f2ee74c1f154e9674678a7d", "11" = "109169d48729108009eb998d3e5531a7")

.self_test$normalize <- function(x) {
  if (is.numeric(x)) format(round(x, 1), nsmall = 1, trim = TRUE)
  else tolower(trimws(as.character(x)))
}
.self_test$checksum <- function(number, x) rlang::hash(paste0(number, ":", .self_test$normalize(x)))

# task 8: the bars must show respondents per age group, and both axes
# need a label that is not a variable name
.self_test$check_plot <- function(p) {
  if (!ggplot2::is_ggplot(p)) return("Das ist keine ggplot-Abbildung. Speichert die Abbildung mit plot_8 <- ggplot(...) + ...")
  layer <- tryCatch(ggplot2::layer_data(p, 1), error = function(e) NULL)
  if (is.null(layer)) return("Die Abbildung lässt sich nicht zeichnen. Führt sie einmal ohne Zuweisung aus und lest die Fehlermeldung.")
  values <- c(layer$y, layer$x)
  values <- sort(values[is.finite(values)])
  target <- c(425, 728, 769, 889)
  if (!(nrow(layer) == 4 && all(target %in% round(values)))) {
    return("Die Balken zeigen nicht die Zahl der Befragten je Altersgruppe (Q002altergru4f).")
  }
  labels <- tryCatch(ggplot2::get_labs(p), error = function(e) p$labels)
  default_labels <- c("Q002altergru4f", "Q002altergru4", "count", "n", "")
  is_labelled <- function(l) !is.null(l) && !(as.character(l)[1] %in% default_labels)
  if (!is_labelled(labels$x) || !is_labelled(labels$y)) {
    return("Die Balken stimmen, aber mindestens eine Achse trägt noch den Variablennamen. Mit labs(x = ..., y = ...) beschriften.")
  }
  TRUE
}

check_answer <- function(number, answer) {
  task <- .self_test$tasks[number, ]
  prefix <- paste0("Aufgabe ", number, " (", task$topic, "): ")
  if (missing(answer) || is.null(answer) || length(answer) == 0 ||
      (is.character(answer) && !nzchar(trimws(answer[1])))) {
    message(prefix, "noch kein Ergebnis.")
    return(invisible(FALSE))
  }
  expected <- unname(.self_test$expected[as.character(number)])
  extra <- NULL
  if (number == 8) {
    finding <- .self_test$check_plot(answer)
    is_correct <- isTRUE(finding)
    if (!is_correct) extra <- finding
  } else {
    # a table holding exactly one value is fine; anything else is not
    if (is.data.frame(answer)) {
      if (nrow(answer) == 1 && ncol(answer) == 1) {
        answer <- answer[[1]]
      } else {
        message(prefix, "Das Ergebnis ist eine Tabelle mit ", nrow(answer), " Zeilen und ", ncol(answer),
                " Spalten. Gesucht ist ein einzelner Wert; pull() holt eine Spalte heraus.")
        return(invisible(FALSE))
      }
    }
    if (length(answer) > 1) {
      message(prefix, "Das Ergebnis hat ", length(answer), " Werte. Gesucht ist ein einzelner Wert.")
      return(invisible(FALSE))
    }
    is_correct <- identical(.self_test$checksum(number, answer), expected)
    # most common near miss: a share between 0 and 1 instead of a percentage
    if (!is_correct && is.numeric(answer) && identical(.self_test$checksum(number, answer * 100), expected)) {
      extra <- "Fast: Das ist der Anteil zwischen 0 und 1. Gesucht ist der Wert in Prozent."
    }
  }
  .self_test$results[number] <- is_correct
  if (is_correct) {
    message(prefix, "richtig.")
  } else {
    message(prefix, "noch nicht.")
    if (!is.null(extra)) message("  ", extra)
    message("  Tipp: ", task$hint)
    message("  Nacharbeiten: Kapitel ", task$chapter, " der \u00dcbung in ", .self_test$study_page)
  }
  invisible(is_correct)
}

show_results <- function() {
  results <- .self_test$results
  tasks <- .self_test$tasks
  message("")
  message("SELBSTTEST: ", sum(results %in% TRUE), " von 11 richtig")
  open <- which(is.na(results))
  wrong <- which(results %in% FALSE)
  if (length(open)) message("  noch nicht geprüft: ", paste(open, collapse = ", "))
  if (length(wrong)) {
    message("  noch nicht richtig: ", paste(wrong, collapse = ", "))
    chapters <- sort(unique(tasks$chapter[wrong]))
    message("  Nacharbeiten: Kapitel ", paste(chapters, collapse = " und "), " der \u00dcbung in ", .self_test$study_page)
  }
  if (all(results %in% TRUE)) message("  Alles richtig. Ihr seid bereit für Sitzung 2.")
  message("")
  invisible(sum(results %in% TRUE))
}

message("Selbsttest geladen. Prüfen mit check_answer(<nummer>, <antwort>), am Ende show_results().")
