--Zmiana techniczna dlugosci varcharu
ALTER TABLE ksiegowosc.pracownicy ALTER COLUMN telefon TYPE varchar(16) USING telefon::varchar;
--a)
update ksiegowosc.pracownicy 
set telefon = '(+48)' || telefon;
--b)
update ksiegowosc.pracownicy 
set telefon =substring(telefon,1,8) || '-' || substring(telefon,9,3) || '-' || substring(telefon,12,3);
--c)
select ksiegowosc.pracownicy.* 
from ksiegowosc.pracownicy 
order by char_length(nazwisko) desc 
limit 1;
--d)
select ksiegowosc.pracownicy.*, md5(ksiegowosc.pensja.kwota::text) as kwota 
from ksiegowosc.pracownicy 
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji;
--e)
select ksiegowosc.pracownicy.*, ksiegowosc.pensja.kwota as pensja, ksiegowosc.premia.kwota as premia 
from ksiegowosc.pracownicy 
left join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
left join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
left join ksiegowosc.premia on ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii;
--f)
select 'Pracownik ' || ksiegowosc.pracownicy.imie || ' ' || ksiegowosc.pracownicy.nazwisko || ' w dniu ' 
|| ksiegowosc.wynagrodzenie.data::date || ' otrzyma³ pensje ca³kowit¹ na kwotê ' || ksiegowosc.pensja.kwota + ksiegowosc.premia.kwota 
|| ', gdzie wynagrodzenie zasadnicze wynosi³o: ' || ksiegowosc.pensja.kwota || ', premia: ' || ksiegowosc.premia.kwota 
|| ', nadgodziny: 0 z³' as Raport
from ksiegowosc.pracownicy 
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika 
join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji 
join ksiegowosc.premia on ksiegowosc.premia.id_premii =ksiegowosc.wynagrodzenie.id_premii 
where imie = 'Jan' and nazwisko = 'Nowak';
