# **Insérer, sélectionner, modifier et supprimer les upsets**<a href="../../"> <img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"> </a>
## Créer une table
```sql
--  Créer une table 'table' terme reservé à SQL
CREATE TABLE RESERVATION8_SQL ( [table] VARCHAR(20) ) ;
```
## Insertion
```sql
INSERT INTO peoples VALUES ('T' , 'Olivier') ;
/* INSERER PLUSIEURS LIGNES */
INSERT INTO peoples VALUES 
    ('Oscar' , 'MARTIN') ,
    ('Isa' , 'DU PONT') ;
-- où
INSERT peoples VALUES 
    ('MARTIN' , 'Oscar') ,
    ('DU PONT' , 'Isa') ;

-- Insérer plusieurs valeurs identiques
CREATE TABLE classique (ID INT) ;
INSERT INTO classique VALUES (1)
    GO 10 -- Répète le ligne 10 fois et pas de ; c'est une erreur de syntaxe

SELECT COUNT(*) FROM classique ; -- Les 10 lignes identiques sont là
```
## Séléctionner et filtrer avec la clause ‘WHERE’
```sql
-- Tout séléctionner dans people
SELECT * FROM peoples ;
-- Sélectionner tout les noms
SELECT name FROM peoples ;
--Sélectionner tout les prénoms
SELECT firstname FROM peoples ;
-- Séléctionner les colonnes firstname et name
SELECT firstname , name FROM peoples ;
-- Puis name et firstname
SELECT name , firstname FROM peoples ;
-- Idem pour la colonne avec un espace
SELECT [colonne avec un espace] from peoples ;

-- Afficher qu'Isa
SELECT * FROM peoples WHERE firstname = 'Isa' ;
SELECT * FROM peoples WHERE firstname = 'Isa' ;

-- Séléctionner la table 'table'
SELECT [table] from RESERVATION8_SQL ;
```
## Modifier
```sql
-- Avec la clause 'WHERE'
UPDATE peoples SET name = 'LEROY' WHERE name = 'T' ;
-- Sans la clause pour ne pas cibler
UPDATE peoples SET name = 'LARUE' ;

-- Sur 2 colonnes
UPDATE peoples SET name = 'COEURDELION' , firstname = 'Richard' WHERE fistname = 'Oscar' ;
```
## Supprimer
```sql
-- Supprimer Isa
DELETE FROM peoples WHERE firstname = 'Isa' ;
-- Supprimer tout
DELETE FROM peoples
```
[Exercice](../sql/1)