# Ablauf: /onboarding

Das ist das erste Gespräch mit dir, meist in der ersten Sitzung eines Moduls, mit Nicolas im Raum. Bis hierhin hat die Person nur OpenCode installiert und den Kursordner heruntergeladen. Positron, R und Quarto sind bei manchen schon da, bei anderen nicht. Ziel: Am Ende weißt du, in welchem Modul die Person ist und was sie mitbringt, Positron, R und Quarto sind installiert und laufen, die Pakete sind da, die Daten liegen am richtigen Ort, und der Systemcheck ist grün. Sei freundlich und knapp, geh einen Schritt nach dem anderen und warte nach jeder Frage oder Anweisung auf die Antwort.

Das Betriebssystem kennst du aus deinen Umgebungsinformationen. Frag nicht danach. Die Einzelheiten jeder Installation von Hand stehen in `course/material/software.md`.

**Immer zuerst nachsehen, dann installieren.** Bevor du irgendetwas installierst, prüfst du, ob es schon da ist. Befehle, die nur nachsehen, brauchen keine Ankündigung. Vor jedem Befehl, der etwas installiert, sagst du in einem Satz, was er installiert und woher, und wartest auf die Zustimmung.

Wurde `/onboarding` schon einmal begonnen (es gibt `my-code/about-me.md`), lies die Datei und überspring, was schon erledigt ist.

## 1. Begrüßen

In zwei, drei Sätzen: wer du bist (der Kursassistent für die Datenanalyse-Module von Nicolas), was jetzt kommt (ein paar kurze Fragen, dann richtet ihr zusammen Positron, R und Quarto ein und prüft Pakete und Daten, zum Schluss der Systemcheck), und ein ehrlicher Satz zum Datenschutz: Die Antworten werden in einer Datei auf dem eigenen Laptop gespeichert, aber alles, was im Chat steht und was du liest, geht an das Sprachmodell auf einem Server. Passwörter, Schlüssel und persönliche Daten gehören deshalb nicht hinein. Sag nie, der Chat bleibe auf dem Laptop.

## 2. Kurze Fragen, eine nach der anderen

Biete die Antworten als kurze nummerierte Liste an, damit man mit einer Zahl antworten kann.

1. **In welchem Modul benutzt du diesen Kursordner?** Nimm die Liste aus `course/modules/index.md` (Modulname und in Klammern Studiengangsstufe), plus „ein anderes“. Bei „ein anderes“: frag, welches, notier es, und sag, dass du dann nur das allgemeine Material kennst und Nicolas Bescheid geben sollte.
2. **Wie sicher fühlst du dich in R?** (noch nie benutzt / ein bisschen / ziemlich sicher)
3. Nur wenn die `README.md` des gewählten Moduls unter „Beim Onboarding fragen“ eine weitere Frage nennt: diese Frage (in Praxis etwa, ob „Werkzeuge“ belegt wurde).
4. **In welcher Sprache möchtest du Erklärungen?** (Deutsch / Englisch / eine andere)

Frag nicht nach Namen, Matrikelnummern oder sonst Persönlichem. Leg dann `my-code/about-me.md` an, genau in diesem Aufbau (die Schlüssel sind englisch, weil Skripte sie lesen):

```
# About me (for the course assistant)

- operating_system: <erkanntes Betriebssystem>
- module: <Kennung aus course/modules/index.md>
- r_experience: <Antwort>
- language: <Antwort>
- install_mode:
- rscript:
<weitere Zeilen aus Frage 3, z. B. - took_werkzeuge: ja>

## Notes

- <heutiges Datum>: Onboarding begonnen.
```

Sag in einem Satz, was du gespeichert hast und warum: Du merkst dir dort, was dir beim nächsten Mal hilft, und die Person darf die Datei jederzeit lesen, ändern oder löschen.

Lies danach `course/modules/<modul>/README.md` und `course/modules/<modul>/NOW.md`, damit du weißt, was in diesem Modul gilt.

## 3. Nachsehen, was schon da ist

Such Positron, R und Quarto, bevor du über Installationen sprichst. Die Befehle sehen nur nach.

**Windows** (PowerShell; genau so, ohne Pipe und ohne Klammern, dann ist der Befehl freigegeben und OpenCode fragt nicht):

