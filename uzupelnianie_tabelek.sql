LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/icd10.csv'
INTO TABLE icd10
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/icd9.csv'
INTO TABLE icd9
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/miasta.csv'
INTO TABLE miasta_polskie
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(miasto);

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/osoby.csv'
INTO TABLE osoby
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(imie, nazwisko);

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/adresy.csv'
INTO TABLE adresy
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS
(id,ulica_i_numer_domu, id_miasto,kod_pocztowy,rodzaj, @ignore_column);

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/dane_kontaktowe.csv'
INTO TABLE dane_kontaktowe
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS
(id, numer_telefonu, @local_email)
SET email = IFNULL(null,@local_email);

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/lekarze.csv'
INTO TABLE lekarze
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/specjalizacje.csv'
INTO TABLE specjalizacje
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(nazwa);

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/lekarze_specjalizacje_link.csv'
INTO TABLE lekarze_specjalizacje_link
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/pacjenci.csv'
INTO TABLE pacjenci
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/personel.csv'
INTO TABLE personel
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/producenci.csv'
INTO TABLE producenci
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS
(nazwa, siedziba, telefon, email);

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/materialy.csv'
INTO TABLE materialy
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/implanty.csv'
INTO TABLE implanty
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/rozmiary_implantow.csv'
INTO TABLE rozmiary_implantow
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/korony.csv'
INTO TABLE korony
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/odcienie.csv'
INTO TABLE odcienie_koron
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/zeby.csv'
INTO TABLE zeby
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/wizyty.csv'
INTO TABLE wizyty
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS
(l_id,p_id,data_wizyty);

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Workbench 6.3 CE/data/csv/przebieg.csv'
INTO TABLE przebieg
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 2 ROWS
(w_id, z_id, kod_schorzenia,kod_procedury, @local_ic,@local_komentarz)
SET id_ic = IFNULL(null,@local_ic),
komentarz = IFNULL(null,@local_komentarz);


