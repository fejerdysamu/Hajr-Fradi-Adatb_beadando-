# phpMyAdmin-ban készült az SQL adatbázis
Készítette: Orosz Gergő Bence és Fejérdy Samu Vilmos
Adatbázis leírása: 
  Labdarúgó bajnokság mérkőzéseinek nyílvántartása
      Táblák: Csapat(csapat_id(kulcs): INT(11), név: VARCHAR(100), edző: VARCHAR(100)),
              Játékos(játékos_id (kulcs): INT(11), név: VARCHAR(100), pozíció: VARCHAR(30), csapat_id (külső kulcs): INT(11)),
              Stadion(stadion_id (kulcs): INT(11), név: VARCHAR(100), város: VARCHAR(100), férőhely: INT(11))
              Meccs(meccs_id (kulcs): INT(11), hazai_id (külső kulcs): INT(11), vendég_id (külső kulcs): INT(11), meccs_dátum: DATE,
              stadion_id (külső kulcs): INT(11), hazai_gólok: INT(11), vendég_gólok: INT(11))
              Gól(gól_id (kulcs): INT(11), meccs_id (külső kulcs): INT(11), játékos_id (külső kulcs): INT(11), percben_betalált: INT(11), öngól: BIT(1))
Lekérdezések leírása:
  1. Játékosok össz gólja
  2. Gönygyölített gólok
  3. Legtöbb gól egy meccsen
  4. Csapatonként összes rúgott gól (öngól nélkül)(Hajrá Fradi)
  5. Meccsek adatai, illetve az előtte levő 3 meccs átlag gólmennyisége és a mögötte levő 3 meccs átlag gólmennyisége
  6. Fradi összes meccs ellenfél, gólok, gólkülönbségek
  7. Melyik stadionba született a legtöbb gól
  8. A csapatok ponttáblázata (3 pont győzelem, 1 döntetlen, 0 vereség)
