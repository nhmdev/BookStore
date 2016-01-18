/*
Script: A sample db for a Book Store.
Script no: 3/3
Description: This T-SQL code INSERTs sample data.
Author: Niclas Hjulström
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
	('Gustav','Grafström',(SELECT bsloginid FROM BSLogin WHERE username='customer7')),
	('Hedvig','Halvarsson',(SELECT bsloginid FROM BSLogin WHERE username='customer8')),
	('Ivar','Isaksson',(SELECT bsloginid FROM BSLogin WHERE username='customer9')),
	('Jenny','Johansson',(SELECT bsloginid FROM BSLogin WHERE username='customer10'))
go

INSERT INTO ProductCategory (name) VALUES
	('Böcker'),('E-böcker'),('DVD-Filmer'),('Blu-ray'),('Videostreaming'),('Ljudböcker'),('Elektronik'),('Kontorstillbehör'),('Leksaker'),('Pyssel')
go

INSERT INTO Product (name, productcategory_id, price, productdesc) VALUES
	('Kalas och katastrof', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'Böcker'), 66.00, 'Dags för kalas: Emilias födelsedagskalas! Alla tjejerna i klassen är förstås bjudna. Eller ... har hon glömt någon?
Möt Emilia och hennes kompisar på lågstadiet! Marie Oskarsson och Helena Bergendahl berättar om deras liv på och runt fritids i den nya Lätt att läsa-serien "Vänner 4-ever". '),
	('Vinterfåglar', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'Böcker'), 231.00, 'Fågelfröer, talgbollar och foderautomater. Många är vi som matar fåglar på vintern, det är faktiskt en mer utbredd sysselsättning än vad man kanske i förstone tror. Uppskattningsvis är det en halv miljon svenska hushåll som på något sätt utfodrar fåglar under vinterhalvåret.'),
	('Konsten att njuta av livet : Och ändå få saker gjorda', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'E-böcker'), 118.00, 'Efter de framgångsrika Det blir alltid som man tänkt sig och Bli en vinnarskalle kommer nu Olof Röhlander med den personliga och inspirerande Konsten att njuta av livet – och ändå få saker gjorda.'),
	('Lögnaren', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'E-böcker'), 118.00,'Shelby Foxworths liv ligger i spillror. Hon har inte bara förlorat sin make i en olycka. Hon har också fått veta att deras gemensamma liv i lyx varit en enda lögn. Kvar efter maken återstår ett berg av skulder, bland hans papper finns otvivelaktiga bevis på att han varit otrogen och i ett bankfack hittar Shelby en hög id-kort med olika namn på. Mannen hon gifte sig med visar sig aldrig ha existerat.'),
	('Game of Thrones - Säsong 5', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'DVD-Filmer'), 258.00, 'Game of Thrones fortsätter sitt segertåg över världen, och den femte säsongens 12 Emmy®-utmärkelser är de flesta någon tv-serie fått under ett och samma år. Säsongen börjar med att krafter från Westeros och Essos alla hörn flyttar fram positionerna för att fylla det maktvakuum som uppstått, och fortsätter med några av de mest explosiva scenerna hittills, alltmedan mantrat om att "vintern är på väg" börjar eka mer olycksbådande än någonsin.'),
	('Ant-Man', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'Blu-ray'), 179.00, 'Marvel Studios introducerar den nyaste medlemmen i the Avengers: Marvels Ant-Man. Scott Lang får möjligheten att krympa i storlek och samtidigt öka i styrka, och måste tillsammans med Dr. Hank Pym skydda hemligheten bakom tekniken i det här actionfyllda äventyret!'),
	('Star Wars: Episode VII - The Force Awakens', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'Videostreaming'), 79.00, 'A continuation of the saga created by George Lucas set thirty years after Star Wars: Episode VI - Return of the Jedi (1983). '),
	('Insidan ut', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'DVD-Filmer'), 149.00, 'Från de fantasifulla skaparna på Disney•Pixar kommer nu en hysteriskt rolig, varm och ovanligt “känslosam” film, som kritikerna älskar. Tittar du ibland på någon och undrar vad som pågår i deras huvud? Disney•Pixars Insidan Ut tar dig med på en fartfylld resa genom medvetandet för att besvara den frågan. Inuti 11-åriga Jennys hjärna jobbar fem känslor hårt på huvudkontoret, ledda av optimisten Glädje. Hon gör allt för att Jenny ska förbli lycklig vad som än händer, och vid sin sida har hon de andra känslorna Rädsla, Ilska, Avsky och Vemod.'),
	('Harry Potter: Complete Box - 1-7', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'DVD-Filmer'), 149.00, 'Samlingsbox som innehåller samtliga Harry Potter-filmer.1. Harry Potter och De vises sten (2001) 2. Harry Potter och Hemligheternas kammare (2002) 3. Harry Potter och Fången från Azkaban (2004) 4. Harry Potter och Den flammande bägaren (2005) 5. Harry Potter och Fenixorden (2007) 6. Harry Potter och Halvblodsprinsen (2009) 7. Harry Potter och dödsrelikerna: del 1 (2010) 8. Harry Potter och dödsrelikerna: del 2 (2011) '),
	('En mörkare himmel', (SELECT Productcategoryid FROM ProductCategory WHERE name = 'Böcker'), 49.00, '
I gryningen puttrar en fiskebåt in mot hamnen i Arguineguin på södra Gran Canaria. En av fiskarna får syn på en död kvinna som ligger på klipporna nedanför den norska sjömanskyrkan. Hon är skandinaviskt blond, naken och kroppen är arrangerad efter en berömd målning från fjortonhundratalet, Venus födelse. Polisen söker febrilt efter gärningsmannen och får oväntad hjälp av den svenska journalisten Sara Moberg, som driver den skandinaviska tidningen på ön och den norske före detta polisen Kristian Wede, nyanställd vid konsulatet i Las Palmas.')

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