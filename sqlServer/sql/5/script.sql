-- Aficher en majuscules les noms des salariés des lignes 7 à 13
select UPPER(nom), prenom
from salarié
order by nom offset 7 rows fetch next 13 rows only ;

-- Trouver les hommes du service finance avec IIF
select s.nom , s.prenom , s.fonction , iif(sexe='M' , 'Monsieur' , 'Madame') sexe from salarié s
inner join bareme_salaire b on s.fonction = b.Fonction
where b.Fonction = 'finance' and s.sexe = 'M' ;

-- Trouver les personnes nés après le moi de mai
select * , CHOOSE(DATEPART(month , naissance) ,
'janvier' , 'Février' , 'Mars' , 'Avril' , 'Mai' , 'Juin' , 'Juillet' , 'Août' , 'Septembre' , 'Octobre' , 'Novembre' , 'Décembre') Nés_ap_mai
from contact
where datepart(month , naissance) > 5 ;

-- Ecrire les dates de naissance au format italien
select * , format(naissance , 'D' , 'it_IT') Italiano
from contact ;

-- Remplacer Elisabeth Walker par Jeanne D'Arc
select replace(prenom , 'Elisabeth' , 'Jeanne') as prenom,
replace(nom , 'MARCHAND' , 'D Arc') as nom
from salarié ;

-- Quels sont les initiales de Brun PORTAIL et de Valérie DELORS
select prenom , nom , SUBSTRING(prenom , 1 , 1) + SUBSTRING(nom , 1 , 1) as Initiales
from salarié
where nom in ('PORTAIL' , 'DELORS') ;

-- Quels sont les noms de salariés de plus de 6 caractères
select nom
from salarié
where LEN(nom) > 6 ;

-- Corriger la demande
select len(a.nom) Nom_Len , a.prenom , b.Fonction , c.[Types] , b.salaire , substring(prenom , 1 , 2) Prenom_Abrege
from salarié a
inner join barame_salaire b ON a.fonction = b.Fonction
inner join statut_emploi c ON a.IDclient = c.IDclient
where c.[Types] = 'CDI' 
and b.salaire = 'entre 2000 et 3000' ;