-- Créer la table etudiant dans la base db
USE [db] ;

CREATE TABLE etudiant (nom VARCHAR(200) , prenom CHAR(10) , age INT) ;

-- Insérer les 5 étudiants
INSERT INTO etudiant VALUES
	('MARCHAND' , 'Elisabeth' , 18),
	('TRUCHON' , 'Melanie' , 16),
	('TESLU' , 'Sandrine' , 17),
	('PORTAIL' , 'Bruno' , 23),
	('MARCHAND' , 'johana' , 22) ;

SELECT * FROM etudiant ; -- Ils sont tous là

-- Quel est l'âge de Sandrine TESLU ?
SELECT * FROM etudiant WHERE nom = 'TESLU' ;  -- 17 ans

-- Sandrine TESLU vient d'avoir 18 ans
UPDATE etudiant SET age = 18 WHERE nom = 'TESLU' AND prenom = 'Sandrine' ;

SELECT prenom , nom FROM etudiant WHERE nom = 'TESLU' AND prenom = 'Sandrine' ; -- Modification réussie

-- Bruno PORTAIL n'est plus étudiant
DELETE FROM etudiant WHERE prenom = 'Bruno' ;

SELECT prenom , nom FROM etudiant ; -- Il est retiré