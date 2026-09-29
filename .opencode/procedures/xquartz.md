# Ablauf: XQuartz installieren (nur macOS)

Wann: Der Systemcheck meldet auf einem Mac „XQuartz fehlt“, oder Quarto bricht beim Rendern einer Abbildung mit `failed to load cairo DLL` ab. R zeichnet Abbildungen für Quarto mit dem Grafikgerät cairo, und das braucht auf dem Mac XQuartz. In Positron selbst klappen Abbildungen auch ohne, deshalb fällt es erst beim Rendern auf.

Das Installationsprogramm verlangt das Passwort des Macs. **Das gibt die Person selbst ein, im Fenster des Installationsprogramms. Frag nie danach, und lass es nie in den Chat oder ins Terminal tippen.** Alles andere erledigst du.

## 1. Erklären und fragen

In zwei Sätzen: Abbildungen in Quarto brauchen auf dem Mac das Zusatzprogramm XQuartz, eine offizielle, kostenlose Ergänzung für macOS (rund 120 MB). Du lädst es herunter und öffnest das Installationsprogramm; klicken und das Passwort eingeben macht die Person selbst. Frag, ob du loslegen darfst.

## 2. Aktuelle Fassung finden

```
curl -s https://api.github.com/repos/XQuartz/XQuartz/releases/latest
```

In der Antwort stehen unter `assets` die Dateien. Nimm die `browser_download_url` der Datei, die auf `.pkg` endet (etwa `XQuartz-2.8.6.pkg`), und die der Datei, die auf `.pkg.sha256sum` endet. Nimm nur Adressen, die mit `https://github.com/XQuartz/XQuartz/releases/download/` beginnen.

## 3. Herunterladen und prüfen

```
curl -L -o ~/Downloads/XQuartz.pkg "<pkg-adresse>"
curl -sL "<sha256sum-adresse>"
shasum -a 256 ~/Downloads/XQuartz.pkg
```

Die beiden Prüfsummen müssen übereinstimmen. Tun sie es nicht, lösch die Datei nicht selbst, sondern sag, dass der Download beschädigt ist, und lade ihn noch einmal.

## 4. Installationsprogramm öffnen

```
open ~/Downloads/XQuartz.pkg
```

Sag der Person, was jetzt kommt: ein Installationsfenster, mehrmals *Fortfahren*, die Lizenz *Akzeptieren*, *Installieren*, dann das **Passwort des Macs** (dasselbe wie beim Anmelden), zum Schluss *Schließen*. Einen Hinweis, sich ab- und wieder anzumelden, darf sie vorerst ignorieren. Warte, bis sie sagt, dass es fertig ist.

## 5. Prüfen

```
test -d /Applications/Utilities/XQuartz.app && echo installiert
```

Dann den Systemcheck noch einmal ausführen (`"<rscript>" .opencode/scripts/systemcheck.R`) und `my-code/systemcheck.txt` lesen. Der Quarto-Rendertest sollte jetzt OK sein. Ist er es nicht, soll die Person den Mac einmal neu starten und danach `/onboarding` oder den Systemcheck noch einmal aufrufen. Notier das Ergebnis in `my-code/about-me.md` (etwa `- 2026-10-01: XQuartz installiert, Rendertest OK.`).

Das Installationspaket in `~/Downloads/XQuartz.pkg` wird danach nicht mehr gebraucht; sag der Person, dass sie es löschen kann. Lösch es nicht selbst.

## Wenn es nicht geht

- **Keine Administratorrechte** (etwa auf einem Firmen-Mac): Dann geht es ohne XQuartz. Im Kopf jedes Quarto-Dokuments stellt man das Grafikgerät ragg ein, das mit dem tidyverse schon installiert ist:
  ```yaml
  knitr:
    opts_chunk:
      dev: ragg_png
  ```
  Erklär das und notier es in `about-me.md`, damit du es bei jedem neuen Dokument wieder einträgst.
- **Download scheitert** (keine Verbindung, GitHub nicht erreichbar): Die Person lädt XQuartz auf <https://www.xquartz.org> über den Download-Knopf selbst und öffnet die `.pkg`-Datei mit Doppelklick; weiter bei Schritt 4.
