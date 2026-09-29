# Der Datensatz: `mds12_schoko_milch.csv`

Eine Online-Panelbefragung, erhoben vom Fachgebiet Agrarmarketing (Herr Enneking) mit dem Panelanbieter bilendi/respondi und programmiert in LimeSurvey. Die vollständige Dokumentation mit jedem Fragetext und jeder Codierung ist die Studiendokumentation `data/M3b_Musterstudie-quantitativ.pdf`, **euer Codebuch**. Die Seitenzahlen unten beziehen sich darauf.

Die CSV ist ein Auszug mit den Spezialthemen Milch und Schokolade. Die Studie selbst ist breiter; welche Themen eure Gruppe bekommt, sagt Herr Enneking.

## Eckdaten

| | |
|---|---|
| Befragte (Zeilen) | 2.811 |
| Variablen (Spalten) | 813 |
| Zeichenkodierung | UTF-8 |
| Trennzeichen | Komma |
| Laden | `read_csv("data/mds12_schoko_milch.csv")`, ohne weitere Angaben |

Eine Zeile ist eine befragte Person. Eine Spalte ist eine Frage, bei Mehrfachantworten und Fragebatterien ein Teil einer Frage.

## Die Präfixe: so findet ihr euch in 813 Spalten zurecht

Jeder Variablenname beginnt mit einem Buchstaben, der sagt, zu welchem Block die Frage gehört (S. 4), danach kommt die Nummer der Frage im Fragebogen und ein sprechender Rest.

| Buchstabe | Block | Beispiel |
|---|---|---|
| `q` | Screening und Quoten: Einkauf, Alter, Bundesland, Geschlecht, Osnabrück | `q003land` |
| `v` | Verhalten: was gekauft, wie oft, wo | `v008ort_1discount` |
| `p` | psychographische Skalen: Einstellungen, Neophobie | `p012neo_1probiere` |
| `b` | Bewertung von Eigenschaften | `B010midiff7_1quali` |
| `u` | Gesamturteil | |
| `w` | Wissensfragen | |
| `d` | Demographie: Haushalt, Wohnort, Einkommen, Medien | `d044stadt` |
| `m` | Spezialthema Milch | |
| `s` | Spezialthema Schokolade | |
| `a` | Experimentzuweisung (wer welche Variante gesehen hat) | `AX010midiff7f` |

Die Blöcke `q`, `v`, `p` und `d` hat jede befragte Person bekommen, egal welches Spezialthema. Mit ihnen arbeitet der Selbsttest.

Spalten eines Blocks findet ihr mit `select()`:

```r
survey |>
  select(starts_with("d04")) |>
  names()

survey |>
  select(starts_with("v008")) |>
  names()
```

## Klein oder groß: roh oder aufbereitet

- **Kleinbuchstabe am Anfang:** Rohvariable, so wie sie aus LimeSurvey kam. Meist Zahlencodes.
- **Großbuchstabe am Anfang:** aufbereitete Variable, von Herrn Enneking berechnet oder umcodiert.
- **`f` am Ende:** „formatiert“, also dieselbe Information als Text statt als Code.

Am Alter sieht man die ganze Kette:

```
q002geburt       Geburtsjahr, roh
  → Q002alter        Alter in Jahren
    → Q002altergru4    vier Altersgruppen als Code 1 bis 4
      → Q002altergru4f   dieselben Gruppen als Text: "45-59 Jahre"
```

Für die Auswertung nehmt ihr in der Regel die aufbereiteten Variablen, für Abbildungen die mit `f`. Aber schaut nach, was bei der Aufbereitung passiert ist (siehe Fallstricke).

## Wichtige Variablen und ihre Codes

Zahlen ohne Codebuch bedeuten nichts. Hier die Codes der Variablen, die ihr am häufigsten braucht.

| Variable | Frage | Codes |
|---|---|---|
| `q001hheinkauf` | Wer kauft im Haushalt Lebensmittel ein? (S. 6) | 2 hauptsächlich ich, 1 ich und eine andere Person (wer „fast immer eine andere Person“ sagte, wurde nicht weiter befragt) |
| `Q002alter` | Alter in Jahren | 18 bis 80 |
| `Q002altergru4f` | Altersgruppe | 18-29, 30-44, 45-59, 60 Jahre und älter |
| `q003land` | Bundesland (S. 7) | 1 bis 16 in alphabetischer Reihenfolge: 1 Baden-Württemberg, 2 Bayern, 3 Berlin, 4 Brandenburg, 5 Bremen, 6 Hamburg, 7 Hessen, 8 Mecklenburg-Vorpommern, 9 Niedersachsen, 10 Nordrhein-Westfalen, 11 Rheinland-Pfalz, 12 Saarland, 13 Sachsen, 14 Sachsen-Anhalt, 15 Schleswig-Holstein, 16 Thüringen |
| `q004geschlecht` | Geschlecht, roh (S. 7) | 1 Mann, 2 Frau, 3 divers |
| `Q004geschlechtf` | Geschlecht, aufbereitet | Männer, Frauen |
| `q005os` | aus Stadt oder Landkreis Osnabrück? (S. 7) | 1 ja, 0 nein |
| `v006gekauft_3mi` | Milch oder Milchalternativen in den letzten 12 Monaten (S. 7) | 3 gekauft und verzehrt, 2 nur gekauft, 1 nur verzehrt, 0 weder noch |
| `v007freq3_mi` | Wie oft Milch? (S. 8) | 4 meistens täglich, 3 etwa wöchentlich, 2 etwa monatlich, 1 seltener |
| `v008ort_*` | Wo kauft ihr Lebensmittel? Mehrfachnennung (S. 8) | je Einkaufsort eine Spalte: 1 genannt, 0 nicht genannt |
| `p012neo_*` | Neophobie-Skala, zehn Aussagen (S. 13) | −2 bis +2; die mit (R) markierten Aussagen sind umgepolt |
| `d042hhzahl` / `D042hhzahlf` | Personen im Haushalt (S. 32) | Anzahl / „1 Person“ bis „5 Personen und mehr“ |
| `d044stadt` / `D044stadtf` | Größe des Wohnorts (S. 32) | 1 Großstadt, 2 Große Mittelstadt, 3 Große Kleinstadt, 4 Kleinstadt >5000, 5 Kleinstadt <5000, 6 Dorf |
| `d049einkommen` | Netto-Haushaltseinkommen (S. 33) | 1 unter 500 € bis 11 5.000 € und mehr, in Stufen zu 500 €; fehlend = keine Angabe |

