# Wie R-Code in diesen Kursen aussieht

Diese Konventionen gelten für euren Code und für den Code, den euer Assistent vorschlägt, in allen Modulen. Sie sind keine Geschmacksfrage: Wer im Referat oder in der Prüfung eine Zahl erklären muss, muss den Code lesen können, und Code, der immer gleich aufgebaut ist, liest sich schneller. Das gilt auch für die Gruppe, die euren Code übernimmt, und für euch selbst in drei Wochen.

## 1. Code ist englisch

Alles, was der Rechner liest, ist englisch: Namen von Objekten, Spalten, die ihr neu anlegt, Funktionen, Dateien und Ordner, und die Kommentare. Englisch ist die Sprache von R, von seinen Paketen, seiner Hilfe und von fast allem, was ihr im Netz dazu findet; euer Code liest sich dann wie der Code, von dem ihr lernt.

**Deutsch bleibt, was ein Mensch in einer Abbildung oder Tabelle liest:** Achsenbeschriftungen, Titel, Legenden, die Beschriftungen von Kategorien („Großstadt“, „60 Jahre und älter“). Das ist Inhalt, kein Code.

```r
# share of respondents shopping at a discounter, by age group
discounter_by_age <- survey |>
  group_by(Q002altergru4f) |>
  summarise(n_respondents = n(), pct_discounter = 100 * mean(v008ort_1discount))

discounter_by_age |>
  ggplot(aes(x = Q002altergru4f, y = pct_discounter)) +
  geom_col() +
  labs(x = "Altersgruppe", y = "Anteil, der beim Discounter kauft (%)")
```

## 2. Namen

**Immer `snake_case`:** kleine Buchstaben, Wörter mit Unterstrich getrennt, keine Umlaute, keine Leerzeichen. `mean_age`, nicht `meanAge`, `MeanAge` oder `mean.age`.

| Was | Form | Beispiele |
|---|---|---|
| Datensätze (Data Frames) | Substantiv, das sagt, was eine Zeile ist | `survey`, `states`, `discounter_by_age` |
| Ergebnis einer Gruppierung | `<was>_by_<wonach>` | `mean_age_by_city`, `discounter_by_age` |
| Abbildungen | `plot_<was>` | `plot_age_groups`, `plot_quota_deviation` |
| eigene Funktionen | Verb zuerst | `count_mentions()`, `recode_scale()` |
| Werte, die sich nie ändern | wie alle anderen, aber oben im Skript | `quota_year <- 2026` |

## 3. Neue Spalten: Präfix sagt, was drinsteht

Wer den Namen liest, soll wissen, welche Art Zahl darin steht und in welcher Einheit. Dafür gibt es feste Präfixe und Endungen:

| Präfix / Endung | Bedeutung | Beispiel |
|---|---|---|
| `n_` | Anzahl | `n_respondents`, `n_mentions` |
| `share_` | Anteil zwischen 0 und 1 | `share_discounter` |
| `pct_` | Prozent zwischen 0 und 100 | `pct_discounter` |
| `mean_`, `median_`, `sd_`, `min_`, `max_` | Kennzahl einer Spalte | `mean_age`, `sd_income` |
| `is_`, `has_` | Ja/Nein (`TRUE`/`FALSE`) | `is_60_plus`, `has_children` |
| `_group` | eine gebildete Gruppierung | `age_group`, `income_group` |
| `_pp` | Prozentpunkte (Differenz zweier Prozentwerte) | `diff_quota_pp` |
| `diff_` | Differenz | `diff_quota_pp`, `diff_mean_age` |
| `_score` | aus mehreren Items gebildete Skala | `neophobia_score` |

Anteil und Prozent nicht mischen: Eine Spalte heißt `share_…` oder `pct_…`, nie nur `anteil` oder `share`. Gerundet wird erst für die Ausgabe (Tabelle, Abbildung), nicht in der Spalte, mit der weitergerechnet wird.

## 4. Die Spalten des Datensatzes behalten ihre Namen

