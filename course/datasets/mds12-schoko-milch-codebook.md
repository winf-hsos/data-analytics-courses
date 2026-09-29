# Codebuch: `mds12_schoko_milch.csv`

Für den Kursassistenten. Diese Datei verbindet den Fragebogen (Studiendokumentation `M3b_Musterstudie-quantitativ.pdf`) mit dem Datensatz: je Frage der Fragetext, der Fragetyp mit Filterbedingung, die Codes, wie der Fragebogen sie druckt, und die Spalten im Datensatz mit den Werten, die tatsächlich vorkommen.


## So benutzt du diese Datei

- **Eine Spalte nachschlagen:** nach dem Spaltennamen suchen (grep, Groß- und Kleinschreibung beachten). Jede Spalte steht genau einmal in einer Tabelle.
- **Eine Frage nachschlagen:** nach der Nummer (`## F32`) oder einem Stichwort aus dem Fragetext suchen.
- **Codes:** „Fragetyp und Codes laut Fragebogen“ ist der Text aus der PDF ohne Layout: erst der Fragetyp mit den Spaltennamen in eckigen Klammern, dann die Antwortcodes. Tabellen (Matrixfragen) sind dabei zu einer Zeile zusammengelaufen; die Codes stehen dort, aber nicht immer neben ihrem Text. „Filter“ ist die Bedingung aus dem Fragebogen, wem die Frage gestellt wurde; wer sie nicht bekam, hat in diesen Spalten einen fehlenden Wert. Im Zweifel die angegebene Seite der PDF lesen und die Seite nennen.
- **Was wirklich vorkommt,** steht in der Spaltentabelle. Weicht es vom Fragebogen ab (Codes, die es nicht gibt, Sondercodes wie -1 oder 99, viele fehlende Werte), sag es dazu: Das ist fast immer eine Filterführung, ein Experiment oder eine Aufbereitung.
- **Klein- und Großbuchstaben:** Kleinbuchstabe am Anfang = Rohvariable aus LimeSurvey, Großbuchstabe = aufbereitete Variable, `f` am Ende = als Text. Der Fragebogen zeigt die Kette mit einem Pfeil: `[q004geschlecht] -> [Q004geschlechtf]`.
- **Freitexte** nie zitieren; sie können persönliche Angaben enthalten.
- Die Beschreibung mit den Fallstricken steht in `course/datasets/mds12-schoko-milch.md`.

## Die Fragen

### F1 · Wer ist in Ihrem Haushalt in erster Linie für den Einkauf von Lebensmitteln … (S. 6)

**Frage:** Wer ist in Ihrem Haushalt in erster Linie für den Einkauf von Lebensmitteln verantwortlich?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [q001hheinkauf], Pflichtfrage, Enneking et al. 2019 2 1 0 Hauptsächlich ich selbst. Ich selbst und eine andere Person. Fast immer eine andere Person. => Interviewende

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `q001hheinkauf` | numeric | 0 | 1 (919); 2 (1892) |

### F2 · In welchem Jahr sind Sie geboren? _ _ Jahr (S. 6)

**Frage:** In welchem Jahr sind Sie geboren? _ _ Jahr

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Zahleneingabe [q002geburt] -> [Q002altergru4] -> (Q002alterfru4f], Pflichtfrage, Quotenvorgabe, Interviewende: 17 Jahre und jünger, Quelle: angepasst an gesis allbus

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `q002geburt` | numeric | 0 | von 1945 bis 2007 |
| `Q002alter` | numeric | 0 | von 18 bis 80 |
| `Q002altergru4` | numeric | 0 | 1 (425); 2 (728); 3 (889); 4 (769) |
| `Q002altergru4f` | character | 0 | 18-29 Jahre (425); 30-44 Jahre (728); 45-59 Jahre (889); 60 Jahre und älter (769) |

### F3 · In welchem Bundesland leben Sie? (S. 7)

**Frage:** In welchem Bundesland leben Sie?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [q003land], Pflichtfrage 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 Baden-Württemberg Bayern Berlin Brandenburg Bremen Hamburg Hessen Mecklenburg-Vorpommern Niedersachsen Nordrhein-Westfalen Rheinland-Pfalz Saarland Sachsen Sachsen-Anhalt Schleswig-Holstein Thüringen Quote Studie A 191 224 80 64 32 48 112 48 143 303 80 32 80 48 64 48 Quote Studie B 181 211 75 61 30 45 106 45 136 287 75 30 75 45 61 45 Quote Prozent 12.43 14.38 4.86 3.75 1.90 3.05 7.47 2.78 9.21 19.22 5.33 2.21 5.25 3.34 4.15 3.31

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `q003land` | numeric | 0 | von 1 bis 16 |

### F4 · Ich bin … (S. 7)

**Frage:** Ich bin …

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [q004geschlecht] -> [Q004geschlechtf], Pflichtfrage 1 2 3 …ein Mann. …eine Frau. …divers. Quote Studie A Quote Studie B Quote Prozent 49

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `q004geschlecht` | numeric | 0 | 1 (1328); 2 (1481); 3 (2) |
| `Q004geschlecht` | numeric | 2 | 1 (1328); 2 (1481) |
| `Q004geschlechtf` | character | 2 | Frauen (1481); Männer (1328) |

### F5 · Ein Teil der Fragen dieses Fragebogens betrifft nur Personen aus der Region Osnabrück. … (S. 7)

**Frage:** Ein Teil der Fragen dieses Fragebogens betrifft nur Personen aus der Region Osnabrück. Den anderen Teil der Fragen erhalten alle Personen, die nicht aus Osnabrück kommen. Kommen Sie aus der Stadt oder dem Landkreis Osnabrück?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [q005os], Pflichtfrage, Filterfrage für Spezialthema Regional 1 0 Ja, ich komme aus dem Landkreis Osnabrück oder der Stadt Osnabrück Nein, ich komme aus einer anderen Region Hier in LimeSurvey Frage 41 einfügen, wegen Setzung von Bedingungen in den Spezialstudien

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `q005os` | numeric | 0 | 0 (2697); 1 (114) |

### F6 · Bitte geben Sie an, welche der folgenden Produktgruppen Sie in den letzten 12 Monaten … (S. 7)

**Frage:** Bitte geben Sie an, welche der folgenden Produktgruppen Sie in den letzten 12 Monaten gekauft oder verzehrt haben. Sie bekommen dann keine Fragen zu Produkten angezeigt, die Sie weder verzehrt noch gekauft haben.

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [v006gekauft], Pflichtfrage 1ge Brokkoli Ja, gekauft und verzehrt Ja, nur gekauft Ja, nur verzehrt Nein, weder gekauft noch verzehrt 3 2 1 0 2ts Tafelschokolade 3 3mi Milch oder nicht tierische 3 Milchalternativen (z.B. Hafermilch/Haferdrink) 4jo Joghurt oder nicht tierische 3 Joghurtalternativen 5wu Aufschnitt oder nicht tierische 3 Aufschnittalternativen 6bi Bier (alkoholisches oder nicht 3 alkoholisches) 2 2 1 0 1 0 2 1 0 2 1 0 2 1 0

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v006gekauft_1ge` | numeric | 0 | 0 (361); 1 (188); 2 (73); 3 (2189) |
| `v006gekauft_2ts` | numeric | 0 | 0 (200); 1 (91); 2 (153); 3 (2367) |
| `v006gekauft_3mi` | numeric | 0 | 0 (302); 1 (64); 2 (112); 3 (2333) |
| `v006gekauft_4jo` | numeric | 0 | 0 (217); 1 (64); 2 (100); 3 (2430) |
| `v006gekauft_5wu` | numeric | 0 | 0 (328); 1 (73); 2 (112); 3 (2298) |
| `v006gekauft_6bi` | numeric | 0 | 0 (827); 1 (116); 2 (281); 3 (1587) |

### F7 · Wie oft konsumieren Sie oder andere Haushaltsmitglieder …. (S. 8)

**Frage:** Wie oft konsumieren Sie oder andere Haushaltsmitglieder ….

**Filter:** gestellt nur, wenn F6 = 3 oder 1

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix, [v007freq], Bedingung nur wenn F6 = 3 oder 1 für jede Produktkategorie Meistens Etwa wö- Etwa mo- Seltener täglich chentlich natlich ge … Brokkoli? 4 3 2 1 ts … Tafelschokolade? 4 3 2 1 mi … Milch oder nicht tierische 4 3 2 1 Milchalternativen (z.B. Hafer- milch)? jo … Joghurt oder nicht tierische 4 3 2 1 Joghurtalternativen? wu … Aufschnitt oder nicht tieri- 4 3 2 1 sche Aufschnittalternativen? In den nachfolgenden Fragen geht es um Ihr Einkaufsverhalten speziell bei Lebensmitteln.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v007freq1_ge` | numeric | 437 | 1 (520); 2 (1129); 3 (671); 4 (54) |
| `v007freq2_ts` | numeric | 368 | 1 (303); 2 (760); 3 (1101); 4 (279) |
| `v007freq3_mi` | numeric | 424 | 1 (80); 2 (173); 3 (682); 4 (1452) |
| `v007freq4_jo` | numeric | 324 | 1 (86); 2 (284); 3 (1108); 4 (1009) |
| `v007freq5_wu` | numeric | 447 | 1 (84); 2 (211); 3 (967); 4 (1102) |

### F8 · Wo kaufen Sie gewöhnlich Ihre Lebensmittel ein? (Mehrfachnennungen möglich) (S. 8)

**Frage:** Wo kaufen Sie gewöhnlich Ihre Lebensmittel ein? (Mehrfachnennungen möglich)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [v008ort], zufällige Reihenfolge 1discount 2super 3sbmarkt 4fach 5markt 6hof 7bioladen 8onlineds 9online sonst Discounter (z.B. Aldi) Supermarkt (führt hauptsächlich Lebensmittel) Verbrauchermarkt, SB-Warenhaus (Lebensmittel und viele andere Artikel) Fachgeschäft für Lebensmittel (z.B. Bäcker, Metzger) Wochenmarkt Hofladen / direkt beim Erzeuger Bioladen / Biosupermarkt, Reformhaus Online bei Discounter, Super- oder Verbrauchermarkt Onlinelebensmittelhändler (z.B. PicNic) Sonstiges und zwar:

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v008ort_1discount` | numeric | 0 | 0 (746); 1 (2065) |
| `v008ort_2super` | numeric | 0 | 0 (677); 1 (2134) |
| `v008ort_3sbmarkt` | numeric | 0 | 0 (1963); 1 (848) |
| `v008ort_4fach` | numeric | 0 | 0 (1782); 1 (1029) |
| `v008ort_5markt` | numeric | 0 | 0 (2318); 1 (493) |
| `v008ort_6hof` | numeric | 0 | 0 (2415); 1 (396) |
| `v008ort_7bioladen` | numeric | 0 | 0 (2452); 1 (359) |
| `v008ort_8onlineds` | numeric | 0 | 0 (2508); 1 (303) |
| `v008ort_9online` | numeric | 0 | 0 (2638); 1 (173) |
| `v008ort_other` | character | 0 | Freitext (nicht zitieren) |

### F10 · Schauen Sie sich bitte die hier abgebildete Milchmarke … an und bewerten Sie diese mit … (S. 11)

**Frage:** Schauen Sie sich bitte die hier abgebildete Milchmarke … an und bewerten Sie diese mit Hilfe der jeweiligen Eigenschaftspaare.

**Filter:** gestellt nur, wenn F6 Milch = 3

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [b010midiff7] -> [B010midiff7), AX-Test [ax010midiff7] -> [AX010midiff7f] zufällige Reihenfolge, Variable …14kauf immer als letztes Adjektivpaar, Bedingung: nur wenn F6 Milch = 3, Variante A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen Der Hinweis auf die Möglichkeit zur Abstufung erfolgt nur in den ersten 2-3 Fragen dieses Formats, um die Probanden in die Logik einzuführen. 1quali 2vertrauen 3regio 4modern 5aufdringlich 6preis 7passt Hohe Qualität Vertrauensvoll Regional Modern Dezent Hochpreisig Passt zum Produkt +2 +1 0 -1 -2 geringe Qualität +2 +1 0 -1 -2 Nicht vertrauensvoll +2 +1 0 -1 -2 Überregional +2 +1 0 -1 -2 Altmodisch +2 +1 0 -1 -2 Aufdringlich +2 +1 0 -1 -2 Günstig +2 +1 0 -1 -2 Passt nicht zum Produkt 8cool 9klima 10geschmack 11marke 12design 13gesund 14kauf Cool Gut fürs Klima Besonders guter Geschmack Attraktive Marke Ansprechendes Design Gesund +2 +2 +2 +2 +2 +2 +1 +1 +1 +1 +1 +1 0 -1 -2 Uncool 0 -1 -2 Schlecht fürs Klima 0 -1 -2 Besonders schlechter Geschmack 0 -1 -2 Unattraktive Marke 0 -1 -2 Liebloses Design 0 -1 -2 Ungesund Würde ich kaufen +2 +1 0 -1 -2 Würde ich nicht kaufen AX-Test 1 Bärenmarke 2 Berchtesgadener Land 3 GUT&GÜNSTIG 4 regionale Marke Fockenbrock 4 regionale Marke Milchhof Müller 5 Oatly 6 Weihenstephan Auswertungshinweis: Die 6 Einzelvariablen werden für die Auswertung zu einer Variablen zusammengefasst, um diese als abhängige Variable für z.B. die Varianzanalyse zunutzen.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ax010midiff7` | numeric | 478 | 1 (339); 2 (316); 3 (323); 4 (329); 5 (345); 6 (341); 7 (340) |
| `AX010midiff7f` | character | 478 | Bärenmarke (339); Berchtesgardener Land (316); Fockenbrock regional (329); Gut&Günstig (323); Milchhof Müller regional (345); Oatly (341); Weihenstephan (340) |
| `B010midiff7_1quali` | numeric | 500 | -2 (54); -1 (101); 0 (710); 1 (822); 2 (624) |
| `B010midiff7_2vertrauen` | numeric | 507 | -2 (75); -1 (128); 0 (770); 1 (790); 2 (541) |
| `B010midiff7_3regio` | numeric | 500 | -2 (298); -1 (268); 0 (721); 1 (515); 2 (509) |
| `B010midiff7_4modern` | numeric | 503 | -2 (122); -1 (278); 0 (833); 1 (664); 2 (411) |
| `B010midiff7_5aufdringlich` | numeric | 507 | -2 (51); -1 (195); 0 (1039); 1 (683); 2 (336) |
| `B010midiff7_6preis` | numeric | 500 | -2 (140); -1 (198); 0 (651); 1 (796); 2 (526) |
| `B010midiff7_7passt` | numeric | 501 | -2 (42); -1 (104); 0 (607); 1 (803); 2 (754) |
| `B010midiff7_8cool` | numeric | 507 | -2 (154); -1 (322); 0 (1064); 1 (472); 2 (292) |
| `B010midiff7_9klima` | numeric | 508 | -2 (137); -1 (247); 0 (1021); 1 (550); 2 (348) |
| `B010midiff7_10geschmack` | numeric | 508 | -2 (65); -1 (122); 0 (1035); 1 (665); 2 (416) |
| `B010midiff7_11marke` | numeric | 497 | -2 (109); -1 (194); 0 (813); 1 (742); 2 (456) |
| `B010midiff7_12design` | numeric | 501 | -2 (105); -1 (227); 0 (704); 1 (761); 2 (513) |
| `B010midiff7_13gesund` | numeric | 499 | -2 (61); -1 (118); 0 (777); 1 (811); 2 (545) |
| `B010midiff7_14kauf` | numeric | 587 | -2 (409); -1 (222); 0 (522); 1 (532); 2 (539) |

### F11 · Wie treffen folgende Aussagen zu regionalen Lebensmitteln auf Sie zu? Sie können Ihre … (S. 12)

**Frage:** Wie treffen folgende Aussagen zu regionalen Lebensmitteln auf Sie zu? Sie können Ihre Meinung auch abstufen.

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p011regio], zufällige Reihenfolge, Local food Scale, Profeta&Hamm 2018, der Hinweis auf die Möglichkeit zur Abstufung erfolgt nur in den ersten 2-3 Fragen dieses Formats, um die Probanden in die Logik einzuführen. Trifft voll Trifft und ganz eher zu zu Teils/ teils Trifft eher nicht zu Trifft überhaupt nicht zu 1wirtschaft Ich kaufe regional Lebensmittel, um die regionale Wirtschaft zu +2 +1 0 unterstützen. -1 -2 2vertrauen Ich habe ein höheres Vertrauen in regionale Lebensmittel. +2 +1 0 -1 -2 3preis Ich bin bereit, für regionale Le- bensmittel einen höheren Preis +2 +1 0 -1 -2 zu zahlen. 4umwelt Lebensmittel aus meiner eige- nen Region sind umweltfreundli- +2 +1 0 -1 -2 cher. 5tierschutz Indem ich regionale Lebensmit- tel kaufe, unterstütze ich den +2 +1 0 Tierschutz. -1 -2 6teuer 7noherkunft 8bio 9regional Generell sind regionale Lebensmittel teurer. (R) +2 Beim Lebensmittelkauf sind mir andere Aspekte als die Herkunft +2 wichtiger. (R) Die Herkunft der Lebensmittel ist mir nicht wichtig, Hauptsache, +2 sie sind bio. (R) Ich kaufe gern nachhaltig und regional, wenn es passt, aber es muss praktisch und effizient +2 sein. (R) +1 +1 0 -1 -2 0 -1 -2 +1 0 -1 -2 +1 0 -1 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p011regio_1wirtschaft` | numeric | 10 | -2 (131); -1 (205); 0 (826); 1 (1019); 2 (620) |
| `p011regio_2vertrauen` | numeric | 8 | -2 (105); -1 (224); 0 (881); 1 (1083); 2 (510) |
| `p011regio_3preis` | numeric | 5 | -2 (282); -1 (411); 0 (988); 1 (799); 2 (326) |
| `p011regio_4umwelt` | numeric | 13 | -2 (73); -1 (133); 0 (780); 1 (1092); 2 (720) |
| `p011regio_5tierschutz` | numeric | 8 | -2 (167); -1 (301); 0 (1070); 1 (858); 2 (407) |
| `p011regio_6teuer` | numeric | 7 | -2 (71); -1 (298); 0 (1117); 1 (900); 2 (418) |
| `p011regio_7noherkunft` | numeric | 7 | -2 (97); -1 (428); 0 (1192); 1 (712); 2 (375) |
| `p011regio_8bio` | numeric | 6 | -2 (526); -1 (879); 0 (874); 1 (384); 2 (142) |
| `p011regio_9regional` | numeric | 10 | -2 (98); -1 (169); 0 (749); 1 (1195); 2 (590) |

### F12 · Wie treffen folgende Aussagen zum Einkauf von neuen Lebensmitteln auf Sie zu? Sie können … (S. 13)

**Frage:** Wie treffen folgende Aussagen zum Einkauf von neuen Lebensmitteln auf Sie zu? Sie können Ihre Meinung auch abstufen.

**Filter:** gestellt nur, wenn F6 = 3

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p012neo], zufällige Reihenfolge, Food Neophobie Pliner&Hobden 1992 (Hinweis: hier umgekehrt kodiert => Neuheiten liebend - neophil) 1probiere 2notrust 3notaste 4laender 5noculture 6party 7noeat 8waehlerisch 9alles 10culture Trifft voll Trifft und ganz eher zu zu Teils/ teils Ich probiere ständig neue und andere Lebensmittel aus. +2 +1 0 Ich vertraue neuen Lebensmitteln nicht. (R) +2 +1 0 Wenn ich nicht weiß, was in ei- nem Lebensmittel enthalten ist, +2 +1 0 werde ich es nicht probieren. (R) Ich mag Lebensmittel aus verschiedenen Ländern. +2 +1 0 Essen aus anderen Kulturen sieht zu seltsam aus, um es zu +2 +1 0 essen. (R) Auf sozialen Ereignissen (z.B. Party) probiere ich gern neue +2 +1 0 Speisen. Ich fürchte mich davor, Speisen zu essen, die ich noch nie vor- +2 +1 0 her gegessen habe. (R) Ich bin sehr wählerisch in Bezug auf Essen. (R) +2 +1 0 Ich esse fast alles. +2 +1 0 Ich gehe gerne an Orte, wo Es- sen aus anderen Kulturen ser- +2 +1 0 viert wird. Trifft eher nicht zu -1 Trifft überhaupt nicht zu -2 -1 -2 -1 -2 -1 -2 -1 -2 -1 -2 -1 -1 -1 -1 -2 -2 -2 -2 AX-Preis [AXpreis5] -> [AXpreis5f]: Fünf verschiedene Methoden der Preisabfragen (Fragen 13 bis 20) werden getestet, Bedingung nur wenn F6 = 3 Wegen der „Quotenumgehung“ werden die Preisfragen zwischen F33 und F34 eingetragen – Aufgrund der Spaltenbegrenzung beim Aktivieren der Umfrage werden der Preisreaktionstest und der GarborGranger Test jeweils nur einmal abgefragt AX-Split Methoden Preisabfragen – Studie A 1 Offener Preis, Preisschätzung (F13) 2 Preisklassentest (F14) 3 Preisreaktionstest mit 4 Preisstufen je ~ 50 Probanden (F15) axpreis5 == "3" 4 Van Westendorp Methode (F16-19) 5 Gabor Granger Preistest mit 5 Startgruppen je ~ 45 Probanden (F20) AX-Split Methoden Preisabfragen – Studie B 3 …

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p012neo_1probiere` | numeric | 9 | -2 (204); -1 (576); 0 (967); 1 (719); 2 (336) |
| `p012neo_2notrust` | numeric | 6 | -2 (469); -1 (906); 0 (970); 1 (316); 2 (144) |
| `p012neo_3notaste` | numeric | 5 | -2 (266); -1 (655); 0 (967); 1 (554); 2 (364) |
| `p012neo_4laender` | numeric | 5 | -2 (68); -1 (200); 0 (798); 1 (970); 2 (770) |
| `p012neo_5noculture` | numeric | 8 | -2 (791); -1 (780); 0 (777); 1 (309); 2 (146) |
| `p012neo_6party` | numeric | 8 | -2 (168); -1 (312); 0 (754); 1 (977); 2 (592) |
| `p012neo_7noeat` | numeric | 5 | -2 (715); -1 (826); 0 (712); 1 (382); 2 (171) |
| `p012neo_8waehlerisch` | numeric | 4 | -2 (284); -1 (663); 0 (890); 1 (640); 2 (330) |
| `p012neo_9alles` | numeric | 8 | -2 (160); -1 (389); 0 (640); 1 (960); 2 (654) |
| `p012neo_10culture` | numeric | 9 | -2 (155); -1 (343); 0 (883); 1 (845); 2 (576) |

### F13 · Nehmen Sie einmal an, Sie möchten für zuhause mehrere Milchmarken kaufen, weil diesmal … (S. 14)

**Frage:** Nehmen Sie einmal an, Sie möchten für zuhause mehrere Milchmarken kaufen, weil diesmal auch Gäste dabei sind, die gerne Hafermilch/Haferdrink trinken. Sie sehen im Supermarktregal diese drei 1-LiterMilchmarken (Frischmilch 3,5% Fett und Hafermilch/Haferdrink). Geben Sie für die 3 Marken bitte den Preis an, den Sie für angemessen halten und bei dem Sie zugreifen würden! Als Dezimaltrennzeichen verwenden Sie bitte das Komma.

**Filter:** gestellt nur, wenn F6 = 3 oder 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfache numerische Eingabe [u013pzahl], zufällige Reihenfolge, Bedingung: nur wenn F6 = 3 oder 2, [Offene Preisschätzung] Originalpreis 1,79 – 1,09€ – 1,79€, nur Studie A 1weihen Weihenstephan ______ EUR 2gut GUT&GÜNSTIG ______ EUR 3alpro Alpro ______ EUR

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `u013pzahl_1weihen` | numeric | 2580 | von 0 bis 150 |
| `u013pzahl_2gut` | numeric | 2580 | von 0 bis 189 |
| `u013pzahl_3alpro` | numeric | 2580 | von 0 bis 150 |

### F14 · Nehmen Sie einmal an, Sie möchten für zuhause mehrere Milchmarken kaufen, weil diesmal … (S. 14)

**Frage:** Nehmen Sie einmal an, Sie möchten für zuhause mehrere Milchmarken kaufen, weil diesmal auch Gäste dabei sind, die gerne Hafermilch/Haferdrink trinken. Sie sehen im Supermarktregal diese drei 1-LiterMilchmarken (Frischmilch 3,5% Fett und Hafermilch/Haferdrink). Geben Sie für die 3 Marken bitte die Preisspanne an, die Sie für angemessen halten und bei der Sie zugreifen würden!

