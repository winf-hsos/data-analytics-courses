# Sitzung 1: Datenanalyse mit R

**Arbeitsumgebung, Auffrischung und Selbststudium** · 30. September

Erst richten alle ihre Arbeitsumgebung ein, dann gehen wir einmal gemeinsam den ganzen Weg von der Datei bis zur Abbildung, in drei Etappen (laden und sichten, transformieren, visualisieren), und zum Schluss geht es um das Selbststudium bis Sitzung 2.

## Teil 1: Arbeitsumgebung

1. OpenCode Desktop installieren, den Kursordner herunterladen und entpacken, in OpenCode öffnen, `/onboarding` tippen. Euer Assistent sieht nach, ob Positron, R und Quarto da sind, und installiert mit euch, was fehlt. Jeder Schritt steht auch in [software.md](../../../material/software.md).
2. Den Kursordner in **Positron** öffnen: *File > Open Folder…*. Links seht ihr `my-code`, `data` und `course`.
3. Die Daten aus ILIAS in `data/` legen.
4. In Positron in `my-code/` eine neue Datei `session_1.R` anlegen. Dort tippt ihr den Code unten mit.

Ausführen: Cursor in die Zeile, **Strg+Enter** (Mac: **Cmd+Enter**). Das führt die Zeile aus, oder bei einer Pipe den ganzen Block, und springt weiter.

Namen im Code sind englisch, nach jeder Pipe beginnt eine neue Zeile: [r-conventions.md](../../../material/r-conventions.md). Der Code hier ist derselbe wie auf den (englischen) Folien.

## Teil 2: Laden und sichten

