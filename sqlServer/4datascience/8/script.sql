USE [FORMATION]
go
-- creation de trois tables pour la mise en place : 

create table bareme_salaire (Fonction varchar (200),salaire varchar(200))
go
create table salari� ( IDclient int,nom varchar (200),prenom varchar (200), age varchar(2000),sexe varchar(200),date_de_naissance varchar(200),[fonction] varchar (200))
go
create table Statut_emploi (IDclient int,[Types] varchar (200))

-- Insertion de valeur dans les tables

insert into bareme_salaire values 
('RH','entre 2000 et 3000'),
('Commercial','entre 2500 et 5000'),
('informatique','entre 2200 et 6000'),
('finance','entre 5000 et 10000')

go 

insert into salari� values 
(1,'Marchand','Elisabeth',18,'F','04-08-1976','RH'),
(1,'Truchon','Melanie',32,'F','04-08-1978','Commercial'),
(2,'Teslu','Sandrine',35,'F','02-05-1987','Informatique'),
(1,'Portail','Bruno',23,'M','06-05-1970','Finance'),
(1,'Virenque','Michel',22,'M','02-08-1983','Informatique'),
(3,'Dutruel','Pascal',22,'M','02-08-1983','Commercial'),-- meme age que Virenque michel
(2,'Virenque','Micheline',37,'M','02-08-1975','Commercial'),
(2,'Fournillet','Alain',22,'M','01-01-1983','RH'),
(2,'Faurnillet','Pascal',48,'M','12-06-1960','RH'),
(2,'Boutin','Ludivine',47,'F','22-01-1965','Informatique'),
(1,'Delors','Valerie',28,'M','24-09-1978','RH'),
(1,'Thuillier','olivier',41,'M','12-08-1976','Commercial'),
(2,'Chuillier','bertrand',43,'M','12-08-1978','Finance'),
(1,'Meilhac','ludivine',45,'F','08-05-1983','Finance'),
(2,'Boutin','Ludivine',47,'F','22-01-1965','Finance'),
(4,'Batin','Alain',59,'M','01-01-1983','RH'),
(2,'Dupont','Pascal',48,'M','12-06-1960','RH'),
(3,'Dujardin','Laetitia',47,'F','22-01-1965','Informatique'),
(1,'Duchemin','Valerie',57,'M','24-09-1978','RH'),
(2,'Martin','olivier',41,'M','12-08-1976','Informatique'),
(2,'Fontaine','olivier',44,'M','12-08-1976','Finance'),
(1,'Chevalier','Amelie',37,'F','08-05-1983','Commercial'),
(6,'Jolly','Ludivine',47,'F','22-01-1965','Finance'),
(5,'Le M�e','aurore',22,'M','01-01-1983','RH'),
(4,'Bonnet','Pascal',48,'M','12-06-1960','RH'),
(2,'Binet','Ludivine',47,'F','22-01-1965','Informatique'),
(2,'Lopez','Valerie',28,'M','24-09-1988','RH'),
(3,'Dumont','Bruno',55,'M','12-08-1973','Commercial'),
(3,'Girard','olivier',58,'M','12-08-1970','Finance'),
(4,'Roussel','Amelie',47,'F','08-05-1978','Informatique'),
(1,'Muller','Ludivine',52,'F','22-01-1963','Informatique')

go 

insert into Statut_emploi values
(1,'CDD'),
(2,'CDI'),
(3,'Interim'),
(4, 'Periode dessai')


-- Quelle est la fonction des salariés (tables salariés et barême_salaire) ?
select prenom , nom , b.fonction
from salarié s
inner join bareme_salaire b on s.fonction = b.fonction ;

select prenom , nom , b.fonction
from salarié s
join bareme_salaire b on s.fonction = b.fonction ;

select prenom , nom , b.fonction
from salarié s
cross join bareme_salaire b ;

-- idem avec cross aply
select s.nom , s.prenom , b.fonction
from salarié s
cross apply (
select fonction from bareme_salaire b
where s.fonction = b.fonction
) 
b ; -- type

-- QUi sont lesfemmes commerciales ?
select s.nom , s.prenom , b.fonction
from salarié s
join bareme_salaire b
on s.fonction = b.fonction 
where s.sexe = 'F' and b.fonction = 'Commercial' ;

-- Quels salarié est en CDI avec 2000 à 3000 €/moins ?
select s.nom , s.prenom , e.[types] , b.fonction , b.salaire
from salarié s
join bareme_salaire b on s.fonction = b.fonction 
inner join Statut_emploi e on e.idclient = s.idclient
where b.salaire = 'entre 2000 et 3000' and e.[types] = 'cdi' ;

-- "À l'aide des jointures", Qui n'a pas de contrat ?
select s.nom , s.prenom , e.[types] , b.fonction
from salarié s
join bareme_salaire b on s.fonction = b.fonction
left join Statut_emploi e on e.idclient = s.idclient
where e.[types] is null ;

-- Et afficher contrat comme colonne et pas de contrat dans la case

select s.nom , s.prenom , b.fonction ,
case when e.[types] is null then 'pas de contrat' else e.[types] end 'contrat'
from salarié s
join bareme_salaire b on s.fonction = b.fonction
left join Statut_emploi e on e.idclient = s.idclient
where e.idclient is null ;

select s.nom , s.prenom , b.fonction ,
case when e.[types] is null then 'aucun contrat' else e.[types] end contrat
from salarié s
join bareme_salaire b on s.fonction = b.fonction
left join Statut_emploi e on e.idclient = s.idclient
where e.idclient is null ;

-- Avec un jointure qui a un contrat ?
select s.nom , s.prenom , 
case when e.[types] is not null then 'contrat signé' else e.[types] end contrat
from salarié s
join bareme_salaire b on s.fonction = b.fonction
left join Statut_emploi e on e.idclient = s.idclient
where e.idclient is not null ;

select s.nom , s.prenom , 
case when e.[types] is not null then 'contrat signé' else e.[types] end contrat
from salarié s
join bareme_salaire b on s.fonction = b.fonction
right join Statut_emploi e on e.idclient = s.idclient -- idéalement une jointure droite
where e.idclient is not null ;

-- En faire une procédure stockée
create or alter procedure sp_contrat
as
begin
select s.nom , s.prenom , 
case when e.[types] is not null then 'contrat signé' else e.[types] end contrat
from salarié s
join bareme_salaire b on s.fonction = b.fonction
left join Statut_emploi e on e.idclient = s.idclient
where e.idclient is not null ;
end ;

exec sp_contrat ;

-- Lister les personnes aynt un contrat et celles n'en ayant pas
select s.nom , s.prenom ,
case when e.[types] is not null then 'contrat signé' else 'aucun contrat !' end contrat
from salarié s
join bareme_salaire b on s.fonction = b.fonction
full join Statut_emploi e on e.idclient = s.idclient
where e.idclient is not null or e.idclient is null ;

-- update sur les tables t1 & t2 En colonne 2 cinquième doit être troisième et sixième quatrième
update t2
set c2 = t1.c2
from t1
inner join t2 on t1.c2 = t2.c2
where t2.c1 in (3 , 4) ;