**Filter:** gestellt nur, wenn F6 = 3 oder 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix nach Spalten [u014pklassen], Bedingung: nur wenn F6 = 3 oder 2, [Preisklassentest], Originalpreis 1,79 – 1,09€ – 1,79€, nur Studie A 1weihen 2gut 3alpro 0,90 bis 1,10 EUR 1 1 1 1,11 bis 1,30 EUR 2 2 2 1,31 bis 1,50 EUR 3 3 3 1,51 bis 1,70 EUR 4 4 4 1,71 bis 1,90 EUR 5 5 5 1,91 bis 2,10 EUR 6 6 6 2,11 bis 2,30 EUR 7 7 7 2,31 bis 2,50 EUR 8 8 8

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `u014pklassen_1weihen` | numeric | 2577 | 1 (47); 2 (80); 3 (52); 4 (29); 5 (18); 6 (4); 7 (2); 8 (2) |
| `u014pklassen_2gut` | numeric | 2577 | 1 (109); 2 (74); 3 (22); 4 (16); 5 (9); 7 (3); 8 (1) |
| `u014pklassen_3alpro` | numeric | 2579 | 1 (47); 2 (39); 3 (59); 4 (29); 5 (23); 6 (20); 7 (10); 8 (5) |

### F15 · Nehmen Sie einmal an, Sie möchten für zuhause mehrere Milchmarken kaufen, weil diesmal … (S. 15)

**Frage:** Nehmen Sie einmal an, Sie möchten für zuhause mehrere Milchmarken kaufen, weil diesmal auch Gäste dabei sind, die gerne Hafermilch/Haferdrink trinken. Sie sehen im Supermarktregal diese drei 1-LiterMilchmarken (Frischmilch 3,5% Fett und Hafermilch/Haferdrink). Wie sicher werden Sie diese drei Marken kaufen?

