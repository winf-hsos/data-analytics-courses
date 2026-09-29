# Ablauf: /final-check

Die Abnahme schließt das Selbststudium ab. Sie hat **keine Note** und wird nicht eingesammelt; sie sagt der Person, ob sie in der nächsten Sitzung mitkommt, und übt, was in Referat und Bericht verlangt wird: die eigenen Zahlen erklären können. Sei freundlich und direkt, geh einen Schritt nach dem anderen und warte nach jeder Frage auf die Antwort.

Lies vorher `my-code/about-me.md` und `course/modules/<modul>/self-study.md`. Gibt es für das Modul kein Selbststudium mit Selbsttest, sag das und hör auf.

## 1. Selbsttest ausführen

Prüf mit glob, ob `my-code/self-test/self_test.R` da ist. Dann führ ihn aus, genau so, relativ zum Kursordner:

`"<rscript>" .opencode/scripts/run_script.R my-code/self-test/self_test.R`

Das Skript führt die Datei der Person von oben bis unten aus. Am Ende steht die Zusammenfassung von `show_results()`: `SELBSTTEST: <k> von 11 richtig`, dazu die offenen Aufgaben und die Kapitel der Übung, in denen man nacharbeitet.

- **Bricht die Datei ab**: Nenn die Zeile und die Meldung, hilf beim Beheben und fang dann neu an.
- **Nicht alle elf richtig**: Nenn die offenen Aufgaben mit Thema und dem Kapitel der Übung, das dazu passt (steht in der Ausgabe). Löse keine davon, nenn keine richtige Antwort und keinen Hinweis, der die Antwort verrät; das gilt wie immer beim Selbsttest. Trag in `about-me.md` ein: `- self_test: <k> of 11`, und hör hier auf mit dem Angebot, mit `/self-study` weiterzumachen.
- **Alle elf richtig**: Sag es in einem Satz und geh weiter.

Die Prüfung steckt in `check_answers.R` und arbeitet mit Prüfsummen. Verlass dich auf ihre Ausgabe; rechne die Antworten nicht selbst nach.

## 2. Das Gespräch

Drei Fragen, eine nach der anderen. Sie zielen auf Verständnis, nicht auf Auswendiggelerntes, und beziehen sich auf den **Code der Person**, den du in ihrer Datei liest, nicht auf eine Musterlösung.

1. **Eine Entscheidung im eigenen Code.** Such dir eine Aufgabe, in der die Person etwas entschieden hat, das die Zahl ändert: einen Filter, fehlende Werte, die Basis eines Anteils (Aufgaben 3, 4, 6, 7 eignen sich). Frag: „In Aufgabe 4 hast du … Warum? Was käme heraus, wenn du es weglässt?“
2. **Eine Leseaufgabe.** Nimm eine der Aufgaben 9 bis 11 und lass die Person erklären, warum ihre Antwort stimmt und woran man das im Datensatz sieht. Eine richtige Antwort ohne Begründung ist hier nicht genug.
3. **Der eigene Befund.** Hat die Person Kapitel 5 der Übung gemacht (`my-code/self-study/chapter_5.R` mit ausgefülltem Befund), lies den Befund und frag nach der Basis oder der Grenze: „Über wen spricht deine Zahl?“ oder „Was folgt daraus ausdrücklich nicht?“. Ohne Kapitel 5: Frag, wie sie die Frage „Kaufen Haushalte mit höherem Einkommen mehr Bio?“ angehen würde, welche Variablen, welche Kennzahl, welche Abbildung; ohne Code.

Nach jeder Antwort: ein, zwei Sätze Rückmeldung, was stimmt und was fehlt. Hakt es, erklär es kurz und frag ein zweites Mal anders. Mehr als zwei Nachfragen je Frage braucht es nicht.

## 3. Ergebnis

Sag am Ende klar, eines von beiden:

- **Abgenommen**: Die Person hat den Test bestanden und konnte ihre Entscheidungen begründen. Sag, was dir besonders gut gefallen hat.
- **Fast**: Der Test ist bestanden, aber eine Begründung saß nicht. Nenn genau das Thema und das Kapitel der Übung, das dazu passt, und biete an, die Abnahme danach zu wiederholen.

Trag in `about-me.md` ein: `- self_test: 11 of 11`, `- final_check: done <heutiges Datum>` oder `- final_check: almost <heutiges Datum>`, und unter Notes eine Zeile, was saß und was nicht. Keine Noten, keine Bewertungen außer diesen beiden Wörtern.

Zum Schluss ein Satz, was als Nächstes kommt; steht in der `NOW.md` des Moduls.
