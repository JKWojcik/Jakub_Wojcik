--Zadanie 6

--a)
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;

--b)
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii 
WHERE ksiegowosc.pensja.kwota + ksiegowosc.premia.kwota > 1000;

--c)
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
WHERE pensja.kwota > 2000 AND wynagrodzenie.id_premii IS NULL;

--d)
SELECT * FROM ksiegowosc.pracownicy 
WHERE imie LIKE 'J%';

--e)
SELECT * FROM ksiegowosc.pracownicy 
WHERE nazwisko LIKE '%n%' AND imie LIKE '%a';

--f)
SELECT imie, nazwisko FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
WHERE ((liczba_godzin * 20) - 160) >= 0;

--g)
SELECT imie, nazwisko FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
WHERE kwota BETWEEN 1500 AND 3000;

--h)
SELECT imie, nazwisko FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.godziny ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.godziny.id_pracownika
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.premia  ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
WHERE ((liczba_godzin * 20) - 160) > 0 AND premia IS NULL;

--i)
SELECT pracownicy.*, kwota FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
ORDER BY kwota;

--j)
SELECT pracownicy.*, pensja.kwota, premia.kwota FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
JOIN ksiegowosc.premia ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
ORDER BY pensja.kwota, premia.kwota DESC;

--k)
SELECT stanowisko, COUNT(stanowisko) AS "ilosc" FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
GROUP BY stanowisko;

--l)
SELECT AVG(pensja.kwota + premia.kwota) AS "srednia", MIN(pensja.kwota + premia.kwota) AS "minimalna",MAX(pensja.kwota + premia.kwota ) AS "maksymalna" FROM ksiegowosc.pensja 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii 
WHERE stanowisko LIKE 'Kierownik';

--m)
SELECT SUM(pensja.kwota) + SUM(premia.kwota) AS "suma wynagrodzen" FROM ksiegowosc.pensja 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii;

--n)
SELECT stanowisko, SUM(pensja.kwota) + SUM(premia.kwota) AS "suma wynagrodzen" FROM ksiegowosc.pensja 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji 
JOIN ksiegowosc.premia ON ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii
GROUP BY stanowisko;

--o)
SELECT stanowisko, COUNT(premia.kwota) AS "ilosc premii" FROM ksiegowosc.premia 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii 
JOIN ksiegowosc.pensja ON ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
GROUP BY stanowisko;

--p)
DELETE FROM ksiegowosc.pracownicy 
WHERE id_pracownika IN 
(
SELECT ksiegowosc.pracownicy.id_pracownika FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika 
JOIN ksiegowosc.pensja ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
WHERE ksiegowosc.pensja.kwota < '1200'
);