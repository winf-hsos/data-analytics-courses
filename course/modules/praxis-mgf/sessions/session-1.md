# Sitzung 1: Datenanalyse mit R

**Arbeitsumgebung, Auffrischung und Selbststudium** · 30. September

Drei Teile: Erst richten alle ihre Arbeitsumgebung ein, dann gehen wir einmal gemeinsam den ganzen Weg von der Datei bis zur Abbildung, und zum Schluss geht es um das Selbststudium bis Sitzung 2.

## Teil 1: Arbeitsumgebung

1. OpenCode installieren, den Kursordner herunterladen und entpacken, in OpenCode öffnen, `/onboarding` tippen. Jeder Schritt steht in [software.md](../../../material/software.md).
2. Den Kursordner in **Positron** öffnen: *File > Open Folder…*. Links seht ihr `my-code`, `data` und `course`.
3. Die Daten aus ILIAS in `data/` legen.
4. In Positron in `my-code/` eine neue Datei `session_1.R` anlegen. Dort tippt ihr den Code unten mit.

Ausführen: Cursor in die Zeile, **Strg+Enter** (Mac: **Cmd+Enter**). Das führt die Zeile aus, oder bei einer Pipe den ganzen Block, und springt weiter.

Namen im Code sind englisch, nach jeder Pipe beginnt eine neue Zeile: [r-conventions.md](../../../material/r-conventions.md). Der Code hier ist derselbe wie auf den (englischen) Folien.

## Teil 2: der Durchstich

Das ist die ganze Kette, die ihr für eure Auswertung braucht, einmal von vorn bis hinten. Jeder Schritt ist klein; es kommt darauf an, dass ihr ihn lesen könnt.

### 1. Pakete laden

```r
library(tidyverse)
```

Ein Paket ist eine Sammlung von Funktionen, die jemand geschrieben hat. Installiert wird es einmal (`install.packages("tidyverse")`, in der Konsole), geladen bei jedem Start. Die Meldungen danach („Attaching core tidyverse packages…“) sind keine Fehler.

### 2. Daten laden

```r
survey <- read_csv("data/mds12_schoko_milch.csv")
```

`<-` heißt: Das Ergebnis rechts bekommt links einen Namen. Ab jetzt steht `survey` im Variablenfenster rechts. Der Pfad ist relativ zum Kursordner; deshalb muss Positron den Kursordner geöffnet haben.

### 3. Hineinsehen

```r
nrow(survey)
ncol(survey)
survey |>
  select(starts_with("Q002")) |>
  glimpse()
```

2.811 Zeilen, eine je befragter Person; 813 Spalten, eine je Frage. Das ist zu viel, um es anzusehen, deshalb wählen wir mit `select()` aus. `starts_with("Q002")` nimmt alle Spalten, die mit `Q002` beginnen: die aufbereiteten Varianten des Alters. Wie die Namen gebaut sind, steht in [mds12-schoko-milch.md](../../../datasets/mds12-schoko-milch.md).

### 4. Die Pipe und das Zählen

```r
survey |>
  count(D044stadtf)

survey |>
  count(D044stadtf, sort = TRUE)
```

`|>` ist die Pipe. Lest sie als „und dann“: Nimm die Umfrage, und dann zähle nach Wohnortgröße. `NA` heißt: fehlender Wert, hier sieben Personen ohne Angabe.

### 5. Filtern und auswählen

```r
survey |>
  filter(Q002alter >= 60) |>
  count(D044stadtf, sort = TRUE)

survey |>
  select(Q002alter, Q004geschlechtf, D044stadtf) |>
  glimpse()
```

`filter()` behält **Zeilen**, die eine Bedingung erfüllen. `select()` behält **Spalten**. Das zu verwechseln ist der häufigste Anfängerfehler.

### 6. Neue Spalten

```r
survey |>
  mutate(is_60_plus = Q002alter >= 60) |>
  count(is_60_plus)
```

`mutate()` rechnet eine neue Spalte aus. Hier ist sie `TRUE` oder `FALSE`, deshalb beginnt ihr Name mit `is_`.

### 7. Gruppieren und zusammenfassen

```r
survey |>
  group_by(D044stadtf) |>
  summarise(mean_age = mean(Q002alter), n_respondents = n()) |>
  arrange(mean_age)
```

