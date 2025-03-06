# **Insérer, sélectionner, modifier et supprimer les upsets**<a href="../../"> <img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"> </a>
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

-- Afficher qu'Isa
SELECT * FROM peoples WHERE firstname = 'Isa' ;
SELECT * FROM peoples WHERE firstname = 'Isa' ;

```
## Modifier `UPDATE`
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