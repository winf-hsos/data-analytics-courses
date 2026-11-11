# Wo das Semester steht

Stand: 2026-11-11, Sitzung 2

## Aktuell

- **Sitzung 2 (11. November): Forschungsfragen, wissenschaftliche Paper und Quarto.** Alle schreiben ihr erstes Quarto-Dokument, und jede Gruppe legt mit `/paper` die Vorlage für ihren Bericht an (`my-code/paper/`, mit Typst zu PDF). Dazu: was eine gute Forschungsfrage ausmacht, die eigene Frage gegen das Codebuch prüfen (dafür `/research-question`), Aufbau eines Papers nach IMRaD (Rückmeldung zum eigenen Bericht mit `/paper-feedback`). Nicolas teilt in dieser Sitzung über Teams einen Kursschlüssel für ein stärkeres Sprachmodell; hilf beim Einrichten so, wie Nicolas es in der Sitzung zeigt; gib ihn nie aus und schreib ihn nie in eine Datei im Kursordner.
- **Auftrag bis 18. November:** die geschärfte Forschungsfrage in die Einleitung des Berichts schreiben und die Gliederung anlegen.
- **Herrn Ennekings Statistik-Strang** geht am 2. Dezember weiter. Statistische Tests und Modelle kommen von ihm. Hilf beim Code, aber greif seiner Methodenwahl nicht vor. Seine R-Pakete stehen in `course/modules/praxis-mgf/packages.txt`; fehlt eines, schlag `/update-semester` vor.
- **Die Inhalte der Sitzungen** liegen auf Hands-on Computer Science im Kurs „Praxis der Markt- und Gesellschaftsforschung“ (ohne Zugangscode): https://hands-on-computer-science.de/ds/de/modules/market-and-social-research-practice/
  Verweise auf die passende Seite, wenn jemand etwas nachlesen will, statt den Inhalt neu zu erklären:
  - OpenCode und der Kursassistent: https://hands-on-computer-science.de/ds/de/items/opencode-course-assistant/
  - Erste Schritte mit Quarto (mit Beispiel-Paper zum Herunterladen): https://hands-on-computer-science.de/ds/de/items/quarto-first-steps/
  - Was ist eine Forschungsfrage?: https://hands-on-computer-science.de/ds/de/items/research-questions/
  - Aufbau eines wissenschaftlichen Papers (IMRaD, Übung an einem Paper): https://hands-on-computer-science.de/ds/de/items/paper-structure/
  - Die Milch-Umfrage: https://hands-on-computer-science.de/ds/de/items/milk-chocolate-survey/
  - Datenanalyse mit R in Kürze (Folien): https://hands-on-computer-science.de/ds/de/items/data-analysis-with-r-slides/
  - R im Selbststudium: fünf Übungen im Browser (https://hands-on-computer-science.de/ds/de/items/survey-exercise-first-look/ und die folgenden) und ein Selbsttest (https://hands-on-computer-science.de/ds/de/items/survey-self-test/). Sie entsprechen `/self-study` und `/final-check` hier im Kursordner; beide Wege gelten.
  Die Inhalte für Sitzung 3 (KI-Agenten) entstehen noch; nenn keine Adressen, die hier nicht stehen.

## Bisher behandelt

- Kick-off (23. September): worum es in diesem Teil geht, die drei Werkzeuge R und Positron, Quarto und OpenCode.
- Sitzung 1 (30. September): Datenanalyse mit R, Arbeitsumgebung, Durchstich von Daten laden bis Abbildung (Code in `course/modules/praxis-mgf/sessions/session-1.md`), danach Selbststudium mit `/self-study` und `/final-check`.
- Herr Kussin: Fragebögen und Planung der Datenerhebung (14. Oktober), Auswertung der Interviewdaten von Hand (21. Oktober).
- Herr Enneking: statistische Analyse mit R (7. Oktober).

## Noch nicht dran

- **KI-Agenten in der empirischen Forschung** kommen in Sitzung 3 am 18. November: was ein Agent ist, warum Text für KI besser taugt, den Agenten steuern und prüfen.
- **Interviewtranskripte mit KI auswerten:** höchstens kurz in Sitzung 3. Kommt jemand vorher damit, hilf, aber frag zuerst nach dem Einverständnis der Interviewten (siehe deine Anweisungen).
- **Präsentieren** aus derselben Quarto-Quelle kommt in Sitzung 4 am 16. Dezember.

## Feste Werte

- Sprachmodell: vorerst die freien Modelle von OpenCode, voreingestellt im Kursordner. Einen Schlüssel für ein stärkeres Modell gibt Nicolas in Sitzung 2 aus.
- Datensatz: `data/mds12_schoko_milch.csv`, 2.811 Befragte, 813 Variablen, UTF-8, Komma als Trennzeichen. Laden mit `read_csv("data/mds12_schoko_milch.csv")`, ohne weitere Angaben.

## Die Prüfung

- Referat und schriftliche Ausarbeitung (Bericht) je Gruppe, beides mit Quarto erstellt. Einzelheiten nennen die Lehrenden in den Sitzungen und in ILIAS.
- Der Selbsttest zählt nicht zur Note und wird nicht eingesammelt.

## Die Termine (Wintersemester 2026/27, mittwochs 13:15 bis 16:30, Raum OT-0001/2)

Das Modul hat drei Lehrende. Der Ablaufplan, wie ihn die Studierenden kennen:

- 23.09. Einführung in das Modul, qualitative Forschung (alle, Herr Kussin)
- 30.09. Sitzung 1: Datenanalyse mit R: Arbeitsumgebung, Kompaktkurs und Aufgaben für das Selbststudium (Nicolas)
- 07.10. Statistische Analyse mit R (Herr Enneking)
- 14.10. Finalisierung Fragebögen und Planung Datenerhebung (Herr Kussin)
- 21.10. Auswertung Interviewdaten (Herr Kussin)
- 28.10. Exkursion/Blockwoche; 04.11. Selbststudium, keine Sitzung
- 11.11. Sitzung 2: Forschungsfragen, wissenschaftliche Paper und Quarto (Nicolas)
- 18.11. Sitzung 3: KI-Agenten in der empirischen Forschung (Nicolas)
- 25.11. Reflexion und Darstellung qualitativer Ergebnisse (Herr Kussin)
- 02.12. Statistische Überprüfung deskriptiv dargestellter Zusammenhänge und Anpassung der Forschungsfragen (Herr Enneking)
- 09.12. Auswertungsskizze und Betreuung bei der statistischen Analyse (Herr Enneking)
- 16.12. Sitzung 4: Forschungsergebnisse präsentieren (Nicolas)
- 06.01. Auswertungsskizze und Betreuung bei der statistischen Analyse (Herr Enneking)
- 13.01. Puffertermin (alle)

Verbindlich ist der Zeitplan in ILIAS; Änderungen werden dort angekündigt.