**Filter:** gestellt nur, wenn F6 = 3 oder 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [u015preaktion4] -> [U015preaktion4], AD-Test [ad015preaktion4] -> [AD015preaktion4f], Bedingung: nur wenn F6 = 3 oder 2, zufällige Reihenfolge, Variante A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen 1weihen +4 = Werde ich si- cher kaufen 0= Unentschie- den -4 = Werde ich sicher nicht kaufen 4 3 2 1 0 -1 -2 -3 -4 2gut 4 3 2 1 0 -1 -2 -3 -4 3alpro 4 3 2 1 0 -1 -2 -3 -4 3alpro Studie A 4 3 2 1 0 -1 -2 -3 -4 Studie B AD-Test Studie A 1 -10 Cent (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 1,69 € alpro 2 Normal (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 1,79 € alpro 3 +10 Cent (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 1,89 € alpro 4 +30 Cent (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 2,09 € alpro AD-Test Studie B 1 -10 Cent (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 1,69 € alpro 2 Normal (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 1,79 € alpro 3 +10 Cent (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 1,89 € alpro 4 +30 Cent (alpro) 1,79 € Weihenstephan 1,09 € GUT&GÜNSTIG 2,09 € alpro

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ad015p1reaktion4` | numeric | 2210 | 1 (141); 2 (142); 3 (161); 4 (157) |
| `AD015p1reaktion4f` | character | 2210 | -10 Cent alpro (141); + 10 Cent alpro (161); + 30 Cent alpro (157); Normal alpro (142) |
| `U015p1reaktion4_1weihen` | numeric | 2223 | -4 (109); -3 (30); -2 (35); -1 (36); 0 (105); 1 (46); 2 (62); 3 (64); 4 (101) |
| `U015p1reaktion4_2gut` | numeric | 2212 | -4 (64); -3 (12); -2 (22); -1 (13); 0 (94); 1 (41); 2 (65); 3 (87); 4 (201) |
| `U015p1reaktion4_3alpro` | numeric | 2215 | -4 (147); -3 (34); -2 (32); -1 (26); 0 (89); 1 (40); 2 (79); 3 (54); 4 (95) |

### F16 · Nehmen Sie einmal an, Sie sehen in einem Supermarkt die Milchmarke …. Bis zu welchem … (S. 17)

**Frage:** Nehmen Sie einmal an, Sie sehen in einem Supermarkt die Milchmarke …. Bis zu welchem Preis schätzen Sie das Produkt als günstig ein (guter Deal!)? Als Dezimaltrennzeichen verwenden sie bitte das Komma. ______ EUR [Van Westendorp Methode]

**Filter:** gestellt nur, wenn F6 = 3 oder 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Zahleneingabe [u016pvonwguenstig2] -> [U016pvonwguenstig2]], AB-Test [ab1619pvonw2] -> [AB1619pvonw2f], alle vier Fragen (17 bis 20) zum Preis auf derselben Seite einblenden, Bedingung: nur wenn F6 = 3 oder 2 AB-Test 1 Weihenstephan 1l 2 alpro 1l

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab1619pvonw2` | numeric | 2191 | 1 (323); 2 (297) |
| `u016pvonwguenstig1` | numeric | 2497 | von 0.1 bis 150 |
| `u016pvonwguenstig2` | numeric | 2519 | von 0 bis 999 |
| `AB1619pvonw2f` | character | 2191 | alpro (297); Weihenstephan (323) |

### F17 · Ab welchem Preis würden Sie das Produkt als zu teuer bezeichnen und nicht mehr kaufen … (S. 17)

**Frage:** Ab welchem Preis würden Sie das Produkt als zu teuer bezeichnen und nicht mehr kaufen wollen (zu teuer)? [u017pvonwzuteuer2] -> [U017pvonwzuteuer2] ______ EUR

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `u017pvonwzuteuer1` | numeric | 2492 | von 0 bis 344 |
| `u017pvonwzuteuer2` | numeric | 2518 | von 0 bis 999 |

### F18 · Gehen Sie jetzt bitte mal von einem Normalpreis aus, der zwischen günstig („guter Deal“) … (S. 17)

**Frage:** Gehen Sie jetzt bitte mal von einem Normalpreis aus, der zwischen günstig („guter Deal“) und „zu teuer“ liegt: Bis zu welchem Preis würden Sie das Produkt als teuer bezeichnen, es aber gerade noch akzeptabel finden (teuer aber noch o.k.)? [u018pvonwteuer2] -> [U018pvonwteuer2] ______ EUR

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `u018pvonwteuer1` | numeric | 2491 | von 0.6 bis 170 |
| `u018pvonwteuer2` | numeric | 2521 | von 0 bis 11008 |

### F19 · Ab welchem Preis würden Sie das Angebot als zu günstig bewerten, sodass Sie ernsthaft an … (S. 17)

**Frage:** Ab welchem Preis würden Sie das Angebot als zu günstig bewerten, sodass Sie ernsthaft an der Qualität/Seriosität zweifeln (zu günstig)? [u019pvonwzuguenstig2] -> [U019pvonwzuguenstig2] ______ EUR

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `u019pvonwzuguenstig1` | numeric | 2492 | von 0 bis 159 |
| `u019pvonwzuguenstig2` | numeric | 2522 | von 0 bis 999 |

### F20 · Nehmen Sie an, Sie sehen in einem Supermarkt diese Milch der Marke „Weihenstephan“ in … (S. 17)

**Frage:** Nehmen Sie an, Sie sehen in einem Supermarkt diese Milch der Marke „Weihenstephan“ in einem 1-Liter-Tetrapack. Wie sicher werden Sie diese kaufen? [Garbor Granger Methode]

**Filter:** gestellt nur, wenn F6 = 3 oder 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [u020pgarbor], zufälliger Beginn der Preise [ax020pgarbor5] -> [AX020pgarbor5f] max. 5x Anzahl Kaufentscheidung mit Preis + Bild auf einer 5er Skala, alle auf einer Seite darstellen, nächste Entscheidung über Bedingung einblenden, Bedingung nur wenn F6 = 3 oder 2, Variante A-Einstiegspreis wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen, 1p179 Werde ich sicher kaufen +2 +1 Teils/ teils 0 -1 Werde ich sicher nicht kaufen -2 AX-Test 1 Beginn 1,79 € Frage mit 1,79 € Frage mit 1,89 € Frage mit 1,99 € Frage mit 2,09 € Frage mit 2,19 € 2 Beginn 1,89 € Frage mit 1,89 € Frage mit 1,79 € Frage mit 1,99 € Frage mit 2,09 € Frage mit 2,19 € 3 Beginn 1,99 € Frage mit 1,99 € Frage mit 1,89 € Frage mit 1,79 € Frage mit 2,09 € Frage mit 2,19 € 4 Beginn 2,09 € Frage mit 2,09 € Frage mit 1,99 € Frage mit 1,89 € Frage mit 1,79 € Bedingung Frage Wenn bei 1,79 +2 oder +1 Wenn bei 1,89 +2 oder +1 Wenn bei 1,99 +2 oder +1 Wenn bei 2,09 +2 oder +1 Wenn bei 1,89 0, -1, -2 Wenn bei 1,89 +2 oder +1 Wenn bei 1,99 +2 oder +1 Wenn bei 2,09 +2 oder +1 Wenn bei 1,99 0, -1, -2 Wenn bei 1,89 0, -1, -2 Wenn bei 1,99 +2 oder +1 Wenn bei 2,09 +2 oder +1 Wenn bei 2,09 0, -1, -2 Wenn bei 1,99 0, -1, -2 Wenn bei 1,89 0, -1, -2 Frage mit 2,19 € 5 Beginn 2,19 € Frage mit 2,19 € Frage mit 2,09 € Frage mit 1,99 € Frage mit 1,89 € Frage mit 1,79 € Wenn bei 2,09 +2 oder +1 Wenn bei 2,19 0, -1 oder -2 Wenn bei 2,09 0, -1 oder -2 Wenn bei 1,99 0, -1 oder -2 Wenn bei 1,89 0, -1 oder -2 Es folgen Fragen zur Verpackung von Lebensmitteln.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `AX020pgarbor5f` | character | 2169 | Beginn 1,79€ (144); Beginn 1,89€ (111); Beginn 1,99€ (119); Beginn 2,09€ (130); Beginn 2,19€ (138) |

### F21 · Welche der folgenden, gesetzlich vorgeschriebenen, Informationen beachten Sie auf einer … (S. 19)

**Frage:** Welche der folgenden, gesetzlich vorgeschriebenen, Informationen beachten Sie auf einer Verpackung?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [v021pack], zufällige Reihenfolge, statista 2023 1zutaten 2mhd 3naehrwert 4herkunft 5allergie 6speziell 7zusatzstoffe Zutatenliste Mindesthaltbarkeitsdatum Nährwertangaben (z. B. Kalorien, Fett, Eiweiß etc.) Herkunftsangaben (Land, Region) Hinweise auf Stoffe, die Allergien oder Unverträglichkeiten auslösen Spezielle Angaben, z. B. Verweis auf erhöhten Koffeingehalt, Verwendung von Azo-Farbstoffen oder Süßholz Angaben zu Inhalts-, Zusatzund Hilfsstoffe* Beachte ich fast immer +2 +2 +2 +2 +2 +2 +2 Beachte ich eher +1 +1 +1 +1 +1 +1 +1 Teils/ teils 0 0 0 0 0 0 0 Beachte ich eher nicht -1 -1 -1 Beachte ich fast nie -2 -2 -2 -1 -2 -1 -2 -1 -1 -2 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v021pack_1zutaten` | numeric | 7 | -2 (211); -1 (395); 0 (792); 1 (833); 2 (573) |
| `v021pack_2mhd` | numeric | 4 | -2 (59); -1 (134); 0 (431); 1 (836); 2 (1347) |
| `v021pack_3naehrwert` | numeric | 5 | -2 (280); -1 (469); 0 (743); 1 (827); 2 (487) |
| `v021pack_4herkunft` | numeric | 5 | -2 (196); -1 (352); 0 (866); 1 (905); 2 (487) |
| `v021pack_5allergie` | numeric | 3 | -2 (530); -1 (679); 0 (680); 1 (541); 2 (378) |
| `v021pack_6speziell` | numeric | 5 | -2 (375); -1 (634); 0 (742); 1 (722); 2 (333) |
| `v021pack_7zusatzstoffe` | numeric | 5 | -2 (260); -1 (462); 0 (776); 1 (785); 2 (523) |

### F22 · Neben den gesetzlichen Kennzeichnungen sind auch folgende Siegel häufig auf einer … (S. 19)

**Frage:** Neben den gesetzlichen Kennzeichnungen sind auch folgende Siegel häufig auf einer Lebensmittelverpackung zu finden. Welche sind Ihre persönlichen Favoriten? (max. 5 Nennungen möglich)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [v022kenn], Keins immer am Ende, zufällige Reihenfolge, statista 2023 1bio 2fair 3regio 4nachhaltig 5tierwohl 6umwelt 7vegan 8veggie 9nutri 10co2 Bio-Siegel Fair gehandelt Regionalfenster Siegel für Nachhaltigkeit (z.B. MSC-Fischerei, Rainforest) Tierwohlsiegel Umweltfreundliche Produktion (z.B. blauer Engel) Veganes Produkt Vegetarisches Produkt Nutri-Score CO2-Label / Klimalabel keins Keins der gezeigten Siegel

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v022kenn_1bio` | numeric | 0 | 0 (1703); 1 (1108) |
| `v022kenn_2fair` | numeric | 0 | 0 (1796); 1 (1015) |
| `v022kenn_3regio` | numeric | 0 | 0 (2013); 1 (798) |
| `v022kenn_4nachhaltig` | numeric | 0 | 0 (1876); 1 (935) |
| `v022kenn_5tierwohl` | numeric | 0 | 0 (1547); 1 (1264) |
| `v022kenn_6umwelt` | numeric | 0 | 0 (1942); 1 (869) |
| `v022kenn_7vegan` | numeric | 0 | 0 (2464); 1 (347) |
| `v022kenn_8veggie` | numeric | 0 | 0 (2489); 1 (322) |
| `v022kenn_9nutri` | numeric | 0 | 0 (1922); 1 (889) |
| `v022kenn_10co2` | numeric | 0 | 0 (2495); 1 (316) |
| `v0220_keins` | numeric | 0 | 0 (2308); 1 (503) |

### F23 · Immer mehr Menschen vermeiden/reduzieren ungesunde Inhalts- oder Zusatzstoffstoffe. … (S. 20)

**Frage:** Immer mehr Menschen vermeiden/reduzieren ungesunde Inhalts- oder Zusatzstoffstoffe. Welche der folgenden Kennzeichnungen beachten Sie beim Kauf von Lebensmitteln ganz bewusst? Den Hinweis …

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [v023frei], nach statista 2015 1konservierung 2zusatz 3laktose 4zucker 5gluten 6weizen 7gen 8vegan 9milch 10ei 11hefe 12nuss 13soja 14fett 15salz 16salzarm 17koffein 18alkohol 19geschmack 20farbstoffe 21aromen 22phosphate 23palmoes 24emulgatoren 25sues 26gelantine 27glutamat … ohne Konservierungsstoffe … ohne Zusatzstoffe … laktosefrei … ohne Zuckerzusatz … glutenfrei … ohne Weizen … ohne Gentechnik … frei von tierischen Inhaltsstoffen … ohne Milch … ohne Ei … ohne Hefe … ohne Nuss … sojafrei … fettfrei … salzfrei … salzarm … koffeinfrei … ohne Alkohol … ohne Geschmacksverstärker … ohne künstliche Farbstoffe … ohne zugesetzte Aromen … ohne Phosphate … ohne Palmöl … ohne Emulgatoren … ohne Süßstoffe … ohne Gelatine … ohne Glutamat Beachte ich 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 Beachte ich nicht 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v023frei_1konservierung` | numeric | 10 | 0 (1091); 1 (1710) |
| `v023frei_2zusatz` | numeric | 17 | 0 (1080); 1 (1714) |
| `v023frei_3laktose` | numeric | 21 | 0 (2264); 1 (526) |
| `v023frei_4zucker` | numeric | 15 | 0 (1210); 1 (1586) |
| `v023frei_5gluten` | numeric | 23 | 0 (2364); 1 (424) |
| `v023frei_6weizen` | numeric | 24 | 0 (2390); 1 (397) |
| `v023frei_7gen` | numeric | 16 | 0 (1451); 1 (1344) |
| `v023frei_8vegan` | numeric | 29 | 0 (2016); 1 (766) |
| `v023frei_9milch` | numeric | 21 | 0 (2370); 1 (420) |
| `v023frei_10ei` | numeric | 27 | 0 (2467); 1 (317) |
| `v023frei_11hefe` | numeric | 24 | 0 (2540); 1 (247) |
| `v023frei_12nuss` | numeric | 25 | 0 (2497); 1 (289) |
| `v023frei_13soja` | numeric | 27 | 0 (2402); 1 (382) |
| `v023frei_14fett` | numeric | 24 | 0 (2083); 1 (704) |
| `v023frei_15salz` | numeric | 27 | 0 (2373); 1 (411) |
| `v023frei_16salzarm` | numeric | 23 | 0 (1962); 1 (826) |
| `v023frei_17koffein` | numeric | 22 | 0 (2196); 1 (593) |
| `v023frei_18alkohol` | numeric | 20 | 0 (1557); 1 (1234) |
| `v023frei_19geschmack` | numeric | 18 | 0 (1322); 1 (1471) |
| `v023frei_20farbstoffe` | numeric | 16 | 0 (1335); 1 (1460) |
| `v023frei_21aromen` | numeric | 22 | 0 (1480); 1 (1309) |
| `v023frei_22phosphate` | numeric | 25 | 0 (1820); 1 (966) |
| `v023frei_23palmoes` | numeric | 11 | 0 (1381); 1 (1419) |
| `v023frei_24emulgatoren` | numeric | 22 | 0 (1933); 1 (856) |
| `v023frei_25sues` | numeric | 24 | 0 (1719); 1 (1068) |
| `v023frei_26gelantine` | numeric | 30 | 0 (2115); 1 (666) |
| `v023frei_27glutamat` | numeric | 21 | 0 (1895); 1 (895) |

### F24 · Betrachten Sie bitte folgendes Siegel und stellen Sie es sich auf einer Pizza-Verpackung … (S. 20)

**Frage:** Betrachten Sie bitte folgendes Siegel und stellen Sie es sich auf einer Pizza-Verpackung vor. Wie bewerten Sie das Siegel im Kontext Pizza mit Hilfe der untenstehenden Adjektivpaare?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [b024labeldiff12] [A]. b024labeldiff8 [B] -> [B024labeldiff20], AX-Test [ax024labeldiff12 (A), [ax024labeldiff8 (B) ] -> [AX024labeldiff20], zufällige Reihenfolge, Adjektivpaar „Kauf“ immer am Ende, F24/F25 auf einer Seite darstellen, Variante A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen 1hochwertig 2vertrauen 3regio Hochwertig Vertrauensvoll Regional Deutlich Eher… eher… +2 +2 +2 +1 +1 +1 Unent- Eher… schieden 0 -1 0 -1 0 -1 Deutlich eher… -2 -2 -2 Billig Nicht vertrauensvoll Überregional 4modern 5kontrolle Modern Streng kontrolliert 6aufdringlich 7design 8klima 9gesund 10cool Dezent Ansprechendes Design Gut fürs Klima Gesund Cool 11kauf Studie A Regt zum Kauf an +2 +2 +2 +2 +2 +2 +2 +2 +1 +1 +1 +1 +1 +1 +1 +1 0 0 0 0 0 0 0 0 -1 -2 -1 -2 -1 -1 -2 -2 Altmodisch Erfüllt nur die gesetzlichen Mindestanforderungen Aufdringlich Liebloses Design -1 -2 Schlecht fürs Klima -1 -2 Ungesund -1 -2 Uncool -1 -2 Hält vom Kauf ab Studie B AX-Test Studie A 1 EU-Biosiegel 2 Naturland 3 Bioland 4 Demeter 5 Gutes aus deutscher Landwirtschaft 6 Qualität aus Deutschland 7 Naturland fair 8 fairtrade siegel 9 Gepa 10 Vegetarisch 11 Regionalfenster 12 Vegan AX-Test Studie B 13 Nutri-Score 14 Tierwohl-Label des Lebensmittelhandels 15 Initiative Tierwohl 16 Staatliches Tierwohllabel (ab 2026) 17 Nachaltige Fischerei 18 Klimalabel (FG Agrarm) 19 QS-Zeichen 20 WWF

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `b024labeldiff111_kauf` | numeric | 2691 | 1 (8); 2 (12); 3 (60); 4 (35); 5 (5) |
| `AX024labeldiff20` | numeric | 0 | von 1 bis 20 |
| `AX024labeldiff20f` | character | 0 | Freitext (nicht zitieren) |
| `B024labeldiff20_1hochwertig` | numeric | 205 | -2 (108); -1 (226); 0 (1170); 1 (793); 2 (309) |
| `B024labeldiff20_2vertrauen` | numeric | 206 | -2 (120); -1 (225); 0 (1025); 1 (882); 2 (353) |
| `B024labeldiff20_3regio` | numeric | 204 | -2 (302); -1 (358); 0 (1186); 1 (508); 2 (253) |
| `B024labeldiff20_4modern` | numeric | 206 | -2 (118); -1 (232); 0 (1172); 1 (775); 2 (308) |
| `B024labeldiff20_5kontrolle` | numeric | 201 | -2 (174); -1 (261); 0 (1073); 1 (789); 2 (313) |
| `B024labeldiff20_6aufdringlich` | numeric | 208 | -2 (91); -1 (216); 0 (1262); 1 (774); 2 (260) |
| `B024labeldiff20_7design` | numeric | 210 | -2 (160); -1 (273); 0 (1163); 1 (714); 2 (291) |
| `B024labeldiff20_8klima` | numeric | 206 | -2 (79); -1 (173); 0 (1233); 1 (770); 2 (350) |
| `B024labeldiff20_9gesund` | numeric | 204 | -2 (105); -1 (220); 0 (1273); 1 (723); 2 (286) |
| `B024labeldiff20_10cool` | numeric | 204 | -2 (209); -1 (297); 0 (1384); 1 (513); 2 (204) |
| `B024labeldiff20_11kauf` | numeric | 277 | -2 (183); -1 (249); 0 (1205); 1 (661); 2 (236) |

### F25 · Betrachten Sie bitte nun folgendes „Biosiegel“ und stellen Sie es sich auf einer … (S. 22)

**Frage:** Betrachten Sie bitte nun folgendes „Biosiegel“ und stellen Sie es sich auf einer Pizza-Verpackung vor. Welches Adjektiv aus der untenstehenden Liste mit Adjektivpaaren bringen Sie jeweils eher mit dem Zeichen in Verbindung (links oder rechts bzw oben oder unten)?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [b025biodiff), zufällige ReihenfolgeAdjektivpaar „Kauf“ immer am Ende, 1hochwertig 2vertrauen 3regio 4modern 5kontrolle 6aufdringlich 7design 8klima 9gesund 10cool 11kauf Hochwertiges Produkt Vertrauensvoll Regional Modern Streng kontrolliert Dezent Ansprechendes Design Gut fürs Klima Gesund Cool Regt zum Kauf an +2 +1 0 -1 -2 Billiges Produkt +2 +1 0 -1 -2 Nicht vertrauensvoll +2 +1 0 -1 -2 Überregional +2 +1 0 -1 -2 Altmodisch +2 +1 0 -1 -2 Erfüllt nur die gesetzlichen Mindestanforderungen +2 +1 0 -1 -2 Aufdringlich +2 +1 0 -1 -2 Liebloses Design +2 +1 0 -1 -2 Schlecht fürs Klima +2 +1 0 -1 -2 Ungesund +2 +1 0 -1 -2 Uncool +2 +1 0 -1 -2 Hält vom Kauf ab

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `b025biodiff_1hochwertig` | numeric | 17 | -2 (55); -1 (139); 0 (972); 1 (1079); 2 (549) |
| `b025biodiff_2vertrauen` | numeric | 11 | -2 (79); -1 (147); 0 (846); 1 (1112); 2 (616) |
| `b025biodiff_3regio` | numeric | 15 | -2 (221); -1 (334); 0 (1278); 1 (637); 2 (326) |
| `b025biodiff_4modern` | numeric | 18 | -2 (60); -1 (205); 0 (1094); 1 (996); 2 (438) |
| `b025biodiff_5kontrolle` | numeric | 17 | -2 (104); -1 (183); 0 (822); 1 (1100); 2 (585) |
| `b025biodiff_6aufdringlich` | numeric | 13 | -2 (71); -1 (249); 0 (1236); 1 (906); 2 (336) |
| `b025biodiff_7design` | numeric | 16 | -2 (84); -1 (200); 0 (1086); 1 (1006); 2 (419) |
| `b025biodiff_8klima` | numeric | 15 | -2 (60); -1 (122); 0 (1011); 1 (1042); 2 (561) |
| `b025biodiff_9gesund` | numeric | 14 | -2 (65); -1 (128); 0 (937); 1 (1108); 2 (559) |
| `b025biodiff_10cool` | numeric | 17 | -2 (110); -1 (244); 0 (1430); 1 (685); 2 (325) |
| `b025labeldiff11_kauf` | numeric | 1418 | 1 (61); 2 (93); 3 (524); 4 (501); 5 (214) |

### F26 · Als nächstes interessiert uns, was Sie gerne mögen. Mal ganz konkret: Wie gerne essen Sie … (S. 22)

**Frage:** Als nächstes interessiert uns, was Sie gerne mögen. Mal ganz konkret: Wie gerne essen Sie folgende Gerichte? Sie können Ihre Meinung auch abstufen.

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p026gericht2] -> [P026gericht2], AB-Test [ab026gericht2] -> [AB026gericht2f], zufällige Reihenfolge, Sparke 2006, (Bilder mit KI erstellt) Hinweis für AB-Variantentesterläuterung Originalvariablen in Datendatei 1austern Variante A : Gerichte als Text Austern Variante B: Gerichte als Image und Text Austern +3 = Sehr gerne -3 = Sehr ungerne +3 +2 +1 0 -1 -2 -3 2sushi Sushi Sushi +3 +2 +1 0 -1 -2 -3 3actimel Actimel Drink Actimel Drink +3 +2 +1 0 -1 -2 -3 4sandwich Sandwich und Sandwich und Coffee to go Coffee to go +3 +2 +1 0 -1 -2 -3 5hamburger Hamburger Hamburger +3 +2 +1 0 -1 -2 -3 6hamburgerv Veganer Hamburger 7pizza Pizza Pizza +3 +2 +1 0 -1 -2 -3 +3 +2 +1 0 -1 -2 -3 8fisch Fischstäbchen Fischstäbchen +3 +2 +1 0 -1 -2 -3 9gulasch Nudeln mit Gulasch Nudeln mit Gulasch +3 +2 +1 0 -1 -2 -3 10braten Schweinebra- Schweinebra- ten ten +3 +2 +1 0 -1 -2 -3 11spargel Spargelmenü Spargelmenü +3 +2 +1 0 -1 -2 -3 12salat Salat Salat +3 +2 +1 0 -1 -2 -3 13muesli Müsli Müsli +3 +2 +1 0 -1 -2 -3 14bratling Grünkernbrat- Grünkernbrat- ling ling +3 +2 +1 0 -1 -2 -3 AB-Test 1 Gerichte als Text 2 Gerichte als Image + Text In den nächsten Fragen geht es um Kaufentscheidungen!

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab026gericht2` | numeric | 0 | 1 (1385); 2 (1426) |
| `p026gericht1_1austern` | numeric | 1431 | 1 (817); 2 (120); 3 (93); 4 (161); 5 (74); 6 (51); 7 (64) |
| `p026gericht1_2sushi` | numeric | 1428 | 1 (461); 2 (98); 3 (90); 4 (154); 5 (141); 6 (174); 7 (265) |
| `p026gericht1_3actimel` | numeric | 1430 | 1 (343); 2 (123); 3 (112); 4 (273); 5 (219); 6 (172); 7 (139) |
| `p026gericht1_4sandwich` | numeric | 1432 | 1 (290); 2 (145); 3 (170); 4 (268); 5 (228); 6 (147); 7 (131) |
| `p026gericht1_5hamburger` | numeric | 1432 | 1 (157); 2 (58); 3 (89); 4 (196); 5 (259); 6 (299); 7 (321) |
| `p026gericht1_6hamburgerv` | numeric | 1431 | 1 (525); 2 (128); 3 (139); 4 (242); 5 (152); 6 (95); 7 (99) |
| `p026gericht1_7pizza` | numeric | 1427 | 1 (35); 2 (28); 3 (46); 4 (150); 5 (271); 6 (356); 7 (498) |
| `p026gericht1_8fisch` | numeric | 1428 | 1 (147); 2 (62); 3 (104); 4 (194); 5 (310); 6 (316); 7 (250) |
| `p026gericht1_9gulasch` | numeric | 1428 | 1 (111); 2 (43); 3 (69); 4 (158); 5 (223); 6 (297); 7 (482) |
| `p026gericht1_10braten` | numeric | 1429 | 1 (218); 2 (72); 3 (94); 4 (187); 5 (260); 6 (244); 7 (307) |
| `p026gericht1_11spargel` | numeric | 1433 | 1 (167); 2 (63); 3 (57); 4 (170); 5 (216); 6 (298); 7 (407) |
| `p026gericht1_12salat` | numeric | 1430 | 1 (26); 2 (15); 3 (36); 4 (109); 5 (249); 6 (381); 7 (565) |
| `p026gericht1_13muesli` | numeric | 1433 | 1 (142); 2 (67); 3 (100); 4 (218); 5 (326); 6 (257); 7 (268) |
| `p026gericht1_14bratling` | numeric | 1429 | 1 (419); 2 (129); 3 (158); 4 (310); 5 (172); 6 (112); 7 (82) |
| `p026gericht2_1austern` | numeric | 1390 | 1 (831); 2 (130); 3 (101); 4 (165); 5 (80); 6 (49); 7 (65) |
| `p026gericht2_2sushi` | numeric | 1389 | 1 (471); 2 (100); 3 (82); 4 (165); 5 (160); 6 (145); 7 (299) |
| `p026gericht2_3actimel` | numeric | 1389 | 1 (332); 2 (112); 3 (116); 4 (296); 5 (213); 6 (172); 7 (181) |
| `p026gericht2_4sandwich` | numeric | 1387 | 1 (252); 2 (128); 3 (157); 4 (272); 5 (257); 6 (181); 7 (177) |
| `p026gericht2_5hamburger` | numeric | 1391 | 1 (173); 2 (70); 3 (92); 4 (214); 5 (248); 6 (305); 7 (318) |
| `p026gericht2_6hamburgerv` | numeric | 1390 | 1 (510); 2 (149); 3 (135); 4 (264); 5 (142); 6 (119); 7 (102) |
| `p026gericht2_7pizza` | numeric | 1389 | 1 (31); 2 (32); 3 (61); 4 (174); 5 (268); 6 (332); 7 (524) |
| `p026gericht2_8fisch` | numeric | 1387 | 1 (158); 2 (83); 3 (103); 4 (236); 5 (335); 6 (299); 7 (210) |
| `p026gericht2_9gulasch` | numeric | 1387 | 1 (109); 2 (33); 3 (58); 4 (143); 5 (256); 6 (366); 7 (459) |
| `p026gericht2_10braten` | numeric | 1387 | 1 (233); 2 (81); 3 (90); 4 (181); 5 (272); 6 (256); 7 (311) |
| `p026gericht2_11spargel` | numeric | 1389 | 1 (143); 2 (35); 3 (61); 4 (171); 5 (203); 6 (291); 7 (518) |
| `p026gericht2_12salat` | numeric | 1391 | 1 (18); 2 (17); 3 (33); 4 (125); 5 (249); 6 (356); 7 (622) |
| `p026gericht2_13muesli` | numeric | 1387 | 1 (146); 2 (80); 3 (86); 4 (222); 5 (270); 6 (288); 7 (332) |
| `p026gericht2_14bratling` | numeric | 1389 | 1 (373); 2 (156); 3 (147); 4 (299); 5 (190); 6 (139); 7 (118) |

### F27 · Sie sehen hier eine(n) Hafermilch/Haferdrink der Marke Alpro und eine Kuhmilch der Marke … (S. 24)

**Frage:** Sie sehen hier eine(n) Hafermilch/Haferdrink der Marke Alpro und eine Kuhmilch der Marke Weihenstephan, die beide zum selben Preis angeboten werden. Geben Sie bitte an, welche der beiden dargestellten Produkte Sie für Ihren Haushalt kaufen würden.

**Filter:** gestellt nur, wenn F6 = 3

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [u027kaufalpro5] -> [U027kaufalpro5] , AX-Test [ax027kaufalpro5] -> [AX027kaufalpro5f], Variante A wird hier gezeigt, alle weiteren Varianten in Programmierhinweisen, Bedingung: nur wenn F6 = 3 Unentschieden Ich werde sicher ALPRO kaufen 4 Ich werde sicher Weihenstephan kaufen 3 2 1 0 -1 -2 -3 -4 AX-Test 1 alpro mit Claim: Zuckerreduziert - Weihenstephan 2 alpro mit Claim: Fettreduziert Weihenstephan 3 alpro mit Claim: Ohne Gentechnik - Weihenstephan 4 alpro mit Claim: Nutri-ScoreA Weihenstephan 5 alpro ohne Claim- Weihenstephan

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ax027kaufalpro5` | numeric | 478 | 1 (445); 2 (503); 3 (463); 4 (452); 5 (470) |
| `AX027kaufalpro5f` | character | 478 | Fettreduziert alpro (503); Nutri-ScoreA alpro (452); ohne claim alpro (470); Ohne Gentechnik alpro (463); Zuckerreduziert alpro (445) |
| `U027kaufalpro5` | numeric | 483 | -4 (936); -3 (175); -2 (130); -1 (70); 0 (371); 1 (79); 2 (119); 3 (101); 4 (347) |

### F28 · Stellen Sie sich nun vor, Sie wollen auf die Schnelle noch einen herzhaften Aufstrich zum … (S. 25)

**Frage:** Stellen Sie sich nun vor, Sie wollen auf die Schnelle noch einen herzhaften Aufstrich zum Abendbrot mitbringen. Im Laden um die Ecke finden Sie nur noch die vegane Variante der Pommerschen (Bild links). Für die echte Pommersche Leberwurst vom Schwein müssten Sie extra noch ein anderes Geschäft aufsuchen. Wie würden Sie sich entscheiden?

**Filter:** gestellt nur, wenn F6 = 5

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [u028kaufpommer8] -> [U028kaufpommer8], AX-Conjoint [ax028kaufpommer8] -> [AX028kaufpommer8f], Bedingung: nur wenn F6 = 5, Set A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen Ich werde sicher vegan kaufen Unentschieden Ich werde sicher vom Schwein kaufen 4 3 2 1 0 -1 -2 -3 -4 AX-Conjoint 1 vegan 2,89 € mit V-Label, vom Schwein 2,69 € 2 vegan 2,69 € mit V-Label, vom Schwein 2,69 € 3 vegan 2,49 € mit V-Label, vom Schwein 2,69 € 4 vegan 2,29 € mit V-Label, vom Schwein 2,69 € 1 vegan 2,89 € ohne V-Label, vom Schwein 2,69 € 2 vegan 2,69 € ohne V-Label, vom Schwein 2,69 € 3 vegan 2,49 € ohne V-Label, vom Schwein 2,69 € 4 vegan 2,29 € ohne V-Label, vom Schwein 2,69 €

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ax028kaufpommer8` | numeric | 513 | 1 (317); 2 (301); 3 (290); 4 (289); 5 (272); 6 (252); 7 (291); 8 (286) |
| `AX028kaufpommer8f` | character | 513 | vegan 2,29€ Schwein 2,69€ (286); vegan 2,29€ V-Label Schwein 2,69€ (289); vegan 2,49€ Schwein 2,69€ (291); vegan 2,49€ V-Label Schwein 2,69€ (290); vegan 2,69€ Schwein 2,69€ (252); vegan 2,69€ V-Label Schwein 2,69€ (301); vegan 2,89€ Schwein 2,69€ (272); vegan 2,89€ V-Label Schwein 2,69€ (317) |
| `U028kaufpommer8` | numeric | 520 | -4 (832); -3 (136); -2 (114); -1 (67); 0 (435); 1 (84); 2 (100); 3 (88); 4 (435) |
| `U028kaufpommer4_mv` | numeric | 1618 | -4 (449); -3 (71); -2 (42); -1 (36); 0 (221); 1 (35); 2 (52); 3 (52); 4 (235) |
| `U028kaufpommer4_ov` | numeric | 1713 | -4 (383); -3 (65); -2 (72); -1 (31); 0 (214); 1 (49); 2 (48); 3 (36); 4 (200) |
| `ad028kaufpommer4_mv` | numeric | 1614 | 1 (317); 2 (301); 3 (290); 4 (289) |
| `ad028kaufpommer4_ov` | numeric | 1710 | 5 (272); 6 (252); 7 (291); 8 (286) |

### F29 · Wie treffen folgende Aussagen zur Lebensmittelauswahl auf Sie zu? Für mich ist es … (S. 26)

**Frage:** Wie treffen folgende Aussagen zur Lebensmittelauswahl auf Sie zu? Für mich ist es wichtig, dass Lebensmittel, die ich an einem normalen Tag esse…

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p029mik], zufällige Reihenfolge, Lebensmittelauswahl, MIK Skala 2022 (verkürzte Steptoe Skala, angepasst Welk, Enneking) 1vertraut 2erschwing 3bequem 4sinn 5image 6gesund 7gewicht 8laune 9kochen 10umwelt 11natur 12regional Trifft voll Trifft und ganz eher zu zu Teils/ teils …mir sehr vertraut sind. +2 +1 0 ...für mich erschwinglich sind. +2 +1 0 ...bequem zu verzehren oder zuzubereiten sind. +2 +1 0 ...besondere Sinneseindrücke haben (Geruch, Geschmack, +2 +1 0 Aussehen, Textur). …von einer Marke stammen, die ein besonderes und positives +2 +1 0 Image hat. ...gesund sind. +2 +1 0 ...mir bei der Kontrolle meines Gewichts helfen. +2 +1 0 ...mir helfen, meine Laune zu beeinflussen (gutes Gefühl, +2 +1 0 Stressabbau). …geeignet sind, um was Tolles zu kochen (auch mit einfachen +2 +1 0 Zutaten). ...umwelt- und tierfreundlich sind. +2 +1 0 ...möglichst natürlich sind (ohne zu viele Zusatzstoffe und Verar- +2 +1 0 beitungsschritte). …von einem bekannten Anbie- ter aus der näheren Umgebung +2 +1 0 stammen. Trifft eher nicht zu -1 -1 -1 Trifft überhaupt nicht zu -2 -2 -2 -1 -2 -1 -1 -1 -1 -2 -2 -2 -2 -1 -1 -1 -2 -2 -2 -1 -2 An diese Stelle (zwischen F29 und F30) werden die Fragenblöcke mit den Spezialthemen platziert. In Studie B - erst Spezialthema 4 Regional (Fragen 98-113) -> Bedingung F5 = 1, danach AX-Test [axspezial4]: alle nicht Osnabrücker ( Bedingung: F5 = 0) werden in die restlichen 4 Spezialstudien aufgeteilt (Fragen 50-62, 75-97, 114-126, 161-175) AX-Test Spezialthemen [AXspezial9] -> [AXspezial9f] Gesamtstudie AX-Test 1 Allgemeine Markt- und Wettbewerbsanalyse Schokolade 2 Allgemeine Markt- und Wettbewerbsanalyse Milch 3 Technische Innovation: Lachsprodukt, Gluten-freies Brot mit Gentechnik 4 Regionalität, Bioprodukte und Nachhaltigkeit 5 Funktionelle und …

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p029mik_1vertraut` | numeric | 16 | -2 (42); -1 (160); 0 (838); 1 (1195); 2 (560) |
| `p029mik_2erschwing` | numeric | 7 | -2 (28); -1 (102); 0 (611); 1 (1031); 2 (1032) |
| `p029mik_3bequem` | numeric | 12 | -2 (34); -1 (114); 0 (699); 1 (1216); 2 (736) |
| `p029mik_4sinn` | numeric | 9 | -2 (62); -1 (208); 0 (849); 1 (1121); 2 (562) |
| `p029mik_5image` | numeric | 10 | -2 (288); -1 (415); 0 (1026); 1 (774); 2 (298) |
| `p029mik_6gesund` | numeric | 14 | -2 (43); -1 (119); 0 (771); 1 (1137); 2 (727) |
| `p029mik_7gewicht` | numeric | 8 | -2 (292); -1 (407); 0 (942); 1 (739); 2 (423) |
| `p029mik_8laune` | numeric | 7 | -2 (168); -1 (330); 0 (903); 1 (942); 2 (461) |
| `p029mik_9kochen` | numeric | 4 | -2 (47); -1 (108); 0 (683); 1 (1163); 2 (806) |
| `p029mik_10umwelt` | numeric | 7 | -2 (95); -1 (235); 0 (925); 1 (966); 2 (583) |
| `p029mik_11natur` | numeric | 6 | -2 (79); -1 (163); 0 (768); 1 (1015); 2 (780) |
| `p029mik_12regional` | numeric | 7 | -2 (199); -1 (407); 0 (1121); 1 (747); 2 (330) |

### F30 · Zunächst geht es allgemein um das Thema Umweltschutz bei Konsumentscheidungen. Wie … (S. 27)

**Frage:** Zunächst geht es allgemein um das Thema Umweltschutz bei Konsumentscheidungen. Wie treffen folgende Aussagen auf Sie zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p030green], zufällige Reihenfolge Green Consumption Values Haws 2014 Trifft voll Trifft und ganz eher zu zu Teils/ teils 1produkte Es ist mir wichtig, dass die von mir verwendeten Produkte die +2 +1 0 Umwelt nicht belasten. 2handeln Ich berücksichtige die potenziel- len Umweltauswirkungen meines Handelns bei vielen meiner +2 +1 0 Entscheidungen. 3sorge Meine Kaufgewohnheiten wer- den durch meine Sorge um die +2 +1 0 Umwelt beeinflusst. 4ressourcen Ich bin besorgt darüber, die Ressourcen unseres Planeten +2 +1 0 zu verschwenden. 5umweltbewusst Ich würde mich selbst als umweltbewusst bezeichnen. +2 +1 0 Trifft eher nicht zu Trifft überhaupt nicht zu -1 -2 -1 -2 -1 -1 -1 -2 -2 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p030green_1produkte` | numeric | 5 | -2 (156); -1 (291); 0 (1025); 1 (938); 2 (396) |
| `p030green_2handeln` | numeric | 8 | -2 (194); -1 (360); 0 (996); 1 (871); 2 (382) |
| `p030green_3sorge` | numeric | 5 | -2 (307); -1 (505); 0 (975); 1 (735); 2 (284) |
| `p030green_4ressourcen` | numeric | 9 | -2 (173); -1 (294); 0 (801); 1 (931); 2 (603) |
| `p030green_5umweltbewusst` | numeric | 6 | -2 (112); -1 (250); 0 (969); 1 (1040); 2 (434) |

### F31 · Wie treffen folgende Aussagen zu Bioprodukten auf Sie zu? (S. 27)

**Frage:** Wie treffen folgende Aussagen zu Bioprodukten auf Sie zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p031bio], zufällige Reihenfolge Scale WFI-OeL, Kühn et al, 2008 / Jürkenbeck et al, Román et al, 2020 1lieberbio 2gleich Trifft voll Trifft und ganz eher zu zu Teils/ teils Beim Lebensmitteleinkauf bevorzuge ich Bio-Produkte. +2 +1 0 Zwischen biologisch und kon- ventionell erzeugten Lebensmitteln sehe ich kaum Unter- +2 +1 0 schiede. (R) Trifft eher nicht zu -1 Trifft überhaupt nicht zu -2 -1 -2 3vertrauen 4teuer 5gesund 6biokauf 7besserfuehlen Ich vertraue Herstellern von BioProdukten mehr als Herstellern +2 von Nicht-Bio-Produkten. Ich kaufe keine Bio-Lebensmittel, weil sie mir zu teuer sind. (R) +2 Bio-Lebensmittel sind gesünder als konventionelle Lebensmittel. +2 Wenn immer möglich, kaufe oder konsumiere ich Bio-Le- +2 bensmittel. Ich fühle mich besser, wenn ich Bio-Lebensmittel esse. +2 +1 +1 +1 +1 +1 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p031bio_1lieberbio` | numeric | 11 | -2 (382); -1 (533); 0 (828); 1 (687); 2 (370) |
| `p031bio_2gleich` | numeric | 5 | -2 (309); -1 (726); 0 (946); 1 (585); 2 (240) |
| `p031bio_3vertrauen` | numeric | 11 | -2 (343); -1 (521); 0 (939); 1 (678); 2 (319) |
| `p031bio_4teuer` | numeric | 9 | -2 (349); -1 (552); 0 (797); 1 (645); 2 (459) |
| `p031bio_5gesund` | numeric | 9 | -2 (258); -1 (391); 0 (1069); 1 (759); 2 (325) |
| `p031bio_6biokauf` | numeric | 8 | -2 (394); -1 (524); 0 (815); 1 (713); 2 (357) |
| `p031bio_7besserfuehlen` | numeric | 9 | -2 (396); -1 (479); 0 (780); 1 (731); 2 (416) |

### F32 · Denken Sie an Ihren normalen Einkauf. Wie groß ist der Anteil von Biolebensmitteln an … (S. 28)

**Frage:** Denken Sie an Ihren normalen Einkauf. Wie groß ist der Anteil von Biolebensmitteln an Ihrem gesamten Einkauf?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [v032bioanteil], Ökobarometer 2022 5 4 3 2 1 Ich kaufe (fast) nur Bio Deutlich mehr als die Hälfte Etwa die Hälfte Deutlich weniger als die Hälfte Ich kaufe (fast) nie Bio

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v032bioanteil` | numeric | 18 | 1 (610); 2 (938); 3 (738); 4 (396); 5 (111) |

### F33 · Wie treffen folgende Aussagen zu Fleisch auf Sie zu? (S. 28)

**Frage:** Wie treffen folgende Aussagen zu Fleisch auf Sie zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p033meat], zufällige Reihenfolge, MEAS - Meat Attachment Scale, Graça et al. 2015 1fan 2leid 3recht 4unersaetzlich Trifft voll Trifft und ganz eher zu zu Teils/ teils Ich liebe Mahlzeiten mit Fleisch. +2 +1 0 Beim Essen von Fleisch werde ich an den Tod und das Leid der +2 +1 0 Tiere erinnert. (R) Bezüglich unserer Stellung in der Nahrungskette, haben wir +2 +1 0 das Recht Fleisch zu essen. Fleisch ist in meiner Ernährung nicht verzichtbar. +2 +1 0 Trifft eher nicht zu -1 Trifft überhaupt nicht zu -2 -1 -2 -1 -1 -2 -2 Jetzt kommen noch ein paar allgemeinere Fragen zum Lebensmitteleinkauf und -konsum.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p033meat_1fan` | numeric | 5 | -2 (223); -1 (200); 0 (734); 1 (874); 2 (775) |
| `p033meat_2leid` | numeric | 6 | -2 (793); -1 (710); 0 (629); 1 (366); 2 (307) |
| `p033meat_3recht` | numeric | 7 | -2 (327); -1 (327); 0 (918); 1 (721); 2 (511) |
| `p033meat_4unersaetzlich` | numeric | 4 | -2 (322); -1 (328); 0 (672); 1 (805); 2 (680) |

### F34 · Wie treffen folgende Aussagen auf Sie zu? (S. 28)

**Frage:** Wie treffen folgende Aussagen auf Sie zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p034norm], zufällige Reihenfolge innerhalb der Gruppen, angelehnt an Bearden et al. (1989): Interpersonal Influence Trifft voll Trifft und ganz eher zu zu Teils/ teils Trifft eher nicht zu Trifft überhaupt nicht zu Normative Orientierung: Wunsch sich anzupassen 1andere Ich achte darauf, was andere Menschen in meinem Umfeld beim Lebensmitteleinkauf bevor- +2 +1 0 -1 -2 zugen. 2sozialesumfeld Mir ist es wichtig, dass meine Lebensmittelauswahl nicht von meinem sozialen Umfeld abge- +2 +1 lehnt wird. 3freunde Ich fühle mich wohler, wenn ich ähnliche Lebensmittel kaufe, wie +2 +1 meine Familie oder Freunde. Informative Orientierung: Suche nach sozialer Information 4anderekunden Ich lasse mich bei der Auswahl von Lebensmitteln durch das Verhalten anderer Kund*innen +2 +1 im Laden beeinflussen. 5orientierung Wenn ich mir bei einem Produkt unsicher bin, orientiere ich mich +2 +1 daran, was andere kaufen. 6empfehlung Ich interessiere mich dafür, wel- che Lebensmittel andere für gut +2 +1 oder empfehlenswert halten. 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p034norm_1andere` | numeric | 6 | -2 (1078); -1 (701); 0 (570); 1 (333); 2 (123) |
| `p034norm_2sozialesumfeld` | numeric | 7 | -2 (1073); -1 (658); 0 (583); 1 (343); 2 (147) |
| `p034norm_3freunde` | numeric | 8 | -2 (995); -1 (670); 0 (643); 1 (359); 2 (136) |
| `p034norm_4anderekunden` | numeric | 8 | -2 (1346); -1 (679); 0 (408); 1 (276); 2 (94) |
| `p034norm_5orientierung` | numeric | 9 | -2 (1078); -1 (769); 0 (531); 1 (316); 2 (108) |
| `p034norm_6empfehlung` | numeric | 7 | -2 (729); -1 (602); 0 (813); 1 (498); 2 (162) |

### F35 · Wie treffen folgende Aussagen zum Kochen auf Sie zu? (S. 29)

**Frage:** Wie treffen folgende Aussagen zum Kochen auf Sie zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [p035koch], zufällige Reihenfolge, angepasste Skala von Grunert (Preference for naturalness of European organic consumers, Hemmerling et al. 2015, Nr. 11) angepasst, Forsa, Pflanzenbetonte Ernährung, 2023 Trifft voll Trifft und ganz eher zu zu Teils/ teils Trifft eher nicht zu Trifft überhaupt nicht zu 1ausgezeichnet Ich bin eine ausgezeichnete Köchin/ein ausgezeichneter Koch. +2 +1 0 -1 -2 2hobby Ich liebe es, zu kochen oder zu backen. +2 +1 0 -1 -2 3zutaten Ich weiß genau, welche Zutaten ich brauche um eine hochwer- +2 +1 0 -1 -2 tige Mahlzeit zubereiten. 4erlebnis Ich bin immer auf der Suche nach neuen Geschmackserleb- +2 +1 0 -1 -2 nissen. 5gesund Beim Kochen kann ich sehr gut einschätzen, was gesund ist. +2 +1 0 -1 -2 6stoebern Ich stöbere gern in Kochbüchern oder Koch-Blogs im Internet. +2 +1 0 -1 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `p035koch_1ausgezeichnet` | numeric | 7 | -2 (271); -1 (440); 0 (997); 1 (797); 2 (299) |
| `p035koch_2hobby` | numeric | 11 | -2 (234); -1 (371); 0 (757); 1 (759); 2 (679) |
| `p035koch_3zutaten` | numeric | 5 | -2 (101); -1 (208); 0 (714); 1 (1094); 2 (689) |
| `p035koch_4erlebnis` | numeric | 8 | -2 (178); -1 (414); 0 (908); 1 (859); 2 (444) |
| `p035koch_5gesund` | numeric | 9 | -2 (78); -1 (153); 0 (678); 1 (1228); 2 (665) |
| `p035koch_6stoebern` | numeric | 3 | -2 (434); -1 (482); 0 (730); 1 (704); 2 (458) |

### F36 · Wie gut kennen Sie sich mit Zusatzstoffen in Lebensmitteln aus. Wie treffen folgende … (S. 29)

**Frage:** Wie gut kennen Sie sich mit Zusatzstoffen in Lebensmitteln aus. Wie treffen folgende Aussagen auf Sie zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): ; Matrix [w036zusatz], zufällige Reihenfolge, subj. Wissen; Scale Subjective Knowledge, Flynn Goldsmith 1999 1vielwissen 2qualitaet Trifft voll Trifft und ganz eher zu zu Teils/ teils Ich weiß ziemlich viel über Zusatzstoffe in Lebensmitteln. +2 +1 0 Ich weiß, wie ich die Qualität ei- nes Zusatzstoffes in Lebensmit- +2 +1 0 teln beurteilen kann. Trifft eher nicht zu -1 Trifft überhaupt nicht zu -2 -1 -2 3sicher Ich glaube, ich weiß genug über Zusatzstoffe in Lebensmitteln, um beim Kauf ziemlich sicher zu +2 +1 0 -1 -2 sein. 4nokennen Ich glaube nicht, dass ich mich sehr gut mit Zusatzstoffen in Le- +2 +1 0 -1 -2 bensmitteln auskenne. (R) 5experte *In meinem Freundeskreis ge- höre ich zu den „Experten“ für +2 +1 0 -1 -2 Zusatzstoffe in Lebensmitteln 6wenigwissen Im Vergleich zu den meisten an- deren Menschen weiß ich weniger über Zusatzstoffe in Lebens- +2 +1 0 -1 -2 mitteln. (R) 7vielgehoert Ich habe von den meisten neuen Zusatzstofftrends in Le- +2 +1 0 -1 -2 bensmitteln gehört, die es gibt. 8nichtvielwissen Wenn es um Zusatzstoffe in Le- bensmitteln geht, weiß ich wirk- +2 +1 0 -1 -2 lich nicht viel. (R) 9preiswert Ich kann erkennen, ob ein Le- bensmittelartikel mit Zusatzstoffen seinen Preis wert ist oder +2 +1 0 -1 -2 nicht. Zum Schluss noch einige Fragen zu Ihrer Person.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `w036zusatz_1vielwissen` | numeric | 13 | -2 (309); -1 (659); 0 (1020); 1 (602); 2 (208) |
| `w036zusatz_2qualitaet` | numeric | 7 | -2 (254); -1 (556); 0 (1141); 1 (640); 2 (213) |
| `w036zusatz_3sicher` | numeric | 9 | -2 (208); -1 (486); 0 (1032); 1 (821); 2 (255) |
| `w036zusatz_4nokennen` | numeric | 10 | -2 (215); -1 (575); 0 (970); 1 (707); 2 (334) |
| `w036zusatz_5experte` | numeric | 7 | -2 (774); -1 (732); 0 (792); 1 (363); 2 (143) |
| `w036zusatz_6wenigwissen` | numeric | 8 | -2 (281); -1 (743); 0 (1038); 1 (535); 2 (206) |
| `w036zusatz_7vielgehoert` | numeric | 11 | -2 (306); -1 (642); 0 (1106); 1 (574); 2 (172) |
| `w036zusatz_8nichtvielwissen` | numeric | 8 | -2 (240); -1 (633); 0 (923); 1 (679); 2 (328) |
| `w036zusatz_9preiswert` | numeric | 8 | -2 (255); -1 (513); 0 (1178); 1 (610); 2 (247) |

### F37 · Welchen höchsten Schulabschluss haben Sie? (S. 30)

**Frage:** Welchen höchsten Schulabschluss haben Sie?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [d037schule] -> [D037schule (ohne -oth-], Gesis Demographiestandards 1 2 3 4 5 6 7 0 sonst Noch Schüler Volks-/ Hauptschulabschluss Mittlere Reife/ Realschulabschluss Polytechnische Oberschule Abitur oder vergleichbares Meister/ Techniker/ Fachschulabschluss Fachhochschul-/ Hochschulabschluss Ohne Abschluss Sonstiges und zwar:

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d037schule` | numeric | 16 | 0 (14); 1 (4); 2 (417); 3 (749); 4 (159); 5 (484); 6 (207); 7 (761) |
| `d037schule_other` | character | 2798 | Freitext (nicht zitieren) |

### F38 · Sie sind zurzeit? (S. 30)

**Frage:** Sie sind zurzeit?

**Filter:** gestellt nur, wenn F38 = 3

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [d038erwerb], Gesis Demographiestandards 1 2 3 4 5 6 0 Vollerwerbstätig Teilzeiterwerbstätig In Ausbildung/Studium Rentner/Pensionär Hausfrau/Hausmann Erwerbslos Keine Angabe Und wie wohnen Sie? Fragetyp: Liste (Optionsfelder) [d038erwerbwohnen], Bedingung nur wenn F38 = 3 1 2 3 Wohne noch zu Hause Wohne in einer Wohngemeinschaft (WG) Führe einen eigenen Haushalt

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d038erwerb` | numeric | 15 | 0 (23); 1 (1393); 2 (457); 3 (115); 4 (598); 5 (106); 6 (104) |
| `d038erwerbwohnen` | numeric | 2697 | 1 (43); 2 (28); 3 (43) |

### F39 · Besitzt Ihr Haushalt …? (Mehrfachnennungen möglich) (S. 31)

**Frage:** Besitzt Ihr Haushalt …? (Mehrfachnennungen möglich)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [d039besitz] -> [D039besitz_sum], zufällige Reihenfolge 1tablet 2pkw 3spuel 4smarttv 5balkon 6zweitpkw 7vollautomat 8fussboden 9ebike 10wohnmobil … Tablet oder Laptop … PKW … Spülmaschine … Smart-TV …. Balkon oder Garten … Zweitwagen … Kaffeevollautomat … Fußbodenheizung … E-Bike … Wohnmobil oder Wohnwagen

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d039besitz_1tablet` | numeric | 0 | 0 (387); 1 (2424) |
| `d039besitz_2pkw` | numeric | 0 | 0 (616); 1 (2195) |
| `d039besitz_3spuel` | numeric | 0 | 0 (706); 1 (2105) |
| `d039besitz_4smarttv` | numeric | 0 | 0 (725); 1 (2086) |
| `d039besitz_5balkon` | numeric | 0 | 0 (576); 1 (2235) |
| `d039besitz_6zweitpkw` | numeric | 0 | 0 (2165); 1 (646) |
| `d039besitz_7vollautomat` | numeric | 0 | 0 (1554); 1 (1257) |
| `d039besitz_8fussboden` | numeric | 0 | 0 (2232); 1 (579) |
| `d039besitz_9ebike` | numeric | 0 | 0 (2103); 1 (708) |
| `d039besitz_10wohnmobil` | numeric | 0 | 0 (2693); 1 (118) |
| `D039besitz_sum` | numeric | 0 | 0 (14); 1 (143); 2 (163); 3 (308); 4 (374); 5 (548); 6 (517); 7 (428); 8 (231); 9 (72); 10 (13) |

### F40 · Wie oft im Monat … (S. 31)

**Frage:** Wie oft im Monat …

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [d040luxus], zufällige Reihenfolge 1essen 2mode 3bio 4freizeit … gehen Sie Essen? … kaufen Sie Kleidung, Modeartikel? …kaufen Sie Bio- und Premiumlebensmittel? … nutzen Sie kostenpflichte Freizeitaktivitäten? Öfter als 5mal im Monat 3 3 3 3 4–5-mal im Monat 2 2 2 2 2–3-mal im Monat 1 1 1 1 1-mal im Monat oder seltener 0 0 0 0

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d040luxus_1essen` | numeric | 13 | 0 (1732); 1 (685); 2 (252); 3 (129) |
| `d040luxus_2mode` | numeric | 10 | 0 (2122); 1 (420); 2 (176); 3 (83) |
| `d040luxus_3bio` | numeric | 10 | 0 (1034); 1 (643); 2 (550); 3 (574) |
| `d040luxus_4freizeit` | numeric | 18 | 0 (1646); 1 (608); 2 (325); 3 (214) |

### F41 · Bezogen auf den Fleischkonsum ernähre ich mich... (S. 31)

**Frage:** Bezogen auf den Fleischkonsum ernähre ich mich...

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [v041nofleisch] + , Pflichtfrage, statista 0 1 2 3 4 sonst … ohne Einschränkungen des Fleischkonsums. … flexitarisch (hauptsächlich pflanzenbasierte Lebensmittel und gelegentlich auch Fleisch und Fisch). … vegetarisch (kein Fleisch und kein Fisch). … vegan (keinerlei tierische Produkte). … pescetarisch (kein Fleisch, aber Fisch). Sonstiges und zwar: Darüber hinaus verfolge ich folgende Ernährungsweisen? (Mehrfachnennung möglich) Fragetyp: Mehrfachnennung [v041diat], Pflichtfrage 0nodiaet 1lowcarb Keine besondere Ernährungsweise Low-carb/no-carb (kohlenhydratarm/kohlenhydratfrei) 2laktose 3gluten 4paleo 5ketogen 6rohkost 7makro 8trenn 9frutarisch 10fleisch 11mediterran 12histaminarm 13frukoserarm 14caseinfrei sonst Laktosefrei (z. B. keine Kuhmilchprodukte) Glutenfrei (z. B. keine Weizenprodukte) Paleo ("Steinzeiternährung") Ketogen (fettreich und kohlenhydratarm) Rohkost Makrobiotisch (Schwerpunkt Getreide, Gemüse, Hülsenfrüchte) Trennkost (Eiweiß und Kohlenhydrate getrennt) Frutarisch (nur Früchte, Nüsse und Samen ohne die Pflanze zu zerstören) Fleischbasiert (kaum Pflanzen) Mediterran (viel Pflanzen und Fisch, wenig Fleisch) Histaminarm (bei Unverträglichkeiten) Fruktosearm, FODMAP-arm (bei Reizdarm) Caseinfrei (bei Milcheiweißallergie) Sonstiges und zwar: Fragetyp: Mehrfachnennung

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `v041nofleisch` | numeric | 28 | 0 (1827); 1 (749); 2 (134); 3 (36); 4 (37) |
| `v041nofleisch_other` | character | 2783 | Freitext (nicht zitieren) |
| `v041diaet_0nodiaet` | numeric | 0 | 0 (653); 1 (2158) |
| `v041diaet_1lowcarb` | numeric | 0 | 0 (2645); 1 (166) |
| `v041diaet_2laktose` | numeric | 0 | 0 (2661); 1 (150) |
| `v041diaet_3gluten` | numeric | 0 | 0 (2726); 1 (85) |
| `v041diaet_4paleo` | numeric | 0 | 0 (2796); 1 (15) |
| `v041diaet_5ketogen` | numeric | 0 | 0 (2767); 1 (44) |
| `v041diaet_6rohkost` | numeric | 0 | 0 (2712); 1 (99) |
| `v041diaet_7makro` | numeric | 0 | 0 (2768); 1 (43) |
| `v041diaet_8trenn` | numeric | 0 | 0 (2774); 1 (37) |
| `v041diaet_9frutarisch` | numeric | 0 | 0 (2783); 1 (28) |
| `v041diaet_10fleisch` | numeric | 0 | 0 (2766); 1 (45) |
| `v041diaet_11mediterran` | numeric | 0 | 0 (2637); 1 (174) |
| `v041diaet_12histaminarm` | numeric | 0 | 0 (2777); 1 (34) |
| `v041diaet_13frukoserarm` | numeric | 0 | 0 (2782); 1 (29) |
| `v041diaet_14caseinfrei` | numeric | 0 | 0 (2808); 1 (3) |
| `v041diaet_other` | character | 0 | Freitext (nicht zitieren) |
| `V041nofleischf` | character | 28 | flexitarisch (749); ohne Einschränkungen Fleischkonsums (1827); pescetarisch (37); vegan (36); vegetarisch (134) |

### F42 · Wie viele Personen gehören insgesamt zu Ihrem Haushalt? ____ Personen (S. 32)

**Frage:** Wie viele Personen gehören insgesamt zu Ihrem Haushalt? ____ Personen

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Zahleneingabe [d042hhzahl] -> [D042hhzahlf]

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d042hhzahl` | numeric | 14 | 1 (824); 2 (1181); 3 (438); 4 (273); 5 (81) |
| `D042hhzahlf` | character | 14 | 1 Person (824); 2 Personen (1181); 3 Personen (438); 4 Personen (273); 5 Personen und mehr (81) |

### F43 · Davon Kinder unter 12 Jahren? ___ Anzahl der Kinder (S. 32)

**Frage:** Davon Kinder unter 12 Jahren? ___ Anzahl der Kinder

**Filter:** gestellt nur, wenn F42 = > 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Zahleneingabe [d043kinderzahl] -> [D043kinderzahl (ohne Aussreißer] Bedingung: nur wenn F42 = > 2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d043kinderzahl` | numeric | 917 | von 0 bis 911234567890 |
| `D043kinderzahl` | numeric | 929 | 0 (1446); 1 (253); 2 (152); 3 (23); 4 (5); 5 (1); 9 (2) |

### F44 · Wie würden Sie ganz grob die Größe Ihres Wohnortes mit der folgenden Skala einstufen? (S. 32)

**Frage:** Wie würden Sie ganz grob die Größe Ihres Wohnortes mit der folgenden Skala einstufen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [d044stadt] -> [D044stadtf], statista 1 2 3 4 5 6 Großstadt (größer als 100.000 Einwohner) Große Mittelstadt (größer als 50.000 Einwohner) Große Kleinstadt (größer als 10.000 Einwohner) Kleinstadt (größer als 5.000 Einwohner) Kleinstadt (kleiner als 5.000 Einwohner) Dorf (kleiner als 2.000 Einwohner)

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d044stadt` | numeric | 7 | 1 (1042); 2 (328); 3 (595); 4 (263); 5 (188); 6 (388) |
| `D044stadtf` | character | 7 | Dorf (388); Große Kleinstadt (595); Große Mittelstadt (328); Großstadt (1042); Kleinstadt <5000 (188); Kleinstadt >5000 (263) |

### F45 · Und wo in der Stadt wohnen Sie? (S. 32)

**Frage:** Und wo in der Stadt wohnen Sie?

**Filter:** gestellt nur, wenn F44 = 1 bis 5

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [d045wohnlage], Bedingung: nur wenn F44 = 1 bis 5 1 2 3 Innenstadt Stadtrand Umgebung

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d045wohnlage` | numeric | 435 | 1 (795); 2 (1268); 3 (313) |

### F46 · Wie ist Ihre derzeitige Wohnungssituation? (S. 32)

**Frage:** Wie ist Ihre derzeitige Wohnungssituation?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [d046miete] 1 2 sonst Zur Miete Eigentum Sonstiges und zwar:

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d046miete` | numeric | 16 | 1 (1683); 2 (1112) |
| `d046miete_other` | character | 2804 | Freitext (nicht zitieren) |

### F47 · Wie treffen folgende Aussagen auf Sie zu? (S. 33)

**Frage:** Wie treffen folgende Aussagen auf Sie zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix, zufällige Reihenfolge [d047bigfive], Big Five: Rammstedt et al. 2012 1reserviert 2vertrauen 3bequem 4entspannt 5nokunst 6gesellig 7kritisch 8genau 9unsicher 10fantasie Trifft voll Trifft und ganz eher zu zu Teils/ teils Ich bin eher zurückhaltend, reserviert. +2 +1 0 Ich schenke anderen leicht Ver- trauen, glaube an das Gute im +2 +1 0 Menschen. Ich bin bequem, neige zur Faulheit. +2 +1 0 Ich bin entspannt, lasse mich durch Stress nicht aus der Ruhe +2 +1 0 bringen. Ich habe nur wenig künstlerisches Interesse. +2 +1 0 Ich gehe aus mir heraus, bin gesellig. +2 +1 0 Ich neige dazu, andere zu kritisieren. +2 +1 0 Ich erledige Aufgaben gründlich. +2 +1 0 Ich werde leicht nervös und unsicher. +2 +1 0 Ich habe eine aktive Vorstellungskraft, bin fantasievoll. +2 +1 0 Trifft eher nicht zu -1 Trifft überhaupt nicht zu -2 -1 -2 -1 -2 -1 -2 -1 -1 -1 -1 -1 -1 -2 -2 -2 -2 -2 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d047bigfive_1reserviert` | numeric | 11 | -2 (234); -1 (523); 0 (897); 1 (791); 2 (355) |
| `d047bigfive_2vertrauen` | numeric | 4 | -2 (305); -1 (504); 0 (874); 1 (862); 2 (262) |
| `d047bigfive_3bequem` | numeric | 8 | -2 (535); -1 (676); 0 (806); 1 (585); 2 (201) |
| `d047bigfive_4entspannt` | numeric | 7 | -2 (171); -1 (438); 0 (935); 1 (870); 2 (390) |
| `d047bigfive_5nokunst` | numeric | 7 | -2 (412); -1 (621); 0 (711); 1 (638); 2 (422) |
| `d047bigfive_6gesellig` | numeric | 6 | -2 (206); -1 (499); 0 (949); 1 (807); 2 (344) |
| `d047bigfive_7kritisch` | numeric | 4 | -2 (373); -1 (765); 0 (968); 1 (557); 2 (144) |
| `d047bigfive_8genau` | numeric | 10 | -2 (24); -1 (66); 0 (443); 1 (1155); 2 (1113) |
| `d047bigfive_9unsicher` | numeric | 7 | -2 (402); -1 (808); 0 (828); 1 (540); 2 (226) |
| `d047bigfive_10fantasie` | numeric | 7 | -2 (106); -1 (291); 0 (750); 1 (1015); 2 (642) |

### F48 · Können Sie uns bitte Ihre Postleitzahl nennen? _________ (fünfstelliges Nummernfeld) … (S. 33)

**Frage:** Können Sie uns bitte Ihre Postleitzahl nennen? _________ (fünfstelliges Nummernfeld) [d048plz]

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Zahleneingabe [d048plz]

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d048plz` | numeric | 24 | von 0 bis 99998 |
| `D048plzgebiet` | numeric | 24 | 0 (252); 1 (307); 2 (373); 3 (292); 4 (358); 5 (251); 6 (285); 7 (242); 8 (201); 9 (226) |

### F49 · Wie hoch ist Ihr Netto-Haushaltseinkommen? (S. 33)

**Frage:** Wie hoch ist Ihr Netto-Haushaltseinkommen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Optionsfelder) [d049einkommen], statista (VuMA) NA 1 2 3 4 5 6 7 8 9 10 11 Keine Angabe Unter 500 € 500 bis unter 1.000 € 1.000 bis unter 1.500 € 1.500 bis unter 2.000 € 2.000 bis unter 2.500 € 2.500 bis unter 3.000 € 3.000 bis unter 3.500 € 3.500 bis unter 4.000 € 4.000 bis unter 4.500 € 4.500 bis unter 5.000 € 5.000 € und mehr Vielen Dank für die Teilnahme. B Spezialthema-1: Allgemeine Markt- und Wettbewerbsanalyse Tafelschokolade (F50-F62) Bedingung: nur wenn F6 Tafelschokolade 3 oder 2 oder 1, wird je nach Frage gekauft/verzehrt noch angepasst (nur bei Anpassung wird die Bedingung ausgewiesen) Es folgen nun ein paar Fragen zum Einkauf und Konsum von Tafelschokoladen.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d049einkommen` | numeric | 100 | 1 (32); 2 (128); 3 (233); 4 (273); 5 (332); 6 (350); 7 (244); 8 (298); 9 (256); 10 (274); 11 (291) |

### F50 · Zu welchen Anlässen kaufen Sie …? (Mehrfachnennungen möglich) (S. 34)

**Frage:** Zu welchen Anlässen kaufen Sie …? (Mehrfachnennungen möglich)

**Filter:** gestellt nur, wenn F6 Tafelsckokolade = 3 oder 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [s050anlass2] -> [S050anlass2], AB-Test [ab050anlass2] -> [AB050anlass2f], zufällige Reihenfolge, Bedingung: nur wenn F6 Tafelsckokolade = 3 oder 2 1essen Einfach nur so zum Essen 2kinder Für Kinder 3belohnung Als Belohnung für mich 4verschenken Zum Verschenken 5feiern Zu Feiern/Feiertagen 6abend Gemütlicher Abend 7snack Als Snack 8no Kaufe ich nicht sonst Sonstiges und zwar: AB-Test 1 konventionelle Tafelschokolade 2 vegane Tafelschokolade

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab050anlass2` | numeric | 2551 | 1 (133); 2 (127) |
| `AB050anlass2f` | character | 2551 | konventionell (133); vegan (127) |
| `S050anlass2_1essen` | numeric | 2551 | 0 (173); 1 (87) |
| `S050anlass2_2kinder` | numeric | 2551 | 0 (216); 1 (44) |
| `S050anlass2_3belohnung` | numeric | 2551 | 0 (182); 1 (78) |
| `S050anlass2_4verschenken` | numeric | 2551 | 0 (176); 1 (84) |
| `S050anlass2_5feiern` | numeric | 2551 | 0 (212); 1 (48) |
| `S050anlass2_6abend` | numeric | 2551 | 0 (181); 1 (79) |
| `S050anlass2_7snack` | numeric | 2551 | 0 (197); 1 (63) |
| `S050anlass2_8no` | numeric | 2551 | 0 (190); 1 (70) |

### F51 · Stellen Sie sich einmal eine Situation vor, in der Sie … kaufen möchten. Welche der … (S. 34)

**Frage:** Stellen Sie sich einmal eine Situation vor, in der Sie … kaufen möchten. Welche der folgenden Kaufkriterien sind Ihnen bei … besonders wichtig? Schieben Sie die 7 wichtigsten Kaufkriterien in eine Rangfolge, das wichtigste Einkaufkriterium nach oben, das unwichtigste nach unten.

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Rangliste [s051krit2] / [S051krit2], AB-Test [ab051krit2] -> [AB051krit2f], zufällige Reihenfolge Limesurvey -Rangvar.name 1geschmack 2regio 3preis 4natur 5quali 6bio 7vegan 8fair 9gesund 10vertrauen 11nachhaltig 12co2 13kakao 14palmoel 15zucker 16ansprechend 17kakaoanteil Besonders guter Geschmack Regionalität Günstiger Preis Natürlich (keine künstlichen Inhaltsstoffe) Hohe Qualität der Zutaten Bioqualität/Ökoanbau Vegan Fair gehandelt Gesundheitskriterien (z.B. Gluten-/Lactosefrei) Attraktive Marke Nachhaltige Verpackung Geringer CO2-Fußabdruck Kakaofrei Palmölfrei Geringer Zuckergehalt Ansprechendes Verpackungsdesign Hoher Kakaoanteil R Kodierzahl 1 2 3 4 5 6 7 R-Var,name rang1 rang2 rang3 rang4 rang5 rang6 rang7 AB-Test 1 konventionelle Tafelschokolade 2 vegane Tafelschokolade

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab051krit2` | numeric | 2536 | 1 (139); 2 (136) |
| `s051krit1_1` | numeric | 2675 | 1 (30); 2 (6); 3 (29); 4 (6); 5 (13); 7 (4); 8 (5); 9 (2); 10 (9); 11 (1); 12 (3); 14 (9); 15 (4); 16 (3); 17 (12) |
| `s051krit1_2` | character | 2674 | Freitext (nicht zitieren) |
| `s051krit1_3` | character | 2675 | Freitext (nicht zitieren) |
| `s051krit1_4` | character | 2686 | Freitext (nicht zitieren) |
| `s051krit1_5` | numeric | 2700 | 1 (13); 2 (8); 3 (8); 4 (11); 5 (14); 7 (1); 8 (11); 9 (4); 10 (5); 11 (4); 12 (4); 14 (4); 15 (9); 16 (10); 17 (5) |
| `s051krit1_6` | character | 2707 | Freitext (nicht zitieren) |
| `s051krit1_7` | character | 2713 | Freitext (nicht zitieren) |
| `s051krit1_8` | logical | 2811 | leer |
| `s051krit1_9` | logical | 2811 | leer |
| `s051krit1_10` | logical | 2811 | leer |
| `s051krit1_11` | logical | 2811 | leer |
| `s051krit1_12` | logical | 2811 | leer |
| `s051krit1_13` | logical | 2811 | leer |
| `s051krit1_14` | logical | 2811 | leer |
| `s051krit1_15` | logical | 2811 | leer |
| `s051krit1_16` | logical | 2811 | leer |
| `s051krit1_17` | logical | 2811 | leer |
| `s051krit2_1` | numeric | 2689 | von 1 bis 17 |
| `s051krit2_2` | numeric | 2692 | von 1 bis 17 |
| `s051krit2_3` | numeric | 2694 | von 1 bis 17 |
| `s051krit2_4` | numeric | 2701 | von 1 bis 17 |
| `s051krit2_5` | numeric | 2710 | von 1 bis 17 |
| `s051krit2_6` | numeric | 2716 | von 1 bis 17 |
| `s051krit2_7` | numeric | 2728 | von 1 bis 17 |
| `s051krit2_8` | logical | 2811 | leer |
| `s051krit2_9` | logical | 2811 | leer |
| `s051krit2_10` | logical | 2811 | leer |
| `s051krit2_11` | logical | 2811 | leer |
| `s051krit2_12` | logical | 2811 | leer |
| `s051krit2_13` | logical | 2811 | leer |
| `s051krit2_14` | logical | 2811 | leer |
| `s051krit2_15` | logical | 2811 | leer |
| `s051krit2_16` | logical | 2811 | leer |
| `s051krit2_17` | logical | 2811 | leer |
| `AB051krit2f` | character | 2536 | konventionell (139); vegan (136) |
| `S051krit2_1geschmack` | numeric | 2612 | 1 (48); 2 (58); 3 (31); 4 (21); 5 (20); 6 (13); 7 (8) |
| `S051krit2_2regio` | numeric | 2745 | 1 (10); 2 (3); 3 (10); 4 (14); 5 (12); 6 (9); 7 (8) |
| `S051krit2_3preis` | numeric | 2646 | 1 (54); 2 (26); 3 (27); 4 (19); 5 (16); 6 (7); 7 (16) |
| `S051krit2_4natur` | numeric | 2689 | 1 (11); 2 (17); 3 (20); 4 (20); 5 (24); 6 (19); 7 (11) |
| `S051krit2_5quali` | numeric | 2641 | 1 (22); 2 (39); 3 (30); 4 (35); 5 (17); 6 (18); 7 (9) |
| `S051krit2_7vegan` | numeric | 2775 | 1 (15); 2 (5); 3 (1); 4 (2); 5 (5); 6 (3); 7 (5) |
| `S051krit2_8fair` | numeric | 2706 | 1 (10); 2 (16); 3 (14); 4 (17); 5 (18); 6 (17); 7 (13) |
| `S051krit2_9gesund` | numeric | 2773 | 1 (6); 2 (3); 3 (6); 4 (4); 5 (4); 6 (7); 7 (8) |
| `S051krit2_10vertrauen` | numeric | 2711 | 1 (12); 2 (7); 3 (22); 4 (13); 5 (13); 6 (18); 7 (15) |
| `S051krit2_11nachhaltig` | numeric | 2748 | 1 (3); 2 (10); 3 (4); 4 (12); 5 (11); 6 (15); 7 (8) |
| `S051krit2_12co2` | numeric | 2762 | 1 (6); 2 (3); 3 (6); 4 (8); 5 (7); 6 (9); 7 (10) |
| `S051krit2_13kakao` | numeric | 2789 | 2 (5); 3 (1); 4 (6); 5 (2); 6 (3); 7 (5) |
| `S051krit2_14palmoel` | numeric | 2715 | 1 (21); 2 (12); 3 (18); 4 (13); 5 (9); 6 (11); 7 (12) |
| `S051krit2_15zucker` | numeric | 2716 | 1 (11); 2 (11); 3 (14); 4 (11); 5 (16); 6 (16); 7 (16) |
| `S051krit2_16ansprechend` | numeric | 2735 | 1 (5); 2 (7); 3 (11); 4 (9); 5 (17); 6 (16); 7 (11) |
| `S051krit2_17kakaoanteil` | numeric | 2685 | 1 (18); 2 (25); 3 (20); 4 (25); 5 (14); 6 (12); 7 (12) |

### F52 · Stellen Sie sich eine Person vor, die sich in Europa nicht mit Schokoladenmarken auskennt … (S. 35)

**Frage:** Stellen Sie sich eine Person vor, die sich in Europa nicht mit Schokoladenmarken auskennt und eine Empfehlung von Ihnen möchte. Betrachten Sie jetzt einmal dies Produkt: Wie wahrscheinlich würden Sie dieser Person diese … aus Ihrer Erfahrung heraus empfehlen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [s052nps2] -> [S052nps2], [Net Promotor Score NPS – 10er Skala], AB-Test [ab052nps2] -> [AB052nps2f], Variante A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen 10 = Werde ich höchstwahr- scheinlich empfehlen 0 = Werde ich höchstwahrscheinlich nicht empfehlen 10 9 8 7 6 5 4 3 2 1 0 v006gekauft_2ts AB-Test 1 konventionelle. Tafelschokolade 100g Vollmilch, 1,99 € 2 Zuckerreduzierte Tafelschokolade 100g Vollmilch Zuckerreduziert, 2,69 €

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab052nps2` | numeric | 2536 | 1 (136); 2 (139) |
| `S052nps2` | numeric | 2538 | 0 (68); 1 (14); 2 (20); 3 (20); 4 (13); 5 (26); 6 (17); 7 (28); 8 (25); 9 (15); 10 (27) |

### F53 · Und was ist der Hauptgrund für die eben abgegebene Bewertung? (S. 35)

**Frage:** Und was ist der Hauptgrund für die eben abgegebene Bewertung?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): langer freier Text [s053npsgrund2] -> [S053grund2] , AB-Test [ab052nps2] -> -> [AB052nps2f], [Net Promotor Score NPS – Begründung], Variante A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen AB-Test 1 konventionelle. Tafelschokolade 100g Vollmilch, 1,99 € 2 Zuckerreduzierte Tafelschokolade 100g Vollmilch Zuckerreduziert, 2,69 €

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `S053grund2` | character | 2565 | Freitext (nicht zitieren) |

### F54 · Jetzt sehen Sie hier ein anderes Produkt: Wie sicher werden Sie dieses Produkt in den … (S. 36)

**Frage:** Jetzt sehen Sie hier ein anderes Produkt: Wie sicher werden Sie dieses Produkt in den nächsten 12 Monaten kaufen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [s054kaufritter2] -> [S054kaufritter2], AB-Test [ab054kaufritter2] -> [AB054kaufritter2f], Variante A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen +4 = Werde ich sicher kaufen 0 = Unentschieden -4 = Werde ich sicher nicht kaufen 4 3 2 1 0 -1 -2 -3 -4 AB-Test 1 konventionelle Rittersport 100 g, 1,99 € 2 vegane Rittersport 100g 1,99 €

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `AB054kaufritter2f` | character | 2536 | konventionelle Rittersport 1,99€ (126); vegane Rittersport 1,99€ (149) |
| `S054kaufritter2` | numeric | 2536 | -4 (65); -3 (21); -2 (16); -1 (16); 0 (58); 1 (29); 2 (25); 3 (20); 4 (25) |

### F55 · Können Sie einmal alle Marken von Tafelschokolade nennen, die Ihnen spontan einfallen? (S. 37)

**Frage:** Können Sie einmal alle Marken von Tafelschokolade nennen, die Ihnen spontan einfallen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Langer freier Text, [s055ungestuetzt]

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s055ungestuetzt` | character | 2544 | Freitext (nicht zitieren) |

### F56 · Welche der nachfolgenden Marken von Tafelschokolade haben Sie schon mal gesehen? … (S. 37)

**Frage:** Welche der nachfolgenden Marken von Tafelschokolade haben Sie schon mal gesehen? (Mehrfachnennung möglich)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [s056gestuetzt], zufällige Reihenfolge, 1alnatura Alnatura 2alpia Alpia 3heidel 4schokojungs 5feodora 6fincarre 7frankonia 8gepa 9gug 10hachez 11ja 12jedentag Confiserie Heidel Die drei Schokojungs Feodora Fin-carre Frankonia Gepa GUT&GÜNSTIG Hachez Ja Jeden Tag 13kinder 14kklassik 15lindt 16lindor 17marabou 18merci 19meybona 20milka 21moserroth 22rapunzel 23rewebeste 24rewefrei 25ritter 26sarroti 27schogetten 28theyo 29vivani 30xucker Kinderschokolade K-Klassik Lindt Lindor Marabou Merci Meybona Milka Moser-Roth Rapunzel Rewe – Beste Wahl Rewe - frei Rittersport Sarroti Schogetten Theyo Vivani Xucker 31windel Windel Sonst Sonstige und zwar:

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s056gestuetzt_1alnatura` | numeric | 2536 | 0 (186); 1 (89) |
| `s056gestuetzt_2alpia` | numeric | 2536 | 0 (91); 1 (184) |
| `s056gestuetzt_3heidel` | numeric | 2536 | 0 (235); 1 (40) |
| `s056gestuetzt_4schokojungs` | numeric | 2536 | 0 (274); 1 (1) |
| `s056gestuetzt_5feodora` | numeric | 2536 | 0 (175); 1 (100) |
| `s056gestuetzt_6fincarre` | numeric | 2536 | 0 (245); 1 (30) |
| `s056gestuetzt_7frankonia` | numeric | 2536 | 0 (268); 1 (7) |
| `s056gestuetzt_8gepa` | numeric | 2536 | 0 (249); 1 (26) |
| `s056gestuetzt_9gug` | numeric | 2536 | 0 (126); 1 (149) |
| `s056gestuetzt_10hachez` | numeric | 2536 | 0 (172); 1 (103) |
| `s056gestuetzt_11ja` | numeric | 2536 | 0 (119); 1 (156) |
| `s056gestuetzt_12jedentag` | numeric | 2536 | 0 (248); 1 (27) |
| `s056gestuetzt_13kinder` | numeric | 2536 | 0 (40); 1 (235) |
| `s056gestuetzt_14kklassik` | numeric | 2536 | 0 (171); 1 (104) |
| `s056gestuetzt_15lindt` | numeric | 2536 | 0 (52); 1 (223) |
| `s056gestuetzt_16lindor` | numeric | 2536 | 0 (61); 1 (214) |
| `s056gestuetzt_17marabou` | numeric | 2536 | 0 (165); 1 (110) |
| `s056gestuetzt_18merci` | numeric | 2536 | 0 (62); 1 (213) |
| `s056gestuetzt_19meybona` | numeric | 2536 | 0 (270); 1 (5) |
| `s056gestuetzt_20milka` | numeric | 2536 | 0 (18); 1 (257) |
| `s056gestuetzt_21moserroth` | numeric | 2536 | 0 (139); 1 (136) |
| `s056gestuetzt_22rapunzel` | numeric | 2536 | 0 (241); 1 (34) |
| `s056gestuetzt_23rewebeste` | numeric | 2536 | 0 (172); 1 (103) |
| `s056gestuetzt_24rewefrei` | numeric | 2536 | 0 (250); 1 (25) |
| `s056gestuetzt_25ritter` | numeric | 2536 | 0 (23); 1 (252) |
| `s056gestuetzt_26sarroti` | numeric | 2536 | 0 (115); 1 (160) |
| `s056gestuetzt_27schogetten` | numeric | 2536 | 0 (83); 1 (192) |
| `s056gestuetzt_28theyo` | numeric | 2536 | 0 (273); 1 (2) |
| `s056gestuetzt_29vivani` | numeric | 2536 | 0 (255); 1 (20) |
| `s056gestuetzt_30xucker` | numeric | 2536 | 0 (265); 1 (10) |
| `s056gestuetzt_31windel` | numeric | 2536 | 0 (247); 1 (28) |
| `s056gestuetzt_other` | character | 2536 | Freitext (nicht zitieren) |

### F57 · Und welche ist Ihre absolute Lieblingstafelschokoladenmarke? (S. 39)

**Frage:** Und welche ist Ihre absolute Lieblingstafelschokoladenmarke?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Liste (Klappbox) [s057liebmarken] 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 Alnatura Alpia Confiserie Heidel Die drei Schokojungs Feodora Fin-carre Frankonia Gepa GUT&GÜNSTIG Hachez Ja Jeden Tag Kinderschokolade K-Klassik Lindt Lindor Marabou Merci Meybona Milka Moser-Roth Rapunzel Rewe – Beste Wahl Rewe - frei Rittersport Sarroti Schogetten Theyo Vivani Xucker Windel Ich habe keine Lieblingsmarke

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s057liebmarken` | numeric | 2537 | von 1 bis 32 |

### F58 · Wie stark treffen die folgenden Eigenschaften (z.B. hochwertige Geschmacksqualität, … (S. 39)

**Frage:** Wie stark treffen die folgenden Eigenschaften (z.B. hochwertige Geschmacksqualität, praktische Verpackung) auf die folgenden Marken zu? Bitte klicken Sie eine 0 an, wenn die Eigenschaften gar nicht zutreffen und eine 10, wenn sie ideal zutreffen. Sie können Ihre Meinung auch abstufen. Bitte antworten Sie auch, wenn Sie das Produkt nicht kennen und geben in diesem Fall an, was Sie von der Schokolade erwarten, wenn Sie diese im Regal entdecken.

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix (Zahlen) [s058matrix], zufällige Reihenfolge Marken/ Eigenschaften Milka Lindt Alnatura Jeden (b) Tag Moser Roth Frankonia (v) 1geschmack Hochwertige Geschmacksqualität 2preiswert Günstiger Preis 3natur Natürliche Zutaten 4trends Innovativ, setzt Trends 5design Ästhetisch ansprechendes Verpackungsdesign 6umwelt Umweltfreundliche und nachhaltige Produktion

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s058matrix_1geschmack_1milka` | numeric | 2555 | 1 (26); 2 (19); 3 (15); 4 (9); 5 (25); 6 (33); 7 (28); 8 (38); 9 (20); 10 (43) |
| `s058matrix_1geschmack_2lindt` | numeric | 2552 | 1 (12); 2 (7); 3 (7); 4 (8); 5 (27); 6 (18); 7 (22); 8 (49); 9 (45); 10 (64) |
| `s058matrix_1geschmack_3alnatura` | numeric | 2563 | 1 (17); 2 (12); 3 (13); 4 (18); 5 (53); 6 (35); 7 (31); 8 (44); 9 (11); 10 (14) |
| `s058matrix_1geschmack_4jedentag` | numeric | 2569 | 1 (29); 2 (28); 3 (32); 4 (26); 5 (58); 6 (27); 7 (12); 8 (16); 9 (7); 10 (7) |
| `s058matrix_1geschmack_5moserroth` | numeric | 2555 | 1 (9); 2 (10); 3 (12); 4 (27); 5 (45); 6 (38); 7 (44); 8 (31); 9 (21); 10 (19) |
| `s058matrix_1geschmack_6frankonia` | numeric | 2566 | 1 (35); 2 (29); 3 (21); 4 (33); 5 (40); 6 (40); 7 (19); 8 (13); 9 (5); 10 (10) |
| `s058matrix_2preiswert_1milka` | numeric | 2550 | 1 (57); 2 (30); 3 (30); 4 (34); 5 (29); 6 (22); 7 (22); 8 (13); 9 (9); 10 (15) |
| `s058matrix_2preiswert_2lindt` | numeric | 2550 | 1 (71); 2 (41); 3 (32); 4 (31); 5 (29); 6 (19); 7 (10); 8 (10); 9 (8); 10 (10) |
| `s058matrix_2preiswert_3alnatura` | numeric | 2559 | 1 (59); 2 (29); 3 (37); 4 (32); 5 (43); 6 (18); 7 (14); 8 (10); 9 (2); 10 (8) |
| `s058matrix_2preiswert_4jedentag` | numeric | 2558 | 1 (21); 2 (11); 3 (17); 4 (31); 5 (42); 6 (23); 7 (19); 8 (38); 9 (29); 10 (22) |
| `s058matrix_2preiswert_5moserroth` | numeric | 2553 | 1 (27); 2 (19); 3 (26); 4 (28); 5 (27); 6 (37); 7 (34); 8 (36); 9 (17); 10 (7) |
| `s058matrix_2preiswert_6frankonia` | numeric | 2558 | 1 (50); 2 (28); 3 (31); 4 (35); 5 (42); 6 (27); 7 (16); 8 (10); 9 (8); 10 (6) |
| `s058matrix_3natur_1milka` | numeric | 2551 | 1 (27); 2 (19); 3 (26); 4 (26); 5 (52); 6 (31); 7 (21); 8 (30); 9 (8); 10 (20) |
| `s058matrix_3natur_2lindt` | numeric | 2550 | 1 (16); 2 (9); 3 (23); 4 (15); 5 (47); 6 (21); 7 (45); 8 (39); 9 (16); 10 (30) |
| `s058matrix_3natur_3alnatura` | numeric | 2554 | 1 (16); 2 (11); 3 (13); 4 (14); 5 (29); 6 (22); 7 (41); 8 (42); 9 (29); 10 (40) |
| `s058matrix_3natur_4jedentag` | numeric | 2560 | 1 (29); 2 (21); 3 (33); 4 (34); 5 (57); 6 (30); 7 (18); 8 (16); 9 (3); 10 (10) |
| `s058matrix_3natur_5moserroth` | numeric | 2554 | 1 (11); 2 (10); 3 (20); 4 (34); 5 (47); 6 (42); 7 (35); 8 (31); 9 (13); 10 (14) |
| `s058matrix_3natur_6frankonia` | numeric | 2562 | 1 (28); 2 (16); 3 (20); 4 (22); 5 (42); 6 (25); 7 (37); 8 (24); 9 (16); 10 (19) |
| `s058matrix_4trends_1milka` | numeric | 2552 | 1 (34); 2 (21); 3 (22); 4 (12); 5 (45); 6 (26); 7 (29); 8 (28); 9 (17); 10 (25) |
| `s058matrix_4trends_2lindt` | numeric | 2551 | 1 (14); 2 (15); 3 (12); 4 (26); 5 (47); 6 (23); 7 (36); 8 (40); 9 (19); 10 (28) |
| `s058matrix_4trends_3alnatura` | numeric | 2555 | 1 (30); 2 (19); 3 (27); 4 (25); 5 (54); 6 (27); 7 (22); 8 (33); 9 (13); 10 (6) |
| `s058matrix_4trends_4jedentag` | numeric | 2567 | 1 (60); 2 (27); 3 (35); 4 (21); 5 (50); 6 (18); 7 (15); 8 (11); 9 (1); 10 (6) |
| `s058matrix_4trends_5moserroth` | numeric | 2557 | 1 (28); 2 (15); 3 (29); 4 (23); 5 (50); 6 (27); 7 (28); 8 (32); 9 (10); 10 (12) |
| `s058matrix_4trends_6frankonia` | numeric | 2564 | 1 (33); 2 (26); 3 (24); 4 (26); 5 (45); 6 (36); 7 (25); 8 (20); 9 (4); 10 (8) |
| `s058matrix_5design_1milka` | numeric | 2550 | 1 (18); 2 (15); 3 (21); 4 (21); 5 (33); 6 (31); 7 (40); 8 (34); 9 (15); 10 (33) |
| `s058matrix_5design_2lindt` | numeric | 2550 | 1 (11); 2 (7); 3 (6); 4 (9); 5 (17); 6 (37); 7 (27); 8 (70); 9 (33); 10 (44) |
| `s058matrix_5design_3alnatura` | numeric | 2552 | 1 (16); 2 (22); 3 (21); 4 (26); 5 (36); 6 (30); 7 (43); 8 (38); 9 (13); 10 (14) |
| `s058matrix_5design_4jedentag` | numeric | 2564 | 1 (45); 2 (38); 3 (41); 4 (25); 5 (38); 6 (20); 7 (13); 8 (16); 9 (4); 10 (7) |
| `s058matrix_5design_5moserroth` | numeric | 2554 | 1 (12); 2 (10); 3 (9); 4 (18); 5 (35); 6 (36); 7 (47); 8 (43); 9 (27); 10 (20) |
| `s058matrix_5design_6frankonia` | numeric | 2558 | 1 (26); 2 (29); 3 (34); 4 (29); 5 (37); 6 (34); 7 (28); 8 (19); 9 (8); 10 (9) |
| `s058matrix_6umwelt_1milka` | numeric | 2555 | 1 (38); 2 (31); 3 (33); 4 (24); 5 (52); 6 (19); 7 (20); 8 (15); 9 (10); 10 (14) |
| `s058matrix_6umwelt_2lindt` | numeric | 2553 | 1 (25); 2 (17); 3 (25); 4 (27); 5 (62); 6 (18); 7 (36); 8 (23); 9 (12); 10 (13) |
| `s058matrix_6umwelt_3alnatura` | numeric | 2556 | 1 (19); 2 (10); 3 (14); 4 (17); 5 (44); 6 (34); 7 (27); 8 (44); 9 (21); 10 (25) |
| `s058matrix_6umwelt_4jedentag` | numeric | 2567 | 1 (40); 2 (29); 3 (39); 4 (33); 5 (52); 6 (11); 7 (20); 8 (9); 9 (4); 10 (7) |
| `s058matrix_6umwelt_5moserroth` | numeric | 2558 | 1 (27); 2 (16); 3 (22); 4 (33); 5 (54); 6 (26); 7 (30); 8 (27); 9 (11); 10 (7) |
| `s058matrix_6umwelt_6frankonia` | numeric | 2558 | 1 (25); 2 (23); 3 (26); 4 (23); 5 (51); 6 (29); 7 (33); 8 (22); 9 (8); 10 (13) |

### F59 · Wie stimmen Sie folgenden Aussagen zu Marken von Tafelschokoladen zu? (S. 40)

**Frage:** Wie stimmen Sie folgenden Aussagen zu Marken von Tafelschokoladen zu?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [s059marke], zufällige Reihenfolge, perceived brand parity Scale Muncy 1996, Handbuch of scale Stimme voll und ganz zu Stimme eher zu Teils/ teils 1nounterschied Ich kann mir keine Unterschiede zwischen den großen Marken von Tafelschokoladen vorstel- +2 +1 0 len. 2bigunterschied Für mich gibt es große Unter- schiede zwischen den verschiedenen Marken der Tafelschoko- +2 +1 0 laden. (R) 3preis Der einzige Unterschied zwi- schen den großen Marken von +2 +1 0 Tafelschokoladen ist der Preis. 4fastgleich Tafelschokolade ist Tafelschoko- lade; Die meisten Marken sind im +2 +1 0 Grunde gleich. 5gleich Alle großen Marken von Tafelschokolade sind gleich. +2 +1 0 Stimme eher nicht zu Stimme überhaupt nicht zu -1 -2 -1 -2 -1 -1 -1 -2 -2 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s059marke_1nounterschied` | numeric | 2537 | -2 (64); -1 (94); 0 (64); 1 (44); 2 (8) |
| `s059marke_2bigunterschied` | numeric | 2537 | -2 (4); -1 (25); 0 (48); 1 (111); 2 (86) |
| `s059marke_3preis` | numeric | 2536 | -2 (50); -1 (70); 0 (75); 1 (51); 2 (29) |
| `s059marke_4fastgleich` | numeric | 2536 | -2 (64); -1 (88); 0 (61); 1 (52); 2 (10) |
| `s059marke_5gleich` | numeric | 2536 | -2 (62); -1 (92); 0 (57); 1 (53); 2 (11) |

### F60 · Stellen Sie sich vor, Sie sehen im Supermarktregal Tafelschokoladen mit Herstellermarken … (S. 40)

**Frage:** Stellen Sie sich vor, Sie sehen im Supermarktregal Tafelschokoladen mit Herstellermarken und Handelsmarken. Schauen Sie sich beispielhaft die folgenden beiden Marken von Tafelschokolade an. Welche Kriterien passen besser zur Herstellermarke und welche besser zur Handelsmarke?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [s060handel], zufällige Reihenfolge, Lebensmittelzeitung Handelsmarkemmonitor 2024 Herstellermarke Handelsmarke Passt besser zur Hersteller- marke Unentschieden Passt besser zu Handels- marke 1geschmack 2design 3preiswert 4sozial 5vielfalt 6marke 7trends 8vertrauen 9nachhaltig 10geschenk Hochwertige Geschmacksqualität +2 +1 Ansprechendes Verpackungsdesign +2 +1 Günstiger Preis +2 +1 Beachtet soziale Umwelt der Kakao-Anbauern +2 +1 Große Produktvielfalt +2 +1 Attraktive Marke +2 +1 Innovativ, setzt Trends +2 +1 Wirkt vertrauensvoll +2 +1 Nachhaltig +2 +1 Eignet sich als Geschenk +2 +1 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2 0 -1 -2

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s060handel_1geschmack` | numeric | 2538 | -2 (5); -1 (10); 0 (115); 1 (66); 2 (77) |
| `s060handel_2design` | numeric | 2538 | -2 (7); -1 (15); 0 (106); 1 (64); 2 (81) |
| `s060handel_3preiswert` | numeric | 2540 | -2 (136); -1 (42); 0 (58); 1 (19); 2 (16) |
| `s060handel_4sozial` | numeric | 2537 | -2 (5); -1 (11); 0 (177); 1 (39); 2 (42) |
| `s060handel_5vielfalt` | numeric | 2538 | -2 (7); -1 (14); 0 (93); 1 (74); 2 (85) |
| `s060handel_6marke` | numeric | 2538 | -2 (8); -1 (17); 0 (93); 1 (79); 2 (76) |
| `s060handel_7trends` | numeric | 2538 | -2 (3); -1 (11); 0 (119); 1 (74); 2 (66) |
| `s060handel_8vertrauen` | numeric | 2539 | -2 (5); -1 (9); 0 (133); 1 (62); 2 (63) |
| `s060handel_9nachhaltig` | numeric | 2538 | -2 (5); -1 (13); 0 (183); 1 (37); 2 (35) |
| `s060handel_10geschenk` | numeric | 2538 | -2 (5); -1 (10); 0 (74); 1 (60); 2 (124) |

### F61 · Stellen Sie sich eine Situation vor, in der Sie eine Tafelschokolade mit Zuckerersatz … (S. 41)

**Frage:** Stellen Sie sich eine Situation vor, in der Sie eine Tafelschokolade mit Zuckerersatz kaufen möchten (z.B. als Geschenk). Wie würden Sie sich gerne über Tafelschokolade mit Zuckersatz informieren? (Mehrfachnennungen möglich)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [s061info], zufällige Reihenfolge 1produkt 2postwurf 3internet 4tv 5zeitschrift 6empfehlung 7socialmedia sonst Beim Einkaufen (z.B. Zutatenliste) Papierwerbung/Postwurfsendungen Internetseiten von Lebensmittelhändlern/Markenherstellern Werbespots im Fernsehen In Zeitschriften (z.B. Essen und Trinken) Weiterempfehlung von Freunden/Bekannten Social Media (z.B. Instagram, Facebook) Sonstiges und zwar:

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s061info_1produkt` | numeric | 2536 | 0 (86); 1 (189) |
| `s061info_2postwurf` | numeric | 2536 | 0 (249); 1 (26) |
| `s061info_3internet` | numeric | 2536 | 0 (190); 1 (85) |
| `s061info_4tv` | numeric | 2536 | 0 (235); 1 (40) |
| `s061info_5zeitschrift` | numeric | 2536 | 0 (254); 1 (21) |
| `s061info_6empfehlung` | numeric | 2536 | 0 (217); 1 (58) |
| `s061info_7socialmedia` | numeric | 2536 | 0 (242); 1 (33) |
| `s061info_other` | character | 2536 | Freitext (nicht zitieren) |

### F62 · Angenommen, Sie möchten für sich selbst oder eine Freundin zuckerreduzierte … (S. 41)

**Frage:** Angenommen, Sie möchten für sich selbst oder eine Freundin zuckerreduzierte Tafelschokolade einkaufen und entdecken auf der Suche verschiedene Hinweise auf Verpackungen. Welche der Hinweise finden Sie für Ihre Kaufentscheidung nützlich?

**Filter:** gestellt nur, wenn F41 Ernährungsweise = 0 oder 1 oder 2 oder 4 oder 5 oder 7

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [s062claims], zufällige Reihenfolge; angepasst nach Zühlsdorf, Jürkenbeck, Mehlhose, Spiller 1ersatz 2nokunst 3weniger 4nosuess 5honig 6suess 7natur 8ohne Absolut nützlich Ohne Zuckersatz Ohne künstliche Süßstoffe Enthält 30 % weniger Zucker Ohne Süßungsmittel Mit Honig gesüßt Mit Süßungsmittel Natürliche Alternative zu Zucker Ohne Zucker +2 +2 +2 +2 +2 +2 +2 +2 Eher nützlich +1 +1 Teils/ teils 0 0 Eher nicht nützlich -1 -1 Überhaupt nicht nützlich -2 -2 +1 0 -1 -2 +1 0 -1 -2 +1 0 -1 -2 +1 0 -1 -2 +1 0 -1 -2 +1 0 -1 -2 A Spezialthema-2: Allgemeine Markt- und Wettbewerbsanalyse Milch (F63 – F74) Bedingung: nur wenn F6 Milch 3 oder 2 oder 1, wird je nach Frage gekauft/verzehrt noch angepasst (nur bei Anpassung wird die Bedingung ausgewiesen) Bedingung: nur wenn F41 Ernährungsweise = 0 oder 1 oder 2 oder 4 oder 5 oder 7 (wegen Nichtkauf/-verzehr von Hafermilch im AB-Test wird lactosefrei und vegan herausgelassen) Es folgen nun ein paar Fragen zum Einkauf und Konsum von Milch.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `s062claims_1ersatz` | numeric | 2536 | -2 (10); -1 (24); 0 (58); 1 (94); 2 (89) |
| `s062claims_2nokunst` | numeric | 2536 | -2 (9); -1 (27); 0 (59); 1 (95); 2 (85) |
| `s062claims_3weniger` | numeric | 2536 | -2 (10); -1 (24); 0 (61); 1 (114); 2 (66) |
| `s062claims_4nosuess` | numeric | 2537 | -2 (13); -1 (28); 0 (63); 1 (92); 2 (78) |
| `s062claims_5honig` | numeric | 2536 | -2 (13); -1 (34); 0 (68); 1 (92); 2 (68) |
| `s062claims_6suess` | numeric | 2538 | -2 (17); -1 (40); 0 (82); 1 (83); 2 (51) |
| `s062claims_7natur` | numeric | 2536 | -2 (16); -1 (31); 0 (74); 1 (91); 2 (63) |
| `s062claims_8ohne` | numeric | 2536 | -2 (9); -1 (20); 0 (57); 1 (89); 2 (100) |

### F63 · Zu welchen Anlässen konsumieren Sie …? (Mehrfachnennungen möglich) (S. 42)

**Frage:** Zu welchen Anlässen konsumieren Sie …? (Mehrfachnennungen möglich)

**Filter:** gestellt nur, wenn F6 Milch = 3 oder 1

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [m063anlass2] -> [M063anlass2], AB-Test [ab063anlass2] -> [AB063anlass2f], zufällige Reihenfolge, Bedingung: nur wenn F6 Milch = 3 oder 1 und F41 = 0 oder 1 oder 2 oder 4 oder 5 oder 7 (wegen Nichtkauf/-verzehr von Hafermilch im AB-Test) 1kaffee 2trinken 3kochen 4muesli 5mahlzeit 6snack 7no sonst In den Kaffee Zum „so“ Trinken Zum Kochen und Backen Zum Frühstück (z.B. Müsli) Als Getränk zu Mahlzeiten (pur / als Milchshake) Als Zwischenmahlzeit / Snack (pur / als Milchshake) Konsumiere ich nicht Sonstiges und zwar: AB-Test 1 Kuhmilch 2 Hafermilch/Haferdrinks

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab063anlass2` | numeric | 2592 | 1 (110); 2 (109) |
| `m063anlass1_1kaffee` | numeric | 2701 | 0 (46); 1 (64) |
| `m063anlass1_2trinken` | numeric | 2701 | 0 (73); 1 (37) |
| `m063anlass1_3kochen` | numeric | 2701 | 0 (41); 1 (69) |
| `m063anlass1_4muesli` | numeric | 2701 | 0 (50); 1 (60) |
| `m063anlass1_5mahlzeit` | numeric | 2701 | 0 (92); 1 (18) |
| `m063anlass1_6snack` | numeric | 2701 | 0 (82); 1 (28) |
| `m063anlass1_7no` | numeric | 2701 | 0 (101); 1 (9) |
| `m063anlass2_1kaffee` | numeric | 2702 | 0 (77); 1 (32) |
| `m063anlass2_2trinken` | numeric | 2702 | 0 (91); 1 (18) |
| `m063anlass2_3kochen` | numeric | 2702 | 0 (77); 1 (32) |
| `m063anlass2_4muesli` | numeric | 2702 | 0 (75); 1 (34) |
| `m063anlass2_5mahlzeit` | numeric | 2702 | 0 (99); 1 (10) |
| `m063anlass2_6snack` | numeric | 2702 | 0 (96); 1 (13) |
| `m063anlass2_7no` | numeric | 2702 | 0 (66); 1 (43) |
| `AB063anlass2f` | character | 2592 | Hafermilch (109); Kuhmilch (110) |
| `M063anlass2_1kaffee` | numeric | 2592 | 0 (123); 1 (96) |
| `M063anlass2_2trinken` | numeric | 2592 | 0 (164); 1 (55) |
| `M063anlass2_3kochen` | numeric | 2592 | 0 (118); 1 (101) |
| `M063anlass2_4muesli` | numeric | 2592 | 0 (125); 1 (94) |
| `M063anlass2_5mahlzeit` | numeric | 2592 | 0 (191); 1 (28) |
| `M063anlass2_6snack` | numeric | 2592 | 0 (178); 1 (41) |
| `M063anlass2_7no` | numeric | 2592 | 0 (167); 1 (52) |

### F64 · Sie möchten … kaufen. Wie wichtig sind Ihnen folgende Kaufkriterien bei …. Schieben Sie … (S. 42)

**Frage:** Sie möchten … kaufen. Wie wichtig sind Ihnen folgende Kaufkriterien bei …. Schieben Sie die 7 wichtigsten Kaufkriterien in eine Rangfolge, das wichtigste Einkaufkriterium nach oben, das unwichtigste nach unten.

**Filter:** gestellt nur, wenn F6 Milch = 3 oder 2

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Rangliste [m064krit2] -> [M064krit2], AB-Test [ab064krit2] -> [AB064krit2f], zufällige Reihenfolge, Bedingung: nur wenn F6 Milch = 3 oder 2 Limesurvey -Rangvar.name R-Var,name R-Var,name 1geschmack 2region 3preis 4natur 5quali 6bio 7vegan 8fair 9gesund 10vertrauen 11nachhaltig 12co2 13design 14tierwohl 15naehrwert Besonders guter Geschmack rang1 Regionalität rang2 Günstiger Preis rang3 Natürlich (keine künstlichen Inhaltsstoffe) rang4 Hohe Qualität der Zutaten rang5 Bioqualität/Ökoanbau rang6 Vegan rang7 Fair gehandelt Gesundheitskriterien (z.B. Gluten-/Lactosefrei) Attraktive Marke Nachhaltige Verpackung Geringer CO2-Fußabdruck Ansprechendes Verpackungsdesign Tierwohl Hoher Ernährungswert (z.B. Protein) AB-Test 1 Kuhmilch 2 Hafermilch/Haferdrink

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab064krit2` | numeric | 2582 | 1 (116); 2 (113) |
| `m064krit1_1` | numeric | 2697 | 1 (20); 2 (9); 3 (30); 4 (9); 5 (5); 6 (12); 7 (4); 8 (2); 9 (3); 10 (4); 11 (2); 13 (2); 14 (10); 15 (2) |
| `m064krit1_2` | numeric | 2699 | 1 (18); 2 (11); 3 (13); 4 (10); 5 (12); 6 (5); 8 (4); 9 (2); 10 (3); 11 (4); 12 (1); 13 (2); 14 (21); 15 (6) |
| `m064krit1_3` | numeric | 2700 | 1 (10); 2 (17); 3 (11); 4 (14); 5 (8); 6 (8); 7 (1); 8 (11); 9 (2); 10 (2); 11 (3); 12 (2); 13 (5); 14 (11); 15 (6) |
| `m064krit1_4` | numeric | 2704 | 1 (13); 2 (8); 3 (11); 4 (19); 5 (10); 6 (5); 8 (5); 9 (6); 10 (5); 11 (4); 12 (5); 13 (2); 14 (9); 15 (5) |
| `m064krit1_5` | numeric | 2711 | 1 (3); 2 (11); 3 (8); 4 (8); 5 (11); 6 (7); 7 (2); 8 (9); 9 (2); 10 (10); 11 (5); 12 (6); 13 (4); 14 (10); 15 (4) |
| `m064krit1_6` | numeric | 2718 | 1 (6); 2 (6); 3 (8); 4 (3); 5 (11); 6 (8); 8 (3); 9 (4); 10 (9); 11 (7); 12 (10); 13 (6); 14 (9); 15 (3) |
| `m064krit1_7` | numeric | 2726 | 1 (3); 2 (6); 3 (6); 4 (6); 5 (9); 6 (3); 7 (3); 8 (10); 9 (6); 10 (7); 11 (8); 12 (5); 13 (1); 14 (7); 15 (5) |
| `m064krit1_8` | logical | 2811 | leer |
| `m064krit1_9` | logical | 2811 | leer |
| `m064krit1_10` | logical | 2811 | leer |
| `m064krit1_11` | logical | 2811 | leer |
| `m064krit1_12` | logical | 2811 | leer |
| `m064krit1_13` | logical | 2811 | leer |
| `m064krit1_14` | logical | 2811 | leer |
| `m064krit1_15` | logical | 2811 | leer |
| `m064krit2_1` | numeric | 2701 | 1 (20); 2 (8); 3 (25); 4 (10); 5 (12); 6 (6); 7 (5); 8 (3); 9 (3); 10 (5); 13 (1); 14 (12) |
| `m064krit2_2` | numeric | 2702 | 1 (21); 2 (5); 3 (15); 4 (10); 5 (11); 6 (5); 7 (2); 8 (4); 9 (4); 10 (1); 11 (5); 12 (6); 13 (2); 14 (11); 15 (7) |
| `m064krit2_3` | numeric | 2703 | 1 (13); 2 (12); 3 (12); 4 (14); 5 (14); 6 (7); 7 (5); 8 (5); 9 (5); 10 (2); 11 (1); 12 (2); 13 (4); 14 (4); 15 (8) |
| `m064krit2_4` | numeric | 2708 | 1 (3); 2 (4); 3 (11); 4 (17); 5 (13); 6 (9); 7 (6); 8 (11); 9 (5); 10 (5); 11 (3); 12 (5); 13 (2); 14 (6); 15 (3) |
| `m064krit2_5` | numeric | 2713 | 1 (5); 2 (7); 3 (7); 4 (4); 5 (8); 6 (7); 7 (2); 8 (10); 9 (7); 10 (12); 11 (4); 12 (5); 13 (5); 14 (6); 15 (9) |
| `m064krit2_6` | numeric | 2720 | 1 (7); 2 (14); 3 (4); 4 (9); 5 (8); 6 (9); 7 (1); 8 (5); 9 (2); 10 (5); 11 (6); 12 (5); 13 (6); 14 (4); 15 (6) |
| `m064krit2_7` | numeric | 2727 | 1 (4); 2 (9); 3 (4); 4 (4); 5 (4); 6 (9); 7 (1); 8 (5); 9 (2); 10 (9); 11 (5); 12 (4); 13 (8); 14 (8); 15 (8) |
| `m064krit2_8` | logical | 2811 | leer |
| `m064krit2_9` | logical | 2811 | leer |
| `m064krit2_10` | logical | 2811 | leer |
| `m064krit2_11` | logical | 2811 | leer |
| `m064krit2_12` | logical | 2811 | leer |
| `m064krit2_13` | logical | 2811 | leer |
| `m064krit2_14` | logical | 2811 | leer |
| `m064krit2_15` | logical | 2811 | leer |
| `AB064krit2f` | character | 2582 | Hafermilch (113); Kuhmilch (116) |
| `M064krit2_1geschmack` | numeric | 2665 | 1 (40); 2 (39); 3 (23); 4 (16); 5 (8); 6 (13); 7 (7) |
| `M064krit2_2region` | numeric | 2684 | 1 (17); 2 (16); 3 (29); 4 (12); 5 (18); 6 (20); 7 (15) |
| `M064krit2_3preis` | numeric | 2646 | 1 (55); 2 (28); 3 (23); 4 (22); 5 (15); 6 (12); 7 (10) |
| `M064krit2_4natur` | numeric | 2674 | 1 (19); 2 (20); 3 (28); 4 (36); 5 (12); 6 (12); 7 (10) |
| `M064krit2_5quali` | numeric | 2675 | 1 (17); 2 (23); 3 (22); 4 (23); 5 (19); 6 (19); 7 (13) |
| `M064krit2_6bio` | numeric | 2711 | 1 (18); 2 (10); 3 (15); 4 (14); 5 (14); 6 (17); 7 (12) |
| `M064krit2_7vegan` | numeric | 2779 | 1 (9); 2 (2); 3 (6); 4 (6); 5 (4); 6 (1); 7 (4) |
| `M064krit2_8fair` | numeric | 2724 | 1 (5); 2 (8); 3 (16); 4 (16); 5 (19); 6 (8); 7 (15) |
| `M064krit2_9gesund` | numeric | 2758 | 1 (6); 2 (6); 3 (7); 4 (11); 5 (9); 6 (6); 7 (8) |
| `M064krit2_10vertrauen` | numeric | 2732 | 1 (9); 2 (4); 3 (4); 4 (10); 5 (22); 6 (14); 7 (16) |
| `M064krit2_11nachhaltig` | numeric | 2754 | 1 (2); 2 (9); 3 (4); 4 (7); 5 (9); 6 (13); 7 (13) |
| `M064krit2_12co2` | numeric | 2755 | 2 (7); 3 (4); 4 (10); 5 (11); 6 (15); 7 (9) |
| `M064krit2_13design` | numeric | 2761 | 1 (3); 2 (4); 3 (9); 4 (4); 5 (9); 6 (12); 7 (9) |
| `M064krit2_14tierwohl` | numeric | 2683 | 1 (22); 2 (32); 3 (15); 4 (15); 5 (16); 6 (13); 7 (15) |
| `M064krit2_15naehrwert` | numeric | 2739 | 1 (2); 2 (13); 3 (14); 4 (8); 5 (13); 6 (9); 7 (13) |
| `M064krit2_1` | numeric | 2587 | 1 (40); 2 (17); 3 (55); 4 (19); 5 (17); 6 (18); 7 (9); 8 (5); 9 (6); 10 (9); 11 (2); 13 (3); 14 (22); 15 (2) |
| `M064krit2_2` | numeric | 2590 | 1 (39); 2 (16); 3 (28); 4 (20); 5 (23); 6 (10); 7 (2); 8 (8); 9 (6); 10 (4); 11 (9); 12 (7); 13 (4); 14 (32); 15 (13) |
| `M064krit2_3` | numeric | 2592 | 1 (23); 2 (29); 3 (23); 4 (28); 5 (22); 6 (15); 7 (6); 8 (16); 9 (7); 10 (4); 11 (4); 12 (4); 13 (9); 14 (15); 15 (14) |
| `M064krit2_4` | numeric | 2601 | 1 (16); 2 (12); 3 (22); 4 (36); 5 (23); 6 (14); 7 (6); 8 (16); 9 (11); 10 (10); 11 (7); 12 (10); 13 (4); 14 (15); 15 (8) |
| `M064krit2_5` | numeric | 2613 | 1 (8); 2 (18); 3 (15); 4 (12); 5 (19); 6 (14); 7 (4); 8 (19); 9 (9); 10 (22); 11 (9); 12 (11); 13 (9); 14 (16); 15 (13) |
| `M064krit2_6` | numeric | 2627 | 1 (13); 2 (20); 3 (12); 4 (12); 5 (19); 6 (17); 7 (1); 8 (8); 9 (6); 10 (14); 11 (13); 12 (15); 13 (12); 14 (13); 15 (9) |
| `M064krit2_7` | numeric | 2642 | 1 (7); 2 (15); 3 (10); 4 (10); 5 (13); 6 (12); 7 (4); 8 (15); 9 (8); 10 (16); 11 (13); 12 (9); 13 (9); 14 (15); 15 (13) |

### F65 · Betrachten Sie jetzt einmal dieses Produkt: Wie sicher werden Sie dieses Produkt kaufen? (S. 43)

**Frage:** Betrachten Sie jetzt einmal dieses Produkt: Wie sicher werden Sie dieses Produkt kaufen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [m065kaufmilch2] -> [M065kaufmilch2], AB-Test [ab065kaufmilch2] -> [AB065kaufmilch2f] Variante A wird hier gezeigt, alle weiteren Varianten in den Programmierhinweisen +4 = Werde ich sicher kaufen 0 = Unentschieden -4 = Werde ich sicher nicht kaufen 4 3 2 1 0 -1 -2 -3 -41 AB-Test 1 Kuhmilch - Weihenstephan 1l 3,5g Fett 2 Hafermilch/Haferdrink - alpro 1 l, Haferdrink 3,5% vegan

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab065kaufmilch2` | numeric | 2577 | 1 (121); 2 (113) |
| `m065kaufmilch1_1` | numeric | 2690 | 1 (16); 2 (7); 3 (9); 4 (10); 5 (26); 6 (12); 7 (17); 8 (8); 9 (16) |
| `m065kaufmilch2_1` | numeric | 2698 | 1 (42); 2 (11); 3 (4); 4 (5); 5 (22); 6 (8); 7 (8); 8 (6); 9 (7) |
| `AB065kaufmilch2f` | character | 2577 | alpro-Not Milk 1,79€ (113); Weihenstephan 1,79€ (121) |

### F66 · Nehmen wir an, Sie stehen im Geschäft und wollen eine Packung Milch kaufen (von der Kuh … (S. 43)

**Frage:** Nehmen wir an, Sie stehen im Geschäft und wollen eine Packung Milch kaufen (von der Kuh oder pflanzlich).

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix nach Spalten [m066packdiff2], AB-Test [ab066packdiff2], mit MaxDiff-Methode 7 Blöcke und Rankingabfrage, angelehnt an statista 2022 Aspekte die bewertet werden sollen 1. Recyclebar (z.B. Karton statt Plastik) 2. Wenig Verpackungsmüll 3. Ansprechendes Design 4. Praktischer, wiederverschließbarer Verschluss 5. Aus nachwachsenden Rohstoffen 6. Geringer CO2-Ausstoss 7. Gut lesbare Informationen AB-Test 1 Kuhmilch (Methode MaxDiff) 2 Kuhmilch (Methode Ranking) Variante A: Maxdiff Methode Sie sehen jetzt nacheinander 7 Blöcke mit jeweils 4 Verpackungskriterien. Bitte wählen Sie für jeden Antwortblock die Verpackungseigenschaft, die Sie am wichtigsten (max. 1 Kreuz) und am unwichtigsten finden (max. 1 Kreuz). Block 1 1 2 3 4 Recyclebar (z.B. Karton statt Plastik) Gut lesbare Informationen Ansprechendes Design Praktischer, wiederverschließbarer Verschluss Am wichtigsten 1 2 3 4 Am unwichtigsten 1 2 3 4 Bitte wählen Sie die Verpackungseigenschaft, die Sie am wichtigsten und am unwichtigsten finden. Block 2 1 2 3 4 Wenig Verpackungsmüll Ansprechendes Design Praktischer, wiederverschließbarer Verschluss Aus nachwachsenden Rohstoffen Am wichtigsten 1 2 3 4 Am unwichtigsten 1 2 3 4 Bitte wählen Sie die Verpackungseigenschaft, die Sie am wichtigsten und am unwichtigsten finden. Block 3 1 2 3 4 Recyclebar (z.B. Karton statt Plastik) Wenig Verpackungsmüll Ansprechendes Design Geringer CO2-Ausstoss Am wichtigsten 1 2 3 4 Am unwichtigsten 1 2 3 4 Bitte wählen Sie die Verpackungseigenschaft, die Sie am wichtigsten und am unwichtigsten finden. Block 4 1 2 3 4 Gut lesbare Informationen Ansprechendes Design Aus nachwachsenden Rohstoffen Geringer CO2-Ausstoss Am wichtigsten 1 2 3 4 Am unwichtigsten 1 2 3 4 Bitte wählen Sie die Verpackungseigenschaft, die Sie am wichtigsten und am …

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab066packdiff2` | numeric | 2577 | 1 (126); 2 (108) |
| `m066packdiff1md1_wichtig` | numeric | 2685 | 1 (26); 2 (27); 3 (8); 4 (65) |
| `m066packdiff1md1_unwichtig` | numeric | 2685 | 1 (26); 2 (15); 3 (77); 4 (8) |
| `m066packdiff1md2_wichtig` | numeric | 2685 | 1 (37); 2 (9); 3 (53); 4 (27) |
| `m066packdiff1md2_unwichtig` | numeric | 2685 | 1 (12); 2 (80); 3 (14); 4 (20) |
| `m066packdiff1md3_wichtig` | numeric | 2685 | 1 (51); 2 (40); 3 (17); 4 (18) |
| `m066packdiff1md3_unwichtig` | numeric | 2685 | 1 (11); 2 (10); 3 (78); 4 (27) |
| `m066packdiff1md4_wichtig` | numeric | 2685 | 1 (53); 2 (14); 3 (32); 4 (27) |
| `m066packdiff1md4_unwichtig` | numeric | 2685 | 1 (13); 2 (77); 3 (13); 4 (23) |
| `m066packdiff1md5_wichtig` | numeric | 2685 | 1 (43); 2 (22); 3 (49); 4 (12) |
| `m066packdiff1md5_unwichtig` | numeric | 2685 | 1 (16); 2 (41); 3 (29); 4 (40) |
| `m066packdiff1md6_wichtig` | numeric | 2685 | 1 (39); 2 (32); 3 (34); 4 (21) |
| `m066packdiff1md6_unwichtig` | numeric | 2685 | 1 (26); 2 (24); 3 (48); 4 (28) |
| `m066packdiff1md7_wichtig` | numeric | 2685 | 1 (34); 2 (59); 3 (20); 4 (13) |
| `m066packdiff1md7_unwichtig` | numeric | 2685 | 1 (23); 2 (33); 3 (27); 4 (43) |
| `m066packdiff2_1` | numeric | 2706 | 1 (10); 2 (10); 3 (12); 4 (17); 5 (31); 6 (7); 7 (18) |
| `m066packdiff2_2` | numeric | 2710 | 1 (21); 2 (19); 3 (5); 4 (10); 5 (15); 6 (9); 7 (22) |
| `m066packdiff2_3` | numeric | 2716 | 1 (21); 2 (15); 3 (10); 4 (11); 5 (12); 6 (10); 7 (16) |
| `m066packdiff2_4` | numeric | 2728 | 1 (10); 2 (18); 3 (10); 4 (12); 5 (12); 6 (8); 7 (13) |
| `m066packdiff2_5` | numeric | 2737 | 1 (10); 2 (15); 3 (18); 4 (9); 5 (7); 6 (10); 7 (5) |
| `m066packdiff2_6` | numeric | 2740 | 1 (8); 2 (10); 3 (16); 4 (4); 5 (9); 6 (18); 7 (6) |
| `m066packdiff2_7` | numeric | 2745 | 1 (10); 2 (5); 3 (9); 4 (15); 5 (10); 6 (11); 7 (6) |
| `AB066packdiff2f` | character | 2577 | Kuhmilch - MaxDiff (126); Kuhmilch - Ranking (108) |
| `M066packdiff2_1recyclebar` | numeric | 2721 | 1 (10); 2 (21); 3 (21); 4 (10); 5 (10); 6 (8); 7 (10) |
| `M066packdiff2_2vpmuell` | numeric | 2719 | 1 (10); 2 (19); 3 (15); 4 (18); 5 (15); 6 (10); 7 (5) |
| `M066packdiff2_3nawaro` | numeric | 2731 | 1 (12); 2 (5); 3 (10); 4 (10); 5 (18); 6 (16); 7 (9) |
| `M066packdiff2_4design` | numeric | 2733 | 1 (17); 2 (10); 3 (11); 4 (12); 5 (9); 6 (4); 7 (15) |
| `M066packdiff2_5praktisch` | numeric | 2715 | 1 (31); 2 (15); 3 (12); 4 (12); 5 (7); 6 (9); 7 (10) |
| `M066packdiff2_6co2` | numeric | 2738 | 1 (7); 2 (9); 3 (10); 4 (8); 5 (10); 6 (18); 7 (11) |
| `M066packdiff2_7lesbar` | numeric | 2725 | 1 (18); 2 (22); 3 (16); 4 (13); 5 (5); 6 (6); 7 (6) |

### F67 · Denken Sie einmal an eine …. Mit welcher der jeweils untenstehenden Eigenschaften würden … (S. 45)

**Frage:** Denken Sie einmal an eine …. Mit welcher der jeweils untenstehenden Eigenschaften würden Sie diese eher in Verbindung bringen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [m067midiff2] -> [M067midiff2] AB-Test: [ab067midiff2] -> [AB067midiff2f], zufällige Reihenfolge, Haas et al 2020 1frisch 2gesund 3knochen 4natur 5verdaulich 6ethisch 7mineral 8schmeckt 9fettarm 10umwelt 11noallergie 12nachhaltig Frisch Gesund Gut für die Knochen Natürlich Verdaulich Ethisch vertretbar Mineralstoffreich Schmeckt gut Fettarm Umweltfreundlich Allergiefrei Nachhaltig +2 +1 0 -1 -2 Konserviert +2 +1 0 -1 -2 Ungesund +2 +1 0 -1 -2 Schlecht für die Knochen +2 +1 0 -1 -2 Künstlich +2 +1 0 -1 -2 Schwer verdaulich +2 +1 0 -1 -2 Ethisch problematisch +2 +1 0 -1 -2 Mineralstoffarm +2 +1 0 -1 -2 Schmeckt schlecht +2 +1 0 -1 -2 Fettreich +2 +1 0 -1 -2 Umweltschädlich +2 +1 0 -1 -2 Allergen +2 +1 0 -1 -2 Nicht nachhaltig AB-Test 1 normale Milch von der Kuh 2 Hafermilch/Haferdrink

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab067midiff2` | numeric | 2577 | 1 (124); 2 (110) |
| `m067midiff1_1frisch` | numeric | 2688 | 1 (4); 2 (8); 3 (37); 4 (28); 5 (46) |
| `m067midiff1_2gesund` | numeric | 2688 | 1 (1); 2 (7); 3 (32); 4 (36); 5 (47) |
| `m067midiff1_3knochen` | numeric | 2689 | 2 (5); 3 (31); 4 (36); 5 (50) |
| `m067midiff1_4natur` | numeric | 2688 | 2 (2); 3 (24); 4 (33); 5 (64) |
| `m067midiff1_5verdaulich` | numeric | 2689 | 1 (3); 2 (11); 3 (35); 4 (38); 5 (35) |
| `m067midiff1_6ethisch` | numeric | 2689 | 1 (6); 2 (11); 3 (42); 4 (35); 5 (28) |
| `m067midiff1_7mineral` | numeric | 2691 | 1 (1); 2 (3); 3 (33); 4 (45); 5 (38) |
| `m067midiff1_8schmeckt` | numeric | 2688 | 1 (3); 2 (7); 3 (24); 4 (32); 5 (57) |
| `m067midiff1_9fettarm` | numeric | 2689 | 1 (14); 2 (21); 3 (53); 4 (23); 5 (11) |
| `m067midiff1_10umwelt` | numeric | 2689 | 1 (5); 2 (18); 3 (46); 4 (32); 5 (21) |
| `m067midiff1_11noallergie` | numeric | 2687 | 1 (9); 2 (13); 3 (57); 4 (25); 5 (20) |
| `m067midiff1_12nachhaltig` | numeric | 2690 | 1 (7); 2 (11); 3 (54); 4 (27); 5 (22) |
| `m067midiff2_1frisch` | numeric | 2701 | 1 (17); 2 (17); 3 (34); 4 (25); 5 (17) |
| `m067midiff2_2gesund` | numeric | 2702 | 1 (10); 2 (11); 3 (33); 4 (38); 5 (17) |
| `m067midiff2_3knochen` | numeric | 2702 | 1 (9); 2 (16); 3 (50); 4 (24); 5 (10) |
| `m067midiff2_4natur` | numeric | 2702 | 1 (16); 2 (13); 3 (21); 4 (39); 5 (20) |
| `m067midiff2_5verdaulich` | numeric | 2702 | 1 (7); 2 (7); 3 (35); 4 (39); 5 (21) |
| `m067midiff2_6ethisch` | numeric | 2702 | 1 (7); 2 (7); 3 (32); 4 (36); 5 (27) |
| `m067midiff2_7mineral` | numeric | 2703 | 1 (8); 2 (10); 3 (42); 4 (33); 5 (15) |
| `m067midiff2_8schmeckt` | numeric | 2701 | 1 (19); 2 (23); 3 (27); 4 (22); 5 (19) |
| `m067midiff2_9fettarm` | numeric | 2702 | 1 (3); 2 (10); 3 (45); 4 (30); 5 (21) |
| `m067midiff2_10umwelt` | numeric | 2701 | 1 (7); 2 (8); 3 (38); 4 (33); 5 (24) |
| `m067midiff2_11noallergie` | numeric | 2702 | 1 (9); 2 (9); 3 (45); 4 (29); 5 (17) |
| `m067midiff2_12nachhaltig` | numeric | 2703 | 1 (8); 2 (7); 3 (27); 4 (43); 5 (23) |
| `AB067midiff2f` | character | 2577 | Hafermilch (110); Kuhmilch (124) |
| `M067midiff2_1frisch` | numeric | 2578 | -2 (21); -1 (25); 0 (71); 1 (53); 2 (63) |
| `M067midiff2_2gesund` | numeric | 2579 | -2 (11); -1 (18); 0 (65); 1 (74); 2 (64) |
| `M067midiff2_3knochen` | numeric | 2580 | -2 (9); -1 (21); 0 (81); 1 (60); 2 (60) |
| `M067midiff2_4natur` | numeric | 2579 | -2 (16); -1 (15); 0 (45); 1 (72); 2 (84) |
| `M067midiff2_5verdaulich` | numeric | 2580 | -2 (10); -1 (18); 0 (70); 1 (77); 2 (56) |
| `M067midiff2_6ethisch` | numeric | 2580 | -2 (13); -1 (18); 0 (74); 1 (71); 2 (55) |
| `M067midiff2_7mineral` | numeric | 2583 | -2 (9); -1 (13); 0 (75); 1 (78); 2 (53) |
| `M067midiff2_8schmeckt` | numeric | 2578 | -2 (22); -1 (30); 0 (51); 1 (54); 2 (76) |
| `M067midiff2_9fettarm` | numeric | 2580 | -2 (17); -1 (31); 0 (98); 1 (53); 2 (32) |
| `M067midiff2_10umwelt` | numeric | 2579 | -2 (12); -1 (26); 0 (84); 1 (65); 2 (45) |
| `M067midiff2_11noallergie` | numeric | 2578 | -2 (18); -1 (22); 0 (102); 1 (54); 2 (37) |
| `M067midiff2_12nachhaltig` | numeric | 2582 | -2 (15); -1 (18); 0 (81); 1 (70); 2 (45) |

### F68 · Schauen Sie sich bitte die hier abgebildete Verpackung der Milchmarke Weihenstephan und … (S. 46)

**Frage:** Schauen Sie sich bitte die hier abgebildete Verpackung der Milchmarke Weihenstephan und die darunter stehenden Eigenschaften an. Welche der beiden Beschreibungen passt jeweils besser?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [m068wdiff2] -> [M068wdiff2], AB-Test [ab068wdiff2] -> [AB068wdiff2f], zufällige Reihenfolge 1quali 2vertrauen 3regio 4modern 5aufdringlich 6preis 7passt 8cool 9klima 10design Besonders guter Geschmack Vertrauensvoll Regional Modern Dezent Hochpreisig Verpackung passt zum Produkt Cool Gut fürs Klima Ansprechendes Design +2 +1 0 -1 -2 Besonders schlechter Geschmack +2 +1 0 -1 -2 Nicht vertrauensvoll +2 +1 0 -1 -2 Überregional +2 +1 0 -1 -2 Altmodisch +2 +1 0 -1 -2 Aufdringlich +2 +1 0 -1 -2 günstig +2 +1 0 -1 -2 Verpackung passt nicht zum Produkt +2 +1 0 -1 -2 Uncool +2 +1 0 -1 -2 Schlecht fürs Klima +2 +1 0 -1 -2 Liebloses Design AB-Test 1 A=Reihenfolge: erst Frage 68 mit Weihenstephan und dann Frage 69 mit Alpro 2 B=Reihenfolge erst Frage Frage 69 mit Alpro und dann 68 mit Weihenstephan

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ab068wdiff2` | numeric | 2577 | 1 (109); 2 (125) |
| `m068wdiff1_1quali` | numeric | 2703 | 1 (2); 2 (6); 3 (38); 4 (48); 5 (14) |
| `m068wdiff1_2vertrauen` | numeric | 2703 | 1 (4); 2 (4); 3 (37); 4 (43); 5 (20) |
| `m068wdiff1_3regio` | numeric | 2703 | 1 (16); 2 (11); 3 (42); 4 (25); 5 (14) |
| `m068wdiff1_4modern` | numeric | 2704 | 1 (2); 2 (9); 3 (44); 4 (36); 5 (16) |
| `m068wdiff1_5aufdringlich` | numeric | 2703 | 1 (3); 2 (11); 3 (53); 4 (28); 5 (13) |
| `m068wdiff1_6preis` | numeric | 2702 | 2 (5); 3 (32); 4 (43); 5 (29) |
| `m068wdiff1_7passt` | numeric | 2702 | 1 (3); 2 (2); 3 (25); 4 (54); 5 (25) |
| `m068wdiff1_8cool` | numeric | 2702 | 1 (4); 2 (12); 3 (47); 4 (33); 5 (13) |
| `m068wdiff1_9klima` | numeric | 2703 | 1 (11); 2 (10); 3 (58); 4 (23); 5 (6) |
| `m068wdiff1_10design` | numeric | 2703 | 1 (3); 2 (6); 3 (34); 4 (43); 5 (22) |
| `m068wdiff2_1quali` | numeric | 2687 | 1 (4); 2 (5); 3 (44); 4 (28); 5 (43) |
| `m068wdiff2_2vertrauen` | numeric | 2688 | 1 (8); 2 (7); 3 (39); 4 (32); 5 (37) |
| `m068wdiff2_3regio` | numeric | 2687 | 1 (13); 2 (13); 3 (39); 4 (31); 5 (28) |
| `m068wdiff2_4modern` | numeric | 2688 | 1 (5); 2 (17); 3 (48); 4 (27); 5 (26) |
| `m068wdiff2_5aufdringlich` | numeric | 2687 | 1 (1); 2 (13); 3 (46); 4 (37); 5 (27) |
| `m068wdiff2_6preis` | numeric | 2687 | 1 (4); 2 (5); 3 (40); 4 (51); 5 (24) |
| `m068wdiff2_7passt` | numeric | 2688 | 1 (1); 2 (9); 3 (25); 4 (41); 5 (47) |
| `m068wdiff2_8cool` | numeric | 2687 | 1 (8); 2 (14); 3 (51); 4 (26); 5 (25) |
| `m068wdiff2_9klima` | numeric | 2687 | 1 (9); 2 (21); 3 (55); 4 (22); 5 (17) |
| `m068wdiff2_10design` | numeric | 2690 | 1 (3); 2 (5); 3 (41); 4 (43); 5 (29) |
| `AB068wdiff2f` | character | 2577 | alpro(69)-Weihenstephan(68) (125); Weihenstephan(68)-alpro(69) (109) |
| `M068wdiff2_1quali` | numeric | 2579 | -2 (6); -1 (11); 0 (82); 1 (76); 2 (57) |
| `M068wdiff2_2vertrauen` | numeric | 2580 | -2 (12); -1 (11); 0 (76); 1 (75); 2 (57) |
| `M068wdiff2_3regio` | numeric | 2579 | -2 (29); -1 (24); 0 (81); 1 (56); 2 (42) |
| `M068wdiff2_4modern` | numeric | 2581 | -2 (7); -1 (26); 0 (92); 1 (63); 2 (42) |
| `M068wdiff2_5aufdringlich` | numeric | 2579 | -2 (4); -1 (24); 0 (99); 1 (65); 2 (40) |
| `M068wdiff2_6preis` | numeric | 2578 | -2 (4); -1 (10); 0 (72); 1 (94); 2 (53) |
| `M068wdiff2_7passt` | numeric | 2579 | -2 (4); -1 (11); 0 (50); 1 (95); 2 (72) |
| `M068wdiff2_8cool` | numeric | 2578 | -2 (12); -1 (26); 0 (98); 1 (59); 2 (38) |
| `M068wdiff2_9klima` | numeric | 2579 | -2 (20); -1 (31); 0 (113); 1 (45); 2 (23) |
| `M068wdiff2_10design` | numeric | 2582 | -2 (6); -1 (11); 0 (75); 1 (86); 2 (51) |

### F69 · Und nun schauen Sie sich bitte die Verpackung der Milchmarke alpro und die darunter … (S. 46)

**Frage:** Und nun schauen Sie sich bitte die Verpackung der Milchmarke alpro und die darunter stehenden Eigenschaften an. Welche der beiden Beschreibungen passt jeweils besser?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [m069adiff2] -> [M069adiff2], AB-Test [ab068wdiff2] -> [AB068wdiff2f], zufällige Reihenfolge 1quali 2vertrauen 3regio 4modern 5aufdringlich 6preis Besonders guter Geschmack Vertrauensvoll Regional Modern Dezent Hochpreisig +2 +1 0 -1 -2 Besonders schlechter Geschmack +2 +1 0 -1 -2 Nicht vertrauensvoll +2 +1 0 -1 -2 Überregional +2 +1 0 -1 -2 Altmodisch +2 +1 0 -1 -2 Aufdringlich +2 +1 0 -1 -2 Günstig 7passt 8cool 9klima 10design Verpackung passt zum Produkt Cool Gut fürs Klima Ansprechendes Design +2 +2 +2 +2 +1 +1 +1 +1 0 -1 -2 Verpackung passt nicht zum Produkt 0 -1 -2 Uncool 0 -1 -2 Schlecht fürs Klima 0 -1 -2 Liebloses Design 1 A=Reihenfolge: erst Frage 68 mit Weihenstephan und dann Frage 69 mit Alpro 2 B=Reihenfolge erst Frage Frage 69 mit Alpro und dann 68 mit Weihenstephan

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `m069adiff1_1quali` | numeric | 2703 | 1 (17); 2 (23); 3 (37); 4 (24); 5 (7) |
| `m069adiff1_2vertrauen` | numeric | 2703 | 1 (6); 2 (14); 3 (33); 4 (38); 5 (17) |
| `m069adiff1_3regio` | numeric | 2703 | 1 (18); 2 (18); 3 (50); 4 (14); 5 (8) |
| `m069adiff1_4modern` | numeric | 2703 | 1 (3); 2 (7); 3 (36); 4 (36); 5 (26) |
| `m069adiff1_5aufdringlich` | numeric | 2703 | 1 (7); 2 (15); 3 (56); 4 (20); 5 (10) |
| `m069adiff1_6preis` | numeric | 2703 | 1 (3); 2 (5); 3 (30); 4 (40); 5 (30) |
| `m069adiff1_7passt` | numeric | 2704 | 1 (5); 2 (9); 3 (22); 4 (42); 5 (29) |
| `m069adiff1_8cool` | numeric | 2703 | 1 (9); 2 (16); 3 (43); 4 (29); 5 (11) |
| `m069adiff1_9klima` | numeric | 2702 | 1 (3); 2 (10); 3 (38); 4 (35); 5 (23) |
| `m069adiff1_10design` | numeric | 2704 | 1 (2); 2 (11); 3 (35); 4 (43); 5 (16) |
| `m069adiff2_1quali` | numeric | 2687 | 1 (11); 2 (22); 3 (49); 4 (24); 5 (18) |
| `m069adiff2_2vertrauen` | numeric | 2688 | 1 (9); 2 (12); 3 (47); 4 (37); 5 (18) |
| `m069adiff2_3regio` | numeric | 2687 | 1 (25); 2 (25); 3 (43); 4 (20); 5 (11) |
| `m069adiff2_4modern` | numeric | 2687 | 1 (8); 2 (5); 3 (37); 4 (46); 5 (28) |
| `m069adiff2_5aufdringlich` | numeric | 2687 | 1 (10); 2 (14); 3 (59); 4 (26); 5 (15) |
| `m069adiff2_6preis` | numeric | 2687 | 1 (2); 2 (8); 3 (34); 4 (47); 5 (33) |
| `m069adiff2_7passt` | numeric | 2688 | 1 (8); 2 (6); 3 (23); 4 (48); 5 (38) |
| `m069adiff2_8cool` | numeric | 2687 | 1 (11); 2 (12); 3 (54); 4 (30); 5 (17) |
| `m069adiff2_9klima` | numeric | 2687 | 1 (9); 2 (11); 3 (48); 4 (36); 5 (20) |
| `m069adiff2_10design` | numeric | 2686 | 1 (8); 2 (3); 3 (41); 4 (49); 5 (24) |
| `M069adiff2_1quali` | numeric | 2579 | -2 (28); -1 (45); 0 (86); 1 (48); 2 (25) |
| `M069adiff2_2vertrauen` | numeric | 2580 | -2 (15); -1 (26); 0 (80); 1 (75); 2 (35) |
| `M069adiff2_3regio` | numeric | 2579 | -2 (43); -1 (43); 0 (93); 1 (34); 2 (19) |
| `M069adiff2_4modern` | numeric | 2579 | -2 (11); -1 (12); 0 (73); 1 (82); 2 (54) |
| `M069adiff2_5aufdringlich` | numeric | 2579 | -2 (17); -1 (29); 0 (115); 1 (46); 2 (25) |
| `M069adiff2_6preis` | numeric | 2579 | -2 (5); -1 (13); 0 (64); 1 (87); 2 (63) |
| `M069adiff2_7passt` | numeric | 2581 | -2 (13); -1 (15); 0 (45); 1 (90); 2 (67) |
| `M069adiff2_8cool` | numeric | 2579 | -2 (20); -1 (28); 0 (97); 1 (59); 2 (28) |
| `M069adiff2_9klima` | numeric | 2578 | -2 (12); -1 (21); 0 (86); 1 (71); 2 (43) |
| `M069adiff2_10design` | numeric | 2579 | -2 (10); -1 (14); 0 (76); 1 (92); 2 (40) |

### F70 · Schauen Sie sich die beiden Marken „Herstellermarke und Handelsmarke“ an. Welche … (S. 47)

**Frage:** Schauen Sie sich die beiden Marken „Herstellermarke und Handelsmarke“ an. Welche Kriterien passen besser zur Herstellermarke und welche besser zur Handelsmarke?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix [m070handeldiff3] -> [M070handeldiff3], AC-Test [ac070handeldiff3] -> [AC070handeldiff3f], zufällige Reihenfolge, Regt zum Kauf an immer als letztes, angepasst Lebensmittelzeitung Handelsmarkemmonitor 2024 1hochwertig 2regio 3preis 4tierwohl 5vielfalt 6vetrauen 7nachhaltig 8gesund 9kauf 10trends Qualitativ hochwertig Regional Günstiger Preis Beachtet Tierwohl Große Produktvielfalt Wirkt vertrauensvoll Nachhaltig Gesund Regt zum Kauf an Innovativ, setzt Trends Passt am bestem zur Herstellermarke +2 +2 +2 +2 +2 +2 +2 +2 +2 +2 +1 +1 +1 +1 +1 +1 +1 +1 +1 +1 Unentschieden 0 0 0 0 0 0 0 0 0 0 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 Passt am besten zur Handelsmarke -2 -2 -2 -2 -2 -2 -2 -2 -2 -2 AC-Test 1 Herstellermarke - Handelsmarke Milch + Nutri-Score A 2 Herstellermarke - Handelsmmarke Milch + Nutri-Score D - 3 - Herstellermarke - Handelsmarke Milch + ohne Nutri-Score

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `ac070handeldiff3` | numeric | 2577 | 1 (77); 2 (69); 3 (88) |
| `m070handeldiff1_1hochwertig` | numeric | 2734 | 1 (4); 2 (1); 3 (36); 4 (24); 5 (12) |
| `m070handeldiff1_2regio` | numeric | 2735 | 1 (4); 2 (4); 3 (43); 4 (12); 5 (13) |
| `m070handeldiff1_3preis` | numeric | 2734 | 1 (38); 2 (12); 3 (16); 4 (5); 5 (6) |
| `m070handeldiff1_4tierwohl` | numeric | 2734 | 1 (2); 2 (3); 3 (50); 4 (11); 5 (11) |
| `m070handeldiff1_5vielfalt` | numeric | 2734 | 1 (7); 2 (3); 3 (39); 4 (16); 5 (12) |
| `m070handeldiff1_6vetrauen` | numeric | 2734 | 1 (2); 2 (8); 3 (36); 4 (18); 5 (13) |
| `m070handeldiff1_7nachhaltig` | numeric | 2734 | 1 (4); 2 (3); 3 (50); 4 (12); 5 (8) |
| `m070handeldiff1_8gesund` | numeric | 2734 | 1 (5); 2 (6); 3 (43); 4 (13); 5 (10) |
| `m070handeldiff1_9kauf` | numeric | 2734 | 1 (4); 2 (10); 3 (33); 4 (14); 5 (16) |
| `m070handeldiff1_10trends` | numeric | 2734 | 1 (4); 2 (3); 3 (40); 4 (16); 5 (14) |
| `m070handeldiff2_1hochwertig` | numeric | 2742 | 1 (1); 2 (3); 3 (40); 4 (16); 5 (9) |
| `m070handeldiff2_2regio` | numeric | 2742 | 1 (3); 2 (9); 3 (43); 4 (9); 5 (5) |
| `m070handeldiff2_3preis` | numeric | 2742 | 1 (36); 2 (8); 3 (18); 4 (4); 5 (3) |
| `m070handeldiff2_4tierwohl` | numeric | 2743 | 2 (3); 3 (50); 4 (6); 5 (9) |
| `m070handeldiff2_5vielfalt` | numeric | 2742 | 1 (5); 2 (1); 3 (43); 4 (13); 5 (7) |
| `m070handeldiff2_6vetrauen` | numeric | 2742 | 1 (5); 2 (6); 3 (40); 4 (12); 5 (6) |
| `m070handeldiff2_7nachhaltig` | numeric | 2742 | 1 (2); 2 (4); 3 (52); 4 (5); 5 (6) |
| `m070handeldiff2_8gesund` | numeric | 2742 | 1 (1); 2 (2); 3 (55); 4 (6); 5 (5) |
| `m070handeldiff2_9kauf` | numeric | 2743 | 1 (6); 2 (11); 3 (31); 4 (13); 5 (7) |
| `m070handeldiff2_10trends` | numeric | 2743 | 1 (1); 2 (7); 3 (46); 4 (6); 5 (8) |
| `m070handeldiff3_1hochwertig` | numeric | 2726 | 1 (2); 2 (1); 3 (48); 4 (14); 5 (20) |
| `m070handeldiff3_2regio` | numeric | 2724 | 1 (2); 2 (8); 3 (54); 4 (5); 5 (18) |
| `m070handeldiff3_3preis` | numeric | 2725 | 1 (42); 2 (18); 3 (14); 4 (3); 5 (9) |
| `m070handeldiff3_4tierwohl` | numeric | 2725 | 1 (1); 3 (55); 4 (16); 5 (14) |
| `m070handeldiff3_5vielfalt` | numeric | 2725 | 1 (1); 2 (7); 3 (49); 4 (15); 5 (14) |
| `m070handeldiff3_6vetrauen` | numeric | 2725 | 1 (1); 2 (5); 3 (47); 4 (19); 5 (14) |
| `m070handeldiff3_7nachhaltig` | numeric | 2724 | 1 (2); 2 (5); 3 (63); 4 (4); 5 (13) |
| `m070handeldiff3_8gesund` | numeric | 2725 | 1 (3); 2 (3); 3 (61); 4 (8); 5 (11) |
| `m070handeldiff3_9kauf` | numeric | 2725 | 1 (8); 2 (8); 3 (40); 4 (18); 5 (12) |
| `m070handeldiff3_10trends` | numeric | 2725 | 1 (1); 2 (3); 3 (57); 4 (11); 5 (14) |
| `AC070handeldiff3f` | character | 2577 | Hersteller - Handel+NutriScore A (77); Hersteller - Handel+NutriScore D (69); Hersteller - Handel+ohne NutriScore (88) |
| `M070handeldiff3_1hochwertig` | numeric | 2580 | -2 (7); -1 (5); 0 (124); 1 (54); 2 (41) |
| `M070handeldiff3_2regio` | numeric | 2579 | -2 (9); -1 (21); 0 (140); 1 (26); 2 (36) |
| `M070handeldiff3_3preis` | numeric | 2579 | -2 (116); -1 (38); 0 (48); 1 (12); 2 (18) |
| `M070handeldiff3_4tierwohl` | numeric | 2580 | -2 (3); -1 (6); 0 (155); 1 (33); 2 (34) |
| `M070handeldiff3_5vielfalt` | numeric | 2579 | -2 (13); -1 (11); 0 (131); 1 (44); 2 (33) |
| `M070handeldiff3_6vetrauen` | numeric | 2579 | -2 (8); -1 (19); 0 (123); 1 (49); 2 (33) |
| `M070handeldiff3_7nachhaltig` | numeric | 2578 | -2 (8); -1 (12); 0 (165); 1 (21); 2 (27) |
| `M070handeldiff3_8gesund` | numeric | 2579 | -2 (9); -1 (11); 0 (159); 1 (27); 2 (26) |
| `M070handeldiff3_9kauf` | numeric | 2580 | -2 (18); -1 (29); 0 (104); 1 (45); 2 (35) |
| `M070handeldiff3_10trends` | numeric | 2580 | -2 (6); -1 (13); 0 (143); 1 (33); 2 (36) |

### F71 · Können Sie einmal alle Marken von Milch und pflanzlichen Milchalternativen (z.B. … (S. 47)

**Frage:** Können Sie einmal alle Marken von Milch und pflanzlichen Milchalternativen (z.B. Haferdrinks) nennen, die Ihnen spontan einfallen?

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Langer freier Text, [m071ungestuetzt]

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `m071ungestuetzt` | character | 2592 | Freitext (nicht zitieren) |

### F72 · Welche der nachfolgenden Marken von Milch (tierisch/pflanzliche Alternative) haben Sie … (S. 48)

**Frage:** Welche der nachfolgenden Marken von Milch (tierisch/pflanzliche Alternative) haben Sie schon mal gesehen? (Mehrfachnennung möglich)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [m072gestuetzt], zufällige Reihenfolge 1aldibio ALDI Bio 2allos 3alnatura Allos Alnatura 4alpro 5ammerlaender Alpro Ammerländer 6andechser 7arla 8baerenmarke 9berchtesgarden 10berief Andechser Arla Bärenmarke Berchesgardener Land Berief 11demeter 12dennree Demeter dennree 13dmbio 14edekabio dmBio Edeka Bio 15edekaveggie 16frankenland 17frankenland 18gug 19hansano 20kclassic 21kbio 22veggie 23landliebe 24milbona 25natumi 26naturgut Edeka My veggie Fair und gut Frankenland GUT&GÜNSTIG Hansano K-Classic K-Bio K-take it veggie Landliebe Milbona Natumi Naturgut Bio 27nettobio 28otlay Netto Bio Bio Oatly 29rewebio 30schwarzwald Rewe Bio Schwarzwaldmilch 31soebbeke 32veganz 33velike Söbbeke veganz Velike 34vlynomilk vly no mlik sonst Sonstige und zwar:

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `m072gestuetzt_1aldibio` | numeric | 2577 | 0 (160); 1 (74) |
| `m072gestuetzt_2allos` | numeric | 2577 | 0 (218); 1 (16) |
| `m072gestuetzt_3alnatura` | numeric | 2577 | 0 (112); 1 (122) |
| `m072gestuetzt_4alpro` | numeric | 2577 | 0 (82); 1 (152) |
| `m072gestuetzt_5ammerlaender` | numeric | 2577 | 0 (200); 1 (34) |
| `m072gestuetzt_6andechser` | numeric | 2577 | 0 (165); 1 (69) |
| `m072gestuetzt_7arla` | numeric | 2577 | 0 (106); 1 (128) |
| `m072gestuetzt_8baerenmarke` | numeric | 2577 | 0 (49); 1 (185) |
| `m072gestuetzt_9berchtesgarden` | numeric | 2577 | 0 (128); 1 (106) |
| `m072gestuetzt_10berief` | numeric | 2577 | 0 (221); 1 (13) |
| `m072gestuetzt_11demeter` | numeric | 2577 | 0 (154); 1 (80) |
| `m072gestuetzt_12dennree` | numeric | 2577 | 0 (208); 1 (26) |
| `m072gestuetzt_13dmbio` | numeric | 2577 | 0 (134); 1 (100) |
| `m072gestuetzt_14edekabio` | numeric | 2577 | 0 (125); 1 (109) |
| `m072gestuetzt_15edekaveggie` | numeric | 2577 | 0 (192); 1 (42) |
| `m072gestuetzt_16fairgut` | numeric | 2577 | 0 (214); 1 (20) |
| `m072gestuetzt_17frankenland` | numeric | 2577 | 0 (213); 1 (21) |
| `m072gestuetzt_18gug` | numeric | 2577 | 0 (65); 1 (169) |
| `m072gestuetzt_19hansano` | numeric | 2577 | 0 (187); 1 (47) |
| `m072gestuetzt_20kclassic` | numeric | 2577 | 0 (117); 1 (117) |
| `m072gestuetzt_21kbio` | numeric | 2577 | 0 (161); 1 (73) |
| `m072gestuetzt_22veggie` | numeric | 2577 | 0 (196); 1 (38) |
| `m072gestuetzt_23landliebe` | numeric | 2577 | 0 (56); 1 (178) |
| `m072gestuetzt_24milbona` | numeric | 2577 | 0 (106); 1 (128) |
| `m072gestuetzt_25natumi` | numeric | 2577 | 0 (220); 1 (14) |
| `m072gestuetzt_26naturgut` | numeric | 2577 | 0 (197); 1 (37) |
| `m072gestuetzt_27nettobio` | numeric | 2577 | 0 (158); 1 (76) |
| `m072gestuetzt_28otlay` | numeric | 2577 | 0 (112); 1 (122) |
| `m072gestuetzt_29rewebio` | numeric | 2577 | 0 (125); 1 (109) |
| `m072gestuetzt_30schwarzwald` | numeric | 2577 | 0 (174); 1 (60) |
| `m072gestuetzt_31soebbeke` | numeric | 2577 | 0 (214); 1 (20) |
| `m072gestuetzt_32veganz` | numeric | 2577 | 0 (195); 1 (39) |
| `m072gestuetzt_33velike` | numeric | 2577 | 0 (227); 1 (7) |
| `m072gestuetzt_34vlynomilk` | numeric | 2577 | 0 (186); 1 (48) |
| `m072gestuetzt_other` | character | 2577 | Freitext (nicht zitieren) |

### F73 · Heutzutage wird immer mehr über die Frage diskutiert, ob man Milch oder pflanzliche … (S. 50)

**Frage:** Heutzutage wird immer mehr über die Frage diskutiert, ob man Milch oder pflanzliche Milchalternativen kaufen sollte. Welche 5 der unten genannten Gründe würden Sie am ehesten Motivieren, pflanzliche Milchalternativen zu kaufen? (max. 5 Gründe)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [m073haferpro], , zufällige Reihenfolge, Antwortkategorie ..keine Hafermilch kaufen“ fest immer oben anzeigen, angepasst an statista 2024.. 1nohafer Ich würde grundsätzlich keine(n) Hafermilch/Haferdrink kaufen 2notierleid 3klima 4unvertraeglich 5vegan 6gesundheit 7geschmack 8preisleistung 9fettarm 10wietier 11calcium 12ressourcen sonst Kein Tierleid Klimaschutz / CO2-Abdruck Wegen Milchunverträglichkeit Spezielle Ernährung (z.B. vegan) Wegen meiner Gesundheit Milder, süßlicher Geschmack Preis/Leistung passend Cholesterienfrei / fettarm Nahe am tierischen Original Anreicherung von Calcium und Vitaminen Ressourcenschonung (z.B. weniger Wasser-/Landverbrauch) Sonstiges und zwar:

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `m073haferpro1_nohafer` | numeric | 2577 | 0 (128); 1 (106) |
| `m073haferpro_2notierleid` | numeric | 2577 | 0 (161); 1 (73) |
| `m073haferpro_3klima` | numeric | 2577 | 0 (194); 1 (40) |
| `m073haferpro_4unvertraeglich` | numeric | 2577 | 0 (195); 1 (39) |
| `m073haferpro_5vegan` | numeric | 2577 | 0 (201); 1 (33) |
| `m073haferpro_6gesundheit` | numeric | 2577 | 0 (188); 1 (46) |
| `m073haferpro_7geschmack` | numeric | 2577 | 0 (201); 1 (33) |
| `m073haferpro_8preisleistung` | numeric | 2577 | 0 (160); 1 (74) |
| `m073haferpro_9fettarm` | numeric | 2577 | 0 (206); 1 (28) |
| `m073haferpro_10wietier` | numeric | 2577 | 0 (198); 1 (36) |
| `m073haferpro_11calcium` | numeric | 2577 | 0 (207); 1 (27) |
| `m073haferpro_12ressourcen` | numeric | 2577 | 0 (185); 1 (49) |
| `m073haferpro_other` | numeric | 2582 | Freitext (nicht zitieren) |

### F74 · Warum würden Sie keine pflanzlichen Milchalternativen kaufen? (Mehrfachnennung möglich) … (S. 50)

**Frage:** Warum würden Sie keine pflanzlichen Milchalternativen kaufen? (Mehrfachnennung möglich) (max. 5 Gründe)

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Mehrfachauswahl [m074hafercontra], zufällige Reihenfolge, Bedingung: nur wenn F73 = Hafermilch kaufen,DGE 2024, statista 2021 1anreicherung 2unvertraeglich 3geschmack 4preis 5auswahl 6schaum 7naehrstoffe 8nonatur 9sorten 10umwelt sonst Zu viele Zusatzstoffe Wegen Unverträglichkeiten Schmeckt nicht Zu hoher Preis Zu geringe Auswahl Schäumt nicht so gut Nicht genug Nährstoffe Nicht natürlich (Industrieprodukt) Zu viele Sorten / unübersichtlich Umweltbedenken Sonstiges und zwar: B Spezialthema-3: Technische Innovation: Lachsprodukt, Gluten-freies Brot mit Gentechnik (F75 – F97) Im folgenden Themenblock geht es um verschiedene Produktverbesserungen durch technologische Neuerungen. Wir starten mit ein paar Fragen zu Brot und zu angereicherten Lebensmitteln.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `m074hafercontra_1anreicherung` | numeric | 2705 | 0 (90); 1 (16) |
| `m074hafercontra_2unvertraeglich` | numeric | 2705 | 0 (103); 1 (3) |
| `m074hafercontra_3geschmack` | numeric | 2705 | 0 (36); 1 (70) |
| `m074hafercontra_4preis` | numeric | 2705 | 0 (55); 1 (51) |
| `m074hafercontra_5auswahl` | numeric | 2705 | 0 (102); 1 (4) |
| `m074hafercontra_6schaum` | numeric | 2705 | 0 (100); 1 (6) |
| `m074hafercontra_7naehrstoffe` | numeric | 2705 | 0 (94); 1 (12) |
| `m074hafercontra_8nonatur` | numeric | 2705 | 0 (79); 1 (27) |
| `m074hafercontra_9sorten` | numeric | 2705 | 0 (97); 1 (9) |
| `m074hafercontra_10umwelt` | numeric | 2705 | 0 (98); 1 (8) |
| `m074hafercontra_other` | character | 2705 | Freitext (nicht zitieren) |

### F216 · Wie häufig nutzen Sie die folgenden Medien? Eine grobe Eischätzung genügt. (S. 147)

**Frage:** Wie häufig nutzen Sie die folgenden Medien? Eine grobe Eischätzung genügt.

**Fragetyp und Codes laut Fragebogen** (Text der PDF ohne Layout): Matrix, [d216medien] Meistens Etwa wö- Etwa mo- Seltener Nie täglich chentlich natlich 1tvoef Öffentlich-rechtliches 4 3 2 1 0 Fernsehen (z.B. ARD, ZDF, regionale Dritte) 2tvprivat Private Unterhaltungs- 4 3 2 1 0 sender (z.B. RTL, Pro- Sieben, Sat.1, VOX) 3tvkultur Kultur- und Bildungs- 4 3 2 1 0 sender (z.B. 3sat, Arte) 4tvstream Streaming-Dienste (z.B. Netflix, Prime Video, Disney+) 4 3 2 1 0 5radio Radio 4 3 2 1 0 6radiostream Musik-Streaming (z.B. 4 3 2 1 0 Spotify, Apple Music) 7printlokal Lokale Tagezeitung 4 3 2 1 0 8printquali Qualitätszeitungen 4 3 2 1 0 (z.B. FAZ, Welt, Zeit, taz) 9printstyle Unterhaltungs- und 4 3 2 1 0 Lifestylemagazine ( z.B. Bunte, Brigitte, Cosmopolitan) 10printtv TV-ProgrammMagazine 4 3 2 1 0 11printspe- Special-Interest-Maga- 4 3 2 1 0 zial zine (z.B. Auto, Sport, Kochen, Wohnen) 12online Online-Nachrichten / 4 3 2 1 0 Nachrichtenportale 13youtube YouTube / Video-Platt- 4 3 2 1 0 formen 14podcats Podcasts 4 3 2 1 0 15blogs Blogs / Foren / Online- 4 3 2 1 0 Communities 16gaming Gaming / Spieleplatt- 4 3 2 1 0 formen 17insta 18tiktok 19facebook Instagram TikTok Facebook 4 3 2 1 0 4 3 2 1 0 4 3 2 1 0 LimeSurvey-Programmierung Hinweise In R über rename herausnahme der 1,2,3,4,5 im Variablennamen Fragengruppe d216medien Frageeinstellungen Allgemein Code: medien1/medien2/medien3/medien4/medien5 Fragetyp: Matrix Logik Anzeige Teilfragenbreite: 40 Antwortoptionen 4 3 2 1 0 Bedingungsdesigner Fragen q000stoerung q000teilnahme q001hheinkauf q002geburt Meistens täglich Etwa wöchentlich Etwa monatlich Seltener Nie Nur wenn Antwortcode -> dann Frage anzeigen 1= Ich nehme an der Studie teil. und 1= Aufklärungsschreiben gelesen und möchte teilnehmen. und 2=hauptsächlich ich selbst oder 1=selbst/anderePers und Vergleichsoperator: Kleiner oder gleich …

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `d216medien_1tvoef` | numeric | 1439 | 0 (220); 1 (191); 2 (108); 3 (286); 4 (567) |
| `d216medien_2tvprivat` | numeric | 1441 | 0 (230); 1 (192); 2 (113); 3 (408); 4 (427) |
| `d216medien_3tvkultur` | numeric | 1442 | 0 (308); 1 (333); 2 (221); 3 (377); 4 (130) |
| `d216medien_4tvstream` | numeric | 1446 | 0 (318); 1 (125); 2 (124); 3 (384); 4 (414) |
| `d216medien_5radio` | numeric | 1455 | 0 (176); 1 (131); 2 (67); 3 (254); 4 (728) |
| `d216medien_6radiostream` | numeric | 1449 | 0 (450); 1 (159); 2 (91); 3 (280); 4 (382) |
| `d216medien_7printlokal` | numeric | 1440 | 0 (465); 1 (251); 2 (98); 3 (269); 4 (288) |
| `d216medien_8printquali` | numeric | 1442 | 0 (683); 1 (322); 2 (147); 3 (143); 4 (74) |
| `d216medien_9printstyle` | numeric | 1442 | 0 (868); 1 (285); 2 (109); 3 (81); 4 (26) |
| `d216medien_10printtv` | numeric | 1447 | 0 (788); 1 (183); 2 (94); 3 (143); 4 (156) |
| `d216medien_11printspezial` | numeric | 1450 | 0 (719); 1 (316); 2 (176); 3 (119); 4 (31) |
| `d216medien_12online` | numeric | 1444 | 0 (232); 1 (168); 2 (87); 3 (303); 4 (577) |
| `d216medien_13youtube` | numeric | 1445 | 0 (172); 1 (195); 2 (167); 3 (419); 4 (413) |
| `d216medien_14podcats` | numeric | 1445 | 0 (608); 1 (260); 2 (145); 3 (231); 4 (122) |
| `d216medien_15blogs` | numeric | 1450 | 0 (680); 1 (293); 2 (140); 3 (178); 4 (70) |
| `d216medien_16gaming` | numeric | 1446 | 0 (788); 1 (188); 2 (94); 3 (173); 4 (122) |
| `d216medien_17insta` | numeric | 1443 | 0 (576); 1 (67); 2 (61); 3 (136); 4 (528) |
| `d216medien_18tiktok` | numeric | 1442 | 0 (938); 1 (78); 2 (50); 3 (89); 4 (214) |
| `d216medien_19facebook` | numeric | 1444 | 0 (477); 1 (82); 2 (78); 3 (205); 4 (525) |

## Spalten ohne Frage im Fragebogen

Diese Spalten ließen sich keiner Frage zuordnen, meist berechnete Variablen oder Experimentzuweisungen (`ac…`, `ax…`). Im Zweifel die PDF durchsuchen.

| Spalte | Typ | fehlend | vorkommende Werte (Anzahl) |
|---|---|---|---|
| `axspezial5` | numeric | 1385 | 1 (268); 2 (268); 3 (293); 4 (275); 5 (322) |
| `axpreis5` | numeric | 1618 | 1 (233); 2 (237); 3 (232); 4 (243); 5 (248) |
| `AXpreis5` | numeric | 478 | 1 (233); 2 (237); 3 (601); 4 (620); 5 (642) |
| `AXpreis5f` | character | 478 | Garbor-Granger Peistest (642); offner Preis (233); Preisklassentest (237); Preisreaktionstest (601); Van Westendorp-Methode (620) |
| `AXspezial9` | numeric | 114 | 1 (295); 2 (268); 3 (308); 5 (325); 6 (268); 7 (293); 8 (343); 9 (275); 10 (322) |
| `AXspezial9f` | character | 436 | SP1 Schoko (295); SP10 Proteinersatz (275); SP2 Milch (268); SP3 tech Innovation (308); SP6 Handwerk (325); SP7 InVerBio (268); SP8 Brokkoli umweltgerecht (293); SP9 Broccolino (343) |
