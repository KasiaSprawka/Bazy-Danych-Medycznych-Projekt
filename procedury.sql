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
SELECT 'Błąd podczas uzupełniania danych pacjenta';
 END;
 START TRANSACTION;
 INSERT INTO osoby (imie,nazwisko) VALUES(v_imie, v_nazwisko);
 INSERT INTO pacjenci(p_id,pesel,data_urodzenia) VALUES(LAST_INSERT_ID(),v_pesel, v_data_urodzenia);
 INSERT INTO dane_kontaktowe(id,numer_telefonu,email) VALUES(LAST_INSERT_ID(),v_numer_telefonu, v_email);
 INSERT INTO adresy(id,ulica_i_numer_domu,id_miasto,kod_pocztowy,rodzaj) VALUES(LAST_INSERT_ID(),v_ulica_i_numer_domu,v_id_miasto,v_kod_pocztowy,v_rodzaj);
 COMMIT;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE dodaj_lekarza(
v_imie VARCHAR(20),
v_nazwisko VARCHAR(20),
v_numer_PWZ INT(3),
v_s_id VARCHAR(15))
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 ROLLBACK;
 SELECT 'Błąd podczas dodawania danych lekarza';
 END;
 START TRANSACTION;
	INSERT INTO osoby(imie, nazwisko) VALUES(v_imie, v_nazwisko);
	INSERT INTO lekarze(l_id,numer_PWZ) VALUES(LAST_INSERT_ID(),v_numer_PWZ);
    SET @lim = CHAR_LENGTH(v_s_id);
	SET @i=1;
	WHILE @i <= @lim DO
		SET @local_s_id = CAST(SUBSTR(v_s_id,@i,1) AS UNSIGNED);
		INSERT INTO lekarze_specjalizacje_link VALUES (LAST_INSERT_ID(), @local_s_id);
		SET @i := @i+2;
    END WHILE;
 COMMIT;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE dodaj_producenta(
v_nazwa VARCHAR(50),
v_siedziba MEDIUMINT(8),
v_telefon VARCHAR(40),
v_email VARCHAR(50))
BEGIN
 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 ROLLBACK;
 SELECT 'Błąd podczas dodawania danych producenta';
 END;
 START TRANSACTION;
 INSERT INTO producenci(nazwa, siedziba, telefon, email) VALUES( v_nazwa, v_siedziba, v_telefon, v_email);
 COMMIT;
END $$
DELIMITER ;

