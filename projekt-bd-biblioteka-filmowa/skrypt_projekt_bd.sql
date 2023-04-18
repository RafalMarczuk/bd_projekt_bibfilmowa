create table film (
kod_filmu number(3) primary key not null,
tytul_polski varchar2(50) not null,
tytul_oryginalny varchar2(50),
rok_produkcji number(4) not null,
budzet number(9),
opis_filmu varchar2(200) not null
);

create table gatunek_filmu (
kod_gatunku number(3) primary key not null,
nazwa_gatunku varchar2(20) not null
);

create table tworca (
nr_tworcy number(3) primary key not null,
nazwisko_tworcy varchar2(30) not null,
imie_tworcy varchar2(15) not null,
data_urodzenia_tworcy date
);

create table nagroda_aktora (
data_otrzymania date not null
);

create table aktor (
nr_aktora number(3) primary key not null,
nazwisko_aktora varchar2(25) not null,
imie_aktora varchar2(20) not null,
data_urodzenia_aktora date,
zdjecie blob
);

create table kategoria_nagrod (
kod_nagrody number(3) primary key not null,
nazwa_nagrody varchar2(20) not null
);

create table festiwal (
kod_festiwalu number(3) primary key not null,
nazwa_festiwalu varchar2(50) not null
);

alter table film
add kod_gatunku number(3) not null;

alter table film 
add constraint FK_GatunekFilm
foreign key (kod_gatunku)
references gatunek_filmu(kod_gatunku);

create table film_tworca (
film_kod_filmu number(3) not null,
tworca_nr_tworcy number(3) not null,
constraint PK_film_tworca primary key (film_kod_filmu, tworca_nr_tworcy),
constraint FK_film_tworca_film foreign key (film_kod_filmu) references film(kod_filmu),
constraint FK_film_tworca_tworca foreign key (tworca_nr_tworcy) references tworca(nr_tworcy)
);

create table film_aktor (
film_kod_filmu number(3) not null,
aktor_nr_aktora number(3) not null,
constraint PK_film_aktor primary key (film_kod_filmu, aktor_nr_aktora),
constraint FK_film_aktor_film foreign key (film_kod_filmu) references film(kod_filmu),
constraint FK_film_aktor_aktor foreign key (aktor_nr_aktora) references aktor(nr_aktora)
);

alter table kategoria_nagrod
drop column kod_nagrody;

alter table kategoria_nagrod
add kod_nagrody number(3) not null;

alter table kategoria_nagrod
add festiwal_kod_festiwalu number(3) not null;

alter table kategoria_nagrod
add constraint PK_kategoria_nagrod primary key (kod_nagrody, festiwal_kod_festiwalu);

alter table kategoria_nagrod
add constraint FK_kategoria_nagrod_festiwal foreign key (festiwal_kod_festiwalu) references festiwal(kod_festiwalu);


alter table nagroda_aktora
add film_kod_filmu number(3) not null;

alter table nagroda_aktora
add aktor_nr_aktora number(3) not null;

alter table nagroda_aktora
add kategoria_nagrod_kod_nagrody number(3) not null;

alter table nagroda_aktora
add kod_festiwalu number(3) not null;

alter table nagroda_aktora
add constraint PK_nagorda_aktora primary key (film_kod_filmu, aktor_nr_aktora, kategoria_nagrod_kod_nagrody, kod_festiwalu);

alter table nagroda_aktora
add constraint FK_nagroda_aktora_aktor foreign key (aktor_nr_aktora) references aktor(nr_aktora);

alter table nagroda_aktora
add constraint FK_film_kod_filmu foreign key (film_kod_filmu) references film(kod_filmu);

alter table nagroda_aktora
add constraint FK_nagroda_aktora_kategoria_nagrod
foreign key (kategoria_nagrod_kod_nagrody, kategoria_nagrod_festiwal_kod_festiwalu)
references kategoria_nagrod(kod_nagrody, festiwal_kod_festiwalu);

alter table film_tworca
add funkcja_w_filmie varchar2(30);

alter table film_aktor
add rola_w_filmie varchar2(30);

insert into gatunek_filmu(kod_gatunku, nazwa_gatunku)
values (001, 'fantasy');

insert into gatunek_filmu(kod_gatunku, nazwa_gatunku)
values (002, 'akcja');

insert into gatunek_filmu(kod_gatunku, nazwa_gatunku)
values (003, 'dramat');

insert into gatunek_filmu(kod_gatunku, nazwa_gatunku)
values (004, 'gangsterski');

insert into gatunek_filmu(kod_gatunku, nazwa_gatunku)
values (005, 'kryminal');

insert into film(kod_filmu, tytul_polski, tytul_oryginalny, rok_produkcji, budzet, opis_filmu, kod_gatunku)
values (001, 'Wladca Pierscieni: Powrot Krola', 'The Lord of the Rings: The Return of the King', 2003, 94000000,'Zwienczenie filmowej trylogii wg powiesci Tolkiena', 001);

