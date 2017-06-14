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

