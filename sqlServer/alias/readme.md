# **Alias, l’opérateur `LIKE`, `TOP`, `DISTINCT`, `SELECT INTO`, les opérateurs de comparaison, `IN`, `NOT IN`, `IS`, `IS NOT`**<a href="../../"> <img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"> </a>
## **Les alias**
```sql
USE db ;
-- Créer la table contact
CREATE TABLE contact (nom VARCHAR(200) , prenom VARCHAR(200) , age INT , sexe CHAR(1) , naissance date) ;

SELECT * FROM contact ;

-- Insérer les données
INSERT INTO contact VALUES
	('MARCHAND'   , 'Elisabeth' , 18 , 'F' , '04-08-1976'),
	('TRUCHON'    , 'Mélanie'   , 16 , 'F' , '04-08-1978'),
	('TESLU'      , 'Sandrine'  , 17 , 'F' , '02-05-1987'),
	('PORTAIL'    , 'Bruno'     , 23 , 'M' , '02-05-1970'),
	('DUPONT  '   , 'Michel'    , 22 , 'M' , '02-08-1983'),
	('DUTRUEL'    , 'Pascal'    , 22 , 'M' , '02-08-1983'),
	('DUPONT'     , 'Micheline' , 37 , 'F' , '02-08-1975'),
	('FOURNILLET' , 'Alain'     , 22 , 'M' , '01-01-1983'),
	('FAURNILLET' , 'Pascal'    , 48 , 'M' , '12-06-1960'),
	('BOUTIN'     , 'Ludivine'  , 47 , 'F' , '22-01-1965'),
	('DELORS'     , 'Valérie'   , 47 , 'M' , '24-09-1978'),
	('BOUTIN'     , 'Ludivine'  , 47 , 'F' , '22-01-1965'),
	('THUILLIER'  , 'Olivier'   , 41 , 'M' , '12-08-1976'),
	('CHUILLIER'  , 'Olivier'   , 41 , 'M' , '12-08-1976'),
	('MEILHAC'    , 'Amelie'    , 34 , 'F' , '08-05-1983'),
	('BOUTIN'     , 'Ludivine'  , 47 , 'F' , '22-01-1965'),
    ('MARCHAND'   , 'Oscar'     , 18 , 'M' , '04-08-1976') ;

SELECT * FROM contact ; -- Tout y est

-- Renomer la colonne nom par patronyme
SELECT nom AS patronyme FROM contact ;
```
## **Afiner les recherches grâche à l’opérateur ’`LIKE`’**
Il affine les recherches avec le ’`where`’.
```sql
-- Rechercher les noms ayant un 'u'
SELECT * from contact WHERE nom LIKE '%u%' ;

-- Prouver que '`LIKE`' peux fonctionner comme '`WHERE`'
SELECT nom FROM contact WHERE nom = 'marchand' ;

SELECT nom FROM contact WHERE nom LIKE 'marchand' ; -- idem

-- Tous les âges débutant par 2
SELECT age FROM contact WHERE age LIKE '2%' ; -- 4 personneq

SELECT age FROM contact WHERE age = '2' ;
SELECT age FROM contact WHERE age LIKE '2' ; -- rien

-- Les âge terminants par 2
SELECT age FROM contact WHERE age LIKE '%2' ;

-- Tous les noms avev le 'V'
SELECT * FROM contact WHERE nom LIKE '%v%' ; -- aucun nom

SELECT * FROM contact WHERE prenom LIKE '%a%' ;

-- Toules les dates avec '08'
SELECT * FROM contact WHERE naissance LIKE '%08%' ;

-- Fournillet ou Faurnillet
SELECT * FROM contact WHERE nom LIKE 'F[OA]URNILLET' GO -- (GO est subsidiaire)

-- Thuillier ou Chuillier
SELECT * FROM contact WHERE nom LIKE '[TC]HUILLIER' ;
```
## **Remonter une quantité de ligne avec ’`TOP`’**
```sql
-- Afficher la première lignes
USE [db] ;
SELECT TOP (1) * FROM contact ;

-- Les 5 premières
SELECT TOP (5) * FROM contact ;

-- Supprimer la permière ligne
DELETE TOP(1) FROM contact ;

-- Modifier la première ligne
UPDATE TOP(1) contact SET nom = 'Maman' ;
```
## **Ne pas afficher les valeurs dupliquées**
```sql
-- Quel est le nom en double
SELECT * FROM contact ; -- Marchand Elisabeth et Oscar, puis, DUPONT Michel et Micheline

-- N'afficher qu'une fois Marchand
SELECT DISTINCT nom FROM contact Where nom = 'Marchand' ;
SELECT DISTINCT nom FROM contact Where nom = 'Dupont' ;
```
## **Copier une table**
```sql
USE [db] ;
-- Tout sauvegarder de contact
SELECT * INTO contact_sauvg FROM contact ;
SELECT * FROM contact_sauvg ;
-- Copier les noms
SELECT nom INTO contact_noms FROM contact ;
SELECT * FROM contact_noms ;
-- Dans contact_dupont copier les Dupont
SELECT * INTO contact_dupont FROM contact WHERE nom = 'DUPONT' ;
SELECT * FROM contact_dupont ;
```