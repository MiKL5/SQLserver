create database ds ;

use ds ;

create table peoples (
    id int not null primary key ,
    prenom varchar(50) not null ,
    nom varchar(50) not null ,
    age int not null ,
    ville varchar(50) not null
);

create table peoples (
    id int identity(1,1) primary key ,
    prenom varchar(50) NOT NULL ,
    nom varchar(50) NOT NULL ,
    age int NOT NULL ,
    ville varchar(50) NOT NULL
);

-- Insérer 5 lignes, il faut 5 valeurs à la table
insert into peoples values
(1 , 'Elisabeth' , 'Marchand' , 30 , 'New York') ,
(2 , 'Mélanie' , 'Truchon' , 25 , 'Los Angeles') ,
(3 , 'Sandrine' , 'Teslu' , 35 , 'Chicago') ,
(4 , 'Bruno' , 'Portail' , 28 , 'Houston') ,
(5 , 'Eve' , 'Vire' , 22,  'Phoenix') ;

select * from peoples ;

-- selectionner TESLU
select * from peoples where nom = 'Teslu' ;

-- Mettre à jour Teslu qui à 18 ans
update peoples set age = 18 where nom = 'Teslu' ;

-- Retirer Eve Vire
delete from peoples where nom = 'Vire' ;

-- En une seule requête Mettre à jour marchand elisabeth par marchande Eli
update peoples set prenom = 'Eli' , nom = 'Marchande' where prenom = 'Elisabeth' ;
update peoples set prenom = 'Eli' , nom = 'Walker' where prenom = 'Eli' and nom = 'Marchande' ;



-- LES PROCEDURES STOCKEES
create procedure ps_insert as
declare @msg varchar(17)
set @msg = 'Insertion réussie'
print @msg ;

create procedure ps_peoples as
exec ps_insert
insert into peoples values
(1 , 'Elisabeth' , 'Marchand' , 30 , 'New York') ,
(2 , 'Mélanie' , 'Truchon' , 25 , 'Los Angeles') ,
(3 , 'Sandrine' , 'Teslu' , 35 , 'Chicago') ,
(4 , 'Bruno' , 'Portail' , 28 , 'Houston') ,
(5 , 'Eve' , 'Vire' , 22,  'Phoenix');

exec ps_peoples ;

create procedure ps_select_peoples as
select * from peoples ;


alter procedure ps_peoples as
begin
    set nocount on; -- Empêche les messages inutiles sur le nombre de lignes affectées.

    -- Insertion des données dans la table peoples
    insert into peoples (prenom, nom, age, ville)
    values
        ('Elisabeth', 'Marchand', 30, 'New York'),
        ('Mélanie', 'Truchon', 25, 'Los Angeles'),
        ('Sandrine', 'Teslu', 35, 'Chicago'),
        ('Bruno', 'Portail', 28, 'Houston'),
        ('Eve', 'Vire', 22, 'Phoenix');

		-- Appel de la procédure ps_insert, si nécessaire
    exec ps_insert;

    -- Appel de la procédure ps_select_peoples pour afficher les données
    exec ps_select_peoples;
end;

exec ps_peoples ;