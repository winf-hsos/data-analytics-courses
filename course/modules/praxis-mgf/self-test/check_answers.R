# =====================================================================
#  check_answers.R: checks the answers of the self-test
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Sourced by my-code/self-test/self_test.R. Do not edit: this file
#  belongs to the course and is replaced by every /update-semester.
#
#  The correct answers are not stored in plain text, only as checksums
#  (MD5 from base R, tools::md5sum). Checking an answer computes the same
#  checksum and compares. Numbers are rounded to one decimal first,
#  letters are lower-cased. Not rlang::hash: its result changed with
#  rlang 1.3.0, and every answer was suddenly "noch nicht".
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
  "1" = "06c131cb00477b64637a40eec7781743", "2" = "bbb4177ff7c8ede063978a95e0adc8e0",
  "3" = "c21fe90d968765cb18fb24ab87f5eec8", "4" = "1af7e592fe0c082720b2c64b046ed07b",
  "5" = "7fd7d0e482752985c4e708224a35394c", "6" = "dd7b4b6a831a9449261166e829087515",
  "7" = "bb20e64c619cd0bb568c68d701637629", "9" = "5fc039684d3805e442f4c99fc0d2a649",
  "10" = "2bbd990c5281146712e9b88561c2d03d", "11" = "0baa435477adb894f640c2f544a78150")

.self_test$normalize <- function(x) {
  if (is.numeric(x)) format(round(x, 1), nsmall = 1, trim = TRUE)
  else tolower(trimws(as.character(x)))
}
.self_test$checksum <- function(number, x) {
  file <- tempfile("self_test_")
  on.exit(unlink(file))
  writeBin(charToRaw(enc2utf8(paste0(number, ":", .self_test$normalize(x)))), file)
  unname(tools::md5sum(file))
}

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
