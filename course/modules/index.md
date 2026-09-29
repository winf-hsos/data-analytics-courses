# Die Module

Dieser Kursordner dient mehreren Modulen zur Datenanalyse. Sie bauen aufeinander auf und nutzen dieselben Werkzeuge (R, Positron, das tidyverse, später Quarto) und dieselben Konventionen. Was ein Modul besonders macht, steht in seinem Ordner.

| Kennung | Modul | Stufe | Semester | Ordner |
|---|---|---|---|---|
| `werkzeuge-mgf` | Werkzeuge der Markt- und Gesellschaftsforschung | Bachelor, 2. Semester | Sommer | [werkzeuge-mgf](werkzeuge-mgf/README.md) |
| `praxis-mgf` | Praxis der Markt- und Gesellschaftsforschung | Bachelor, 3. Semester | Winter | [praxis-mgf](praxis-mgf/README.md) |
| `empirisches-arbeiten` | Empirisches Arbeiten | Master | | [empirisches-arbeiten](empirisches-arbeiten/README.md) |
| `big-data-analytics` | Big Data Analytics | | | [big-data-analytics](big-data-analytics/README.md) |

Empirisches Arbeiten und Big Data Analytics sind noch nicht eingerichtet; ihre Ordner halten nur den Platz.

## Wie sie zusammenhängen

- **Werkzeuge** führt in R, Positron und die explorative Datenanalyse ein: Daten laden, umformen, darstellen, und die Fallstricke, in die man dabei tappt.
- **Praxis** setzt darauf auf und geht den ganzen Forschungsprozess: vom Thema zur Forschungsfrage, zur Auswertung, zu Bericht und Präsentation mit Quarto, mit einem KI-Agenten als Forschungsassistent. Nicht alle haben Werkzeuge belegt; wer nicht, holt es im Selbststudium nach.
- **Empirisches Arbeiten** ist das Mastermodul zum selbstständigen empirischen Arbeiten.

Wer im Sommer in Werkzeuge war und im Winter in Praxis ist, behält denselben Kursordner und sagt dem Assistenten, dass das Modul gewechselt hat.

## Aufbau eines Modulordners

| Datei | Inhalt |
|---|---|
| `README.md` | worum es geht, Lehrende, Lernziele, Daten, was beim Onboarding zusätzlich gefragt wird |
| `NOW.md` | wo das Semester steht, was noch nicht dran ist |
| `sessions/session-N.md` | was in einer Sitzung gemacht wurde, mit dem Code |
| `self-study.md` | Selbststudium, falls es eins gibt |
| `templates/<name>/` | Vorlagen, die bei `/onboarding` und `/update-semester` nach `my-code/<name>/` kopiert werden |
| `packages.txt` | Pakete, die nur dieses Modul braucht (optional) |