`group_by()` teilt die Daten in Gruppen, `summarise()` rechnet je Gruppe eine Zeile aus, `n()` zählt die Personen. Schaut auf die Spalte `n_respondents`: Ein Mittelwert aus sieben Personen trägt weniger als einer aus tausend.

### 8. Zahlen ohne Bedeutung: der Join

```r
survey |>
  count(q003land)
```

Bundesland 1 bis 16, aber welches ist welches? Das steht nicht in den Daten, sondern in der Studiendokumentation (S. 7): alphabetisch, und daneben die Quote, also welcher Anteil der Befragten aus welchem Land kommen sollte. Diese Tabelle tippen wir ab und verbinden sie mit den Daten:

```r
# codes and quotas from the study documentation, p. 7
states <- tibble(
  q003land = 1:16,
  state = c(
    "Baden-Württemberg", "Bavaria", "Berlin", "Brandenburg",
    "Bremen", "Hamburg", "Hesse", "Mecklenburg-Western Pomerania",
    "Lower Saxony", "North Rhine-Westphalia", "Rhineland-Palatinate",
    "Saarland", "Saxony", "Saxony-Anhalt", "Schleswig-Holstein",
    "Thuringia"
  ),
  pct_quota = c(
    12.43, 14.38, 4.86, 3.75, 1.90, 3.05, 7.47, 2.78,
    9.21, 19.22, 5.33, 2.21, 5.25, 3.34, 4.15, 3.31
  )
)

respondents_by_state <- survey |>
  count(q003land, name = "n_respondents") |>
  left_join(states, by = "q003land") |>
  mutate(
    pct_sample = 100 * n_respondents / sum(n_respondents),
    diff_quota_pp = pct_sample - pct_quota
  ) |>
  arrange(desc(diff_quota_pp))
respondents_by_state
```

`left_join()` hängt an jede Zeile links die passende Zeile rechts an, verbunden über die gemeinsame Spalte `q003land`. Die Namen der neuen Spalten sagen, was drinsteht: `pct_` ist Prozent, `diff_…_pp` eine Differenz in Prozentpunkten. Ergebnis: Niedersachsen (Lower Saxony) liegt über vier Prozentpunkte über seiner Quote. Die Namen stehen englisch wie auf den Folien; die Reihenfolge ist die des Codebuchs, alphabetisch nach den deutschen Namen. Warum? Für das Thema Regionalität wurden rund 200 Menschen aus Osnabrück zusätzlich befragt (S. 3). **Wie die Daten entstanden sind, steht nicht in den Daten.**

### 9. Die Abbildung

```r
survey |>
  filter(!is.na(D044stadtf)) |>
  ggplot(aes(x = fct_infreq(D044stadtf))) +
  geom_bar() +
  labs(x = "Size of place of residence",
       y = "Number of respondents")
```

`ggplot()` baut eine Abbildung in Schichten, verbunden mit `+`: welche Daten, welche Spalte auf welche Achse (`aes()`), welche Form (`geom_bar()`), welche Beschriftung (`labs()`). `fct_infreq()` sortiert die Balken nach Häufigkeit. `filter(!is.na(…))` lässt die sieben ohne Angabe weg; das `!` heißt „nicht“. Die Beschriftungen sind für Menschen, nicht für R; hier englisch wie die Folien, im Bericht in der Sprache des Berichts.

Und die Abweichung von der Quote als Bild:

```r
plot_quota_deviation <- respondents_by_state |>
  ggplot(aes(x = diff_quota_pp, y = fct_reorder(state, diff_quota_pp))) +
  geom_col() +
  labs(x = "Deviation from the quota in percentage points", y = NULL)
plot_quota_deviation
```

`geom_bar()` zählt selbst, `geom_col()` nimmt Werte, die schon ausgerechnet sind. Eine Abbildung, die man aufhebt, bekommt einen Namen mit `plot_`.

## Teil 3: Selbststudium

Bis Sitzung 2 lernt ihr R im eigenen Tempo, gestaffelt nach Vorkenntnissen: [self-study.md](../self-study.md). Am Anfang steht der Selbsttest in `my-code/self-test/`. Wer ihn gleich besteht, ist fertig.

Wenn etwas nicht läuft: [error-messages.md](../../../material/error-messages.md), und euer Assistent.
