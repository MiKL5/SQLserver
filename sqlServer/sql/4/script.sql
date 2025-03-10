-- Quelle est la foncion de chaque salarié ?
select A.prenom , A.nom , B.fonction from salarié A
inner join bareme_salaire B on A.fonction = B.Fonction ;

select A.prenom , A.nom , B.fonction from salarié A
join bareme_salaire B on A.fonction = B.Fonction ;

-- Trouver la fonction de chaque salarié avec CROSS APPLY
select A.prenom , A.nom , B.fonction from salarié A
cross apply bareme_salaire B ;

select A.prenom , A.nom , C.fonction from salarié A
cross apply
(
    select * from bareme_salaire B
    where A.fonction = B.Fonction
) C ; -- le C est un type

-- Qui sont les femmes commerciales ?
-- Utiliser une jointure entre les tables salarié et bareme_salaire.
select A.prenom , A.nom , B.Fonction from salarié A
inner join bareme_salaire B on A.fonction = B.Fonction
where A.sexe = 'F' and B.fonction = 'Commercial' ;

-- Qui est un CDI avec 2000 à 3000 euros de salaire ?
select A.prenom , A.nom , B.Fonction , S.[Types] , B.salaire from salarié A
inner join Statut_emploi S on A.IDclient = S.IDclient
inner join bareme_salaire B on A.fonction = B.Fonction
where S.Types = 'CDI' and B.salaire = 'entre 2000 et 3000' ;

-- Utiliser les jointures pour savoir qui n'a pas de type de contrat ? Il doit y avoir unee colone Pas de contrat contenant la mension "Pas de contrat". Utiliser les colonnes nom prenom et types
select A.prenom , A.nom ,
case when C.[Types] is null then 'pas de contrat' end 'pas de contrat'
from salarié A
left join Statut_emploi C on C.IDclient = A.IDclient
where C.IDclient is null ;

-- Avec les jointures, listter les personnes yant un contrat. et le texte 'il y a un contrat' dans la colonne contrat 
select A.prenom , A.nom,
case when C.[Types] is not null then 'a un contrat' end 'contrat'
from salarié A
right join Statut_emploi C on C.IDclient = A.IDclient
where A.IDclient is not null ;


-- Lister les personnes avec et sans contrat et noter le texte 'il y a un contrat' ou 'Pas de contrat' dans la colonne contrat
select A.prenom , A.nom ,
case when C.Types is not null then 'a un contrat' else 'n a pas de contrat' end 'contat'
from salarié A
full join Statut_emploi C on C.IDclient = A.IDclient ;

select salarié.nom, salarié.prenom, ISNULL(Statut_emploi.Types, 'Pas de contrat') Contrat
from salarié
left join Statut_emploi on salarié.IDclient = Statut_emploi.IDclient ;

-- Avec un update et une jonture remplacer la table T2 par la T1
update T2
set colonne1 = T1.colonne2
from T1 t1
inner join T2 t2 on t1.colonne1 = t2.colonne1
where t2.colonne1 = '3 , 4' ;

-- 