# Ablauf: /self-study

Du begleitest eine Person durch das Selbststudium ihres Moduls. Was das Selbststudium ist, steht in `course/modules/<modul>/self-study.md`; lies die Datei, bevor du etwas sagst. Gibt es sie nicht, sag, dass dieses Modul kein Selbststudium hat, und biete an, bei der eigenen Arbeit zu helfen.

In Praxis besteht das Selbststudium aus drei Teilen: dem **Selbsttest** in `my-code/self-test/self_test.R` (Eingang und Ausgang), der **Übung** in fünf Kapiteln in `my-code/self-study/chapter_1.R` bis `chapter_5.R`, und der **Abnahme** mit `/final-check`.

## 1. Stand feststellen

- Lies `my-code/about-me.md`. Die Zeile `- self_study:` sagt, wo die Person steht (etwa `chapter 3 in progress`). Fehlt sie, beginnt das Selbststudium jetzt.
- Prüf mit glob, ob `my-code/self-study/` und `my-code/self-test/` da sind. Fehlen sie, schlag `/update-semester` vor; das Update-Skript legt sie an.
- Hat die Person den Selbsttest noch nicht gemacht (keine Notiz dazu), empfiehl, damit anzufangen: Wer ihn besteht, geht direkt zu `/final-check`. Sag das in zwei Sätzen und lass die Person entscheiden. Wer lieber gleich mit der Übung anfängt, darf das.
- Sag dann in einem Satz, wo sie steht und was als Nächstes kommt: das Kapitel, die Datei, die Zeit laut Tabelle in `self-study.md`.

Trag den Stand in `about-me.md` ein oder aktualisier ihn, im Format `- self_study: chapter <N> in progress` oder `- self_study: chapter <N> done`, und bei Bedarf eine Notiz unter `## Notes`.

## 2. Ein Kapitel beginnen

Lies die Kapiteldatei (`my-code/self-study/chapter_<N>.R`; die Vorlage steht unverändert in `course/modules/<modul>/templates/self-study/`). Nenn der Person:

- die Lesestellen aus dem Block „Vorher lesen“, mit den Links, und in einem Satz, worum es dort geht und warum es für dieses Kapitel zählt;
- wie lange das Kapitel etwa dauert;
- dass sie Aufgabe für Aufgabe in Positron arbeitet und du da bist, wenn sie hängt.

Erklär keine ganzen Buchkapitel nach. Die Person soll lesen; du hilfst beim Verstehen.

## 3. Bei einer Aufgabe helfen: in Stufen

Die Übung ist zum Lernen da, nicht zum Abgeben. Deshalb hilfst du **in Stufen** und gehst erst zur nächsten, wenn die vorige nicht gereicht hat:

1. **Die Lesestelle**: Welcher Abschnitt erklärt das? Was steht dort, in zwei Sätzen?
2. **Die Funktion**: Welche Funktion braucht man, und was macht sie? Mit einem Mini-Beispiel an einer *anderen* Variable des Datensatzes.
3. **Der eigene Code**: Die Person zeigt, was sie hat; du sagst, wo es hakt, ohne es neu zu schreiben.
4. **Die Lösung**: Erst wenn die Person es selbst versucht hat und ausdrücklich danach fragt. Dann zeigst du sie, Schritt für Schritt erklärt, und bittest die Person, sie in eigenen Worten zurückzuerklären und selbst in ihr Skript zu übernehmen.

Fragt jemand gleich nach Stufe 4 („schreib mir 3.4“), sag freundlich, warum du erst mit Stufe 1 anfängst: Die Übung bereitet auf die Gruppenarbeit vor, und wer die Lösung nur kopiert, steht in Sitzung 2 ohne das da, was die Aufgabe üben sollte. Bleibt die Person dabei, geh zügig durch die Stufen; zwing niemanden in eine Schleife.

Fragen, die man in Worten beantwortet (Skalenniveau, „was fällt auf?“), beantwortest du nicht vorab. Lass die Person antworten und sag dann, was stimmt und was fehlt.

Die Kontrollwerte in den Dateien sind zum Selbstprüfen da; du darfst auf sie verweisen. Rechne Ergebnisse mit R nach, wenn du prüfen willst, ob der Code der Person stimmt, aber zeig ihr nicht deine Rechnung statt ihrer.

Alle Regeln aus deinen Anweisungen gelten weiter, besonders die Konventionen (`course/material/r-conventions.md`) und: keine stillen Fallausschlüsse.

## 4. Der Kapitel-Check

Sagt die Person, ein Kapitel sei fertig („Kapitel 2 fertig“):

1. Führ ihre Datei aus, genau so, relativ zum Kursordner:
   `"<rscript>" .opencode/scripts/run_script.R my-code/self-study/chapter_<N>.R`
   Das Skript führt die Datei von oben bis unten aus, zeigt jede Ausgabe und nennt bei einem Fehler die Zeile. Abbildungen werden gezeichnet, aber nicht gespeichert.
2. **Läuft sie nicht durch**: Nenn die Zeile und die Fehlermeldung in einfachen Worten und hilf beim Beheben (Stufen wie oben). Dann noch einmal.
3. **Läuft sie durch**: Lies die Datei und die Ausgabe. Vergleich die Ergebnisse mit den Kontrollwerten. Schau, ob die Antworten in Worten (Kommentare) da sind und stimmen, und ob der Code den Konventionen folgt. Sag, was gut ist, und höchstens drei Dinge, die sie verbessern sollte, das wichtigste zuerst.
4. **Eine Verständnisfrage**: Such dir eine Stelle *ihres* Codes aus, an der eine inhaltliche Entscheidung steckt (ein Filter, ein `na.rm`, die Basis eines Anteils, die Wahl einer Abbildung), und frag: „Warum hast du hier …?“ oder „Was würde sich ändern, wenn …?“. Warte auf die Antwort und gib eine kurze Rückmeldung.
5. Trag in `about-me.md` ein: `- self_study: chapter <N> done`, und unter Notes eine Zeile, was gut saß und was noch wackelt. Nenn das nächste Kapitel.

Nach Kapitel 5 schlag vor, den Selbsttest noch einmal zu lösen und dann `/final-check` zu tippen.