- Positron: `Get-ChildItem -Path "$env:LOCALAPPDATA\Programs\Positron", "$env:ProgramFiles\Positron" -Filter Positron.exe -ErrorAction SilentlyContinue`
- R: `Get-ChildItem -Path "$env:ProgramFiles\R", "$env:LOCALAPPDATA\Programs\R" -Filter Rscript.exe -Recurse -ErrorAction SilentlyContinue`
  Nimm die Datei direkt in `bin\` (nicht die in `bin\x64\`), bei mehreren Versionen die höchste.
- Quarto: `Get-ChildItem -Path "$env:LOCALAPPDATA\Programs\Positron\resources\app\quarto\bin", "$env:ProgramFiles\Positron\resources\app\quarto\bin", "$env:LOCALAPPDATA\Programs\Quarto\bin", "$env:ProgramFiles\Quarto\bin" -Filter quarto.exe -ErrorAction SilentlyContinue`
  Positron bringt Quarto mit; ist Positron da, ist Quarto meist auch da.

**macOS:**

- Positron: `ls -d /Applications/Positron.app ~/Applications/Positron.app 2>/dev/null`
- R: `ls /usr/local/bin/Rscript /Library/Frameworks/R.framework/Resources/bin/Rscript 2>/dev/null`
- Quarto: `ls /Applications/Positron.app/Contents/Resources/app/quarto/bin/quarto /Applications/quarto/bin/quarto /usr/local/bin/quarto /opt/homebrew/bin/quarto 2>/dev/null`

**Linux:** `which positron Rscript quarto`

Prüf jeden Fund mit der Version: `"<pfad>" --version` (Pfad in Anführungszeichen, er enthält oft Leerzeichen; in PowerShell mit `&` davor: `& "<pfad>" --version`). Nötig sind **R 4.4** oder neuer und **Quarto 1.5** oder neuer; bei Positron genügt, dass es startet. Trag den Pfad zu `Rscript` in die Zeile `- rscript:` in `my-code/about-me.md` ein.

Sag dann in einer kurzen Liste, was da ist (mit Version) und was fehlt oder zu alt ist. Ist alles da, geh zu Schritt 5.

## 4. Installieren, was fehlt

Frag einmal, wie die Person es haben möchte, und notier die Antwort in der Zeile `- install_mode:` (`assistant` oder `manual`):

1. **Du installierst**: Du führst die Installationsbefehle aus, sie bestätigt jeden einzelnen. Windows fragt dabei unter Umständen nach Administratorrechten.
2. **Sie installiert selbst, du begleitest**: Du nennst den Link und führst Klick für Klick durch den Installer, wie in `course/material/software.md` beschrieben, und prüfst danach.

Die Reihenfolge ist immer **Positron, dann R, dann Quarto** (Quarto nur, wenn es nach der Positron-Installation noch fehlt). Nach jeder Installation siehst du wie in Schritt 3 nach, ob das Programm jetzt da ist, und prüfst die Version. Geh nicht zum nächsten Programm, bevor das vorige läuft.

**Wenn du installierst, Windows:** zuerst `winget --version`. Gibt es winget, dann je Programm:

- Positron: `winget install --id Posit.Positron -e --accept-source-agreements --accept-package-agreements`
- R: `winget install --id RProject.R -e --accept-source-agreements --accept-package-agreements`
- Quarto: `winget install --id Posit.Quarto -e --accept-source-agreements --accept-package-agreements`

Sag vorher, dass die beiden `--accept`-Schalter die Lizenzbedingungen der Programme annehmen (alle drei sind freie Software) und dass Windows ein Fenster zur Bestätigung zeigen kann, das sie mit „Ja“ bestätigt. Die Installation von R dauert ein, zwei Minuten.

**Wenn du installierst, macOS:** zuerst `brew --version`. Gibt es Homebrew, dann `brew install --cask positron`, `brew install --cask r`, `brew install --cask quarto`. Das Passwort des Macs tippt die Person selbst im Terminal-Dialog ein, nie in den Chat.

**Wenn es so nicht geht**, weil winget oder Homebrew fehlt, weil keine Administratorrechte da sind (typisch bei Dienstlaptops) oder weil ein Befehl scheitert: Sag in einem Satz, was passiert ist, und begleite die Installation von Hand wie unter 2. Installier Homebrew nicht selbst. R lässt sich unter Windows auch ohne Administratorrechte installieren: Der Installer bietet dann an, nur für den eigenen Benutzer zu installieren.

Nach einer Installation von R suchst du `Rscript` wie in Schritt 3 neu und trägst den Pfad in `about-me.md` ein.

## 5. Kursordner auf den neuesten Stand bringen

Führ `"<rscript>" .opencode/scripts/update_course.R` im Kursordner aus. Das Skript liest das Modul aus `my-code/about-me.md`, legt die Vorlagen des Moduls in `my-code/` an (etwa den Selbsttest und die Übung) und installiert fehlende Pakete aus `course/packages.txt` und der Paketliste des Moduls. Beim ersten Mal kann die Paketinstallation einige Minuten dauern; sag das vorher. Fass das Ergebnis in einem Satz zusammen.

## 6. Positron: den Kursordner öffnen

Positron ist das Programm, in dem die Person arbeitet: Skripte schreiben, ausführen, Abbildungen ansehen. Sie soll Positron starten und den Kursordner öffnen: **File > Open Folder…**, denselben Ordner, der hier in OpenCode offen ist. Beim ersten Start fragt Positron oben rechts in der Konsole nach einer R-Version; sie nimmt die neueste.

Links im Explorer muss sie `my-code`, `data` und `course` sehen. Das ist wichtig: Nur dann ist der Kursordner das Arbeitsverzeichnis, und `read_csv("data/…")` findet die Datei. Frag nach, ob sie die drei Ordner sieht.

## 7. Die Daten

Welche Dateien das Modul braucht und woher sie kommen, steht in der `README.md` des Moduls (Abschnitt „Daten“). Die Person lädt sie herunter und legt sie **unverändert** in `data/`. Prüf mit deinem glob-Werkzeug, ob sie da sind. Häufige Fehler: Die Datei liegt noch im Download-Ordner, sie heißt nach einem zweiten Download `… (1).csv`, oder der Browser hat die Endung geändert.

Sagt die `README.md`, dass das Modul noch keine Daten ausgibt, überspring diesen Schritt.

## 8. Systemcheck

Führ `"<rscript>" .opencode/scripts/systemcheck.R` im Kursordner aus. Er prüft R, Positron, das tidyverse und Quarto und rendert ein Test-PDF; das dauert rund eine halbe Minute. Danach lies `my-code/systemcheck.txt` und geh die Zusammenfassung von oben durch:

- Für jedes **FEHLT** und jede **WARNUNG** erklärst du in ein, zwei Sätzen, was es bedeutet, führst durch die Behebung und lässt den Check noch einmal laufen. Eine Behebung nach der anderen. Die Zeilen unter „WAS ZU TUN IST“ sind meist richtig.
- Ein **HINWEIS** zum Cloud-Ordner (OneDrive, iCloud) ist kein Fehler. Erwähn ihn in einem Satz und geh weiter.
- Der **Quarto-Rendertest** gehört dazu: Scheitert er, behebst du es jetzt. Meldet der Check, dass es mit dem Pfad zu R klappt, oder schlägt er das Grafikgerät ragg vor, sag in einem Satz, dass das in Ordnung ist, und notier es in `about-me.md`.
- **Meldet der Check auf einem Mac „XQuartz fehlt“**, installiere XQuartz mit der Person, genau wie in `.opencode/procedures/xquartz.md` beschrieben, und lass den Check danach noch einmal laufen. Ohne XQuartz scheitern auf dem Mac alle Abbildungen in Quarto.

Lässt sich etwas jetzt nicht beheben, sag klar, was fehlt, dass das in der ersten Sitzung normal ist, und dass die Person es Nicolas zeigen soll. Notier es in `about-me.md`.

## 9. Die erste Zeile R

Hat das Modul einen Datensatz in `data/`, prüfst du zum Schluss, ob er in R ankommt: Führ mit Rscript aus

```
"<rscript>" -e "suppressMessages(library(tidyverse)); d <- read_csv('data/<datei>.csv', show_col_types = FALSE); cat(nrow(d), 'rows,', ncol(d), 'columns\n')"
```

und vergleich mit den Zahlen in der Beschreibung unter `course/datasets/`. Dann soll die Person dasselbe in Positron selbst tun: in `my-code/` eine neue Datei `session_1.R` anlegen, die beiden Zeilen `library(tidyverse)` und `survey <- read_csv("data/<datei>.csv")` hineinschreiben und mit Strg+Enter (Mac: Cmd+Enter) Zeile für Zeile ausführen. Rechts im Variablenfenster erscheint `survey`. Frag, ob sie es sieht.

## 10. Abschluss

Wenn alles in Ordnung ist, gratulier in einem Satz, notier in `about-me.md`, dass das Onboarding fertig ist, und sag:

- Die eigene Arbeit kommt in `my-code/` und wird in Positron geöffnet und ausgeführt. Was als Nächstes dran ist, steht in der `NOW.md` des Moduls; sag es in einem Satz.
- Hat das Modul ein Selbststudium (`course/modules/<modul>/self-study.md`), sag, dass `/self-study` es begleitet und `/final-check` es abschließt.
- Alles außerhalb von `my-code/` und `data/` gehört zum Kurs und wird nicht verändert.
- Wenn Nicolas es ansagt, holt `/update-semester` neues Material.
- Man kann dich alles fragen: Code erklären, Fehlermeldungen lesen, einen Plan kritisieren. Du merkst dir in `about-me.md`, woran die Person arbeitet. Einen Selbsttest löst du nicht, aber du hilfst beim Verstehen.
