-- Tabele
-- Table: Dostawcy
CREATE TABLE Dostawcy 
(
    Dostawca varchar(30)  NOT NULL,
    Kod_pocztowy varchar(6)  NOT NULL,
    Miasto varchar(15)  NOT NULL,
    Ulica varchar(30)  NOT NULL,
    Numer_budynku varchar(4)  NOT NULL,
    Numer_mieszkania smallint  NOT NULL,
    CONSTRAINT Dostawcy_pk PRIMARY KEY (Dostawca)
);

-- Table: Dostawy
CREATE TABLE Dostawy 
(
    ID_dostawy smallint  NOT NULL,
    Nazwa_produktu varchar(20)  NOT NULL,
    Dostawca varchar(30)  NOT NULL,
    CONSTRAINT Dostawy_pk PRIMARY KEY (ID_dostawy)
);

-- Table: Pacjenci
CREATE TABLE Pacjenci 
(
    ID_pacjenta smallint  NOT NULL,
    Imie varchar(15)  NOT NULL,
    Nazwisko varchar(25)  NOT NULL,
    CONSTRAINT Pacjenci_pk PRIMARY KEY (ID_pacjenta)
);

-- Table: Pracownicy
CREATE TABLE Pracownicy 
(
    ID_pracownika smallint  NOT NULL,
    Imie varchar(15)  NOT NULL,
    Nazwisko varchar(25)  NOT NULL,
    CONSTRAINT Pracownicy_pk PRIMARY KEY (ID_pracownika)
);

-- Table: Produkty
CREATE TABLE Produkty 
(
    Nazwa_produktu varchar(20)  NOT NULL,
    Cena_netto money  NOT NULL,
    Cena_brutto money  NOT NULL,
    CONSTRAINT Produkty_pk PRIMARY KEY (Nazwa_produktu)
);

-- Table: Wizyty
CREATE TABLE Wizyty 
(
    Data_godzina_wizyty timestamp  NOT NULL,
    ID_pracownika smallint  NOT NULL,
    ID_pacjenta smallint  NOT NULL,
    ID_zabiegu smallint  NOT NULL,
    CONSTRAINT Wizyty_pk PRIMARY KEY (Data_godzina_wizyty)
);

-- Table: Zabiegi
CREATE TABLE Zabiegi 
(
    ID_zabiegu smallint  NOT NULL,
    Nazwa_zabiegu varchar(40)  NOT NULL,
    CONSTRAINT Zabiegi_pk PRIMARY KEY (ID_zabiegu)
);

-- Relacje
-- Reference: Dostawy_Dostawcy (table: Dostawy)
ALTER TABLE Dostawy ADD CONSTRAINT Dostawy_Dostawcy
    FOREIGN KEY (Dostawca)
    REFERENCES Dostawcy (Dostawca)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Dostawy_Produkty (table: Dostawy)
ALTER TABLE Dostawy ADD CONSTRAINT Dostawy_Produkty
    FOREIGN KEY (Nazwa_produktu)
    REFERENCES Produkty (Nazwa_produktu)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Wizyty_Pacjenci (table: Wizyty)
ALTER TABLE Wizyty ADD CONSTRAINT Wizyty_Pacjenci
    FOREIGN KEY (ID_pacjenta)
    REFERENCES Pacjenci (ID_pacjenta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Wizyty_Pracownicy (table: Wizyty)
ALTER TABLE Wizyty ADD CONSTRAINT Wizyty_Pracownicy
    FOREIGN KEY (ID_pracownika)
    REFERENCES Pracownicy (ID_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Wizyty_Zabiegi (table: Wizyty)
ALTER TABLE Wizyty ADD CONSTRAINT Wizyty_Zabiegi
    FOREIGN KEY (ID_zabiegu)
    REFERENCES Zabiegi (ID_zabiegu)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;
