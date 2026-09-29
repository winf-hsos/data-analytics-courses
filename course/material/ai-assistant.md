# Mit dem KI-Assistenten arbeiten

Ihr dürft den Assistenten in diesem Kurs ohne Einschränkung nutzen. Ich möchte das sogar. Er ist Teil der Aufgabe, nicht ein Weg drumherum.

Das Bild, das ihr im Kopf behalten solltet: Der Assistent hat mehr über R, Statistik und Marktforschung gelesen als wir alle zusammen. Euren Datensatz kennt er aus einer Beschreibung im Kursordner und aus dem, was er in R nachrechnet. Was er nicht weiß: wie die Daten entstanden sind, wenn es nirgends steht, und was eure Gruppe eigentlich wissen will. **Der Agent kann Code schreiben. Ihr entscheidet das Was und verantwortet das Ergebnis.**

## Euer Kursassistent

Der Assistent, den ihr im Kursordner startet, ist kein allgemeiner Chatbot. Er kennt das Material eurer Module, die Konventionen für R-Code und den Stand des Semesters. Er kennt zwei Befehle: `/onboarding` für den Anfang und `/update-semester`, um neues Material zu holen, wenn Nicolas es ansagt.

Er merkt sich in `my-code/about-me.md`, in welchem Modul ihr seid, was ihr mitbringt und woran ihr gerade arbeitet, damit ihr nicht jedes Mal von vorn erklären müsst. Die Datei gehört euch: Lest sie, korrigiert sie, löscht sie, wenn ihr wollt. Wechselt ihr das Modul, sagt es ihm.

Einiges tut er absichtlich nicht:

- **Er löst keinen Selbsttest**, hilft euch aber, ihn zu verstehen.
- **Er schreibt in kleinen Schritten** und erklärt jeden. Im Referat müsst ihr jede Zahl erklären können.
- Er hält sich an die Regeln in `course/material/r-conventions.md`: tidyverse, Pipe `|>`, ggplot2.

Die Kurse starten mit einem der freien Modelle von OpenCode; ihr braucht dafür keinen Schlüssel. Freie Modelle gibt es nur eine Zeit lang, und manche nutzen Gespräche, um das Modell zu verbessern: Nichts Persönliches hineinkopieren. Später kann es einen Schlüssel für ein stärkeres Modell geben; Nicolas sagt es an. Er hat ein begrenztes Budget; verschwendet es nicht mit Plaudern.

## Wofür er gut ist

**Einrichten.** `/onboarding` geht die Installation mit euch durch. Hängt ihr fest, kopiert die Meldung hinein oder macht ein Bildschirmfoto und zieht es ins Eingabefeld; er kann Bildschirmfotos lesen.

**Verstehen, was in der Sitzung war.** Lasst euch etwas noch einmal erklären, mit anderen Worten, an einem anderen Beispiel, so oft ihr wollt. Keine Frage ist zu einfach.

**Fehlermeldungen lesen.** Die ganze Meldung hineinkopieren und fragen, was R meint. Dann selbst beheben.

**Code schreiben.** Beschreibt, was ihr herausfinden wollt, nicht welche Funktion ihr braucht: „Ich will wissen, ob Ältere häufiger beim Discounter kaufen als Jüngere“ ist ein besserer Auftrag als „mach mir ein group_by“. Lasst euch jeden Schritt erklären.

**Kritik, bevor ihr etwas baut.** Zeigt euren Plan oder Code und fragt, was schiefgehen kann. Darin ist er besser als im Erfinden.

## Gute Fragen

**Gebt ihm, was er nicht wissen kann.** Welche Variable, welche Codes, wer wurde gefragt: „`v007freq3_mi` wurde nur Personen gestellt, die Milch verzehren. Wie berechne ich den Anteil der täglichen Milchtrinker, und worauf bezieht er sich dann?“

**Fragt nach Möglichkeiten, nicht nach der Antwort.** „Zeig mir zwei Wege, das Alter in Gruppen einzuteilen, mit dem Nachteil von jedem.“

**Fragt, über wen eine Zahl spricht.** Nach jeder Kennzahl: Wie viele Personen stecken dahinter, und wer fehlt?

**Lasst erklären, nicht nur machen.** „Erklär mir diese Zeile“ lehrt euch etwas. „Mach, dass es geht“ nicht.

## Das KI-Protokoll

Führt in `my-code/ai-log.md` eine kurze Liste: Wo habt ihr einen Vorschlag des Assistenten korrigiert oder verworfen, und warum? Eine erfundene Variable, ein stilles `na.rm = TRUE`, eine falsche Basis für einen Anteil.

Das wird nicht benotet. Aber es gehört später in den Methodenteil eures Berichts (L12), und es ist die beste Übung darin, eine plausible Antwort von einer richtigen zu unterscheiden.