`Q002altergru4f` ist kein schöner Name, aber er steht so im Codebuch, und jeder im Kurs weiß, was gemeint ist. Benennt Spalten des Datensatzes deshalb nicht um. Wer für eine Auswertung kürzere Namen braucht, legt eine eigene, kleinere Tabelle an und benennt dort mit `rename()` um, gleich nach dem Auswählen und mit einem Kommentar:

```r
# own short names for the columns used in this analysis
milk <- survey |>
  select(Q002alter, Q002altergru4f, v007freq3_mi) |>
  rename(age = Q002alter, age_group = Q002altergru4f, milk_frequency = v007freq3_mi)
```

## 5. Das tidyverse, wo immer es geht

`library(tidyverse)` lädt die wichtigsten Pakete auf einmal:

| Paket | wofür |
|---|---|
| `readr` | Daten laden: `read_csv()` |
| `dplyr` | Daten umformen: `filter()`, `select()`, `mutate()`, `group_by()`, `summarise()`, `count()`, `left_join()` |
| `tidyr` | Daten umstellen: `pivot_longer()`, `pivot_wider()`, `drop_na()` |
| `ggplot2` | Abbildungen |
| `stringr` | Text: `str_detect()`, `str_replace()` |
| `forcats` | Kategorien ordnen: `fct_infreq()`, `fct_relevel()` |

Excel-Dateien lädt `readxl::read_excel()`. Base-R nehmt ihr nur, wo das tidyverse nichts Passendes hat.

## 6. Die Pipe `|>`

Die Pipe reicht das Ergebnis eines Schritts an den nächsten weiter. Lest sie als „und dann“:

```r
survey |>
  filter(Q002alter >= 60) |>
  count(D044stadtf)
```

„Nimm die Umfrage, und dann behalte die ab 60, und dann zähle nach Wohnortgröße.“ Ein Schritt je Zeile, die Pipe am Zeilenende, die folgenden Zeilen zwei Leerzeichen eingerückt. Im Netz seht ihr oft `%>%`; das ist die ältere Fassung. Wir schreiben `|>`.

## 7. Abbildungen mit ggplot2

Jede Abbildung entsteht mit `ggplot2`, keine mit `plot()`, `hist()` oder `barplot()`. Jede bekommt mit `labs()` Achsenbeschriftungen, die ein Mensch versteht, mit Einheit, statt Variablennamen. Innerhalb von `ggplot()` werden die Schichten mit `+` verbunden, nicht mit `|>`.

## 8. Ein Skript, das von oben nach unten läuft

- Oben `library(…)`, dann das Laden der Daten, dann die Auswertung.
- Daten immer mit einem Pfad relativ zum Kursordner laden: `read_csv("data/mds12_schoko_milch.csv")`. Kein `setwd()`, kein Pfad wie `C:/Users/…`: der läuft nur auf eurem Laptop.
- `install.packages()` gehört in die Konsole, nicht ins Skript.
- Das Skript muss nach einem Neustart von R (in Positron: *Session > Restart R*) von oben bis unten durchlaufen.

## 9. Dateien und Ordner

- R-Skripte und Quarto-Dokumente in `snake_case`: `session_1.R`, `milk_frequency.R`, `report.qmd`.
- Ordner mit Bindestrich, wie der Kursordner selbst: `my-code`, `self-test`.
- Alles Eigene liegt in `my-code/`.

## 10. Keine stillen Fallausschlüsse

`filter()`, `drop_na()` und `na.rm = TRUE` ändern, über wen eine Zahl spricht. Das ist oft richtig, aber es muss sichtbar sein:

```r
# who is missing, and why? (only milk drinkers were asked)
survey |> count(is_missing = is.na(v007freq3_mi))
```

Schreibt als Kommentar dazu, wie viele Fälle wegfallen und warum. Im Bericht gehört das in den Methodenteil.

## 11. Kommentare

Englisch, knapp, und sie sagen **warum**, nicht was: `# only milk drinkers were asked about frequency` hilft, `# filter` nicht.

## Zum Nachlesen

- *R for Data Science*, 2. Auflage, von Hadley Wickham, Mine Çetinkaya-Rundel und Garrett Grolemund, frei online: <https://r4ds.hadley.nz/>
- Der tidyverse-Stil im Detail, auf dem diese Konventionen aufbauen: <https://style.tidyverse.org/>
