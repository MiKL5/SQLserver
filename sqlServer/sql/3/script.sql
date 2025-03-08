-- Combien y a t-il de Ludivine ?
select count(*) from contact
    where nom = 'Ludivine';

-- Sommer les femmes nées en 1983.
select sum(1) from contact
    where sexe = 'F' and year(naissance) = 1983 ;

-- Sommer les personnes nées en 1983.
select sum(1) from contact
    where year(naissance) = 1983 ;

-- Combien de femme ont entre 20 et 45 ans dont le nombre est supérieur à 1 par décroissance ?
select count(*) sexe , age from contact
	where sexe = 'F' and age between 20 and 45
	group by sexe , age
	having count(*) > 1
	order by age desc ;

-- Et de personnes ?
select count(*) sexe , age from contact
	where sexe = 'F' and age between 20 and 45
	group by sexe , age
	having count(*) > 1
	order by age desc ;

-- Combien de lignes distinctes dans la colonne sexe ?
select count(distinct sexe) from contact ;

-- Insérer deux lingnes à la table contact et imprimer les résultats.
insert into contact values ('PERONIN' , 'Denis' , 43 , 'M' , '1974-06-02')
    print 'Denis PERONIN est ajouté.' ;
insert into contact values ('GALTIER' , 'Sophie' , 26 , 'F' , '1988-02-01')
    print 'Sophie GALTIER est ajoutée.' ;

-- Séléctionner les personne  n'ayant pas de 20 à 27 ans
select * from contact where age not between 20 and 27 ;

-- Compter les peersonnes masculine avec le A au prénom ayant 18 à 40 ans dont le total est supérieur à 1.
select count(*) , age , sexe from contact
	where prenom like '%a%' and age between 18 and 40 and sexe = 'M'
	group by age , sexe
	having count(*) > 1 ;
-- 