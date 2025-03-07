USE db ;

-- Retirer les doublons dans age
SELECT DISTINCT age FROM contact ;

-- Séléctionner les dates de naissance commançant par 1976 et renommer la colonne année 1976
SELECT nom, prenom, age , naissance AS 'année 1976' FROM contact WHERE naissance LIKE '1976%' ;

-- Séléctionner les personnes nées le 1er janvier
SELECT * FROM contact WHERE naissance LIKE '%01-01' ;
SELECT * FROM contact WHERE naissance LIKE '%01-01%' ;

-- Lister les prénoms finissant pas 'e'
SELECT prenom FROM contact WHERE prenom LIKE '%e' ;

-- Sortir les femmes de deux manières différentes
SELECT * FROM contact WHERE sexe = 'F' ;

SELECT * FROM contact WHERE sexe <> 'M' ;
SELECT * FROM contact WHERE sexe NOT IN ('M') ;
SELECT * FROM contact WHERE sexe IN ('F') ;
SELECT * FROM contact WHERE sexe != ('M') ;

-- Lister les personnes de 17 ans et inférieur
SELECT * FROM contact WHERE age <= 17 ;

-- Séléctionner les personnes n'ayant ni 17 ni 48 ans
SELECT * FROM contact WHERE age NOT IN (17, 48) ;

--Lister les 7 premières personne dans contact
SELECT TOP 7 * FROM contact ;

-- Dans la table contact-portail copier que Bruno Portail
SELECT * INTO contact_portail FROM contact WHERE nom = 'Portail' AND prenom = 'Bruno' ;

-- Ne pas séléctionner les personnes nées en 1976
SELECT * FROM contact WHERE naissance NOT LIKE '1976%' ;
SELECT * FROM contact WHERE year(naissance) <> '1976' ;
SELECT * FROM contact WHERE year(naissance) != '1976' ;


--Séléctionner les personne n'étant pas nées en août
SELECT * FROM contact WHERE naissance NOT LIKE '%-08-%' ;
SELECT * FROM contact WHERE month(naissance) <> '08' ;
SELECT * FROM contact WHERE month(naissance) != '08' ;