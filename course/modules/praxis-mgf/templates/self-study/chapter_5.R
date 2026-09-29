# =====================================================================
#  Selbststudium, Kapitel 5: Eine Frage beantworten
#  Praxis der Markt- und Gesellschaftsforschung
#
#  Leitfrage der Übung: Wo kaufen die Befragten ein, und wer kauft Bio?
#
#  Zum Schluss geht ihr den ganzen Weg allein, an einer Frage, die ihr
#  aus vier auswählt. Genau so arbeitet ihr ab Sitzung 2 in der Gruppe an
#  eurem Thema: Frage, Variablen, Aufbereitung, Kennzahlen, Abbildung,
#  und ein Befund, für den ihr geradesteht.
#
#  Zeit: etwa 2 Stunden. Begleitung: "/self-study" in OpenCode.
#  Danach: "/final-check" (siehe unten).
# =====================================================================


# ---- Vorher lesen ----------------------------------------------------
#
#  - R4DS 10.2 "Questions", 10.3 "Variation", 10.5 "Covariation"
#    https://r4ds.hadley.nz/EDA.html#questions
#  - course/datasets/mds12-schoko-milch.md, "Die Stichprobe ist nicht
#    bundesrepräsentativ"
#  - Claus Wilke, "Directory of Visualizations"
#    https://clauswilke.com/dataviz/directory-of-visualizations.html


# ---- Wählt eine Frage ------------------------------------------------
#
#  A  Kaufen Haushalte mit höherem Einkommen mehr Bio?
#     (d049einkommen, v032bioanteil)
#  B  Kaufen Menschen auf dem Land häufiger direkt beim Erzeuger, im
#     Hofladen oder auf dem Wochenmarkt?
#     (d044stadt / D044stadtf, v008ort_5markt, v008ort_6hof)
#  C  Grüne Mobilität, grüner Konsum? Kaufen Haushalte mit E-Bike mehr
#     Bio? (d039besitz_9ebike, v032bioanteil)
#  D  Hängt die Einstellung zu Bio mit dem Umweltbewusstsein zusammen?
#     (p030green_* und p031bio_*: aus jeder Batterie einen Wert je
#     Person bilden, die umgepolten Aussagen vorher umdrehen)
#
#  Frage A und B habt ihr in Kapitel 3 und 4 schon angefangen; dort geht
#  ihr jetzt tiefer. C und D sind neu.
#
#  Gewählte Frage:


# ---- setup -----------------------------------------------------------

library(tidyverse)
survey <- read_csv("data/mds12_schoko_milch.csv") |>
  mutate(respondent_id = row_number(), .before = 1)


# ---- 5.1 Die Variablen -----------------------------------------------
# Welche Spalten braucht ihr? Findet sie im Codebuch, notiert Seite,
# Fragetext in Kurzform und die Codes. Legt eine kleine Tabelle an, die
# nur respondent_id und diese Spalten enthält.




# ---- 5.2 Skalenniveau und Datentyp -----------------------------------
# Welches Skalenniveau hat jede Spalte? Passt der Datentyp? Wandelt um,
# wo nötig (Faktor mit richtiger Reihenfolge, Gruppen, Werte umpolen).




# ---- 5.3 Wertebereich und Füllgrad -----------------------------------
# Welche Werte kommen vor, wie viele fehlen, und warum fehlen sie? Wen
# schließt ihr aus, und wie viele sind es?




# ---- 5.4 Kennzahlen --------------------------------------------------
# Beschreibt jede Variable einzeln und dann den Zusammenhang: Anteile je
# Gruppe, Mittelwerte je Gruppe oder, bei Frage D, eine Korrelation
# (cor(), mit use = "complete.obs"). Nennt zu jeder Zahl, auf wie
# vielen Befragten sie beruht.




# ---- 5.5 Eine Abbildung ----------------------------------------------
# Eine Abbildung, die eure Frage beantwortet, so, dass ihr sie in einen
# Bericht übernehmen könntet: passende Form, sinnvolle Reihenfolge,
# Beschriftungen, bei Anteilen eine Achse, die bei null beginnt.
# Speichert sie als plot_answer.




# ---- 5.6 Der Befund --------------------------------------------------
# Drei Sätze, als Kommentar:
#   1. Das Ergebnis: Was zeigen die Daten, mit Zahl?
#   2. Die Basis: Über wen spricht die Zahl, wie viele sind es, wer
#      fehlt?
#   3. Die Grenze: Was folgt daraus ausdrücklich nicht? (Denkt an die
#      Stichprobe und daran, dass ein Zusammenhang keine Ursache ist.)
#
# Ergebnis:
# Basis:
# Grenze:


# ---- Fertig? ---------------------------------------------------------
# Session > Restart R, dann oben rechts auf "Source". Läuft die Datei
# ohne Fehler durch, sagt eurem Assistenten "Kapitel 5 fertig".
#
# Danach die Abnahme: Löst den Selbsttest in my-code/self-test/ noch
# einmal, und tippt in OpenCode "/final-check". Euer Assistent führt euren
# Selbsttest aus, schaut sich die Ergebnisse an und spricht mit euch
# über euren Code und über euren Befund aus diesem Kapitel.
