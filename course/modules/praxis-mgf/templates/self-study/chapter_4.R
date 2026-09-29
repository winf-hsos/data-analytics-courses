# =====================================================================
#  Selbststudium, Kapitel 4: Abbildungen
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Leitfrage der Übung: Wo kaufen die Befragten ein, und wer kauft Bio?
#
#  Aus den Tabellen der Kapitel 2 und 3 werden Abbildungen. Zwei Fragen
#  begleiten jede: Welche Form passt zur Frage und zur Art der Variable?
#  Und: Versteht ein Mensch die Abbildung ohne euren Code?
#
#  Jede Abbildung bekommt mit labs() Beschriftungen in der Sprache eures
#  Berichts, also deutsch, keine Variablennamen.
#
#  Zeit: etwa 2 bis 3 Stunden. Begleitung: "/self-study" in OpenCode.
# =====================================================================


# ---- Vorher lesen ----------------------------------------------------
#
#  - R4DS 1.2 bis 1.5: die ersten Schritte, Verteilungen, Zusammenhänge
#    https://r4ds.hadley.nz/data-visualize.html#first-steps
#  - R4DS 9.3 "Geometric objects", 9.4 "Facets", 9.6 "Position adjustments"
#    https://r4ds.hadley.nz/layers.html#sec-geometric-objects
#  - R4DS 11.2 "Labels"
#    https://r4ds.hadley.nz/communication.html#labels
#  - Welche Abbildung wofür: Claus Wilke, "Directory of Visualizations"
#    https://clauswilke.com/dataviz/directory-of-visualizations.html


# ---- setup -----------------------------------------------------------
# Die Spalten aus den Kapiteln 2 und 3, damit diese Datei für sich läuft.

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
    income_group = case_when(
      d049einkommen <= 4 ~ "unter 2.000 €",
      d049einkommen <= 7 ~ "2.000 bis unter 3.500 €",
      d049einkommen <= 10 ~ "3.500 bis unter 5.000 €",
      d049einkommen == 11 ~ "5.000 € und mehr"
    ),
    income_group = fct_relevel(
      income_group, "unter 2.000 €", "2.000 bis unter 3.500 €",
      "3.500 bis unter 5.000 €", "5.000 € und mehr"
    ),
    .before = 1
  )


# ---- 4.1 Eine Verteilung: das Alter ----------------------------------
# Zeichnet ein Histogramm des Alters (Q002alter) mit geom_histogram().
# Probiert binwidth = 1, 5 und 10. Welche Breite zeigt die Verteilung am
# besten, und was seht ihr (Form, Spitzen, Grenzen)?
# Beschriftet beide Achsen. Speichert die Abbildung als plot_age.
# Lesen: R4DS 1.4 "Visualizing distributions",
#        https://r4ds.hadley.nz/data-visualize.html#visualizing-distributions




# ---- 4.2 Eine Kategorie: der Wohnort ---------------------------------
# Ein Balkendiagramm der Befragten je Wohnortgröße, in der Reihenfolge
# des Codebuchs (city_size). Lasst die 7 ohne Angabe weg und sagt im
# Kommentar, dass ihr es tut.
# Warum sortiert man hier nicht nach Häufigkeit, wie in Sitzung 1?
# Speichert die Abbildung als plot_city_size.




# ---- 4.3 Mehrfachantworten zeigen: die Einkaufsorte ------------------
# Holt euch die Tabelle places aus Kapitel 2, Aufgabe 2.7 (Code hierher
# kopieren). Die Spaltennamen (v008ort_5markt) versteht niemand. Legt
# deshalb eine kleine Tabelle place_labels an, mit den Spalten place und
# label ("Discounter", "Supermarkt", ...; die Bezeichnungen stehen im
# Codebuch auf Seite 8), und verbindet sie mit left_join().
# Dann: liegende Balken, ein Balken je Ort, sortiert nach dem Anteil
# (fct_reorder()), die x-Achse in Prozent.
# Lesen: R4DS 19.3 "Basic joins", https://r4ds.hadley.nz/joins.html#sec-mutating-joins;
#        R4DS 16.4, https://r4ds.hadley.nz/factors.html#sec-modifying-factor-order
# Speichert die Abbildung als plot_places.




# ---- 4.4 Zwei Kategorien: Bio-Anteil nach Einkommen ------------------
# Zeigt, wie sich der Bio-Anteil (organic_share) in den vier
# Einkommensgruppen (income_group) verteilt. Drei Varianten mit
# geom_bar(aes(x = income_group, fill = organic_share)):
#   a) ohne position-Angabe (gestapelt)
#   b) position = "dodge" (nebeneinander)
#   c) position = "fill" (gestapelt auf 100 %)
# Welche beantwortet die Frage "Kaufen Menschen mit mehr Einkommen mehr
# Bio?" am besten, und warum? Welche wäre irreführend?
# Personen ohne Angabe bei Einkommen oder Bio-Anteil weglassen.
# Lesen: R4DS 9.6 "Position adjustments",
#        https://r4ds.hadley.nz/layers.html#position-adjustments
# Speichert die beste Variante als plot_organic_income.




# ---- 4.5 Eine Zahl je Gruppe: Alter und Bio --------------------------
# Sind die, die viel Bio kaufen, jünger oder älter? Zeichnet Boxplots
# des Alters je Stufe von organic_share (geom_boxplot()). Legt die
# Kategorien auf die y-Achse, damit die langen Texte lesbar bleiben.
# Was zeigt ein Boxplot, und was verbirgt er? Wie viele Menschen stecken
# in der Gruppe "(fast) nur Bio"?
# Lesen: R4DS 1.5 "Visualizing relationships",
#        https://r4ds.hadley.nz/data-visualize.html#visualizing-relationships




# ---- 4.6 Kleine Vielfache: Hofladen und Wochenmarkt -----------------
# Aus Kapitel 3, Aufgabe 3.3: der Anteil, der im Hofladen und auf dem
# Wochenmarkt einkauft, je Wohnortgröße. Bringt die beiden Anteile mit
# pivot_longer() untereinander (eine Spalte für den Ort, eine für den
# Anteil) und zeichnet zwei Balkendiagramme nebeneinander mit
# facet_wrap(). Was zeigt die Abbildung, was die Tabelle nicht so
# schnell zeigt?
# Lesen: R4DS 9.4 "Facets", https://r4ds.hadley.nz/layers.html#facets




# ---- 4.7 Eine Abbildung, die täuscht ---------------------------------
# Nehmt plot_places aus 4.3 und lasst die Achse erst bei 5 Prozent
# beginnen: + coord_cartesian(xlim = c(5, NA)). Vergleicht beide
# Fassungen. Wie viel größer sieht der Balken "Supermarkt" gegenüber
# "Onlinelebensmittelhändler" jetzt aus, und wie viel größer ist er
# wirklich? Warum müssen Balken bei null beginnen?
# Lesen: R4DS 9.7 "Coordinate systems",
#        https://r4ds.hadley.nz/layers.html#coordinate-systems




# ---- Fertig? ---------------------------------------------------------
# Session > Restart R, dann oben rechts auf "Source". Läuft die Datei
# ohne Fehler durch, sagt eurem Assistenten "Kapitel 4 fertig".
# Weiter geht es in chapter_5.R.
