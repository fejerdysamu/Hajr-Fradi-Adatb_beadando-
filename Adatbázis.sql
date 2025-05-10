CREATE TABLE Csapat ( csapat_id INT PRIMARY KEY, név VARCHAR(100) NOT NULL, edző VARCHAR(100) ); 

CREATE TABLE Játékos ( játékos_id INT PRIMARY KEY, név VARCHAR(100), pozíció VARCHAR(30), csapat_id INT, FOREIGN KEY (csapat_id) REFERENCES Csapat(csapat_id) ); 

CREATE TABLE Stadion ( stadion_id INT PRIMARY KEY, név VARCHAR(100), város VARCHAR(100), férőhely INT ); 

CREATE TABLE Meccs ( meccs_id INT PRIMARY KEY, hazai_id INT, vendég_id INT, meccs_dátum DATE, stadion_id INT, hazai_gólok INT, vendég_gólok INT, FOREIGN KEY (hazai_id) REFERENCES Csapat(csapat_id), FOREIGN KEY (vendég_id) REFERENCES Csapat(csapat_id), FOREIGN KEY (stadion_id) REFERENCES Stadion(stadion_id) ); 

CREATE TABLE Gól ( gól_id INT PRIMARY KEY, meccs_id INT, játékos_id INT, percben_betalált INT, öngól BIT, FOREIGN KEY (meccs_id) REFERENCES Meccs(meccs_id), FOREIGN KEY (játékos_id) REFERENCES Játékos(játékos_id) ); 

INSERT INTO Csapat (csapat_id, név, edző) VALUES (1, 'Blabla Klub', 'János Kovács'), (2, 'Ferencváros','Anna Szabó'), (3, 'Sunrise Rovers', 'Péter Nagy'), (4, 'Mountain Rangers', 'Katalin Tóth'), (5, 'River City Stars', 'Zsolt Horváth'); 

INSERT INTO Stadion (stadion_id, név, város, férőhely) VALUES (1, 'Serenity Arena', 'Budapest', 15000), (2, 'Valley Stadium', 'Sopron', 8000), (3, 'Rovers Park', 'Debrecen', 12000), (4, 'Ranger Field', 'Miskolc', 9000), (5, 'River City Ground', 'Győr', 11000); 

INSERT INTO Játékos (játékos_id, név, pozíció, csapat_id) VALUES (1, 'Balázs Horváth', 'Kapus', 1), (2, 'Tamás Varga', 'Védő', 1), (3, 'Gábor Kiss', 'Védő', 1), (4, 'Miklós Farkas', 'Középpályás', 1), (5, 'Zoltán Nagy', 'Középpályás', 1), (6, 'Csaba Szűcs', 'Csatár', 1), (7, 'Dávid Molnár', 'Csatár', 1), (8, 'Erik Balogh', 'Védő', 1), 

(9, 'Ádám Kovács', 'Kapus', 2), (10, 'Laura Németh', 'Védő', 2), (11, 'Bence Molnár', 'Védő', 2), (12, 'Réka Szabó', 'Középpályás', 2), (13, 'Zsófia Tóth', 'Középpályás', 2), (14, 'Péter Horváth', 'Csatár', 2), (15, 'Eszter Varga', 'Csatár', 2), (16, 'Gergő Kiss', 'Védő', 2), 

(17, 'Tamara Szűcs', 'Kapus', 3), (18, 'Márk Balogh', 'Védő', 3), (19, 'László Molnár', 'Védő', 3), (20, 'Nikolett Horváth', 'Középpályás', 3), (21, 'István Nagy', 'Középpályás', 3), (22, 'Katalin Kiss', 'Csatár', 3), (23, 'Attila Varga', 'Csatár', 3), (24, 'Júlia Tóth', 'Védő', 3), 

(25, 'Gábor Szabó', 'Kapus', 4), (26, 'Anikó Molnár', 'Védő', 4), (27, 'Barnabás Horváth', 'Védő', 4), (28, 'Orsolya Balogh', 'Középpályás', 4), (29, 'Csaba Tóth', 'Középpályás', 4), (30, 'Enikő Nagy', 'Csatár', 4), (31, 'Zsolt Varga', 'Csatár', 4), (32, 'Dóra Kiss', 'Védő', 4), 

(33, 'László Kovács', 'Kapus', 5), (34, 'Zita Szűcs', 'Védő', 5), (35, 'Máté Balogh', 'Védő', 5), (36, 'Fanni Molnár', 'Középpályás', 5), (37, 'Norbert Horváth', 'Középpályás', 5), (38, 'Jázmin Tóth', 'Csatár', 5), (39, 'Roland Nagy', 'Csatár', 5), (40, 'Panna Kiss', 'Védő', 5); 

INSERT INTO Meccs (meccs_id, hazai_id, vendég_id, meccs_dátum, stadion_id, hazai_gólok, vendég_gólok) VALUES (1, 1, 2, '2025-06-01', 1, 1, 1), (2, 1, 3, '2025-06-02', 1, 2, 1), (3, 1, 4, '2025-06-03', 1, 1, 1), (4, 1, 5, '2025-06-04', 1, 1, 1), (5, 2, 1, '2025-06-05', 2, 2, 0), (6, 2, 3, '2025-06-06', 2, 2, 1), (7, 2, 4, '2025-06-07', 2, 2, 1), (8, 2, 5, '2025-06-08', 2, 1, 1), (9, 3, 1, '2025-06-09', 3, 1, 0), (10, 3, 2, '2025-06-10', 3, 1, 1), (11, 3, 4, '2025-06-11', 3, 2, 0), (12, 3, 5, '2025-06-12', 3, 0, 1), (13, 4, 1, '2025-06-13', 4, 1, 0), (14, 4, 2, '2025-06-14', 4, 1, 2), (15, 4, 3, '2025-06-15', 4, 2, 1), (16, 4, 5, '2025-06-16', 4, 1, 1), (17, 5, 1, '2025-06-17', 5, 1, 0), (18, 5, 2, '2025-06-18', 5, 2, 1), (19, 5, 3, '2025-06-19', 5, 2, 0), (20, 5, 4, '2025-06-20', 5, 1, 1); 

INSERT INTO Gól (gól_id, meccs_id, játékos_id, percben_betalált, öngól) VALUES (1, 1, 6, 12, 0), (2, 1, 14, 38, 0), (3, 2, 3, 7, 0), (4, 2, 22, 41, 0), (5, 2, 4, 78, 0), (6, 3, 5, 18, 0), (7, 3, 28, 67, 0), (8, 4, 38, 55, 0), (9, 4, 5, 89, 1), (10, 5, 14, 24, 0), (11, 5, 15, 59, 0), (12, 6, 22, 36, 0), (13, 6, 18, 74, 0), (14, 6, 10, 80, 1), (15, 7, 14, 11, 0), (16, 7, 30, 43, 0), (17, 8, 38, 77, 0), (18, 9, 22, 60, 0), (19, 10, 13, 30, 0), (20, 10, 14, 88, 0), (21, 11, 21, 15, 0), (22, 11, 21, 89, 0), (23, 12, 39, 23, 0), (24, 13, 26, 48, 0), (25, 14, 14, 66, 0), (26, 14, 14, 88, 0), (27, 15, 22, 8, 0), (28, 15, 29, 88, 0), (29, 16, 36, 91, 0), (30, 16, 31, 91, 0), (31, 17, 33, 35, 0), (32, 18, 15, 19, 0), (33, 18, 11, 70, 0), (34, 19, 38, 42, 0), (35, 19, 30, 85, 0), (36, 20, 25, 58, 0), (37, 20, 25, 93, 0); 