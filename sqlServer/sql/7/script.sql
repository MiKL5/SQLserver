-- créer une vue pour Sandrive devant voir les femmes nées entre 1976 et 1985
create view Sandrive as
select * from contact
where sexe = 'F' and naissance between '1976' and '1985' ;

select * from Sandrive ;
-- Créer une seconde vue pour Benoit devant voir les contacts de 25 à 40 ans
create view Benoit0 as
select * from contact
where datediff(year, naissance, getdate()) between 25 and 40 ;

select * from Benoit0 ;

create view Benoit as
select * from contact
where age between 25 and 40 ;

select * from benoit ;

-- Erratum la vue dde benoit doit remonter les personnes de 16 à 25 ans
alter view Benoit as
select * from contact
where age between 16 and 25 ;

select * from Benoit ;

-- Le renommer benoit2
sp_rename 'Benoit' , 'benoit2' ;

-- le suppimer
drop view benoit2 ;