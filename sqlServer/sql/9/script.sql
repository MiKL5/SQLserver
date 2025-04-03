-- Créer la BDD exercice
create database magasin ;

-- Créer la table article, les colonnes sont : nom_article en varchar(200), prix en int, stock en int, date_arrivée en date, nom_vendeur en varchar(200), et id_article en int (clé primaire)
use magasin ;
create table article (
    id_article int primary key
    nom_article varchar(200) ,
    prix int ,
    stock int ,
    date_arrivée date ,
    nom_vendeur varchar(200) ,
) ;

-- Créer Les données (25 lignes complètes)
insert into article (id_article, nom_article, prix, stock, date_arrivée, nom_vendeur) values
(1, 'Article 1', 100, 10, '2023-01-01', 'Vendeur A') ,
(2, 'Article 2', 200, 20, '2023-02-01', 'Vendeur A') ,
(3, 'Article 3', 300, 30, '2023-03-01', 'Vendeur A') ,
(4, 'Article 4', 400, 40, '2023-04-01', 'Vendeur A') ,
(5, 'Article 5', 500, 50, '2023-05-01', 'Vendeur A') ,
(6, 'Article 6', 600, 60, '2023-06-01', 'Vendeur A') ,
(7, 'Article 7', 700, 70, '2023-07-01', 'Vendeur E') ,
(8, 'Article 8', 800, 80, '2023-08-01', 'Vendeur E') ,
(9, 'Article 9', 900, 90, '2023-09-01', 'Vendeur E') ,
(10,'Article 10',1000,100,'2023-10-01','Vendeur J') ,
(11,'Article 11',1100,110,'2023-11-01','Vendeur K') ,
(12,'Article 12',1200,120,'2023-12-01','Vendeur K') ,
(13,'Article 13',1300,130,'2024-01-01','Vendeur K') ,
(14,'Article 14',1400,140,'2024-02-01','Vendeur K') ,
(15,'Article 15',1500,150,'2024-03-01','Vendeur K') ,
(16,'Article 16',1600,160,'2024-04-01','Vendeur K') ,
(17,'Article 17',1700,170,'2024-05-01','Vendeur K') ,
(18,'Article 18',1800,180,'2024-06-01','Vendeur K') ,
(19,'Article 19',1900,190,'2024-07-01','Vendeur S') ,
(20,'Article 20',2000,200,'2024-08-01','Vendeur S') ,
(21,'Article 21',2100,210,'2024-09-01','Vendeur S') ,
(22,'Article 22',2200,220,'2024-10-01','Vendeur S') ,
(23,'Article 23',2300,230,'2024-11-01','Vendeur S') ,
(24,'Article 24',2400,240,'2024-12-01','Vendeur S') ,
(25,'Article 25',2500,250,'2025-01-01','Vendeur Y') ;

-- Séléctionner les 10 premiers lignes
select top 10 * from article ;

-- Séléctionner les noms des articles à la lettre A
select nom_article from article where nom_article like '%A%' ;

-- Séléctionner les stocks ou les valeurs ne sont pas null
select * from article where stock is not null ;

-- Quel vendeur n'est pas Benoît ? de 2 façons
select nom_vendeur from article where nom_vendeur != 'Benoît' ;
select nom_vendeur from article where nom_vendeur <> 'Benoît' ;
select nom_vendeur from article where nom_vendeur not in 'Benoît' ;

-- Trouver les stock enntre 200 et 1000 pour le vendeur Christophe, classer le prix par décroissance
select *
from article
where stock
between 200 and 1000 and nom_vendeur = 'Christophe'
order by prix desc ;

-- Combien y a t-il de lignes distictes à la colonne stock ?
select count(distinct stock) from article ;

-- Sommer les stocks pour le vendeur Benoît nommée la colonne Somme totale des stocks
select sum(stock)'Somme totale des stocks'
from article
where nom_vendeur = 'Benoît' ;

-- Copier la table article. la bouvelle table sera table_benoit. Cette nouvelle table doit uniquement contenir toutes les ventes du vendeur Benoît
select * into table_benoit form article where nom_vendeur = 'Benoît' ;
select * from table benoit ;

-- Séléctionner le nom de l'article 'Basket ou Vin'
select nom_article
from article
where nom_article = 'Basket' or nom_article = 'Vin' ;

-- Requêter la moyenne des prix pour le vendeur dont le total est égale ou supérieur à 500 et afficher son nom
select nom_vendeur, avg(prix)
from article
where prix >= 500
group by nom_vendeur ;

select avg(prix) , nom_vendeur
from article
group by nom_vendeur
having avg(prix) >= 500 ;

-- Créer la vue vue_article ou les articles sont arrivés de janvier à septembre
create view vue_article as
select * from article where date_arrivée between '2023-01-01' and '2023-09-30' ;

select ù from vue_article ;
-- Créer une procédure stockée supprimant les parapluies du stock
create procedure supprimer_parapluies as
delete from article where nom_article = 'Parapluie' ;

exec supprimer_parapluies ;