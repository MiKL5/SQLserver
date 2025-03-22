# **Les jointures**<a href="../../"><img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"></a>
Le fonctionnement du base de données et celui d’un puzzle.  
Une table est une pièce séparée.  
Le travail est de les rassemblées.

Une jointure relier au moins une table en une requête.
Les données de plusieurs sont combinées.
Avec SQL Server, elles sont très utilisées.
## **`INNER JOIN`**
Une jointure interne retourne les enregistrements si la condition es vrai aux 2 tables. Elle est l’une des plus utilisée.  
Elle regroupe les données concordantes entre les deux tables.
```sql
use db ;

-- Créer les tables client et commande
create table commande(numerodecommande int , idclient  int)
go
create table client (nom varchar(200) , prenom varchar(200) , idclient int , adresse varchar(2000) , ville varchar(200) )
insert into commande values
('3712' , 1),
('4851' , 2),
('6712' , 3),
('3215' , 4),
('3218' , 5),
('3220' , 6),
('3221' , 7),
('3227' , 8),
('3238' , 9);
insert into client values
insert into client values
('THUILLIER' , 'Olivier' , 1 , '7 rue Poirier' , 'Dreux'),
('THUILLIER' , 'Lac' , 3 , '7 rue Paris' , 'Paris'),
('THUILLIER' , 'Théodore' , 5 , '7 rue Amsterdam' , 'Amsterdam'),
('THUILLIER' , 'Marcel' , 12 , '7 rue Prague' , 'Prague'),
('THUILLIER' , 'Lucas' , 13 , '7 rue Vienne' , 'Vienne') ;

-- Sélectionner les tables
select * from client ;
select * from commande ;

-- Quels clients ont un numéro de commande
select A.numerodecommande , A.idclient from commande A 
inner join client B
on A.idclient = B.idclient ;

-- Qui sont ils ?
select A.numerodecommande , A.idclient , B.prenom , B.nom from commande A 
inner join client B
on A.idclient = B.idclient ;

-- Comment prouver qu'INNER devant JOIN est superfetatoire
select A.numerodecommande , A.idclient , B.prenom , B.nom from commande A 
join client B
on A.idclient = B.idclient ;

-- L'ordre des jointure a t-il une incidence ?
select A.numerodecommande , A.idclient , B.prenom , B.nom  from commande A 
join client B
on B.idclient = A.idclient ; -- Non

-- L'odre des colonnes change t-il avec SELECT ?
select B.prenom , B.nom ,A.numerodecommande , A.idclient from commande A 
join client B
on B.idclient = A.idclient ; -- Oui
```
## **Les joinures externes `LEFT` & `RIGHT` JOIN**
### **`LEFT JOIN`**
`LEFT JOIN` retourne tous les enregistrement de la table à gauche, et les valeurs correspondantes à celle de droite.  
### **`LEFT JOIN` & `IS NULL`**
Avec le `LEFT JOIN`, il rapporte tous les enregistrements de la table de gauche, n’ayant pas de correspondance à celle de droite.
### **`RIGHT JOIN`**
Cette jointure externe rapporte tous les enregistrements de droite et les valeurs correspondantes à gauche.
### **`RIGHT JOIN` & `IS NULL`**
Les valeurs de droite ne correspondants pas à celles de gauche.
```sql
-- Quel client n'a pas d'identifiant dans la table commande
select B.idclient , B.nom , B.prenom from client B
left outer join commande A
on A.idclient = B.idclient
where A.idclient is null ;

-- Essayer sans outer
select B.idclient , B.nom , B.prenom from client B
left join commande A -- outer et facultatif
on A.idclient = B.idclient
where A.idclient is null ;

-- Idem avec right join
select B.idclient , B.nom , B.prenom from commande A
right join client B
on A.idclient = B.idclient
where A.idclient is null ;
```
## **`FULL (OUTER) JOIN`**
Permet la combinaison intégrale de 2 tables, les associer grâce à une condition et renvoie les valeurs ne conrrespondants (NULL) ; tous les enregistrements.
#### **Le filtre `IS NULL`**
Ramène les valeurs non concordantes.

Cette jointure est pratique pour voir les lignes qui ne correspondent pas.
```sql
-- Prendre commande A.idclient
select A.idclient from commande A
full join client B
on A.idclient = B.idclient ;

-- Idem avec B.idclient
select B.idclient from commande A
full join client B
on A.idclient = B.idclient ;

-- A.idclient sans null
select A.idclient from commande A
full join client B
on A.idclient = B.idclient
where B.idclient is null ;

-- B.idclient sans null
select B.idclient from commande A
full join client B
on A.idclient = B.idclient
where A.idclient is null ;

-- Que les null
select B.idclient from commande A
full join client B
on A.idclient = B.idclient
where B.idclient is null ;

select A.idclient from commande A
full join client B
on A.idclient = B.idclient
where A.idclient is null ;
```
## **`CROSS JOIN`**
La jointure croisée est le produit cartésien de 2 tables. Avec SQL c’est une multimlication généralisée.  
C’est-à-dire, associe les lignes de la première table à la seconde.
```sql
-- Lier par une jointure croisée client et commande
select * from client
cross join commande ; -- 45 ligne la table est multipliée par l'autre

select * from commande
cross join client ;
```
## **Joindre plusieurs tables**
```sql
-- Quels clients ont un numéro de commande et une carte de fidélité ?
select A.idclient from commande A
inner join client B
on B.idclient = A.idclient
inner join carte_fidelite C
on B.idclient = C.idclient
where C.fidelite = 'oui' ;
```
## **LEFT JOIN vs NOT IN vs NOT EXISTS**
```sql
-- Quel client n'a pas d'identifiant à la tabls commande ?
select B.idclient , B.nom , B.prenom from client B
left join commande A
on A.idclient = B.idclient
where A.idclient is null ;

-- Même question en utilisant NOT IN
select idclient , nom , prenom from client
where idclient not in 
(
select idclient from commande
) ;

-- Même problématique aved NOT EXISTS
select B.idclient , B.prenom , B.nom from client B
where not exists
(
    select * from commande A
    where B.idclient = A.idclient
) ;

/* NOT IN voire NOT EXISTS est parfois plus rapide */
```
## **Les jointures dans ‘update’**
```sql
-- Copier les données de la table 1 à la table 2
update t2
set c2 = t1.c2 -- màj depuis la première
from t1
inner join t2 on t1.c1 = t2.c1
where t2.c1 in (1 , 3 , 4) ;
```
## **Le Hint**
Cet _opérateur de jointure_ un indicateur.Le but est de changer l’ordre des jointures.  
`HASH JOIN` est très puissant et utilisé pour les volumes moyen et grands. Techniquement, il créer une table de hashage en mémoire, puis créé dans la seconde phase ‘la phase probe’ et analyse chaque ligne avec celle de la première phase pour trouver une correspondance.

