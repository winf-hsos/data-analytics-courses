# Die häufigsten Fehlermeldungen

R meldet sich in der Konsole rot. Das sieht dramatischer aus, als es ist. Eine Fehlermeldung sagt euch, **was** R nicht konnte und oft auch **wo**. Lest sie ganz, von oben, bevor ihr etwas ändert.

Nicht jede rote Zeile ist ein Fehler: `Warning` heißt, R hat trotzdem gerechnet, euch aber auf etwas hingewiesen; `Error` heißt, es wurde nicht gerechnet. Die Meldungen beim Laden des tidyverse („Attaching core tidyverse packages“, „Conflicts“) sind weder das eine noch das andere.

## 1. `could not find function "…"`

```
Error in read_csv("data/mds12_schoko_milch.csv") : could not find function "read_csv"
```

R kennt die Funktion nicht. Fast immer ist das Paket nicht geladen: `library(tidyverse)` fehlt oder wurde nach einem Neustart nicht wieder ausgeführt. Seltener ein Tippfehler im Funktionsnamen (`sumarise`).

**Tun:** `library(tidyverse)` ausführen, dann die Zeile noch einmal.

## 2. `object '…' not found`

```
Error: object 'survey' not found
```

oder innerhalb einer Pipe:

```
Error in `filter()`: Caused by error: object 'q002alter' not found
```

R kennt diesen Namen nicht. Entweder habt ihr das Objekt noch nicht erzeugt (die Zeile mit `survey <- read_csv(…)` wurde nicht ausgeführt), oder der Name ist falsch geschrieben. R unterscheidet Groß- und Kleinschreibung: `q002alter` gibt es nicht, `Q002alter` schon. In diesem Datensatz ist genau das eine häufige Falle, weil klein und groß verschiedene Variablen sind.

**Tun:** Im Variablenfenster rechts nachsehen, ob das Objekt da ist. Spaltennamen mit `names(survey)` prüfen und kopieren statt abtippen.

## 3. `'…' does not exist in current working directory`

```
Error: 'data/mds12_schoko_milch.csv' does not exist in current working directory ('C:/Users/…/Documents').
```

R sucht die Datei an der falschen Stelle. Die Meldung sagt euch sogar, wo es gesucht hat: in Klammern steht das Arbeitsverzeichnis. Zwei Ursachen:

- **Positron hat nicht den Kursordner geöffnet**, sondern einen anderen oder gar keinen. Dann *File > Open Folder…* und den Kursordner wählen.
- **Die Datei liegt nicht in `data/`**, oder sie heißt anders, etwa `mds12_schoko_milch (1).csv` nach einem zweiten Download.

**Tun:** Im Explorer links in Positron nachsehen: Liegt die Datei in `data/`, und steht oben der Name des Kursordners?

## Wenn es keine der drei ist

Kopiert die **ganze** Meldung, auch die Zeilen darüber, und fragt euren Assistenten, was sie bedeutet. Lasst sie euch erklären, und behebt den Fehler dann selbst. Nach einer Woche erkennt ihr die häufigen auf einen Blick.
