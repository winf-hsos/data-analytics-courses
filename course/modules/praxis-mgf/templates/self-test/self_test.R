# =====================================================================
#  Selbsttest R
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Elf kleine Aufgaben auf dem Kursdatensatz. Jede erzeugt genau einen
#  Wert, und die Zeile check_answer(...) darunter sagt euch sofort, ob er
#  stimmt. Stimmt er nicht, sagt sie, wo ihr nacharbeiten könnt.
#
#  Aufgaben 1 bis 8: selbst Code schreiben.
#  Aufgaben 9 bis 11: vorgegebenen Code lesen. Er läuft ohne Fehler,
#  und trotzdem steckt etwas darin, das man wissen muss.
#
#  Der Test hat keine Note und wird nicht eingesammelt. Er sagt euch,
#  ob ihr in Sitzung 2 mitkommt. Euer Assistent könnte ihn lösen;
#  bestehen könnt ihr ihn nur selbst. Er hilft euch aber gern, eine
#  Funktion oder eine Fehlermeldung zu verstehen.
#
#  So geht es:
#    1. Diese Datei in Positron öffnen (der Kursordner muss geöffnet sein).
#    2. Den Block "setup" ausführen: Cursor hinein, Strg+Enter
#       (Mac: Cmd+Enter), Zeile für Zeile.
#    3. Je Aufgabe: NULL nach "answer_N <-" durch euren Code ersetzen,
#       ausführen, dann die Zeile check_answer(N, answer_N) ausführen.
#    4. Am Ende show_results() ausführen.
#
#  Namen im Code sind englisch (answer_1, survey, mean_age), wie in
#  course/material/r-conventions.md beschrieben.
#
#  Hilfe: course/modules/praxis-mgf/sessions/session-1.md (Code aus Sitzung 1)
#         course/datasets/mds12-schoko-milch.md (Variablen und Codes)
# =====================================================================


# ---- setup -----------------------------------------------------------

library(tidyverse)
source("course/modules/praxis-mgf/self-test/check_answers.R")
survey <- read_csv("data/mds12_schoko_milch.csv")


# ---- Aufgabe 1 -------------------------------------------------------
# Wie viele Befragte wohnen in einer Großstadt?
# (Variable D044stadtf)

answer_1 <- NULL   # replace NULL with your code

check_answer(1, answer_1)


# ---- Aufgabe 2 -------------------------------------------------------
# Wie alt sind die Befragten im Durchschnitt? Eine Nachkommastelle genügt.
# (Variable Q002alter)

answer_2 <- NULL   # replace NULL with your code

check_answer(2, answer_2)


# ---- Aufgabe 3 -------------------------------------------------------
# Wie viele Befragte sind 60 Jahre oder älter UND wohnen in einem Dorf?

answer_3 <- NULL   # replace NULL with your code

check_answer(3, answer_3)


# ---- Aufgabe 4 -------------------------------------------------------
# Berechnet das Durchschnittsalter je Größe des Wohnorts (D044stadtf).
# Befragte ohne Angabe zum Wohnort zählen nicht mit.
# Wie hoch ist das niedrigste Durchschnittsalter? Eine Nachkommastelle.

answer_4 <- NULL   # replace NULL with your code

check_answer(4, answer_4)


# ---- Aufgabe 5 -------------------------------------------------------
# Bei der Frage "Wo kaufen Sie gewöhnlich Ihre Lebensmittel ein?" konnte
# jede Person mehrere Orte nennen, je Ort eine Spalte von v008ort_1discount
# bis v008ort_9online (1 = genannt, 0 = nicht genannt; v008ort_other ist
# ein Freitext und zählt nicht mit).
# Berechnet mit mutate() für jede Person, wie viele Orte sie genannt hat
# (eine neue Spalte n_places). Wie viele Orte nennen die Befragten im
# Durchschnitt? Eine Nachkommastelle.

answer_5 <- NULL   # replace NULL with your code

check_answer(5, answer_5)


# ---- Aufgabe 6 -------------------------------------------------------
# Wie viel Prozent der Befragten kaufen beim Discounter ein
# (v008ort_1discount)? Eine Nachkommastelle.

answer_6 <- NULL   # replace NULL with your code

check_answer(6, answer_6)


# ---- Aufgabe 7 -------------------------------------------------------
# Die Frage, wie oft jemand Milch trinkt (v007freq3_mi), hat bei vielen
# Befragten keinen Wert. Einen Teil davon hat man gar nicht gefragt.
# Wie viele Befragte haben Milch gekauft UND verzehrt (v006gekauft_3mi == 3)
# und trotzdem keinen Wert bei v007freq3_mi?

answer_7 <- NULL   # replace NULL with your code

check_answer(7, answer_7)


# ---- Aufgabe 8 -------------------------------------------------------
# Zeichnet ein Balkendiagramm: die Zahl der Befragten je Altersgruppe
# (Q002altergru4f), beide Achsen mit einer Beschriftung, die ein Mensch
# versteht. Speichert die Abbildung unter dem Namen plot_8 und schaut
# sie euch mit plot_8 an.

plot_8 <- NULL   # replace NULL with your code

plot_8
check_answer(8, plot_8)


# ---- Aufgabe 9: Code lesen -------------------------------------------
# Dieser Code berechnet das Durchschnittsalter nach Geschlecht:

survey |>
  group_by(Q004geschlechtf) |>
  summarise(mean_age = mean(Q002alter), n_respondents = n())

# Das Ergebnis hat drei Zeilen: Frauen, Männer und NA mit 2 Personen.
# Woher kommt die dritte Zeile?
#   a) Zwei Personen haben die Frage nach dem Geschlecht nicht beantwortet.
#   b) Zwei Personen haben in der Befragung "divers" angegeben; in der
#      aufbereiteten Variable wurden sie auf NA gesetzt.
#   c) R fügt bei group_by() immer eine Zeile für fehlende Werte hinzu.
#   d) Beim Einlesen der Datei sind zwei Zeilen beschädigt worden.
# Prüft eure Vermutung mit Code, bevor ihr antwortet.

answer_9 <- ""   # "a", "b", "c" or "d"

check_answer(9, answer_9)


# ---- Aufgabe 10: Code lesen ------------------------------------------
# Dieser Code berechnet, wie oft die Befragten im Durchschnitt Milch
# trinken (4 = meistens täglich bis 1 = seltener):

survey |>
  summarise(mean_milk_frequency = mean(v007freq3_mi, na.rm = TRUE))

# Er läuft ohne Fehler. Aber über wen spricht die Zahl?
# Auf wie vielen Befragten beruht sie?

answer_10 <- NULL   # replace NULL with your code

check_answer(10, answer_10)


# ---- Aufgabe 11: Code lesen ------------------------------------------
# Dieser Code soll zeigen, wie viele Befragte bei welchem Einkaufsort
# kaufen:

survey |>
  select(v008ort_1discount:v008ort_9online) |>
  pivot_longer(everything(), names_to = "place", values_to = "is_mentioned") |>
  filter(is_mentioned == 1) |>
  count(place, name = "n_mentions") |>
  mutate(pct_mentions = round(100 * n_mentions / sum(n_mentions), 1))

# Laut Ergebnis kaufen 26,5 % beim Discounter. In Aufgabe 6 kam etwas
# anderes heraus. Worauf bezieht sich der Anteil in diesem Code?
#   a) auf die Befragten
#   b) auf alle Nennungen zusammen
#   c) auf die neun Einkaufsorte
#   d) auf die Haushalte

answer_11 <- ""   # "a", "b", "c" or "d"

check_answer(11, answer_11)


# ---- result ----------------------------------------------------------

show_results()
