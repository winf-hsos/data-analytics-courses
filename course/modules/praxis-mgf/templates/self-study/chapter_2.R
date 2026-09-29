# =====================================================================
#  Selbststudium, Kapitel 2: Einzelne Variablen beschreiben
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Leitfrage der Übung: Wo kaufen die Befragten ein, und wer kauft Bio?
#
#  In diesem Kapitel beschreibt ihr einzelne Variablen: Was messen sie,
#  auf welchem Skalenniveau, wie viele Werte fehlen, welche Kennzahl und
#  welche Darstellung passt? Dazu drei Datenformen, die in Befragungen
#  ständig vorkommen: Codes, die erst eine Bedeutung bekommen müssen,
#  Mehrfachantworten und Fragebatterien.
#
#  Zeit: etwa 3 Stunden. Kontrollwerte wie in Kapitel 1.
#  Begleitung: "/self-study" in OpenCode.
# =====================================================================


# ---- Vorher lesen ----------------------------------------------------
#
#  - Döring (2023), Kapitel 8.4 "Messung und die vier Skalenniveaus"
#  - R4DS 3.2 "Rows" und 3.3 "Columns"
#    https://r4ds.hadley.nz/data-transform.html#rows
#  - R4DS 3.4 "The pipe"
#    https://r4ds.hadley.nz/data-transform.html#sec-the-pipe
#  - R4DS 13.3 "Counts" und 13.6 "Numeric summaries"
#    https://r4ds.hadley.nz/numbers.html#sec-counts
#  - R4DS 16.2 "Factor basics"
#    https://r4ds.hadley.nz/factors.html#factor-basics
#  - course/datasets/mds12-schoko-milch.md, "Die Fallstricke"


# ---- setup -----------------------------------------------------------

library(tidyverse)
survey <- read_csv("data/mds12_schoko_milch.csv") |>
  mutate(respondent_id = row_number(), .before = 1)


# ---- 2.1 Skalenniveaus ------------------------------------------------
# Bestimmt für jede Variable das Skalenniveau (nominal, ordinal,
# intervall- oder verhältnisskaliert), mit einem halben Satz Begründung:
#   q003land, D044stadtf, Q002alter, v032bioanteil, d049einkommen,
#   p031bio_1lieberbio
# Und dann: Welchen Datentyp hat R jeder dieser Spalten gegeben
# (glimpse())? Wo passt er nicht zum Skalenniveau?
# Lesen: Döring 8.4; R4DS 16.1 und 16.2
#
# q003land:
# D044stadtf:
# Q002alter:
# v032bioanteil:
# d049einkommen:
# p031bio_1lieberbio:




# ---- 2.2 Das Alter beschreiben ----------------------------------------
# Berechnet in einem einzigen summarise() Minimum, Maximum, Median und
# Standardabweichung von Q002alter. Warum sind das die passenden
# Kennzahlen für diese Variable?
# Lesen: R4DS 13.6 "Numeric summaries",
#        https://r4ds.hadley.nz/numbers.html#numeric-summaries
# Kontrolle: Median 50, Standardabweichung 14,7.




# ---- 2.3 Der Wohnort, in der richtigen Reihenfolge -------------------
# Zählt die Befragten nach D044stadtf mit count(). Die Reihenfolge ist
# alphabetisch und damit sinnlos: "Dorf" steht vor "Großstadt".
# Legt eine neue Spalte city_size an, die dieselben Werte als Faktor
# enthält, in der Reihenfolge des Codebuchs (Seite 32), von "Großstadt"
# bis "Dorf". Zählt dann nach city_size.
# Welche Kategorie ist die häufigste (der Modus)? Wie viele haben keine
# Angabe gemacht?
# Tipp: factor(D044stadtf, levels = c("Großstadt", ...)). Schreibt die
# Werte genau so, wie count() sie zeigt; ein Tippfehler macht aus einem
# Wert still ein NA.
# Lesen: R4DS 16.2 "Factor basics", https://r4ds.hadley.nz/factors.html#factor-basics
# Kontrolle: In der Tabelle steht "Große Mittelstadt" an zweiter Stelle,
#            NA bei 7 Personen.




