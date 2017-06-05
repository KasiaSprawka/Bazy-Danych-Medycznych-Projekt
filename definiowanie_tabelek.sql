CREATE TABLE icd10 (
    kod VARCHAR(7) NOT NULL,
    nazwa VARCHAR(300) NOT NULL,
    PRIMARY KEY (kod)
);

CREATE TABLE icd9 (
    podrozdzdial_numer DECIMAL(4,2) NOT NULL,
    podrozdzial_tytul VARCHAR(200) NOT NULL,
    kategoria_numer DECIMAL(6,4) NOT NULL,
    kategoria_tytul VARCHAR(300) UNIQUE,
    PRIMARY KEY (kategoria_numer)
);

CREATE TABLE miasta_polskie (
    id_miasto MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    miasto VARCHAR(100),
    PRIMARY KEY (id_miasto)
);

CREATE TABLE osoby (
    id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    imie VARCHAR(20) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE adresy (
    id SMALLINT(5) UNSIGNED NOT NULL,
    ulica_i_numer_domu VARCHAR(100) NOT NULL,
    id_miasto MEDIUMINT(8) UNSIGNED NOT NULL,
    kod_pocztowy VARCHAR(10) NOT NULL,
    rodzaj ENUM('korespondencyjny', 'zamieszkania', 'zameldowania') NOT NULL,
    FOREIGN KEY (id)
        REFERENCES osoby (id),
    FOREIGN KEY (id_miasto)
        REFERENCES miasta_polskie (id_miasto)
); 

CREATE TABLE dane_kontaktowe (
    id SMALLINT(5) UNSIGNED NOT NULL,
    numer_telefonu VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (id)
        REFERENCES osoby (id)
);

CREATE TABLE lekarze (
    l_id SMALLINT(5) UNSIGNED NOT NULL,
    numer_PWZ INT(3) NOT NULL,
    PRIMARY KEY (numer_PWZ),
    FOREIGN KEY (l_id)
        REFERENCES osoby (id)
);

CREATE TABLE specjalizacje (
    s_id INT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(15) NOT NULL UNIQUE,
    PRIMARY KEY (s_id)
);

CREATE TABLE lekarze_specjalizacje_link (
    l_id SMALLINT(5) UNSIGNED NOT NULL,
    s_id INT(1) UNSIGNED NOT NULL,
    FOREIGN KEY (l_id)
        REFERENCES lekarze (l_id),
    FOREIGN KEY (s_id)
        REFERENCES specjalizacje (s_id)
); 

CREATE TABLE pacjenci (
    p_id SMALLINT(5) UNSIGNED NOT NULL,
    pesel VARCHAR(12) DEFAULT NULL,
    data_urodzenia DATE,
    FOREIGN KEY (p_id)
        REFERENCES osoby (id)
);

CREATE TABLE personel (
    pe_id SMALLINT(5) UNSIGNED NOT NULL,
    funkcja VARCHAR(20) NOT NULL,
    FOREIGN KEY (pe_id)
        REFERENCES osoby (id)
); 

CREATE TABLE producenci (
    pr_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(50) UNIQUE NOT NULL,
    siedziba MEDIUMINT(8) UNSIGNED NOT NULL,
    telefon VARCHAR(40) UNIQUE,
    email VARCHAR(50) UNIQUE,
    PRIMARY KEY (pr_id),
    FOREIGN KEY (siedziba)
        REFERENCES miasta_polskie (id_miasto)
);

CREATE TABLE materialy (
    m_id VARCHAR(5) NOT NULL,
    material VARCHAR(50) NOT NULL,
    PRIMARY KEY (m_id)
); 

CREATE TABLE implanty (
    pr_id SMALLINT(5) UNSIGNED NOT NULL,
    i_id VARCHAR(15) NOT NULL,
    m_id VARCHAR(5) NOT NULL,
    PRIMARY KEY (i_id),
    FOREIGN KEY (pr_id)
        REFERENCES producenci (pr_id)
        ON DELETE CASCADE,
    FOREIGN KEY (m_id)
        REFERENCES materialy (m_id)
); 

CREATE TABLE rozmiary_implantow (
    i_id VARCHAR(15) NOT NULL,
    srednica_mm DECIMAL(3,1) NOT NULL,
    dlugosc_mm DECIMAL(3,1) NOT NULL,
    FOREIGN KEY (i_id)
        REFERENCES implanty (i_id)
        ON DELETE CASCADE
); 

CREATE TABLE korony (
    k_id VARCHAR(8) NOT NULL,
    pr_id SMALLINT(5) UNSIGNED NOT NULL,
    m_id VARCHAR(5) NOT NULL,
    PRIMARY KEY (k_id),
    FOREIGN KEY (pr_id)
        REFERENCES producenci (pr_id)
        ON DELETE CASCADE,
    FOREIGN KEY (m_id)
        REFERENCES materialy (m_id)
); 

CREATE TABLE odcienie_koron (
    o_id CHAR(2) NOT NULL,
    kolor VARCHAR(20) NOT NULL,
    intensywność INT(1) NOT NULL,
    PRIMARY KEY (o_id)
); 

CREATE TABLE zeby (
    z_id INT(1) NOT NULL,
    opis VARCHAR(50) NOT NULL,
    PRIMARY KEY (z_id)
);

CREATE TABLE wizyty (
    w_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    l_id SMALLINT(5) UNSIGNED NOT NULL,
    p_id SMALLINT(5) UNSIGNED NOT NULL,
    data_wizyty DATE NOT NULL,
    PRIMARY KEY (w_id),
    FOREIGN KEY (l_id)
        REFERENCES lekarze (l_id),
    FOREIGN KEY (p_id)
        REFERENCES pacjenci (p_id)
);

CREATE TABLE przebieg (
    w_id SMALLINT(5) UNSIGNED NOT NULL,
    z_id INT(1) DEFAULT NULL,
    kod_schorzenia VARCHAR(7),
    kod_procedury DECIMAL(6,4),
    id_ic VARCHAR(20),
    komentarz VARCHAR(100),
    FOREIGN KEY (w_id)
        REFERENCES wizyty (w_id),
    FOREIGN KEY (kod_schorzenia)
        REFERENCES icd10 (kod),
    FOREIGN KEY (kod_procedury)
        REFERENCES icd9 (kategoria_numer),
    FOREIGN KEY (z_id)
        REFERENCES zeby (z_id)
); 
