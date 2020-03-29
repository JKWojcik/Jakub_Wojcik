-- Tables
-- Table: godziny
CREATE TABLE godziny (
    id_godziny smallint  NOT NULL,
    data date  NOT NULL,
    liczba_godzin smallint  NOT NULL,
    id_pracownika smallint  NOT NULL,
    CONSTRAINT godziny_pk PRIMARY KEY (id_godziny)
);

-- Table: pensje
CREATE TABLE pensje (
    id_pensji smallint  NOT NULL,
    stanowisko text  NULL,
    kwota int  NOT NULL,
    id_premii smallint  NULL,
    CONSTRAINT pensje_pk PRIMARY KEY (id_pensji)
);

-- Table: pracownicy
CREATE TABLE pracownicy (
    id_pracownika smallint  NOT NULL,
    imie varchar(20)  NOT NULL,
    nazwisko varchar(30)  NOT NULL,
    adres text  NULL,
    telefon varchar(12)  NULL,
    CONSTRAINT pracownicy_pk PRIMARY KEY (id_pracownika)
);

-- Table: premie
CREATE TABLE premie (
    id_premii smallint  NOT NULL,
    rodzaj varchar(255)  NULL,
    kwota int  NOT NULL,
    CONSTRAINT premie_pk PRIMARY KEY (id_premii)
);

-- foreign keys
-- Reference: godziny_pracownicy (table: godziny)
ALTER TABLE godziny ADD CONSTRAINT godziny_pracownicy
    FOREIGN KEY (id_pracownika)
    REFERENCES pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: pensje_premie (table: pensje)
ALTER TABLE pensje ADD CONSTRAINT pensje_premie
    FOREIGN KEY (id_premii)
    REFERENCES premie (id_premii)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Insert records:

-- Into premie:

INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(1, 'Premia za ilosciowy wzrost wykonywanych zadan', 300);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(2, 'Premia za poprawe jakosci', 500);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(3, NULL, 200);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(4, 'Premia za obnizenie kosztow dzialalnosci', 100);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(5, NULL, 220);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(6, 'Premia za poprawe wykorzystania czasu pracy ludzi i maszyn', 150);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(7, 'Premia za przedterminowe wykonanie zadan', 50);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(8, NULL, 120);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(9, NULL, 380);
INSERT INTO public.premie
(id_premii, rodzaj, kwota)
VALUES(10, 'Premia za bezwypadkowa prace', 20);

-- Into pensje:

INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(1, 'Ksiegowosc', 4100, 10);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(2, 'Sekretariat', 3600, 4);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(3, 'Kierownictwo', 9500, 6);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(4, 'Administracja', 6300, 2);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(5, 'Zarzadzanie', 8200, NULL);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(6, NULL, 2800, NULL);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(7, 'Projektowanie', 3500, 1);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(8, NULL, 800, NULL);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(9, 'Ubezpieczenia', 2200, 7);
INSERT INTO public.pensje
(id_pensji, stanowisko, kwota, id_premii)
VALUES(10, NULL, 1800, NULL);

-- Into pracownicy:

INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(1, 'Jan', 'Nowak', 'ul. Donimirskiego Antoniego 86
81-273 Gdynia', '896236122');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(2, 'Jacek', 'Bak', 'ul. Jaœminowa 127
02-717 Warszawa', '829411591');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(3, 'Marek', 'Was', 'Al. Jana Paw³a II 41
00-145 Warszawa', NULL);
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(4, 'Adam', 'Kosowski', NULL, '979004691');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(5, 'Jakub', 'Rataj', 'ul. Ogiñskiego Micha³a 137
92-608 £ódŸ', '594128830');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(6, 'Natalia', 'Milos', 'ul. £ukasiñskiego Waleriana 81
20-454 Lublin', NULL);
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(7, 'Mikolaj', 'Pollek', NULL, '493444694');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(8, 'Mariusz', 'Gudzianowski', 'ul. Niska 117
81-646 Gdynia', '936836205');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(9, 'Iga', 'Heglarz', 'ul. Podgórska 96
31-061 Kraków', '512035818');
INSERT INTO public.pracownicy
(id_pracownika, imie, nazwisko, adres, telefon)
VALUES(10, 'Aleksandra', 'Bukowska', 'ul. Wid³akowa 121
54-530 Wroc³aw', '673976457
');


-- Into godziny:

INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(1, '2020-03-01', 8, 1);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(2, '2020-03-01', 10, 2);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(3, '2020-03-01', 8, 3);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(4, '2020-03-01', 8, 4);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(5, '2020-03-01', 6, 5);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(6, '2020-03-01', 12, 6);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(7, '2020-03-01', 8, 7);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(8, '2020-03-01', 8, 8);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(9, '2020-03-01', 4, 9);
INSERT INTO public.godziny
(id_godziny, "data", liczba_godzin, id_pracownika)
VALUES(10, '2020-03-01', 3, 10);

