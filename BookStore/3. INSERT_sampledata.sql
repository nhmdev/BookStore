/*
Script: A sample db for a Book Store.
Script no: 3/3
Description: This T-SQL code INSERTs sample data.
Author: Niclas Hjulstr�m
Date: 2016-01-18
*/
use BookStore
go

INSERT INTO		BSLogin	(username,passwd) VALUES 
	('Hasse','abc123'),
	('Niclas','abc123'),
	('customer1',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer2',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer3',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer4',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer5',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer6',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer7',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer8',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer9',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9))),
	('customer10',(SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,9)));
go

-- CREATE TABLE BSUser
INSERT INTO BSUser	(name,bslogin_id) VALUES
	('Hasse',(SELECT bsloginid FROM BSLogin WHERE username = 'Hasse')),
	('Niclas',(SELECT bsloginid FROM BSLogin WHERE username = 'Niclas'))
go

-- INS
INSERT INTO Customer (firstname,lastname,bslogin_id) VALUES
	('Adam','Adamsson',(SELECT bsloginid FROM BSLogin WHERE username='customer1')),
	('Berit','Bengtsson',(SELECT bsloginid FROM BSLogin WHERE username='customer2')),
	('Ceasar','Carlsson',(SELECT bsloginid FROM BSLogin WHERE username='customer3')),
	('Dagny','Davidsson',(SELECT bsloginid FROM BSLogin WHERE username='customer4')),
	('Erik','Eriksson',(SELECT bsloginid FROM BSLogin WHERE username='customer5')),
	('Fredrika','Fransson',(SELECT bsloginid FROM BSLogin WHERE username='customer6')),
	('Gustav','Grafstr�m',(SELECT bsloginid FROM BSLogin WHERE username='customer7')),
	('Hedvig','Halvarsson',(SELECT bsloginid FROM BSLogin WHERE username='customer8')),
	('Ivar','Isaksson',(SELECT bsloginid FROM BSLogin WHERE username='customer9')),
	('Jenny','Johansson',(SELECT bsloginid FROM BSLogin WHERE username='customer10'))
go

INSERT INTO ProductCategory (name) VALUES
	('B�cker'),('E-b�cker'),('DVD-Filmer'),('Blu-ray'),('Videostreaming'),('Ljudb�cker'),('Elektronik'),('Kontorstillbeh�r'),('Leksaker'),('Pyssel')
go

INSERT INTO Product (name, productcategory_id, price, productdesc) VALUES
	('Kalas och katastrof', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'B�cker'), 66.00, 'Dags f�r kalas: Emilias f�delsedagskalas! Alla tjejerna i klassen �r f�rst�s bjudna. Eller ... har hon gl�mt n�gon?
