--Zadanie 1
CREATE DATABASE firma;
COMMENT ON DATABASE firma IS 'Baza danych o nazwie firma';

--Zadanie 2
CREATE SCHEMA ksiegowosc;
COMMENT ON SCHEMA ksiegowosc IS 'Schemat o nazwie ksiegowosc';

--Zadanie 3
CREATE TABLE ksiegowosc.pracownicy 
(
id_pracownika SMALLINT NOT NULL,
imie VARCHAR(20),
nazwisko VARCHAR(30),
adres VARCHAR(50),
telefon VARCHAR(9),
CONSTRAINT pracownicy_pk PRIMARY KEY(id_pracownika)
);

COMMENT ON TABLE ksiegowosc.pracownicy IS 'Tabela pracownicy';

CREATE TABLE ksiegowosc.godziny
(
id_godziny SMALLINT NOT NULL PRIMARY KEY,
"data" TIMESTAMP,
liczba_godzin INT,
id_pracownika SMALLINT NOT NULL REFERENCES ksiegowosc.pracownicy (id_pracownika) ON DELETE CASCADE
);

COMMENT ON TABLE ksiegowosc.godziny IS 'Tabela godziny';

CREATE TABLE ksiegowosc.pensja
(
id_pensji SMALLINT NOT NULL,
stanowisko VARCHAR(30),
kwota INT,
PRIMARY KEY(id_pensji)
);

COMMENT ON TABLE ksiegowosc.pensja IS 'Tabela pensja';

CREATE TABLE ksiegowosc.premia
(
id_premii SMALLINT NOT NULL, 
rodzaj VARCHAR(30), 
kwota INT
);
ALTER TABLE ksiegowosc.premia ADD CONSTRAINT premia_pk
PRIMARY KEY (id_premii);

COMMENT ON TABLE ksiegowosc.premia IS 'Tabela premia';

CREATE TABLE ksiegowosc.wynagrodzenie
(
id_wynagrodzenia SMALLINT NOT NULL PRIMARY KEY, 
"data" TIMESTAMP,
id_pracownika SMALLINT NOT NULL REFERENCES ksiegowosc.pracownicy (id_pracownika) ON DELETE CASCADE, 
id_godziny SMALLINT NOT NULL REFERENCES ksiegowosc.godziny (id_godziny) ON DELETE CASCADE, 
id_pensji SMALLINT NOT NULL REFERENCES ksiegowosc.pensja (id_pensji) ON DELETE CASCADE, 
id_premii SMALLINT NOT NULL REFERENCES ksiegowosc.premia (id_premii) ON DELETE CASCADE
);

COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela wynagrodzenie';

--Zadanie 4

INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(1, 'Gabriela', 'Kycynowicz', 'ul. Donimirskiego Antoniego 86 81-273 Gdynia', '896236122');
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(2, 'Jacek', 'Bak', 'ul. Jaœminowa 127 02-717 Warszawa', '829411591');
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(3, 'Marek', 'Was', 'Al. Jana Paw³a II 41 00-145 Warszawa', NULL);
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(4, 'Adam', 'Kosowski', NULL, '979004691');
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(5, 'Jakub', 'Rataj', 'ul. Ogiñskiego Micha³a 137 92-608 £ódŸ', '594128830');
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(6, 'Natalia', 'Milos', 'ul. £ukasiñskiego Waleriana 81 20-454 Lublin', NULL);
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(7, 'Mikolaj', 'Pollek', NULL, '493444694');
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(8, 'Mariusz', 'Gudzianowski', 'ul. Niska 117 81-646 Gdynia', '936836205');
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(9, 'Iga', 'Heglarz', 'ul. Podgórska 96 31-061 Kraków', '512035818');
INSERT INTO ksiegowosc.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(10, 'Aleksandra', 'Bukowska', 'ul. Wid³akowa 121 54-530 Wroc³aw', '673976457');

INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(1, '2020-03-01', 8, 1);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(2, '2020-03-01', 10, 2);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(3, '2020-03-01', 8, 3);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(4, '2020-03-01', 8, 4);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(5, '2020-03-01', 6, 5);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(6, '2020-03-01', 12, 6);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(7, '2020-03-01', 8, 7);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(8, '2020-03-01', 8, 8);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(9, '2020-03-01', 4, 9);
INSERT INTO ksiegowosc.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(10, '2020-03-01', 3, 10);

INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(1, 'Ksiegowosc',3500);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(2,'Sekretariat',3600);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(3,'Kierownik',3000);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(4,'Administracja',4200);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(5,'Zarzadzanie',6000);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(6,'Projektowanie',2800);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(7,'Ubezpieczenia',3800);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(8,'Kucharka',3000);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(9,'Kierowca',3200);
INSERT INTO ksiegowosc.pensja
(id_pensji,stanowisko,kwota)
VALUES(10,'Kustosz',3500);

INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(1,'premia zdrowotna',300);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(2,'premia rodzinna',200);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(3,'premia swiateczna',500);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(4,'premia za dodatkowe godziny',800);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(5,'premia managerska',400);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(6,'premia zwycieska',200);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(7,'premia motywacyjna',900);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(8,'premia startowa',400);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(9,'premia koncowa',550);
INSERT INTO ksiegowosc.premia
(id_premii,rodzaj,kwota)
VALUES(10,'premia roczna',150);

INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(1,'2020-03-01',1,1,1,1);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(2,'2020-03-01',2,2,2,1);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(3,'2020-03-01',3,3,3,2);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(4,'2020-03-01',4,4,4,3);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(5,'2020-03-01',5,5,2,4);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(6,'2020-03-01',6,6,3,5);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(7,'2020-03-01',7,7,7,7);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(8,'2020-03-01',8,8,3,6);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(9,'2020-03-01',9,9,9,8);
INSERT INTO ksiegowosc.wynagrodzenie
(id_wynagrodzenia,"data",id_pracownika,id_godziny,id_pensji,id_premii)
VALUES(10,'2020-03-01',10,10,10,9);