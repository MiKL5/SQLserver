-- Combien de lignes distinctes a la colonnes "sexe" ?
select count(distinct sexe) distinct_lines from contact ;

-- Corriger la requête suivante pour 
select nom , prenom , age , count(*) nb
from contact
where nom = 'boutin'
group by nom , prenom , age
having count(1) > 1 ; -- Il y a 2 Ludivine Boutin

select nom , prenom , age , count(*) nb
from contact
where nom = 'boutin'
group by nom , prenom , age
having count(*) > 1 ; -- Il y a 2 Ludivine Boutin

-- Insérer à contact Denis Peronin, 43 ans, masculin et né le 2 juin 1974
insert into contact values ('peronin' , 'denis' , 43 , 'M' , '1974-06-02') ;
select * from contact ;

-- Qui est né en janvier et à plus de 16 ans ?
select * from contact
where month(date_de_naissance) = 1 and age > 16 ;

-- Sélectionner les personnes nommée Portail et Virenque
select * from contact
where nom = 'portail' or nom = 'Virenque' ;