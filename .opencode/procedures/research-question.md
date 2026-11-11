# Rückmeldung zur Forschungsfrage

Eine Gruppe legt dir ihre Forschungsfrage vor und will wissen, ob sie trägt. Du gibst eine Rückmeldung nach den Maßstäben der Lektion „Was ist eine Forschungsfrage?“ auf Hands-on Computer Science:
https://hands-on-computer-science.de/ds/de/items/research-questions/

Die Lektion stützt sich auf Döring, *Forschungsmethoden und Evaluation*, 6. Aufl. 2023, Kap. 5, und Huntington-Klein, *The Effect*, Kap. 2. Die Maßstäbe stehen unten; nenn die Lektion als Quelle, damit die Gruppe dort nachlesen kann. Dasselbe gilt, wenn jemand ohne Kommando um eine Rückmeldung zur Frage bittet oder den Auftrag aus der Übung der Lektion einfügt.

## Ablauf

1. **Die Frage holen.** Steht sie im Aufruf, nimm sie. Sonst frag einmal danach, so wie die Gruppe sie gerade formuliert hat. Steht in `my-code/about-me.md` ein Spezialthema (`group_topic`), lies es mit.
2. **Einordnen.** Ist es ein Thema, ein Forschungsproblem, eine Frage oder eine Hypothese? Bleibt der Text beim Thema stehen („Wir untersuchen Nachhaltigkeit beim Milchkauf“), sag das zuerst; dann ist der nächste Schritt das Eingrenzen, nicht das Feilen an Worten.
3. **Prüfen** nach den Maßstäben unten: zwei Bedingungen, Art der Frage, vier Fallen, sechs Angaben.
4. **Realitätstest am Codebuch.** Zerleg die Frage in ihre Teile und such für jeden Teil die Spalte in `course/datasets/mds12-schoko-milch-codebook.md` (grep nach Stichwort oder Spaltenname). Nenn je Spalte den Fragetext, den Filter (wem die Frage gestellt wurde) und die Fallzahl aus der Spaltentabelle (Zeilen minus fehlend). Experimente und andere Fallstricke stehen in `course/datasets/mds12-schoko-milch.md`.
5. **Urteil** in einem von drei Worten: beantwortbar, anpassen oder verwerfen. Bei „anpassen“ und „verwerfen“ zwei geschärfte Fassungen, die sich mit den Daten beantworten lassen.
6. **Prüfauftrag an die Gruppe** (siehe unten). Auf Wunsch die gewählte Fassung als kurze Zeile unter `## Notes` in `my-code/about-me.md`; in den Bericht (`my-code/paper/sections/_introduction.qmd`) schreibst du nur, wenn die Gruppe darum bittet.

**Rechne nichts aus.** Keine Auswertung, keine Mittelwerte, keine Tests: Hier geht es darum, ob die Frage trägt, nicht um ihre Antwort. Die Fallzahlen kommen aus dem Codebuch.

## Die Maßstäbe

**Thema, Problem, Frage, Hypothese.** Ein Thema benennt einen Gegenstand („Pflanzenmilch“). Das Forschungsproblem legt fest, welche Erkenntnis über welchen Aspekt gesucht wird. Die Forschungsfrage lässt sich mit Daten beantworten. Eine Hypothese ist eine Behauptung mit Richtung, die aus Theorie oder früheren Befunden abgeleitet und zitiert wird (Döring 2023, S. 149–150). Wer eine vorhandene Umfrage neu auswertet, arbeitet meist mit offenen Fragen; eine Hypothese nur dann, wenn die Gruppe die Literatur dafür nennen kann. Erfinde keine Literatur.

**Zwei Bedingungen** (Huntington-Klein, Abschnitt 2.1):

1. Sie lässt sich mit Belegen beantworten: Es ist festgelegt, woran man die Antwort misst („die beste Werbung“ ist es nicht).
2. Die Antwort sagt etwas darüber, wie die Welt funktioniert („Wie viele Befragte wohnen in Niedersachsen?“ erklärt nichts).

Prüfstein: Würde ein unerwartetes Ergebnis die Meinung der Gruppe ändern?

**Drei Arten von Fragen** und was man am Ende behaupten darf:

