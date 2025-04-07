create table Contact (Nom varchar (200),prenom varchar (200), age int, sexe char (1), date_de_naissance date)

insert into contact values 

('Marchand','Elisabeth',18,'F','04-08-1976'),
('Truchon','Melanie',16,'F','04-08-1978'),
('Teslu','Sandrine',17,'F','02-05-1987'),
('Portail','Bruno',23,'M','06-05-1970'),
('Virenque','Michel',22,'M','02-08-1983'),
('Dutruel','Pascal',22,'M','02-08-1983'),-- meme age que Virenque michel
('Virenque','Micheline',37,'M','02-08-1975'),
('Fournillet','Alain',22,'M','01-01-1983'),
('Faurnillet','Pascal',48,'M','12-06-1960'),
('Boutin','Ludivine',47,'F','22-01-1965'),
('Delors','Valerie',28,'M','24-09-1978'),
('Thuillier','olivier',41,'M','12-08-1976'),
('Chuillier','olivier',41,'M','12-08-1976'),
('Meilhac','Amelie',34,'F','08-05-1983'),
('Boutin','Ludivine',47,'F','22-01-1965')-- deux fois la meme valeur dans la table, c'est un doublon





-- Elisabeth Marchand Elisabeth Walker
update Contact set nom = 'Walker' where nom = 'Marchand' and prenom = 'Elisabeth' ;

select * from Contact ;

-- Supprimer virenque
delete from contact where nom = 'Virenque' ;

select * from Contact ;

-- Dans la reqi$ete remplacer la colonne nom par 'lastname'
select nom lastname, prenom, age from contact ;

select nom ';-)', prenom, age from contact ;

-- Trouver les âges débutant par 3
select * from contact where age like '3%' ;

-- Trouver les âges finissant par 8
select * from contact where age like '%8' ;

-- Trouver les noms contenant 'D'
select * from contact where nom like '%D%' ;

-- Trouver les dates de janvier
select date_de_naissance from contact where date_de_naissance like '%01%' ;
select * from contact where date_de_naissance like '%01%' ;

-- Trouver Thuillier ou Chuillier
select nom from contact where nom like '[TC]huillier' ;

-- Touver les noms commençant par 'M' et finissant par 'D'
select nom from contact where nom like 'M%D' ;

-- Elisabeth à changer de nom trouver les nom commençant par 'W' et finissant par 'R'
select nom from contact where nom like 'W%R' ;

-- Sélectionner la première ligne
select top 1 * from Contact ;

-- Séléctionner les 5 premières lignes
select top 5 * from Contact ;

-- Sélectionner le/la plus jeune
select top 1 * from contact order by date_de_naissance desc ;

-- Supprimer les doublons
select distinct nom, prenom, age from contact ;

-- Copier dans un nouvelle table la valeur Chuillier
select nom into contact2 from contact where nom = 'Chuillier' ;

select * from contact2 ;

-- Trouver les hommes de 4 manières
select * from contact where sexe = 'M' ;

select * from contact where sexe <> 'F' ;

select * from contact where sexe != 'F' ;

select * from contact where sexe not in ('F') ;

select * from contact where sexe in ('M') ;

-- Sélectionner les pessonnes de 18 et moins
select * from contact where age <= 18 ;

-- Sélectionner ceux qui ont 47 & 48 ans
select * from contact where age in (47, 48) ;

-- Qui n'est pas né en 1976 ?
select * from contact where date_de_naissance not like '%1976%' ;

-- Qui n'est pas né en août ?
select * from contact where date_de_naissance not like '%08%' ;

-- Qui n'a pas entre 20 et 40 ans ?
select * from contact where age not between 20 and 40 ;

-- Compter les personnes de 18 à 40 ans, masculin, dont le total est supérieur à 1
select count(*) age , sexe
from contact 
where age between 18 and 40 and sexe = 'M'
group by age , sexe
having count(*) > 1 ;

-- Combien de personnes sont Olivier ?
select count(*) from contact where prenom = 'Olivier' ;

-- Sommer les femmes nées en 1983
select sum(1) from contact where sexe = 'F' and date_de_naissance like '1983%' ;

-- Qui à de 20 à 45 ans, dont le nombre est supérieur à 1, en classant l'âge par décroissance ?
select age, count(*) nombre
from contact 
where age between 20 and 45
group by age 
order by age desc ;

select count(*) nombre , age
from contact
where age between 20 and 45
group by age
having count(*) > 1
order by age desc ;