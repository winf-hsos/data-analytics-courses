# =====================================================================
#  Selbststudium, Kapitel 3: Gruppen vergleichen
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Leitfrage der Übung: Wo kaufen die Befragten ein, und wer kauft Bio?
#
#  Jetzt wird es interessant: Unterscheiden sich Gruppen? Kaufen
#  Menschen auf dem Dorf anders ein als in der Großstadt, Haushalte mit
#  mehr Einkommen häufiger Bio? Das Werkzeug dafür ist group_by() mit
#  summarise(), und die wichtigste Frage bei jeder Gruppe lautet: Wie
#  viele Menschen stecken dahinter?
#
#  Zeit: etwa 3 Stunden. Begleitung: "/self-study" in OpenCode.
# =====================================================================


# ---- Vorher lesen ----------------------------------------------------
#
#  - R4DS 3.5 "Groups" und 3.6 "Case study: aggregates and sample size"
#    https://r4ds.hadley.nz/data-transform.html#groups
#  - R4DS 12.4 "Summaries" (Anteile aus TRUE/FALSE)
#    https://r4ds.hadley.nz/logicals.html#sec-logical-summaries
#  - R4DS 12.5 "Conditional transformations" (if_else, case_when)
#    https://r4ds.hadley.nz/logicals.html#conditional-transformations


# ---- setup -----------------------------------------------------------
# Die Spalten aus Kapitel 2, damit diese Datei für sich läuft.

library(tidyverse)
survey <- read_csv("data/mds12_schoko_milch.csv") |>
  mutate(
    respondent_id = row_number(),
    city_size = factor(D044stadtf, levels = c(
      "Großstadt", "Große Mittelstadt", "Große Kleinstadt",
      "Kleinstadt >5000", "Kleinstadt <5000", "Dorf"
    )),
    organic_share = factor(v032bioanteil, levels = 1:5, labels = c(
      "(fast) nie Bio", "deutlich weniger als die Hälfte", "etwa die Hälfte",
      "deutlich mehr als die Hälfte", "(fast) nur Bio"
    )),
    .before = 1
  )


# ---- 3.1 summarise() oder mutate()? ----------------------------------
# Führt beide Zeilen aus und vergleicht die Ergebnisse. Wie viele Zeilen
# hat jedes? Erklärt den Unterschied in einem Satz.

survey |>
  summarise(n_respondents = n())

survey |>
  mutate(n_respondents = n())

# Welche Abkürzung gibt es für das summarise() oben?
# Lesen: R4DS 3.3 und 3.5
# Kontrolle: 1 Zeile gegen 2.811 Zeilen.




# ---- 3.2 Was group_by() ändert ---------------------------------------
# Setzt vor beide Befehle aus 3.1 ein group_by(Q004geschlechtf).
# Was ändert sich bei summarise(), was bei mutate()? Woher kommt die
# Zeile mit NA? (Spur: course/datasets/mds12-schoko-milch.md, "Zwei
# Menschen verschwinden in der Aufbereitung")
# Lesen: R4DS 3.5.1 bis 3.5.3




# ---- 3.3 Stadt und Land: Wer kauft direkt beim Erzeuger? -------------
# Berechnet je Wohnortgröße (city_size) die Zahl der Befragten und den
# Anteil in Prozent, die im Hofladen (v008ort_6hof) und auf dem
# Wochenmarkt (v008ort_5markt) einkaufen. Lasst die 7 Personen ohne
# Angabe zum Wohnort weg und schreibt einen Kommentar, warum.
# Was fällt auf, wenn ihr beide Spalten nebeneinander lest?
# Lesen: R4DS 12.4
# Kontrolle: Hofladen im Dorf 17,8 %, Wochenmarkt im Dorf 13,1 %.




# ---- 3.4 Anteile innerhalb einer Gruppe ------------------------------
# Wie verteilt sich der Bio-Anteil (organic_share) innerhalb jeder
# Wohnortgröße? Zählt mit count(city_size, organic_share), gruppiert
# dann nach city_size und berechnet mit mutate() den Anteil jeder Zeile
# an ihrer Gruppe in Prozent (pct = 100 * n / sum(n)). Hebt am Ende die
# Gruppierung mit ungroup() auf.
# Warum hier mutate() und nicht summarise()?
# Lasst Personen ohne Angabe bei Wohnort oder Bio-Anteil weg.
# Kontrolle: "(fast) nie Bio" in der Großstadt 20,9 %, im Dorf 23,4 %.




# ---- 3.5 Gruppen selbst bilden ---------------------------------------
# Das Einkommen (d049einkommen) hat elf Stufen (Codebuch Seite 33). Für
# einen Vergleich sind das zu viele. Bildet mit case_when() eine Spalte
# income_group mit vier Gruppen:
#   "unter 2.000 €"            Codes 1 bis 4
#   "2.000 bis unter 3.500 €"  Codes 5 bis 7
#   "3.500 bis unter 5.000 €"  Codes 8 bis 10
#   "5.000 € und mehr"         Code 11
# Wer keine Angabe gemacht hat, bleibt NA. Bringt die Gruppen mit
# fct_relevel() in die richtige Reihenfolge.
# Bildet außerdem eine Spalte is_organic_half: TRUE, wenn jemand
# mindestens etwa die Hälfte Bio kauft (v032bioanteil ab 3).
# Berechnet dann je Einkommensgruppe die Zahl der Befragten und den
# Anteil mit is_organic_half in Prozent.
# Lesen: R4DS 12.5, https://r4ds.hadley.nz/logicals.html#conditional-transformations;
#        R4DS 16.4, https://r4ds.hadley.nz/factors.html#sec-modifying-factor-order
# Kontrolle: 291 Befragte in "5.000 € und mehr"; Anteil mit
#            is_organic_half in "unter 2.000 €" 38,3 %, in
#            "5.000 € und mehr" 50,2 %.




# ---- 3.6 Kinder und Discounter ---------------------------------------
# Kaufen Haushalte mit Kindern unter 12 häufiger beim Discounter?
# Bildet has_children aus D043kinderzahl (mehr als 0 Kinder) und
# vergleicht den Anteil, der beim Discounter (v008ort_1discount)
# einkauft.
# Vorher: Wie viele Befragte haben bei has_children ein NA, und wer ist
# das? (Kapitel 2, Aufgabe 2.6.) Über wen spricht euer Vergleich also?
# Kontrolle: 436 Befragte mit Kindern unter 12.




# ---- 3.7 Wie viele stecken dahinter? ---------------------------------
# Berechnet das Durchschnittsalter nach Ernährungsweise (V041nofleischf)
# zusammen mit der Zahl der Befragten je Gruppe, sortiert nach der
# Gruppengröße. Wie sehr würdet ihr dem Mittelwert der kleinsten Gruppe
# trauen? Was müsste neben dieser Zahl in einem Bericht stehen?
# Lesen: R4DS 3.6, https://r4ds.hadley.nz/data-transform.html#sec-sample-size
# Kontrolle: Die kleinste Gruppe mit Angabe sind die 36 veganen Befragten.




# ---- Fertig? ---------------------------------------------------------
# Session > Restart R, dann oben rechts auf "Source". Läuft die Datei
# ohne Fehler durch, sagt eurem Assistenten "Kapitel 3 fertig".
# Weiter geht es in chapter_4.R.
