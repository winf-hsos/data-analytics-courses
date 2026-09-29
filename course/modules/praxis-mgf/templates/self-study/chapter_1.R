# =====================================================================
#  Selbststudium, Kapitel 1: Den Datensatz kennenlernen
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Die Übung zieht sich durch fünf Kapitel und eine Leitfrage:
#
#      Wo kaufen die Befragten ein, und wer kauft Bio?
#
#  Jedes Kapitel ist eine eigene Datei in my-code/self-study/. Ihr arbeitet
#  sie der Reihe nach durch. Zu jeder Aufgabe steht, was ihr vorher lesen
#  solltet ("Lesen:"), und bei vielen ein Kontrollwert, mit dem ihr euer
#  Ergebnis selbst prüfen könnt ("Kontrolle:").
#
#  So geht es:
#    1. Diese Datei in Positron öffnen (der Kursordner muss geöffnet sein).
#    2. Den Block "setup" ausführen: Cursor hinein, Strg+Enter
#       (Mac: Cmd+Enter), Zeile für Zeile.
#    3. Aufgabe für Aufgabe: Code unter die Aufgabe schreiben, ausführen,
#       Ergebnis mit dem Kontrollwert vergleichen. Fragen, die man in
#       Worten beantwortet, beantwortet ihr als Kommentar (# ...).
#    4. Am Ende muss die Datei nach "Session > Restart R" von oben bis
#       unten ohne Fehler durchlaufen.
#
#  Euer Assistent begleitet euch: In OpenCode "/self-study" tippen.
#  Er zeigt euch die Lesestellen, erklärt Funktionen und Fehlermeldungen
#  und schaut sich am Ende eines Kapitels euren Code an. Die Lösung
#  schreibt er euch erst, wenn ihr es selbst versucht habt.
#
#  Zeit für dieses Kapitel: etwa 1,5 Stunden.
#
#  Hilfe: course/datasets/mds12-schoko-milch.md (Aufbau, Präfixe, Codes)
#         data/M3b_Musterstudie-quantitativ.pdf (das Codebuch)
#         course/material/r-conventions.md (wie Code hier aussieht)
# =====================================================================


# ---- Vorher lesen ----------------------------------------------------
#
#  R for Data Science (2. Auflage), frei online:
#  - Kapitel 2 "Workflow: basics", ganz
#    https://r4ds.hadley.nz/workflow-basics.html
#  - Kapitel 6.1 und 6.2 "Scripts" und "Projects"
#    https://r4ds.hadley.nz/workflow-scripts.html
#  - Kapitel 7.2 "Reading data from a file"
#    https://r4ds.hadley.nz/data-import.html#reading-data-from-a-file
#  - course/datasets/mds12-schoko-milch.md, die Abschnitte "Eckdaten",
#    "Die Präfixe" und "Klein oder groß"


# ---- setup -----------------------------------------------------------

library(tidyverse)
survey <- read_csv("data/mds12_schoko_milch.csv")


# ---- 1.1 Wie groß ist der Datensatz? ---------------------------------
# Wie viele Zeilen und wie viele Spalten hat survey? Was ist eine Zeile,
# was eine Spalte? Antwortet in einem Satz als Kommentar.
# Lesen: course/datasets/mds12-schoko-milch.md, "Eckdaten"




# ---- 1.2 Wer ist wer? ------------------------------------------------
# Jede Beobachtung in einem Datensatz sollte sich eindeutig bezeichnen
# lassen, damit man sie wiederfindet und Tabellen verbinden kann.
# Gibt es in survey eine Spalte, die das leistet? Prüft es für die ersten
# fünf Spalten mit n_distinct(): Eine Kennung hätte so viele verschiedene
# Werte, wie es Zeilen gibt.
# Wenn keine passt: Legt mit mutate() eine neue Spalte respondent_id an,
# die die Zeilen durchnummeriert (row_number()), und speichert das
# Ergebnis wieder unter survey.
# Lesen: R4DS 3.3 "Columns", https://r4ds.hadley.nz/data-transform.html#columns
# Kontrolle: respondent_id hat 2.811 verschiedene Werte.




# ---- 1.3 813 Spalten, ein System --------------------------------------
# Der erste Buchstabe eines Variablennamens sagt, zu welchem Block die
# Frage gehört. Wie viele Spalten gehören zum Block v (Verhalten)?
# Wählt sie mit select(starts_with("v")) aus und zählt sie mit ncol().
# Und jetzt aufgepasst: starts_with() unterscheidet von sich aus nicht
# zwischen groß und klein. Wie viele Spalten beginnen mit einem kleinen v?
# Schlagt in der Hilfe nach (?starts_with), wie man das einstellt.
# Warum kann der Unterschied hier wichtig sein?
# Lesen: course/datasets/mds12-schoko-milch.md, "Die Präfixe" und
#        "Klein oder groß"
# Kontrolle: mit großem und kleinem v 86, nur kleines v 85.




# ---- 1.4 Ins Codebuch schauen ----------------------------------------
# Die Spalte v032bioanteil enthält Zahlen von 1 bis 5. Was bedeuten sie?
# Sucht die Frage im Codebuch (data/M3b_Musterstudie-quantitativ.pdf;
# in der PDF mit Strg+F nach "v032" suchen). Notiert als Kommentar:
# die Seite, den Fragetext in Kurzform und was die Codes 1 und 5 heißen.
# Kontrolle: Die Frage steht auf Seite 28.




# ---- 1.5 Vom Rohwert zur aufbereiteten Variable ----------------------
# Zeigt für die ersten fünf Befragten respondent_id, q002geburt,
# Q002alter, Q002altergru4 und Q002altergru4f nebeneinander
# (select() und slice()). Beschreibt in einem Satz, wie die vier
# Altersspalten zusammenhängen, und welche ihr für eine Tabelle und
# welche für eine Abbildung nehmen würdet.
# Lesen: R4DS 3.2 "Rows" (dort slice() und Verwandte),
#        https://r4ds.hadley.nz/data-transform.html#rows




# ---- 1.6 Was nicht in den Daten steht --------------------------------
# Lest im Codebuch die Seiten 1 bis 3 (Ziel der Befragung, Stichprobe,
# Durchführung). Nennt als Kommentar zwei Dinge, die man für die
# Auswertung wissen muss, die aber in keiner Spalte stehen.
# Lesen: course/datasets/mds12-schoko-milch.md, "Die Stichprobe ist
#        nicht bundesrepräsentativ"




# ---- Fertig? ---------------------------------------------------------
# Session > Restart R, dann die ganze Datei ausführen: oben rechts über
# dem Editor auf "Source" klicken. Läuft sie ohne Fehler durch,
# sagt eurem Assistenten "Kapitel 1 fertig". Er schaut sich euren Code an
# und stellt euch eine Frage dazu. Weiter geht es in chapter_2.R.
