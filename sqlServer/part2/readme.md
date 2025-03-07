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
<!-- ## **Les fonctions d'agrégation `MIN`, `MAX` & `AVERAGE`** -->