insert into film(kod_filmu, tytul_polski, tytul_oryginalny, rok_produkcji, budzet, opis_filmu, kod_gatunku)
values (002, 'Spider-man: Bez Drogi do Domu', 'Spider-man: Now Way Home', 2021, 200000000,'Kiedy caly swiat dowiaduje sie, ze pod maska Spider Mana skrywa sie Peter Parker, superbohater decyduje sie zwrocic o pomoc do Doktora Strange', 002);

insert into film(kod_filmu, tytul_polski, tytul_oryginalny, rok_produkcji, budzet, opis_filmu, kod_gatunku)
values (003, 'Harry Potter i Komnata Tajemnic', 'Harry Potter and The Chamber of Secrets', 2002, 100000000,'W Hogwarcie dochodzi do tajemniczych atakow na uczniow.', 001);

insert into film(kod_filmu, tytul_polski, tytul_oryginalny, rok_produkcji, budzet, opis_filmu, kod_gatunku)
values (004, 'Na Rauszu', 'Druk', 2020, 33500000,'Czworka nauczycieli pracujacych w gimnazjum testuje alkoholowa metode, ktora ma polepszyc jakosc ich zycia', 003);

insert into film(kod_filmu, tytul_polski, tytul_oryginalny, rok_produkcji, budzet, opis_filmu, kod_gatunku)
values (005, 'Ojciec Chrzestny', 'The Godfather', 1972, 6000000,'Opowiesc o nowojorskiej rodzinie mafijnej', 004);

insert into film(kod_filmu, tytul_polski, tytul_oryginalny, rok_produkcji, budzet, opis_filmu, kod_gatunku)
values (006, 'Siedem', 'Se7en', 1995, 33000000,'Dwoch policjantow stara sie zlapac seryjnego morderce wybierajacego swoje ofiary wedlug specjalnego klucza - siedmiu grzechow glownych', 005);

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy, data_urodzenia_tworcy)
values (001, 'Jackson', 'Peter', '1961/10/31');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (002, 'Walsh', 'Fran');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (003, 'Boyens', 'Philippa');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (004, 'Lesnie', 'Andrew');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy, data_urodzenia_tworcy)
values (005, 'Watts', 'Jon', '1981/06/28');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (006, 'McKenna', 'Chris');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (007, 'Sommers', 'Erik');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (008, 'Giacchino', 'Michael');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy, data_urodzenia_tworcy)
values (009, 'Columbus', 'Chris', '58/09/10');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (010, 'Kloves', 'Steve');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (011, 'Pratt', 'Roger');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (012, 'Craig', 'Stuart');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy, data_urodzenia_tworcy)
values (013, 'Vinterberg', 'Thomas', '69/05/19');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (014, 'Lindholm', 'Tobias');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (015, 'Hviid', 'Sabine');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (016, 'Rasmussen', 'Manon');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy, data_urodzenia_tworcy)
values (017, 'Coppola', 'Francis', '39/04/07');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (018, 'Puzo', 'Mario');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (019, 'Evans', 'Robert');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy, data_urodzenia_tworcy)
values (020, 'Fincher', 'David', '62/08/28');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (021, 'Walker', 'Andrew');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (022, 'Shore', 'Howard');