| Art | fragt nach | erlaubt am Ende |
|---|---|---|
| beschreibend | wie viele, wie oft, wie verteilt | eine Beschreibung |
| Zusammenhang | ob Gruppen sich unterscheiden oder Merkmale zusammen auftreten | „hängt zusammen mit“, keine Ursache |
| kausal | was passiert, wenn man eines ändert | eine Ursache, aber nur mit einem Design, das sie trennt |

In dieser Umfrage ist eine kausale Frage nur an den Experimenten beantwortbar, in denen der Zufall die Variante zugeteilt hat (etwa die Preisstufen von Alpro Haferdrink). Sonst heißt die ehrliche Fassung „hängt zusammen mit“.

**Vier Fallen** und wie man die Frage rettet:

- **Normativ** („Sollte Haferdrink so viel kosten wie Kuhmilch?“): Daten urteilen nicht. Beantwortbar ist, wie viele Befragte das finden.
- **Vage** („Was denken die Deutschen über Lebensmittel?“): Gegenstand und Messung fehlen. Außerdem ist die Umfrage ein quotiertes Online-Panel von Menschen, die selbst einkaufen, nicht „die Deutschen“.
- **Kausal ohne Design** („Macht ein höheres Einkommen Menschen zu Bio-Käufern?“): Eine einmalige Befragung kann Einkommen nicht von Bildung, Wohnort und Werten trennen. Beantwortbar ist der Zusammenhang.
- **Nicht in den Daten** („mehr Bio als 2020?“): Die Umfrage ist eine einzige Erhebung, ohne zweiten Zeitpunkt gibt es keinen Vergleich über die Zeit.

Meist lässt sich die Frage retten: aus „macht“ wird „hängt zusammen mit“, aus „sollte“ wird „wie viele finden“.

**Sechs Angaben** machen aus einer Idee eine Frage: wer, wo, wann, welche Variation, welches Ergebnis, welcher Vergleich. Wo die Gruppe eine Angabe nicht machen kann, ist die Frage noch unscharf.

**Prüfliste** (Huntington-Klein, Abschnitt 2.4), knapp durchgehen: mögliche Ergebnisse (lehrt jede plausible Antwort etwas?), Machbarkeit (stehen die Daten im Codebuch?), Umfang (in den Wochen bis zum Bericht zu schaffen?), Design (können die Daten trennen, was getrennt werden soll?), Einfachheit (eine Frage oder drei?). Umfang und Einfachheit scheitern am häufigsten: „Was beeinflusst den Kauf von Bio-Lebensmitteln?“ ist ein Forschungsprogramm, keine Frage für vier Wochen.

**Realitätstest.** Bei vorhandenen Daten passt sich die Frage den Daten an, nicht umgekehrt. Der Fehler ist nicht das Anpassen der Frage, sondern das Passendreden der Daten: Misst eine Spalte etwas anderes, als die Frage braucht, sag das, statt sie als Ersatz zu nehmen.

## Die Form der Rückmeldung

Knapp, in dieser Reihenfolge:

1. **Urteil** in einem Satz: beantwortbar, anpassen oder verwerfen, und warum.
2. **Was trägt** und **was fehlt oder unscharf ist**, nach den Maßstäben oben, nur die Punkte, die hier zählen.
3. **Die sechs Angaben** als Tabelle: Angabe, was die Frage dazu sagt, Spalte(n) mit Filter und Fallzahl. Wo nichts passt: „fehlt“.
4. **Zwei geschärfte Fassungen**, je ein Satz, mit der Art der Frage dahinter. Welche die Gruppe nimmt, entscheidet sie.
5. **Prüfauftrag:** Schlagt jede genannte Spalte selbst im Codebuch nach und lest den Fragetext (im Zweifel die Seite der Studiendokumentation). Haltet dann fest: eure geschärfte Frage in einem Satz, die Spalten mit Filter und Fallzahl, was ihr gegenüber der ersten Fassung geändert habt und warum.

## Grenzen

- Freitexte nie zitieren, sie können persönliche Angaben enthalten.
- Bei Fragen zur Methodenwahl der Statistik (welcher Test, welches Modell) verweis auf Herrn Enneking; beurteile nur, ob die Daten die Frage tragen.
- Die Rückmeldung ist ein Vorschlag. Ob eine Frage für den Bericht taugt, entscheiden die Lehrenden.
