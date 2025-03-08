# **Partie 2**<a href="../../"> <img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"> </a>
## **Les opérateurs logiques `AND` et `OR`**
L’opérateur `AND` joint plusieurs conditions à une requête.  
Il s’applique au filtre `WHERE`.  
Les 2 conditions doivent êtres remplies pour que la clause `AND` retourne la requête.

L’opérateur `OR` s’applique également à `WHERE` nécessite qu’une condition soit remplie pour retourner la requête.
```sql
USE db ;

-- Qui sont les hommes de plus de 41 ans ?
SELECT * FROM contact WHERE sexe = 'M' AND age < 41 ;

-- Qui est né en août et à plus de 16 ans
SELECT * FROM contact WHERE month(naissance) = '08' AND age > 16 ;

-- Y a t-il une personne de 101 ans née en août ?
SELECT * FROM contact WHERE month(naissance) = '08' AND age = 101 ;

-- Qui sont toutes les pesonnes nées en août ?
SELECT * FROM contact WHERE month(naissance) = '08' ;

-- Qui est né en août ou à 101 ans
SELECT * FROM contact WHERE month(naissance) = '08' OR age = 101 ;

-- Qui est né en août ou à plus de 16 ans
SELECT * FROM contact WHERE month(naissance) = '08' OR age > 16 ;
```
## **Trier avec `ORDER BY`**
Il tri les lignes par ascendance ou descendance.  
Sans précision, le classement ascendant est fait pas défaut.
```sql
-- Afficher les âges depui le plus jeune
SELECT * FROM contact ORDER BY age asc ;

-- Afficher les date depuis la plus ancienne
SELECT * FROM contact ORDER BY naissance DESC ;

-- Afficher les noms alphabétiquement
SELECT * FROM contact ORDER BY nom ;

-- Faire l'inverse avec les prénoms
SELECT * FROM contact ORDER BY prenom DESC ;

-- Classé par l'année de naissance
SELECT * FROM contact ORDER BY year(naissance) ;

-- Obternir l'inverse
SELECT * FROM contact ORDER BY year(naissance) DESC ;

-- Classer les mois pas descendance
SELECT * FROM contact ORDER BY month(naissance) DESC ;
```
## **Les fonctions d’agrégation `MIN`, `MAX` & `AVERAGE`**
La fonction `MIN` retourne la valeur minimul d’une colonne.  
La fonction `MAX` fait le contraire.  
Quant à la fonction `AVERAGE` ; la valeur moyenne.
```sql
-- Classser l'âge des contact par ascendance
SELECT * FROM contact ORDER BY age ;

-- Quel est le plus jeune âge?
SELECT MIN(age) FROM contact ;

-- Quel est le plus grand âge ?
SELECT MAX(age) FROM contact ;

-- Et l'âge moyen ?
SELECT AVG(age) FROM contact ;

-- Quel est l'âge mininum des personnes nées en 1976 ?
SELECT MIN(age) FROM contact WHERE year(naissance) = 1976

-- Quel est l'âge maximul des persionnes nées en 1976 ?
SELECT MAX(age) FROM contact WHERE year(naissance) = 1976

-- Quel est la moyen de ces personnes ?
SELECT AVG(age) FROM contact WHERE year(naissance) = 1976

-- Quel est le nom le plus bas dans l'alphabet ?
SELECT MAX(nom) FROM contact ;

-- Et le plus haut
SELECT MIN(nom) FROM contact ;
```
## **Sélécionner un intervale**
L’opéteur `BETWEEN` sert à sélectionner un intervale dans une requête `WHERE`.
```sql
-- Qui a entre 16 et 33 ans et les classe du plus petit au plus grand ?
SELECT * FROM contact WHERE age BETWEEN 16 AND 33 ORDER BY age ASC ;

-- Classer pas ascendance les personnes nés entre 1976 et 1983.
SELECT * FROM contact WHERE year(naissance) BETWEEN 1976 AND 1983 ORDER BY naissance ASC ;

-- Avec OR.
SELECT * FROM contact WHERE year(naissance) BETWEEN 1976 OR 1983 ; -- Evidement incompatible avec Between

-- En dehors de 1976 et 83.
SELECT * FROM contact WHERE year(naissance) NOT BETWEEN 1976 AND 1983 ORDER BY naissance ASC ;
```
## Les fonctions d’agrégation `COUNT()` & `SUM()`
`SUM()` permet de sommer le totale d’une colonne de valeurs numériques.  
`COUNT()` permet le conmtage des lignes d’une colonnes.
```sql
-- Combien y a t-il de ligne dans la tables contact ?
select count(*) from contact ;

-- Idem avec le prenom
select count(prenom) from contact ;

-- Combien de ligne sans valeur nulle ?
select count(*) from contact where naissance is not null ;

-- Combien de ligne sans prénom en doublon ?
select count(distinct prenom) from contact ; -- N epas inverser count et distinct sinon, il compte tout

-- Quelle est la somme des âges de tous les contacts ?
select sum(age) from contact ;

-- Utiliser 'SUM()' pour compter le nomvre de lignes
select sum(1) from contact ;

-- Compter chaque linge 2 fois
select sum(2) from contact ;

-- Quel est l'âge total des femmes
select sum(age) from contact where sexe = 'F' ;

-- Combien y a t-il de femmes ?
select sum(1) from contact where sexe = 'F' ;
select count(sexe) from contact where sexe = 'F' ;

-- Combien d'hommes ?
select sum(1) from contact where sexe = 'M' ;
select count(sexe) from contact where sexe = 'M' ;
```
## **La condition `HAVING`**
Elle est analogue à `WHERE`, sauf qu’elle permet le filtrage par les fonctions d’agrégation `SUM()`, `COUNT()` , `AVG()` , `MIN()` et `MAX()`.
La condition `HAVING` est toujours aprés `GROUP BY`<!--, respect du flux-->.  
Cet opérateur est un cousin de `WHERE`.
```sql
-- Qui est masculin et a entre 20 et 25 ans ?
select count(*) total , sexe , age from contact
	where sexe='M' and age between 20 and 25
	group by sexe , age ;

-- Compter si le total est supérieur à 2
select count(*) total , sexe , age from contact
	where sexe='M' and age between 20 and 25
	group by sexe , age
    having count(*) > 2 ;

-- Le faire avec SUM()
select count(*) total , sexe , age from contact
	where sexe='M' and age between 20 and 25
	group by sexe , age
    having sum(1) > 2 ;
```
## **Grouper les résultats**
`GROUP BY` groupe les résultats.
```sql
-- Combien d'homme nés en 1976 ?
select count(*) total , sexe , naissance from contact
	where sexe = 'M' and year(naissance) = 1976
	group by sexe , naissance ;
```
## **Retourner un message défini**
La fonction `PRINT()` retourne un message défini.  
Très utile pour d’importante mise à jour (ajout, suppresion,…).
```sql
-- un message doit confirmé que la base db est sélectionnée.
use db print 'une base est sélectonnée' ;

-- idem pour contact
select * from contact print 'La table es sélectionnée' ;

-- Insérer 2 lignes et suivre les insértions
insert into contact values ('DUTRONC' , 'Michel' , 35 , 'M' , '1981-05-02')
    print 'M. DUTRONC est inséré.' ;
insert into contact values ('LAVAL' , 'Micheline' , 34 , 'F' , '1981-05-02')
    print 'Mme LAVAL est insérée.' ;
```
[Exercice](../sql/3)