Der Weg, den R for Data Science für die explorative Datenanalyse beschreibt: Daten importieren, aufräumen, dann transformieren, visualisieren und modellieren, bis man sie versteht, und zum Schluss kommunizieren ([Kapitel „Whole game“](https://r4ds.hadley.nz/whole-game.html)). Heute gehen wir ihn einmal im Schnelldurchlauf. Modelle, also Tests und Regressionen, kommen aus dem Statistik-Strang von Herrn Enneking; kommunizieren mit Quarto ist Sitzung 2. Es kommt nicht darauf an, dass ihr jeden Schritt auswendig könnt, sondern dass ihr ihn lesen könnt.

### 0. Die Datei: CSV

`mds12_schoko_milch.csv` ist eine CSV-Datei (comma-separated values): reiner Text, den jedes Programm lesen kann, auch euer Assistent. Öffnet ihr sie in einem Texteditor, sieht der Anfang so aus (hier 4 von 813 Spalten):

```
q002geburt,q003land,D043kinderzahl,D044stadtf
1970,1,NA,Kleinstadt <5000
1990,7,0,Großstadt
1963,6,NA,Großstadt
```

Die erste Zeile enthält die Spaltennamen, jede weitere Zeile ist eine befragte Person, das Komma trennt die Spalten, `NA` steht für einen fehlenden Wert. `read_csv()` macht daraus eine Tabelle. Dateien aus einem deutschen Excel trennen oft mit Semikolon und schreiben Dezimalzahlen mit Komma; dafür gibt es `read_csv2()`.

### 1. Pakete und Daten laden

```r
library(tidyverse)
survey <- read_csv("data/mds12_schoko_milch.csv")
```

Ein Paket ist eine Sammlung von Funktionen, die jemand geschrieben hat. Installiert wird es einmal (`install.packages("tidyverse")`, in der Konsole), geladen bei jedem Start. Die Meldungen danach („Attaching core tidyverse packages…“) sind keine Fehler. `<-` heißt: Das Ergebnis rechts bekommt links einen Namen. Ab jetzt steht `survey` im Variablenfenster rechts. Der Pfad ist relativ zum Kursordner; deshalb muss Positron den Kursordner geöffnet haben.

**Tipp für andere Datensätze:** `janitor::clean_names()` macht aus unordentlichen Spaltennamen (Leerzeichen, Umlaute, Großbuchstaben) saubere Namen in `snake_case`. Bei unserer Befragung aber nicht: Es würde 170 der 813 Namen ändern, aus `Q002alter` würde `q002alter`, und die aufbereitete `Q004geschlecht` kollidiert mit der rohen `q004geschlecht` und hieße danach `q004geschlecht_2`. Die Unterscheidung klein = roh, groß = aufbereitet wäre weg.

### 2. Sichten

```r
survey |>
  glimpse()
```

2.811 Zeilen, eine je befragter Person; 813 Spalten, eine je Frage. `glimpse()` zeigt jede Spalte mit ihrem Datentyp und den ersten Werten: `<dbl>` für Zahlen, `<chr>` für Text. Außerdem nützlich: `nrow()` und `ncol()` zählen Zeilen und Spalten, `names()` listet die Spaltennamen, `summary()` fasst jede Spalte zusammen, und `skimr::skim()` zeigt je Spalte fehlende Werte, Füllgrad, Mittelwert, Streuung und ein kleines Histogramm.

813 Spalten sind zu viel, um sie anzusehen. Mit `select()` holt ihr euch einen Block heraus; `starts_with("Q002")` nimmt alle Spalten, die mit `Q002` beginnen, die aufbereiteten Varianten des Alters:

```r
survey |>
  select(starts_with("Q002")) |>
  glimpse()
```

Wie die Namen gebaut sind (Präfixe, klein und groß), steht in [mds12-schoko-milch.md](../../../datasets/mds12-schoko-milch.md).

### 3. Die Pipe

`|>` ist die Pipe. Sie nimmt das Ergebnis dessen, was links steht, und setzt es als **erstes Argument** in die Funktion rechts ein. Diese beiden Zeilen rechnen also genau dasselbe:

```r
count(survey, D044stadtf)

survey |>
  count(D044stadtf)
```

Wozu dann die Pipe? Sobald mehrere Schritte aufeinander folgen. Ohne Pipe verschachtelt man die Funktionen und liest von innen nach außen:

```r
arrange(count(filter(survey, Q002alter >= 60), D044stadtf), desc(n))
```

Mit der Pipe steht jeder Schritt in seiner Zeile, in der Reihenfolge, in der er passiert. Lest sie als „und dann“: Nimm die Umfrage, und dann behalte die ab 60, und dann zähle nach Wohnortgröße, und dann sortiere nach Anzahl.

```r
survey |>
  filter(Q002alter >= 60) |>
  count(D044stadtf) |>
  arrange(desc(n))
```

In Positron tippt ihr die Pipe mit **Strg+Umschalt+M** (Mac: **Cmd+Umschalt+M**). `NA` in einer Ausgabe heißt: fehlender Wert, beim Wohnort sind es sieben Personen ohne Angabe.

## Teil 3: Transformieren

### 4. Zeilen oder Spalten

```r
survey |>
  filter(Q002alter >= 60) |>
  count(D044stadtf)

survey |>
  select(Q002alter, D044stadtf) |>
  glimpse()
```

`filter()` behält **Zeilen**, die eine Bedingung erfüllen. `select()` behält **Spalten**. Das zu verwechseln ist der häufigste Anfängerfehler.

### 5. Neue Spalten

```r
survey |>
  mutate(is_60_plus = Q002alter >= 60) |>
  count(is_60_plus)
```

`mutate()` rechnet eine neue Spalte aus, für jede Zeile. Hier ist sie `TRUE` oder `FALSE`, deshalb beginnt ihr Name mit `is_`.

### 6. Gruppieren und zusammenfassen

```r
survey |>
  group_by(D044stadtf) |>
  summarise(mean_age = mean(Q002alter),
            n_respondents = n()) |>
  arrange(mean_age)
```

`group_by()` teilt die Daten in Gruppen, `summarise()` rechnet je Gruppe eine Zeile aus, `n()` zählt die Personen. Schaut auf die Spalte `n_respondents`: Ein Mittelwert aus sieben Personen trägt weniger als einer aus tausend. **Über wen spricht diese Zahl?** Die Frage stellt ihr ab heute bei jeder Zahl.

### Tipp: tidylog sagt, was jeder Schritt getan hat

```r
library(tidylog)

survey |>
  filter(Q002alter >= 60) |>
  count(D044stadtf)
```

Nach dem tidyverse geladen, meldet tidylog bei jedem `filter()`, `select()`, `mutate()`, `group_by()` und `summarise()` in der Konsole, was passiert ist, etwa `filter: removed 2,042 rows (73%), 769 rows remaining`. So seht ihr bei jedem Schritt, über wen eure Zahl noch spricht. Wieder abschalten: *Session > Restart R* und tidylog nicht laden.

### 7. Von Codes zu Namen: ein Faktor

```r
survey |>
  count(q003land)
```

Bundesland 1 bis 16, aber welches ist welches? Das steht nicht in den Daten, sondern in der Studiendokumentation (S. 7): alphabetisch nach den deutschen Namen. Mit `factor()` bekommen die Codes ihre Namen:

```r
# codes from the study documentation, p. 7
state_names <- c(
  "Baden-Württemberg", "Bavaria", "Berlin", "Brandenburg",
  "Bremen", "Hamburg", "Hesse", "Mecklenburg-Western Pomerania",
  "Lower Saxony", "North Rhine-Westphalia", "Rhineland-Palatinate",
  "Saarland", "Saxony", "Saxony-Anhalt", "Schleswig-Holstein",
  "Thuringia"
)

survey <- survey |>
  mutate(state = factor(q003land, levels = 1:16, labels = state_names))

survey |>
  count(state)
```

`levels` sagt, welche Codes es gibt und in welcher Reihenfolge, `labels`, wie sie heißen. Die neue Spalte `state` ist ein Faktor; `q003land` bleibt, wie sie ist. Die Namen stehen englisch wie auf den Folien.

### 8. Die Quoten verbinden: der Join

Neben den Codes steht im Codebuch die Quote, also welcher Anteil der Befragten aus welchem Land kommen sollte. Diese Tabelle tippen wir ab und verbinden sie mit den Daten:

```r
# quotas from the study documentation, p. 7
quotas <- tibble(
  state = state_names,
  pct_quota = c(
    12.43, 14.38, 4.86, 3.75, 1.90, 3.05, 7.47, 2.78,
    9.21, 19.22, 5.33, 2.21, 5.25, 3.34, 4.15, 3.31
  )
)

respondents_by_state <- survey |>
  count(state, name = "n_respondents") |>
  left_join(quotas, by = "state") |>
  mutate(
    pct_sample = 100 * n_respondents / sum(n_respondents),
    diff_quota_pp = pct_sample - pct_quota
  )
```

`left_join()` hängt an jede Zeile links die passende Zeile rechts an, verbunden über die gemeinsame Spalte `state`. Das Ergebnis steht jetzt unter dem Namen `respondents_by_state` im Variablenfenster; ein Klick darauf zeigt die Tabelle. Die Namen der neuen Spalten sagen, was drinsteht: `pct_` ist Prozent, `diff_…_pp` eine Differenz in Prozentpunkten.

## Teil 4: Visualisieren

### Welche Abbildung? Das Skalenniveau entscheidet

| | nominal | ordinal | intervall | verhältnis |
|---|---|---|---|---|
| Beispiel | Bundesland | Größe des Wohnorts | Geburtsjahr | Alter |
| in R | `<fct>` | `<fct>`, Stufen in Reihenfolge | `<dbl>` | `<dbl>` |
| Kennzahl | `count()` | `count()`, `median()` | `mean()`, `sd()` | `mean()`, `sd()` |
| Abbildung | Balken, nach Häufigkeit | Balken, in der Reihenfolge der Skala | Histogramm, Boxplot | Histogramm, Boxplot |

Die vier Skalenniveaus: Döring (2023), Kapitel 8.4.

### 9. Nominal: Balken, nach Häufigkeit

```r
survey |>
  ggplot(aes(y = fct_rev(fct_infreq(state)))) +
  geom_bar() +
  labs(x = "Number of respondents", y = NULL)
```

`ggplot()` baut eine Abbildung in Schichten, verbunden mit `+`: welche Daten, welche Spalte auf welche Achse (`aes()`), welche Form (`geom_bar()` zählt selbst), welche Beschriftung (`labs()`). `+` fügt Schichten hinzu; die Pipe `|>` gehört nur vor `ggplot()`. `fct_infreq()` sortiert nach Häufigkeit, `fct_rev()` dreht die Reihenfolge, damit das häufigste Land oben steht. Die Beschriftungen sind für Menschen, nicht für R; hier englisch wie die Folien, im Bericht in der Sprache des Berichts.

### 10. Ordinal: ein Faktor behält die Reihenfolge

```r
survey <- survey |>
  mutate(city_size = factor(D044stadtf, levels = c(
    "Großstadt", "Große Mittelstadt", "Große Kleinstadt",
    "Kleinstadt >5000", "Kleinstadt <5000", "Dorf"
  )))

survey |>
  filter(!is.na(city_size)) |>
  ggplot(aes(x = city_size)) +
  geom_bar() +
  labs(x = "Size of place of residence", y = "Number of respondents")
```

Als Text sortiert R die Wohnortgrößen alphabetisch: das Dorf vorn, die Großstadt irgendwo. Ein Faktor mit `levels` behält die Reihenfolge des Codebuchs. Schreibt die Werte genau so, wie `count()` sie zeigt; ein Tippfehler macht aus einem Wert still ein `NA`. `filter(!is.na(…))` lässt die sieben ohne Angabe weg; das `!` heißt „nicht“.

### 11. Eine Zahl: das Histogramm

```r
survey |>
  ggplot(aes(x = Q002alter)) +
  geom_histogram(binwidth = 5) +
  labs(x = "Age in years", y = "Number of respondents")
```

Das Histogramm teilt eine Zahl in Klassen, hier je fünf Jahre, und zählt, wie viele in jede fallen. Probiert `binwidth = 1` und `10`.

### 12. Eine Zahl je Gruppe: der Boxplot

```r
survey |>
  filter(!is.na(city_size)) |>
  ggplot(aes(x = city_size, y = Q002alter)) +
  geom_boxplot() +
  labs(x = "Size of place of residence", y = "Age in years")
```

Der Strich in der Box ist der Median, die Box die mittlere Hälfte der Werte, die Linien reichen bis zu den üblichen Werten, Punkte darüber hinaus.

### 13. Stichprobe gegen Quote

```r
respondents_by_state |>
  ggplot(aes(x = diff_quota_pp, y = fct_reorder(state, diff_quota_pp))) +
  geom_col() +
  labs(x = "Deviation from the quota in percentage points", y = NULL)
```

`geom_bar()` zählt selbst, `geom_col()` nimmt Werte, die schon ausgerechnet sind. `fct_reorder()` sortiert die Länder nach ihrer Abweichung. Ergebnis: Niedersachsen liegt über vier Prozentpunkte über seiner Quote. Warum? Für das Thema Regionalität wurden rund 200 Menschen aus Osnabrück zusätzlich befragt (S. 3). **Wie die Daten entstanden sind, steht nicht in den Daten.**

### Welche Abbildung für welche Frage?

| Abbildung | für die Frage |
|---|---|
| Balken | Wie viele je Kategorie? |
| Histogramm | Wie ist eine Zahl verteilt? |
| Boxplot | Unterscheidet sich eine Zahl zwischen Gruppen? |
| gestapelte Balken auf 100 % | Unterscheidet sich eine Kategorie zwischen Gruppen? |
| Streudiagramm | Hängen zwei Zahlen zusammen? |
| Liniendiagramm | Wie entwickelt sich etwas über die Zeit? |

Mehr: Claus Wilke, [Directory of Visualizations](https://clauswilke.com/dataviz/directory-of-visualizations.html).

## Teil 5: Selbststudium

Bis Sitzung 2 lernt ihr R im eigenen Tempo: [self-study.md](../self-study.md). Am Anfang steht der Selbsttest in `my-code/self-test/`. Wer ihn besteht, geht gleich zur Abnahme (`/final-check`). Alle anderen arbeiten die Übung in `my-code/self-study/` durch, fünf Kapitel zur Frage „Wo kaufen die Befragten ein, und wer kauft Bio?“, mit Lesestellen aus *R for Data Science*. Euer Assistent begleitet euch mit `/self-study`.

Wenn etwas nicht läuft: [error-messages.md](../../../material/error-messages.md), und euer Assistent.