## Die Fallstricke

Der Datensatz ist echt, nicht für den Unterricht gebaut. Deshalb stecken in ihm die Fallen, in die man bei echten Daten tappt, und genau an denen lernt man am meisten.

### Fehlend heißt oft: nicht gefragt

Viele Fragen wurden nur einem Teil der Befragten gestellt (Filterführung). Die Frage nach der Häufigkeit (`v007freq3_mi`) bekam nur, wer Milch verzehrt (`v006gekauft_3mi` gleich 3 oder 1). Von den 424 fehlenden Werten sind deshalb nur 10 echte Ausfälle; die übrigen 414 Personen wurden gar nicht gefragt.

Wer mit `mean(..., na.rm = TRUE)` oder `drop_na()` rechnet, bekommt eine Zahl, die nur für einen Teil der Befragten gilt. Das ist nicht falsch, aber es muss dazugesagt werden: **über wen spricht diese Zahl?**

### Zwei Menschen verschwinden in der Aufbereitung

| | 1 | 2 | 3 | fehlend |
|---|---|---|---|---|
| `q004geschlecht` (roh) | 1.328 | 1.481 | **2** | 0 |
| `Q004geschlecht` (aufbereitet) | 1.328 | 1.481 | | **2** |

Die zwei Personen, die „divers“ angegeben haben, sind in der aufbereiteten Variable fehlend. Bei zwei Personen ist keine Gruppenauswertung möglich, das ist der sachliche Grund. Vermerkt ist die Entscheidung nirgends. Nicht die Entscheidung ist das Problem, sondern dass sie unsichtbar ist. Wer so etwas entscheidet, schreibt es in den Methodenteil.

### Mehrfachantworten: die Basis ist die Person

Bei `v008ort_*` konnte jede Person mehrere Einkaufsorte nennen. „73,5 % kaufen beim Discounter“ bezieht sich auf die Befragten. Wer die Nennungen zählt, bekommt 26,5 %: den Anteil des Discounters an allen Nennungen. Beides sind Zahlen, aber nur eine beantwortet die Frage „Wie viele kaufen beim Discounter?“.

### Die Stichprobe ist nicht bundesrepräsentativ

Für das Spezialthema Regionalität wurden rund 200 Personen aus Stadt und Landkreis Osnabrück zusätzlich befragt (S. 3). Niedersachsen ist deshalb überrepräsentiert: 13,6 % der Befragten statt der 9,2 % laut Quote. Aussagen über „die Deutschen“ gehen mit diesen Daten nur mit Vorsicht, und für Osnabrück-Vergleiche gibt es `q005os`.

### Experimente in der Befragung

Ein Teil der Fragen ist ein Experiment: Die Befragten wurden zufällig auf Varianten verteilt, etwa bekam jede Person genau eine von sieben Milchmarken zur Bewertung (`AX010midiff7f`), oder einen von vier Preisen. Die Spalten der anderen Varianten sind bei ihr leer. Hohe Anteile fehlender Werte sind hier also kein Datenproblem, sondern das Design. Gleichzeitig sind die Gruppen vergleichbar, weil zufällig gebildet; das erlaubt Aussagen über Ursache und Wirkung, die sonst eine Befragung nicht hergibt.

### Freitexte

Spalten mit `_other`, `ungestuetzt` oder `grund` im Namen enthalten, was die Befragten selbst geschrieben haben. Sie sind unordentlich (Tippfehler, Zahlen neben Wörtern) und können unbeabsichtigt persönliche Angaben enthalten. Wer sie zitiert, etwa im Bericht, prüft vorher, dass nichts darin eine Person erkennbar macht.

## Datenschutz

Die Befragten sind nicht namentlich erfasst. Geburtsjahr, Geschlecht, Postleitzahl und Wohnortgröße zusammen können eine Person aber wiedererkennbar machen, gerade bei den zusätzlich befragten Osnabrückerinnen und Osnabrückern. Deshalb gilt: Die Daten bleiben im Kurs. Gebt sie nicht weiter und legt sie nicht in öffentliche Ordner oder Repositories.
