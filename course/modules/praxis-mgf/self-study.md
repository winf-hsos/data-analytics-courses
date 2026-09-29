# Selbststudium bis Sitzung 2

Hier lernt ihr R, im eigenen Tempo, an einer durchgehenden Übung mit dem Kursdatensatz. Wer im Sommer „Werkzeuge der Markt- und Gesellschaftsforschung“ belegt hat, ist oft in ein bis zwei Stunden fertig. Wer bei null anfängt, braucht zwölf bis vierzehn. Beides ist in Ordnung; ab Sitzung 2 arbeitet ihr in Gruppen, und alle müssen dort mitkommen.

## Wie es funktioniert

```
   Selbsttest (Eingang)
            |
    alles richtig? ── ja ──────────────┐
            |                          |
          nein                         |
            |                          |
   Übung, Kapitel 1 bis 5              |
   mit Lesestellen und Assistent       |
            |                          |
   Selbsttest noch einmal              |
            |                          |
            └──────►  /final-check  ◄──────┘
```

1. **Mit dem Selbsttest anfangen**: `my-code/self-test/self_test.R` in Positron öffnen und Aufgabe für Aufgabe lösen. Nach jeder Aufgabe sagt eine Zeile, ob euer Ergebnis stimmt, und wenn nicht, welches Kapitel der Übung dazu passt.
2. **Alles richtig?** Dann direkt zur Abnahme (Schritt 4).
3. **Sonst die Übung**: fünf Kapitel in `my-code/self-study/`, von `chapter_1.R` bis `chapter_5.R`, der Reihe nach. Wer nur bei einzelnen Aufgaben hing, kann mit dem Kapitel anfangen, das der Selbsttest nennt, sollte Kapitel 5 aber in jedem Fall machen. Danach den Selbsttest noch einmal.
4. **Die Abnahme**: in OpenCode `/final-check` tippen. Euer Assistent führt euren Selbsttest aus und spricht dann mit euch über euren Code und über euren Befund aus Kapitel 5.

Der Selbsttest und die Abnahme haben keine Note und werden nicht eingesammelt. Sie sagen euch, ob ihr in Sitzung 2 mitkommt.

## Die Übung

Eine Leitfrage zieht sich durch alle fünf Kapitel: **Wo kaufen die Befragten ein, und wer kauft Bio?** Jedes Kapitel ist eine R-Datei mit Aufgaben. Zu jeder Aufgabe steht, was ihr vorher lesen solltet („Lesen:“), und bei vielen ein Kontrollwert („Kontrolle:“), mit dem ihr euer Ergebnis selbst prüft. Jede Datei läuft für sich: Oben steht der Code, der die Spalten aus den früheren Kapiteln wieder anlegt.

| Kapitel | Datei | Inhalt | ca. |
|---|---|---|---|
| **1** | `chapter_1.R` | Den Datensatz kennenlernen: Größe, Kennung, Präfixe, Codebuch, was nicht in den Daten steht | 1,5 h |
| **2** | `chapter_2.R` | Einzelne Variablen beschreiben: Skalenniveau, Kennzahlen, Faktoren, fehlende Werte, Rohwerte, Mehrfachantworten, Fragebatterien | 3 h |
| **3** | `chapter_3.R` | Gruppen vergleichen: `group_by()`, `summarise()` und `mutate()`, Anteile in Gruppen, Gruppen selbst bilden, wie viele dahinterstecken | 3 h |
| **4** | `chapter_4.R` | Abbildungen: Verteilung, Kategorien, Mehrfachantworten, zwei Kategorien, Boxplots, kleine Vielfache, eine Abbildung, die täuscht | 2–3 h |
| **5** | `chapter_5.R` | Eine Frage beantworten, allein: von der Frage über Variablen und Kennzahlen zur Abbildung und zu einem Befund in drei Sätzen | 2 h |

Die Dateien legt euer Assistent beim `/onboarding` oder beim `/update-semester` in `my-code/self-study/` an. Fehlen sie, tippt `/update-semester`.

## Was ihr lest

Hauptquelle ist ***R for Data Science*** (2. Auflage) von Hadley Wickham, Mine Çetinkaya-Rundel und Garrett Grolemund, frei online unter <https://r4ds.hadley.nz/>. Jede Aufgabe nennt den Abschnitt, den sie braucht. Im Überblick:

