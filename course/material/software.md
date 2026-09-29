# Software

Vier Programme, alle kostenlos, alle für Windows und macOS. Quarto bringt Positron mit.

| Programm | wofür | woher |
|---|---|---|
| **R** | die Sprache, in der ihr auswertet | [cran.r-project.org](https://cran.r-project.org) |
| **Positron** | das Programm, in dem ihr R schreibt und ausführt | [positron.posit.co](https://positron.posit.co/download.html) |
| **OpenCode** | euer KI-Assistent | [opencode.ai/download](https://opencode.ai/download) |
| **Quarto** | Berichte und Präsentationen | kommt mit Positron |

## Die Installation in drei Teilen

**Teil 1** macht ihr von Hand: OpenCode installieren, den Kursordner herunterladen, beides zusammenbringen. **Teil 2** übernimmt euer Assistent mit `/onboarding`: Er sieht nach, ob Positron, R und Quarto schon da sind, installiert mit euch, was fehlt, prüft die Pakete und lässt den Systemcheck laufen. **Teil 3** ist Positron: den Kursordner dort öffnen. Jeder Schritt von Teil 2 steht hier auch zum Nachlesen, für alle, die lieber selbst installieren.

## Teil 1: bis euer Assistent läuft

### 1. OpenCode

Ladet die Desktop-App von [opencode.ai/download](https://opencode.ai/download) und installiert sie wie jedes andere Programm.

- **Windows:** den Windows-Installer herunterladen, ausführen, den Schritten folgen.
- **macOS:** die Fassung für euren Mac: *Apple Silicon*, wenn er einen M-Chip hat, sonst *Intel*. Das steht unter Apfel-Menü > *Über diesen Mac* in der Zeile *Chip*. Die Datei öffnen und OpenCode in den Ordner *Programme* ziehen.

### 2. Der Kursordner

1. Öffnet [github.com/winf-hsos/data-analytics-courses](https://github.com/winf-hsos/data-analytics-courses), klickt auf den grünen Knopf **Code** und dann auf **Download ZIP**. Oder direkt: [data-analytics-courses-main.zip](https://github.com/winf-hsos/data-analytics-courses/archive/refs/heads/main.zip).
2. Die ZIP-Datei entpacken. **Windows:** Rechtsklick, *Alle extrahieren*, bestätigen. **macOS:** Doppelklick.
3. Ihr habt jetzt einen Ordner `data-analytics-courses-main`. Legt ihn dorthin, wo ihr ihn wiederfindet, etwa in *Dokumente*. Ihr dürft ihn in `data-analytics-courses` umbenennen.

Unter Windows gibt es eine Falle: Ein Doppelklick auf die ZIP-Datei zeigt ihren Inhalt, als wäre sie ein Ordner, entpackt aber nichts. Darin kann weder euer Assistent noch R arbeiten. Immer *Alle extrahieren*.

### 3. Den Ordner in OpenCode öffnen

Startet OpenCode. Auf der Startseite seht ihr links eine Liste **Projects**.

1. **Kursordner hinzufügen:** Klickt auf das kleine Ordnersymbol mit dem Plus neben *Projects* (Tooltip *Add project*), wählt euren Kursordner und klickt *Select Folder*.
2. **Sitzung starten:** Klickt **New session**. Unter dem Eingabefeld steht das Modell, das der Kursordner voreingestellt hat, eines der freien Modelle von OpenCode. Ihr braucht keinen Schlüssel.

Freie Modelle kommen und gehen. Läuft das voreingestellte nicht, wählt in der Modellauswahl unter dem Eingabefeld ein anderes freies.

**Ein Schlüssel, wenn ihr einen bekommt:** In OpenCode unter der Projektliste auf **Settings**, dann links **Providers**. Beim Anbieter, für den der Schlüssel gilt, **+ Connect** klicken (steht er nicht in der Liste, zuerst *Show more providers*), **API key** wählen und einfügen. Ein Schlüssel kostet bei jeder Antwort Geld: Behandelt ihn wie ein Passwort, schickt ihn niemandem und kopiert ihn in keinen Chat, auch nicht in den mit eurem Assistenten.

## Teil 2: euer Assistent übernimmt

In der neuen Sitzung tippt ihr

```
/onboarding
```

Der Assistent fragt, in welchem Modul ihr seid und was ihr mitbringt. Dann sieht er nach, was schon installiert ist. Fehlt etwas, fragt er, ob er es selbst installieren soll (unter Windows mit winget, auf dem Mac mit Homebrew) oder ob ihr es lieber selbst macht und er euch Schritt für Schritt begleitet. Vor jeder Installation sagt er, was er installieren will, und wartet auf euer OK. Die Reihenfolge ist Positron, R, Quarto.

### Positron

- **Windows:** Auf [positron.posit.co](https://positron.posit.co/download.html) den Windows-Installer (*User*) herunterladen und ausführen.
- **macOS:** Dort die `.dmg`-Datei herunterladen, öffnen und Positron in den Ordner *Programme* ziehen.

### R

Nötig ist R 4.4 oder neuer. Wer es neu installiert:

- **Windows:** [R für Windows](https://cran.r-project.org/bin/windows/base/), *Download R for Windows*, Installer ausführen, alle Voreinstellungen lassen.
- **macOS:** [R für macOS](https://cran.r-project.org/bin/macosx/), die Fassung für euren Chip (*arm64* für Apple Silicon, *x86_64* für Intel), Paket öffnen, den Schritten folgen.

Danach sucht euer Assistent R noch einmal und macht weiter. Ohne Administratorrechte bietet der Windows-Installer an, R nur für euren Benutzer zu installieren; das genügt.

### Quarto

Quarto kommt mit Positron. Nur wenn der Assistent es danach nicht findet oder es zu alt ist (nötig ist 1.5 oder neuer): von [quarto.org](https://quarto.org/docs/get-started/) den Installer für euer System herunterladen und ausführen.

### Die Pakete

Der Kurs braucht das tidyverse und ein paar kleinere Pakete; die Liste steht in `course/packages.txt`. Der Assistent installiert, was fehlt. Von Hand ginge es in der Konsole von Positron mit `install.packages("tidyverse")`. Beim ersten Mal dauert das einige Minuten.

### Die Daten

Welche Dateien euer Modul braucht, steht in seiner `README.md` unter `course/modules/`; in Werkzeuge und Praxis sind es `mds12_schoko_milch.csv` und `M3b_Musterstudie-quantitativ.pdf`. Aus dem ILIAS-Kurs herunterladen und **unverändert** in den Ordner `data/` im Kursordner legen. Achtet darauf, dass der Browser beim zweiten Herunterladen nicht `(1)` an den Namen hängt.

### Der Systemcheck

Zum Schluss lässt der Assistent den Systemcheck laufen und liest das Ergebnis `my-code/systemcheck.txt` mit euch durch.

## Teil 3: Positron

In Positron arbeitet ihr: Skripte schreiben, ausführen, Abbildungen ansehen. OpenCode läuft daneben.

1. Positron starten, **File > Open Folder…**, den Kursordner wählen (denselben wie in OpenCode).
2. Links im Explorer seht ihr `my-code`, `data` und `course`. Oben rechts in der Konsole wählt Positron beim ersten Mal eine R-Version; nehmt die neueste.
3. In `my-code/` legt ihr eure Skripte an: Rechtsklick auf den Ordner, *New File…*, Name mit `.R` am Ende.

Warum der ganze Ordner und nicht nur eine Datei? Positron macht den geöffneten Ordner zum Arbeitsverzeichnis. Nur dann findet `read_csv("data/mds12_schoko_milch.csv")` die Datei, auf jedem Laptop gleich.

## Aktualisieren

Wenn Nicolas es ansagt, tippt ihr in OpenCode `/update-semester`. Neues Material kommt, eure Ordner `my-code/` und `data/` bleiben unberührt.

## Wenn etwas nicht läuft

Fragt zuerst euren Assistenten; kopiert die Meldung hinein oder zieht ein Bildschirmfoto ins Eingabefeld. Lässt es sich nicht lösen, zeigt es Nicolas in der Sitzung.
