# Selbststudium bis Sitzung 2

Hier lernt ihr R, im eigenen Tempo. Wer im Sommer „Werkzeuge der Markt- und Gesellschaftsforschung“ belegt hat, braucht ein bis zwei Stunden. Wer bei null anfängt, acht bis zehn. Beides ist in Ordnung; ab Sitzung 2 arbeitet ihr in Gruppen, und alle müssen dort mitkommen.

## Wie es funktioniert

```
        Selbsttest
            |
       bestanden?  ── ja ──►  fertig
            |
          nein
            |
   die Stufe, an der es hakt
            |
        Selbsttest
```

1. **Mit dem Selbsttest anfangen**, nicht mit dem Lernen: `my-code/self-test/self_test.R` in Positron öffnen und Aufgabe für Aufgabe lösen. Nach jeder Aufgabe prüft eine Zeile, ob euer Ergebnis stimmt.
2. **Wer alles richtig hat, ist fertig.**
3. Wer nicht: Jede Aufgabe sagt, zu welcher **Stufe** sie gehört. Arbeitet die Stufen durch, an denen es gehakt hat, und macht dann die Aufgaben noch einmal.

Der Test hat keine Note und wird nicht eingesammelt. Er sagt euch, ob ihr in Sitzung 2 mitkommt.

> Der Assistent kann diesen Test für euch lösen. Er kann ihn nicht für euch bestehen.

Euer Assistent löst deshalb keine Aufgabe des Selbsttests. Er erklärt euch aber alles, was ihr dafür braucht: eine Funktion, eine Fehlermeldung, eine ähnliche Aufgabe mit einer anderen Variable.

## Die Stufen

| Stufe | Inhalt | ca. |
|---|---|---|
| **0** | Die Arbeitsumgebung läuft | 0,5 h |
| **1** | Daten laden und ansehen, Variablen und Skalenniveaus | 3 h |
| **2** | Daten umformen mit dem tidyverse | 3 h |
| **3** | Abbildungen mit ggplot2 | 2 h |

### Stufe 0: Die Arbeitsumgebung läuft

- `/onboarding` in OpenCode ist durchgelaufen, der Systemcheck ist grün oder gelb.
- Der Kursordner ist in Positron geöffnet, `my-code/session_1.R` läuft von oben bis unten durch.
- Falls nicht: [software.md](../../material/software.md) und euer Assistent.

### Stufe 1: Daten laden und ansehen

- Den Durchstich aus Sitzung 1 noch einmal selbst tippen, Teil 1 bis 4: [session-1.md](sessions/session-1.md)
- *R for Data Science*, Kapitel [Whole Game](https://r4ds.hadley.nz/whole-game.html), vor allem [Workflow: basics](https://r4ds.hadley.nz/workflow-basics.html) und [Data import](https://r4ds.hadley.nz/data-import.html)
- Den Datensatz kennenlernen: [mds12-schoko-milch.md](../../datasets/mds12-schoko-milch.md), besonders die Präfixe und klein gegen groß
- Skalenniveaus: Döring (2023), Kapitel 8.4
- Übungsaufgabe aus dem Sommer: [Variablen eines Datensatzes erkunden](https://winf-hsos.github.io/university-docs/quarto/applied_analytics/exercise_survey_explore_variables.pdf)
- Die Videoaufzeichnung der ersten Sitzung aus dem Sommer liegt in ILIAS.

### Stufe 2: Daten umformen

- *R for Data Science*, Kapitel [Data transformation](https://r4ds.hadley.nz/data-transform.html) und [Joins](https://r4ds.hadley.nz/joins.html)
- Übungsaufgabe aus dem Sommer: [Gruppierte Betrachtung von Variablen](https://winf-hsos.github.io/university-docs/quarto/applied_analytics/exercise_survey_analyze_grouped_variables.pdf)
- Fehlende Werte verstehen: der Abschnitt „Fehlend heißt oft: nicht gefragt“ in [mds12-schoko-milch.md](../../datasets/mds12-schoko-milch.md)
- Videoaufzeichnungen der zweiten und dritten Sitzung aus dem Sommer in ILIAS

### Stufe 3: Abbildungen

- *R for Data Science*, Kapitel [Data visualization](https://r4ds.hadley.nz/data-visualize.html) und [Layers](https://r4ds.hadley.nz/layers.html)
- Übungsaufgabe aus dem Sommer: [Explorative Datenanalyse](https://winf-hsos.github.io/university-docs/quarto/applied_analytics/exercise_survey_exploratory_data_analysis.pdf)
- Welche Abbildung wofür: [Directory of Visualizations](https://clauswilke.com/dataviz/directory-of-visualizations.html) aus Claus Wilkes *Fundamentals of Data Visualization*
- Videoaufzeichnung der vierten Sitzung aus dem Sommer in ILIAS

## Mit dem Assistenten lernen

Gut funktioniert:

- „Erklär mir, was `group_by()` macht, an einem Beispiel aus unserem Datensatz.“
- „Hier ist meine Fehlermeldung: … Was will R mir sagen?“
- „Ich habe diesen Code geschrieben: … Was habe ich übersehen?“
- „Stell mir drei kleine Übungsaufgaben zu `filter()` mit Variablen aus dem Block `d`, ohne Lösung.“

Wenig bringt: „Schreib mir den Code für Aufgabe 4.“ Selbst wenn er es täte, stündet ihr in Sitzung 2 ohne das da, was Aufgabe 4 prüfen sollte.