insert into tworca(nr_tworcy, nazwisko_tworcy, imie_tworcy)
values (023, 'Kaplan', 'Michael');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (001, 001, 'Rezyser');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (001, 002, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (001, 003, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (001, 004, 'Zdjecia');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (002, 005, 'Rezyser');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (002, 006, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (002, 007, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (002, 008, 'Kompozytor');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (003, 009, 'Rezyser');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (003, 010, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (003, 011, 'Zdjecia');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (003, 012, 'Scenograf');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (004, 013, 'Rezyser');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (004, 014, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (004, 015, 'Scenograf');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (004, 016, 'Kostiumy');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (005, 017, 'Rezyser');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (005, 018, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (005, 019, 'Producent');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (006, 020, 'Rezyser');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (006, 021, 'Scenarzysta');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (006, 022, 'Kompozytor');

insert into film_tworca(film_kod_filmu, tworca_nr_tworcy, funkcja_w_filmie)
values (006, 023, 'Kostiumy');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (001, 'Wood', 'Elijah');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (002, 'Mortensen', 'Viggo');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (003, 'Weaving', 'Hugo');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (004, 'Holland', 'Tom');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (005, 'Cumberbatch', 'Benedict');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (006, 'Buress', 'Hannibal');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (007, 'Radcliffe', 'Daniel');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (008, 'Enoch', 'Alfred');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (009, 'Watson', 'Emma');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (010, 'Mikkelsen', 'Mads');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (011, 'Millang', 'Magnus');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (012, 'Bonnevie', 'Maria');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (013, 'Brando', 'Marlon');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (014, 'Pacino', 'Al');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (015, 'Caan', 'James');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (016, 'Freeman', 'Morgan');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (017, 'Pitt', 'Brad');

insert into aktor(nr_aktora, nazwisko_aktora, imie_aktora)
values (018, 'Cassini', 'John');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (001, 001, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (001, 002, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (001, 003, 'Drugoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (002, 004, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (002, 005, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (002, 006, 'Epizodyczna');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (003, 007, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (003, 008, 'Epizodyczna');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (003, 009, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (004, 010, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (004, 011, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (004, 012, 'Drugoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (005, 013, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (005, 014, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (005, 015, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (006, 016, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (006, 017, 'Pierwszoplanowa');

insert into film_aktor(film_kod_filmu, aktor_nr_aktora, rola_w_filmie)
values (006, 018, 'Drugoplanowa');

insert into festiwal(kod_festiwalu, nazwa_festiwalu)
values (001, 'Rozdanie Nagrod Saturna');

insert into festiwal(kod_festiwalu, nazwa_festiwalu)
values (002, 'Rozdanie Europejskich Nagrod Filmowych');

insert into festiwal(kod_festiwalu, nazwa_festiwalu)
values (003, 'Ceremonia Wreczenia Oscarow');

insert into festiwal(kod_festiwalu, nazwa_festiwalu)
values (004, 'Ceremonia Wreczenia Zlotych Globow');

insert into kategoria_nagrod(kod_nagrody, nazwa_nagrody, festiwal_kod_festiwalu)
values (001, 'Saturn', 001);

insert into kategoria_nagrod(kod_nagrody, nazwa_nagrody, festiwal_kod_festiwalu)
values (002, 'Europejska Nagroda', 002);

insert into kategoria_nagrod(kod_nagrody, nazwa_nagrody, festiwal_kod_festiwalu)
values (003, 'Oscar', 003);

insert into kategoria_nagrod(kod_nagrody, nazwa_nagrody, festiwal_kod_festiwalu)
values (004, 'Zloty Glob', 004);

insert into nagroda_aktora(data_otrzymania, film_kod_filmu, aktor_nr_aktora, kategoria_nagrod_kod_nagrody, kategoria_nagrod_festiwal_kod_festiwalu)
values ('2003/05/18', 001, 001, 001, 001);

insert into nagroda_aktora(data_otrzymania, film_kod_filmu, aktor_nr_aktora, kategoria_nagrod_kod_nagrody, kategoria_nagrod_festiwal_kod_festiwalu)
values ('2020/12/12', 004, 010, 002, 002);

insert into nagroda_aktora(data_otrzymania, film_kod_filmu, aktor_nr_aktora, kategoria_nagrod_kod_nagrody, kategoria_nagrod_festiwal_kod_festiwalu)
values ('1973/03/27', 005, 013, 003, 003);

insert into nagroda_aktora(data_otrzymania, film_kod_filmu, aktor_nr_aktora, kategoria_nagrod_kod_nagrody, kategoria_nagrod_festiwal_kod_festiwalu)
values ('1973/01/28', 005, 013, 004, 004);

create view dane_aktora as
select nr_aktora as Numer, imie_aktora ||' '|| nazwisko_aktora as Aktor, tytul_oryginalny as Film
from aktor a, film f, film_aktor fa
where fa.aktor_nr_aktora = a.nr_aktora
and f.kod_filmu = fa.film_kod_filmu;

create view film_info as
select kod_filmu as Numer, tytul_polski as "Tytul polski", tytul_oryginalny as Tytul, rok_produkcji as Premiera,
budzet as Budzet, nazwa_gatunku as Gatunek
from film f, gatunek_filmu g
where f.kod_gatunku = g.kod_gatunku;

create view nagrody_aktorzy as
select imie_aktora ||' '|| nazwisko_aktora as Aktor, tytul_oryginalny as Film, 
nazwa_nagrody as Nagroda, data_otrzymania as "Data"
from aktor a, film f, kategoria_nagrod kat, nagroda_aktora na
where a.nr_aktora = na.aktor_nr_aktora and
f.kod_filmu = na.film_kod_filmu and
kat.kod_nagrody = na.kategoria_nagrod_kod_nagrody;

create view tworcy_film as
select imie_tworcy||' '||nazwisko_tworcy as Tworca, tytul_oryginalny as Film,
funkcja_w_filmie as Funkcja
from film f, film_tworca ft, tworca t
where f.kod_filmu = ft.film_kod_filmu and t.nr_tworcy = ft.tworca_nr_tworcy;

select * from dane_aktora
where Film = 'Druk'; 

select * from film_info
where Budzet < 100000000
order by Budzet desc;

select * from film_info
where rownum <= 2
order by Budzet desc;

select Aktor, Film, count(*) as "Ilosc nagrod" from nagrody_aktorzy
group by Aktor, Film
having count(*) > 1;