`MERGE JOIN` est une jointure de fusion utilisé lorsque les 2 tables sont pré-triées en fonction des expressions de jointures. Utile les plus souvent pour beaucoup de données.

Pour les très petites volumétries, il y a le `NESTED LOOP`. Cette jointure de boucle imbriquée est l’implémentation physique la plus simple pour les jointures de très petites tables.

Pour un serveur distant `REMOTE` est utlisable, _uniquement dans les clause `INNER JOIN`_.
```sql
-- Saisir ce code et faire contral+L pour voir le plan d'exécutio
select * from client A
inner join commande B
on A.idclient = b.idclient ; -- SQL Server à fait un hash

-- Utiliser un hash (jointure de hashage) et oberser le résultat
select * from client A
inner hash join commande B
on A.idclient = b.idclient ; -- Même résultat

-- Utiliser une jointure de fusion (le merge) et observer le plan d'exécution
select * from client A
inner merge join commande B
on A.idclient = B.idclient ; -- La fusion à besoin de plus de ressources que le hash

-- Faire une jointure de boucle 'NESTED LOOP' et regarder le plan d'exécution

select * from client A
inner loop join commande B
on A.idclient = B.idclient ; -- Moins gourmande

select * from client A
inner remote join commande B
on A.idclient = B.idclient ;

-- Mettre le hash en option
select * from client A
inner join commande B
on A.idclient = B.idclient
option (hash join) ;

-- Idem pour le merge
select * from client A
inner join commande B
on A.idclient = B.idclient
option (merge join) ;

-- Idem avec une boucle imbriquée
select * from client A
inner join commande B
on A.idclient = B.idclient
option (loop join) ;
```
<!-- SQL gère très bien les jointures 99% du temps. -->
## **Les jointures `CROSS APPLY` & `OUTER APPLY`**
`CROSS APPLY` équivaut à une jointure internet.  
`OUTER APPLY` correspond à une `LEFT JOIN`.  
```sql
-- Faire une jointure interne
SELECT * FROM department D 
INNER JOIN employee E ON D.departmentID = E.departmentID ;

-- Faire une CROSS APPLY
SELECT * FROM department D 
cross apply 
(
    select * from employee E
    where E.departmentID = D.departmentID
)
A ; -- Ceci est un alias ; une table dérivée est crée

-- Faire une LEFT JOIN
select * from department D 
left outer join employee E ON D.departmentID = E.departmentID ;

-- Faire une OUTER APPLY
select * from Department D 
outer apply 
(
	select * from Employee E
	where E.DepartmentID = D.DepartmentID
)
A ;
```
## **Les jointures `EXCEPT` & `INTERSECT`**
Elles sont très rarement utilisées, même en Transact-SQL.

La jointure `EXCEPT` retourne les lignes distinctes de la requête d’entrée à gauche qui ne sont pas retrouvées par la requête d’entrée à droite. Elle correspond à `LEFT JOIN`.

Alors qu’`INTERSECT` retourne les lignes distinctes générées par les entrées <!--(droite & gauche)-->. Elle correspond à `INNER JOIN`.
```sql
-- Comparer le plan d'exéution de l'intersect et inner join
select procuctID
from productID.productID
intersect
select productID
from productID.WorkOrder ;

select distinct b.productID
from production.product C
join production.WorkOrder B ont B.productID = C.productID
where C.productID is not null ; -- La jointure inner join est moins gourmande

-- Comparer except et left join
select productID
from production.product
except
select productID
from production.WorkOrder
order by 1 asc ; -- except demande beauocup moins de ressources

select distinct C.poductID
from production.product C
left join production.WorkOrder B
on B.productID = C.productID
where B.productID is null
order by 1 asc ;

-- Et not in
select C.productID
from production.product C
where C.productID not in (
    select B.productID
    from production.WorkOrder B
)
order by 1 asc ; -- Consomme autant de ressources qu'except
```
[Exercices](../sql/4)
___
> Cf.  
> `ctrl+F5` pour analyser le code.
>
> Pour savoir si plusieurs requêtes font la même chose :  
> écrire `set statistics io on` avant les requêtes. Exécuter le tout, et lire les infos dans Messages.