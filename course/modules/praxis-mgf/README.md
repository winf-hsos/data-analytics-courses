# Praxis der Markt- und Gesellschaftsforschung

Bachelor, 3. Semester, Wintersemester. Studierende aus Betriebswirtschaft in der Lebensmittel- und Agrarwirtschaft (BNE, BLP), Landwirtschaft und Angewandter Pflanzenbiologie. Früher hieß das Modul „Empirische Fallstudien“.

## Worum es geht

Die Studierenden arbeiten in Gruppen an einem Spezialthema und gehen den ganzen Forschungsprozess: vom Thema zur Forschungsfrage, von der Frage zur Datenauswertung, von der Auswertung zu Bericht und Präsentation. Beides entsteht mit Quarto aus einer Quelle, und ein KI-Agent hilft dabei. Am Ende stehen eine schriftliche Ausarbeitung (der **Bericht**) und ein Referat.

## Drei Stränge, drei Lehrende

| Strang | Lehrende | Daten | Was passiert |
|---|---|---|---|
| statistisch | Herr Enneking | Panelbefragung, n ≈ 2.800 | statistische Auswertung des eigenen Themas |
| qualitativ | Herr Kussin | eigene Interviews, etwa drei je Gruppe | Erhebung und Auswertung **von Hand** |
| Werkzeuge, KI, Bericht | Nicolas | beides | R, Quarto, KI-Agenten, Bericht und Präsentation |

Methodenfragen zu Tests und Modellen gehören in Herrn Ennekings Strang, Fragen zur Interviewführung und zum Codieren in Herrn Kussins. Der Assistent hilft bei beidem mit R, legt aber keine Methode fest, die dort anders gelehrt wird.

## Nicolas' vier Sitzungen

1. Datenanalyse mit R: Arbeitsumgebung, Auffrischung und Selbststudium
2. Forschungsfragen, wissenschaftliche Berichte und Quarto
3. KI-Agenten in der empirischen Forschung
4. Forschungsergebnisse präsentieren

Die Termine stehen in [NOW.md](NOW.md).

## Daten

Aus dem ILIAS-Kurs in `data/` legen, ohne Umbenennen:

- `mds12_schoko_milch.csv`: die Panelbefragung. Beschreibung: [course/datasets/mds12-schoko-milch.md](../../datasets/mds12-schoko-milch.md)
- `M3b_Musterstudie-quantitativ.pdf`: die Studiendokumentation, das Codebuch

Die Interviewtranskripte aus Herrn Kussins Strang darf der Assistent mit auswerten, nachdem er gefragt hat, ob die Interviewten einverstanden sind und die Transkripte pseudonymisiert sind.

## Beim Onboarding fragen

- Hast du im Sommer „Werkzeuge der Markt- und Gesellschaftsforschung“ belegt? (ja / nein) → Zeile `- took_werkzeuge:` in `about-me.md`. Wer nicht, braucht im Selbststudium mehr Zeit; weise freundlich darauf hin.

Später, sobald es feststeht: das Spezialthema der Gruppe → Zeile `- group_topic:`.

## Lernziele

*Die Studierenden können …*

**Forschungsfrage und Bericht**

- **L1**: eigene Forschungsfragen entwickeln, beurteilen, was eine gute ausmacht, und eine vage Idee zu einer genauen Frage schärfen
- **L2**: erkennen, welche Fragen sich empirisch nicht beantworten lassen
- **L3**: gängige Studien- und Publikationsarten unterscheiden und einordnen, welche zu welcher Fragestellung gehört
- **L4**: den Aufbau eines wissenschaftlichen Berichts erklären und begründen, was in welchen Abschnitt gehört und was nicht

**Werkzeuge**

- **L5**: mit R und Positron sicher arbeiten
- **L6**: eine empirische Fragestellung eigenständig mit R bearbeiten: Daten aufbereiten, analysieren, visualisieren und die Ergebnisse interpretieren
- **L7**: begründen, warum textbasierte Formate für die Arbeit mit KI taugen und Binärformate wie Word nicht
- **L8**: Bericht und Präsentation mit Quarto aus einer Quelle erzeugen: Abbildungen, Tabellen, Querverweise, Literaturverzeichnis
- **L9**: Abbildungen und Tabellen nach wissenschaftlichen Kriterien erstellen und beschreiben

**KI in der Forschung**

- **L10**: einen KI-Agenten steuern: die Aufgabe genau stellen und den nötigen Kontext mitgeben
- **L11**: erzeugten Code und Text lesen, prüfen und die typischen Fehler erkennen
- **L12**: den eigenen KI-Einsatz dokumentieren und die Verantwortung für das Ergebnis übernehmen
- **L13**: die Möglichkeiten von KI in der qualitativen Forschung kennen und einschätzen

**Darstellen**

- **L14**: wissenschaftlich präsentieren und dabei Ergebnis, Interpretation und Empfehlung sauber trennen
- **L15**: die Grenzen der eigenen Arbeit genau benennen, auch die, die schon aus den Daten und ihrer Erhebung folgen

| Sitzung | Lernziele |
|---|---|
| 1 | L5, L6 |
| 2 | L1 bis L4, L5, L10 |
| 3 | L6 bis L12 |
| 4 | L8, L9, L14, L15, Ausblick L13 |

L5 und L6 stehen am Anfang und kommen später wieder, weil nicht alle mit denselben Vorkenntnissen starten.

## Prüfung

Referat und schriftliche Ausarbeitung je Gruppe, beides mit Quarto erstellt. Einzelheiten nennen die Lehrenden in den Sitzungen und in ILIAS.