M�t Emilia och hennes kompisar p� l�gstadiet! Marie Oskarsson och Helena Bergendahl ber�ttar om deras liv p� och runt fritids i den nya L�tt att l�sa-serien "V�nner 4-ever". '),
	('Vinterf�glar', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'B�cker'), 231.00, 'F�gelfr�er, talgbollar och foderautomater. M�nga �r vi som matar f�glar p� vintern, det �r faktiskt en mer utbredd syssels�ttning �n vad man kanske i f�rstone tror. Uppskattningsvis �r det en halv miljon svenska hush�ll som p� n�got s�tt utfodrar f�glar under vinterhalv�ret.'),
	('Konsten att njuta av livet : Och �nd� f� saker gjorda', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'E-b�cker'), 118.00, 'Efter de framg�ngsrika Det blir alltid som man t�nkt sig och Bli en vinnarskalle kommer nu Olof R�hlander med den personliga och inspirerande Konsten att njuta av livet � och �nd� f� saker gjorda.'),
	('L�gnaren', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'E-b�cker'), 118.00,'Shelby Foxworths liv ligger i spillror. Hon har inte bara f�rlorat sin make i en olycka. Hon har ocks� f�tt veta att deras gemensamma liv i lyx varit en enda l�gn. Kvar efter maken �terst�r ett berg av skulder, bland hans papper finns otvivelaktiga bevis p� att han varit otrogen och i ett bankfack hittar Shelby en h�g id-kort med olika namn p�. Mannen hon gifte sig med visar sig aldrig ha existerat.'),
	('Game of Thrones - S�song 5', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'DVD-Filmer'), 258.00, 'Game of Thrones forts�tter sitt segert�g �ver v�rlden, och den femte s�songens 12 Emmy�-utm�rkelser �r de flesta n�gon tv-serie f�tt under ett och samma �r. S�songen b�rjar med att krafter fr�n Westeros och Essos alla h�rn flyttar fram positionerna f�r att fylla det maktvakuum som uppst�tt, och forts�tter med n�gra av de mest explosiva scenerna hittills, alltmedan mantrat om att "vintern �r p� v�g" b�rjar eka mer olycksb�dande �n n�gonsin.'),
	('Ant-Man', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'Blu-ray'), 179.00, 'Marvel Studios introducerar den nyaste medlemmen i the Avengers: Marvels Ant-Man. Scott Lang f�r m�jligheten att krympa i storlek och samtidigt �ka i styrka, och m�ste tillsammans med Dr. Hank Pym skydda hemligheten bakom tekniken i det h�r actionfyllda �ventyret!'),
	('Star Wars: Episode VII - The Force Awakens', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'Videostreaming'), 79.00, 'A continuation of the saga created by George Lucas set thirty years after Star Wars: Episode VI - Return of the Jedi (1983). '),
	('Insidan ut', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'DVD-Filmer'), 149.00, 'Fr�n de fantasifulla skaparna p� Disney�Pixar kommer nu en hysteriskt rolig, varm och ovanligt �k�nslosam� film, som kritikerna �lskar. Tittar du ibland p� n�gon och undrar vad som p�g�r i deras huvud? Disney�Pixars Insidan Ut tar dig med p� en fartfylld resa genom medvetandet f�r att besvara den fr�gan. Inuti 11-�riga Jennys hj�rna jobbar fem k�nslor h�rt p� huvudkontoret, ledda av optimisten Gl�dje. Hon g�r allt f�r att Jenny ska f�rbli lycklig vad som �n h�nder, och vid sin sida har hon de andra k�nslorna R�dsla, Ilska, Avsky och Vemod.'),
	('Harry Potter: Complete Box - 1-7', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'DVD-Filmer'), 149.00, 'Samlingsbox som inneh�ller samtliga Harry Potter-filmer.1. Harry Potter och De vises sten (2001) 2. Harry Potter och Hemligheternas kammare (2002) 3. Harry Potter och F�ngen fr�n Azkaban (2004) 4. Harry Potter och Den flammande b�garen (2005) 5. Harry Potter och Fenixorden (2007) 6. Harry Potter och Halvblodsprinsen (2009) 7. Harry Potter och d�dsrelikerna: del 1 (2010) 8. Harry Potter och d�dsrelikerna: del 2 (2011) '),
	('En m�rkare himmel', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'B�cker'), 49.00, '
I gryningen puttrar en fiskeb�t in mot hamnen i Arguineguin p� s�dra Gran Canaria. En av fiskarna f�r syn p� en d�d kvinna som ligger p� klipporna nedanf�r den norska sj�manskyrkan. Hon �r skandinaviskt blond, naken och kroppen �r arrangerad efter en ber�md m�lning fr�n fjortonhundratalet, Venus f�delse. Polisen s�ker febrilt efter g�rningsmannen och f�r ov�ntad hj�lp av den svenska journalisten Sara Moberg, som driver den skandinaviska tidningen p� �n och den norske f�re detta polisen Kristian Wede, nyanst�lld vid konsulatet i Las Palmas.')

go

WITH cte_rn_10 AS ( SELECT ABS(CHECKSUM(NewId())) % 10 + 1 as rn)	-- generate random number with 10
	,cte_rn_365 AS ( SELECT ABS(CHECKSUM(NewId())) % 365 + 1 as rn)	-- generate random number with 365

INSERT INTO orderheader (customer_id, orderdate) VALUES 
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))), -- This generates customerid and a generated date last 365 days
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE()))),
	((SELECT rn FROM cte_rn_10), (SELECT DATEADD(day,-(SELECT rn FROM cte_rn_365),GETDATE())))
go
-- Insert random products into orderdetail table

EXEC sp_insert_product_to_order 1;
EXEC sp_insert_product_to_order 2;
EXEC sp_insert_product_to_order 3;
EXEC sp_insert_product_to_order 4;
EXEC sp_insert_product_to_order 5;
EXEC sp_insert_product_to_order 6;
EXEC sp_insert_product_to_order 7;
EXEC sp_insert_product_to_order 8;
EXEC sp_insert_product_to_order 9;
EXEC sp_insert_product_to_order 10;
go
EXEC sp_insert_product_to_order 1;
EXEC sp_insert_product_to_order 2;