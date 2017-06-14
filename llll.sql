call dodaj_pacjenta('gvfb',
'afdbgab',
'fgargab',str_to_date('28/09/1981','%d/%m/%Y'),
'4585475','dfhfgjfgj','fgafgfd 5', 17,'458477','zamieszkania');

DELIMITER $$
CREATE PROCEDURE dodaj_pacjenta(
v_imie VARCHAR(20),
v_nazwisko VARCHAR(20),
v_pesel VARCHAR(12),
v_data_urodzenia DATE,
v_numer_telefonu VARCHAR(100),
v_email VARCHAR(100),
v_ulica_i_numer_domu VARCHAR(100),
v_id_miasto MEDIUMINT(8),
v_kod_pocztowy VARCHAR(10),
v_rodzaj ENUM('korespondencyjny','zamieszkania','zameldowania'))
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 ROLLBACK;
SELECT 'Błąd podczas dodawania pacjenta';
 END;
 START TRANSACTION;
 INSERT INTO osoby(imie,nazwisko) VALUES(v_imie, v_nazwisko);
 INSERT INTO pacjenci(pesel,data_urodzenia) VALUES(v_pesel, v_data_urodzenia);
 INSERT INTO dane_kontaktowe(numer_telefonu,email) VALUES(v_numer_telefonu, v_email);
 INSERT INTO adresy(ulica_i_numer_domu,id_miasto,kod_pocztowy,rodzaj) VALUES(v_ulica_i_numer_domu,v_id_miasto,v_kod_pocztowy,v_rodzaj);
 COMMIT;
END $$
DELIMITER ;