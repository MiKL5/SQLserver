# **Partie 2**
## **Les opérateurs logiques `AND` et `OR`**
L’opérateur `AND` joint plusieurs conditions à une requête.  
Il s’applique au filtre `WHERE`.  
Les 2 conditions doivent êtres remplies pour que la clause `AND` retourne la requête.

L’opérateur `OR` s’applique également à `WHERE` nécessite qu’une condition soit remplie pour retourner la requête.
```SQL
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
<!-- ## **Trier avec `ORDER BY`** -->