# ---- 2.4 Codes eine Bedeutung geben ----------------------------------
# v032bioanteil ist der Bio-Anteil am eigenen Einkauf, als Code 1 bis 5
# (Kapitel 1, Aufgabe 1.4). Legt eine Spalte organic_share an, die die
# Codes als Text trägt, in der richtigen Reihenfolge: factor() mit
# levels = 1:5 und labels = c(...).
# Zählt dann nach organic_share und berechnet den Anteil in Prozent
# (mutate() nach count()). Welcher Wert ist der Median?
# Lesen: R4DS 16.2; R4DS 3.3 (mutate)
# Kontrolle: "(fast) nie Bio" 21,7 %, "etwa die Hälfte" 26,3 %,
#            18 Personen ohne Angabe.




# ---- 2.5 Wer hat nicht geantwortet? ----------------------------------
# Wie viele Befragte haben beim Einkommen (d049einkommen) keine Angabe
# gemacht, absolut und in Prozent? Warum könnten sie fehlen? Ist das
# dieselbe Art Fehlen wie bei einer Frage, die jemandem gar nicht
# gestellt wurde?
# Lesen: R4DS 18.2 "Explicit missing values",
#        https://r4ds.hadley.nz/missing-values.html#explicit-missing-values
# Kontrolle: 3,6 %.




# ---- 2.6 Rohdaten sind nicht glaubwürdig -----------------------------
# Die Frage nach der Zahl der Kinder unter 12 Jahren gibt es zweimal:
# roh (d043kinderzahl) und aufbereitet (D043kinderzahl).
#   a) Vergleicht das Maximum beider Spalten. Was ist passiert?
#   b) Zeigt die Zeilen, die roh einen Wert haben, aufbereitet aber
#      nicht, zusammen mit der Haushaltsgröße d042hhzahl. Woran erkennt
#      man, dass die Werte nicht stimmen können?
#   c) Wem wurde die Frage überhaupt gestellt? Zählt mit
#      count(d042hhzahl, is_asked = !is.na(d043kinderzahl)) und schlagt
#      im Codebuch (Seite 32) die Bedingung nach.
# Lesen: course/datasets/mds12-schoko-milch.md, "Fehlend heißt oft:
#        nicht gefragt"; R4DS 12.2 "Comparisons",
#        https://r4ds.hadley.nz/logicals.html#comparisons
# Kontrolle: 12 Werte wurden bei der Aufbereitung entfernt.




# ---- 2.7 Mehrfachantworten -------------------------------------------
# Bei "Wo kaufen Sie gewöhnlich Ihre Lebensmittel ein?" konnte jede
# Person mehrere Orte nennen: je Ort eine Spalte, von v008ort_1discount
# bis v008ort_9online (1 = genannt, 0 = nicht genannt).
# Berechnet für jeden der neun Orte den Anteil der Befragten, die ihn
# genannt haben, in Prozent, und sortiert absteigend.
# Weg: summarise(across(v008ort_1discount:v008ort_9online, mean)), dann
# mit pivot_longer() aus einer breiten Zeile eine lange Tabelle machen.
# Warum ist der Mittelwert einer 0/1-Spalte ein Anteil?
# Speichert das Ergebnis unter places; ihr braucht es in Kapitel 4.
# Lesen: R4DS 5.3 "Lengthening data", https://r4ds.hadley.nz/data-tidy.html#sec-pivoting;
#        R4DS 12.4 "Summaries", https://r4ds.hadley.nz/logicals.html#sec-logical-summaries;
#        course/datasets/mds12-schoko-milch.md, "Mehrfachantworten"
# Kontrolle: Wochenmarkt 17,5 %, Hofladen 14,1 %, Bioladen 12,8 %.




# ---- 2.8 Eine Fragebatterie ------------------------------------------
# Frage 31 (Codebuch Seite 27 und 28) besteht aus sieben Aussagen zu
# Bio-Produkten, jede von +2 (trifft voll und ganz zu) bis -2 (trifft
# überhaupt nicht zu): die Spalten p031bio_1lieberbio bis
# p031bio_7besserfuehlen.
#   a) Berechnet den Mittelwert jeder Aussage (across(starts_with(...))).
#   b) Zwei Aussagen sind im Codebuch mit (R) markiert. Welche, und was
#      heißt das für einen Mittelwert über alle sieben Aussagen?
# Kontrolle: p031bio_5gesund hat den höchsten Mittelwert, 0,18.




# ---- Fertig? ---------------------------------------------------------
# Session > Restart R, dann oben rechts auf "Source". Läuft die Datei
# ohne Fehler durch, sagt eurem Assistenten "Kapitel 2 fertig".
# Weiter geht es in chapter_3.R.
