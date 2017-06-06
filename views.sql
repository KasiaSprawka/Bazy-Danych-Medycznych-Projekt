CREATE VIEW informacje_wizyty AS
SELECT 
    w.w_id,
    CONCAT(o1.imie, ' ', o1.nazwisko) AS pacjent,
    CONCAT(o2.imie, ' ', o2.nazwisko) AS lekarz,
    w.data_wizyty,
    icd10.nazwa AS schorzenie,
    icd9.kategoria_tytul, 
    z.opis AS ząb,
    CONCAT(r.srednica_mm,'/',r.dlugosc_mm) AS 'rozmiar_implantu: średnica/długość [mm]',
    m1.material AS material_implantu,
    m2.material AS material_korony,
    CONCAT(ok.kolor,' ',ok.intensywność) AS kolor_korony,
    pr.komentarz
FROM
    wizyty w
        JOIN
    osoby o1 ON o1.id = w.p_id
        JOIN
    osoby o2 ON o2.id = w.l_id
        JOIN
    pacjenci p ON w.p_id = p.p_id
		JOIN
	przebieg pr ON w.w_id = pr.w_id
		JOIN
	icd10 ON pr.kod_schorzenia = icd10.kod
    	JOIN
	icd9 ON pr.kod_procedury = icd9.kategoria_numer
		JOIN
	implanty i ON pr.id_ic LIKE concat('%',i.i_id,'%')
		JOIN 
	materialy m1 ON i.m_id = m1.m_id
		JOIN
	rozmiary_implantow r ON r.i_id = i.i_id
		JOIN
	korony k ON pr.id_ic LIKE concat('%',k.k_id,'%')
		JOIN 
	materialy m2 ON k.m_id = m2.m_id
		JOIN 
	odcienie_koron ok ON  pr.id_ic LIKE concat('%',ok.o_id,'%')
		JOIN
	zeby z on z.z_id = pr.z_id
    
UNION

SELECT 
    w.w_id,
    CONCAT(o1.imie, ' ', o1.nazwisko) AS pacjent,
    CONCAT(o2.imie, ' ', o2.nazwisko) AS lekarz,
    w.data_wizyty,
    icd10.nazwa AS schorzenie,
    icd9.kategoria_tytul,
    z.opis AS ząb,
    'nie dotyczy',
    'nie dotyczy',
    'nie dotyczy',
    'nie dotyczy',
    pr.komentarz
FROM
    wizyty w
        JOIN
    osoby o1 ON o1.id = w.p_id
        JOIN
    osoby o2 ON o2.id = w.l_id
        JOIN
    pacjenci p ON w.p_id = p.p_id
		JOIN
	przebieg pr ON w.w_id = pr.w_id
		JOIN
	icd10 ON pr.kod_schorzenia = icd10.kod
    	JOIN
	icd9 ON pr.kod_procedury = icd9.kategoria_numer
    	JOIN
	zeby z on z.z_id = pr.z_id
WHERE pr.id_ic IS NULL
ORDER BY w_id;

    