| Kapitel der Übung | R for Data Science | außerdem |
|---|---|---|
| 1 | [2 Workflow: basics](https://r4ds.hadley.nz/workflow-basics.html), [6.1–6.2 Scripts, Projects](https://r4ds.hadley.nz/workflow-scripts.html), [7.2 Reading data from a file](https://r4ds.hadley.nz/data-import.html#reading-data-from-a-file) | [mds12-schoko-milch.md](../../datasets/mds12-schoko-milch.md): Eckdaten, Präfixe, klein und groß; Codebuch S. 1–3 |
| 2 | [3.2–3.4 Rows, Columns, The pipe](https://r4ds.hadley.nz/data-transform.html#rows), [5.3 Lengthening data](https://r4ds.hadley.nz/data-tidy.html#sec-pivoting), [12.2 und 12.4](https://r4ds.hadley.nz/logicals.html), [13.3 und 13.6](https://r4ds.hadley.nz/numbers.html), [16.2 Factor basics](https://r4ds.hadley.nz/factors.html#factor-basics), [18.2 Explicit missing values](https://r4ds.hadley.nz/missing-values.html#explicit-missing-values) | Döring (2023), Kap. 8.4 Skalenniveaus; [mds12-schoko-milch.md](../../datasets/mds12-schoko-milch.md): die Fallstricke |
| 3 | [3.5–3.6 Groups, sample size](https://r4ds.hadley.nz/data-transform.html#groups), [12.4–12.5 Summaries, conditional transformations](https://r4ds.hadley.nz/logicals.html#sec-logical-summaries), [16.4 Factor order](https://r4ds.hadley.nz/factors.html#sec-modifying-factor-order) | |
| 4 | [1.2–1.5 Data visualization](https://r4ds.hadley.nz/data-visualize.html#first-steps), [9.3, 9.4, 9.6, 9.7 Layers](https://r4ds.hadley.nz/layers.html), [11.2 Labels](https://r4ds.hadley.nz/communication.html#labels), [19.3 Basic joins](https://r4ds.hadley.nz/joins.html#sec-mutating-joins) | Claus Wilke, [Directory of Visualizations](https://clauswilke.com/dataviz/directory-of-visualizations.html) |
| 5 | [10.2, 10.3, 10.5 Exploratory data analysis](https://r4ds.hadley.nz/EDA.html#questions) | [mds12-schoko-milch.md](../../datasets/mds12-schoko-milch.md): die Stichprobe |

Die Videoaufzeichnungen der Sitzungen aus dem Sommer liegen in ILIAS; sie zeigen dieselben Werkzeuge an denselben Daten.

## Mit dem Assistenten lernen

Tippt in OpenCode **`/self-study`**. Euer Assistent weiß dann, in welchem Kapitel ihr seid, zeigt euch die Lesestellen und begleitet euch durch die Aufgaben. Am Ende eines Kapitels sagt ihr „Kapitel 2 fertig“: Er führt eure Datei aus, vergleicht mit den Kontrollwerten und stellt euch eine Frage zu eurem Code.

Bei einer Aufgabe hilft er in Stufen: erst die Lesestelle, dann die passende Funktion, dann ein ähnliches Beispiel mit einer anderen Variable. Eine Lösung zeigt er erst, wenn ihr es selbst versucht habt, und dann lässt er sie euch erklären. Den Selbsttest löst er nicht.

Gut funktioniert:

- „Erklär mir, was `group_by()` macht, an einem Beispiel aus unserem Datensatz.“
- „Hier ist meine Fehlermeldung: … Was will R mir sagen?“
- „Ich habe Aufgabe 3.4 so gelöst: … Was habe ich übersehen?“
- „Stell mir drei kleine Übungsaufgaben zu `filter()` mit Variablen aus dem Block `d`, ohne Lösung.“

Wenig bringt: „Schreib mir den Code für Aufgabe 4.3.“ Ihr hättet eine Datei, die läuft, und stündet in Sitzung 2 ohne das da, was die Aufgabe üben sollte.

> Der Assistent kann diese Übung für euch lösen. Er kann sie nicht für euch lernen.

## Die Abnahme

Wer den Selbsttest besteht, tippt **`/final-check`**. Der Assistent

1. führt euren Selbsttest aus und prüft, ob alle elf Aufgaben richtig sind,
2. fragt euch zu zwei, drei Stellen eures Codes, warum ihr es so gemacht habt, und
3. lässt sich euren Befund aus Kapitel 5 erklären, falls ihr die Übung gemacht habt.

Es geht nicht darum, euch zu prüfen, sondern darum, dass ihr eure Zahlen erklären könnt. Genau das wird in Referat und Bericht verlangt. Das Ergebnis notiert er in `my-code/about-me.md`.
