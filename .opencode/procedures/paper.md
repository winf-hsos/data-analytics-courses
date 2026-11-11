# Ablauf: /paper

Die Person möchte die Vorlage für den Bericht ihrer Gruppe anlegen. Der Bericht ist die schriftliche Prüfungsleistung: ein Quarto-Dokument, das R-Code, Text, Abbildungen und Literatur zusammenhält und mit Typst zu einem PDF gerendert wird. Darin schreibt die Gruppe bis zur Abgabe.

## 1. Gibt es schon einen Bericht?

Sieh mit deinen Dateiwerkzeugen nach, ob es `my-code/paper/` gibt. Wenn ja, legst du nichts neu an: Sag, dass der Bericht schon da ist, und biete an, ihn zu rendern (Schritt 5) oder beim Weiterschreiben zu helfen.

## 2. Ein paar Fragen, in einer Nachricht

Frag nach dem, was oben im Bericht steht. Alles darf vorläufig sein und später geändert werden; sag das dazu.

1. **Arbeitstitel** des Berichts
2. **Spezialthema** der Gruppe (steht als Untertitel; steht es schon in `about-me.md` unter `- group_topic:`, schlag es vor)
3. **Forschungsfrage**, so wie sie gerade lautet
4. **Autorinnen und Autoren**, so wie sie auf dem Deckblatt stehen sollen. Wer das noch nicht festlegen will, lässt es offen; dann bleibt der Platzhalter stehen.

Die Namen kommen nur in den Bericht, nie in `about-me.md`.

## 3. Vorlage anlegen

Nimm den Pfad zu `Rscript` aus `my-code/about-me.md` (Zeile `- rscript:`) und führ im Kursordner aus: `"<rscript>" .opencode/scripts/new_paper.R` (in PowerShell mit `&` davor). Das Skript kopiert die Vorlage nach `my-code/paper/` und überschreibt nie etwas. Meldet es `SCHON DA` oder `PROBLEM`, folg der Zeile `WAS TUN`.

## 4. Die Antworten eintragen

Trag die Antworten ein, mit einer Änderung je Datei, und sag vorher, was du änderst:

- `my-code/paper/paper.qmd`, Kopf: `title`, `subtitle` (Spezialthema) und unter `author` je Person ein Eintrag `- name: "…"` mit `affiliations: "Hochschule Osnabrück"`
- `my-code/paper/sections/_introduction.qmd`: `FORSCHUNGSFRAGE` durch die Frage ersetzen

Steht das Spezialthema noch nicht in `about-me.md`, trag es dort als `- group_topic:` ein und notier unter `## Notes` mit Datum, dass der Bericht in `my-code/paper/` liegt.

## 5. Einmal rendern

Führ aus: `"<rscript>" .opencode/scripts/render_paper.R`. Es findet Quarto, rendert `paper.qmd` und meldet `FERTIG` mit dem Pfad des PDFs oder `FEHLER` mit Quartos letzten Zeilen. Fehlt `data/mds12_schoko_milch.csv`, hilf zuerst, die Daten aus ILIAS nach `data/` zu legen. Bei `cairo` auf dem Mac: `.opencode/procedures/xquartz.md`.

## 6. Den Aufbau erklären

Kurz, in der Sprache der Person:

- `paper.qmd` ist das zentrale Dokument: oben die Einstellungen (Titel, Autoren, Abstract, PDF über Typst), darunter das Laden der Daten und die Abschnitte, die mit `{{< include … >}}` eingefügt werden. Gerendert wird immer nur `paper.qmd`, in Positron mit **Preview**.
- In `sections/` steht je Abschnitt eine Datei: Einleitung, Methode, Ergebnisse, Diskussion, Fazit und der Anhang zur KI-Nutzung. Die Kommentare `<!-- … -->` darin sagen, was in den Abschnitt gehört; im PDF erscheinen sie nicht. Mehr dazu in der Lektion „Aufbau eines wissenschaftlichen Papers“ (https://hands-on-computer-science.de/ds/de/items/paper-structure/); eine Rückmeldung zum Aufbau gibt `/paper-feedback`.
- Der Code läuft vom Kursordner aus, Daten also wie in den Skripten mit `read_csv("data/…")`. Das Laden steht einmal oben in `paper.qmd`; die Abschnitte nutzen `survey` von dort.
- Was die Beispiele zeigen: eine Zahl aus R im Text (Inline-R), eine Formel, eine Abbildung und eine Tabelle mit Beschriftung und Querverweis (`@fig-…`, `@tbl-…`), Zitate aus `references.bib` (`[@doering2023]`). Die Beispiele dürfen weg, sobald es eigene gibt.
- Der Anhang „Angaben zur KI-Nutzung“ gehört zur Abgabe; wer mit dir arbeitet, trägt dort ein, wofür.

Schlag dann einen ersten Schritt vor, etwa die Einleitung zu skizzieren oder die erste eigene Abbildung in `sections/_results.qmd` zu bauen.

## Arbeiten in der Gruppe

Jede Person hat ihren eigenen Kursordner. Fragt jemand, wie die Gruppe gemeinsam an einem Bericht schreibt: Eine Person legt ihn an, die anderen bekommen den Ordner `my-code/paper/` als Kopie in ihren eigenen `my-code/`. Wer welchen Abschnitt schreibt, sprecht ihr ab; weil jeder Abschnitt eine eigene Datei ist, kommt man sich dabei kaum in die Quere. Die Daten gibt niemand weiter, jede Person hat sie aus ILIAS.
