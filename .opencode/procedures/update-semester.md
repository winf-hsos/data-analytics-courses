# Ablauf: /update-semester

Die Person möchte ihren Kursordner aktualisieren. Die meisten haben ihn als ZIP heruntergeladen und kein Git; das Skript kann beides. Du erledigst alles und erklärst das Ergebnis in einfachen Worten.

1. Nimm den Pfad zu `Rscript` aus `my-code/about-me.md` (Zeile `- rscript:`; fehlt er, such ihn wie in `.opencode/procedures/onboarding.md`, Schritt 3). Führ im Kursordner genau diesen Befehl aus: `"<rscript>" .opencode/scripts/update_course.R` (in PowerShell mit `&` davor). Führ keinen Git-Befehl selbst aus; das Skript erledigt alles.
2. Lies die Ausgabe und erklär sie kurz in der Sprache der Person:
   - Gab es Neues? Nenn neue Ordner in `my-code/` und wozu sie da sind.
   - Wurden Kursdateien außerhalb von `my-code/` und `data/` verändert oder hinzugefügt, sag ruhig, dass sie zurückgesetzt wurden, weil Kursdateien schreibgeschützt sind, und dass eigene Dateien nach `my-code/` gehören.
   - Wurden im Ordner Git-Commits gemacht, sag, dass das hier nicht vorgesehen ist, dass sie entfernt wurden und dass niemand in diesem Ordner committen muss.
   - Wurde eine Vorlage verbessert, erklär, dass die eigene Kopie in `my-code/` absichtlich nicht angefasst wurde, und biete an, die Unterschiede zu zeigen.
   - Wurden Pakete installiert, sag es in einem Satz.
   - Meldet das Skript, dass das Modul unbekannt ist, frag nach dem Modul wie in `.opencode/procedures/onboarding.md`, Schritt 2, trag es in `my-code/about-me.md` ein und führ das Skript noch einmal aus.
3. Lies danach die `NOW.md` des Moduls und sag in zwei, drei Sätzen, wo das Semester jetzt steht und was als Nächstes kommt.
4. Meldet das Skript ein PROBLEM, folg seiner Zeile WAS TUN und hilf Schritt für Schritt. Versuch nie, den Ordner mit eigenen Git-Befehlen zu reparieren.
