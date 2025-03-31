-- Créer la table Type de colonnes de 3 colonnes
create table Type_de_colonne (
    nom char(10),
    age int,
    date_adhesion datetime2
) ;

-- Insérer 3 personnes
-- Duhamel , 18 , ajourd'hui
-- Dutruel , 22 , hier
-- Dupont , 22 , Il y a 2 jours
insert into Type_de_colonne (nom, age, date_adhesion)
values
('Duhamel', 18, getdate() ),
('Dutruel', 22, getdate( DAY, -1, getdate() ) ) ,
('Dupont', 22, getdate( DAY, -2, getdate() ) ) ;

-- Séléctinner le mois, le jour et l'année à la colonne date d'adhésion
select
    month(date_adhesion) Mois,
    day(date_adhesion) Jour,
    year(date_adhesion) Année
from Type_de_colonne ;

-- Insérer DUPONT-MARCHE , 25 , aujourd'hui
insert into Type_de_colonne (nom, age, date_adhesion)
values('DUPONT-MARCHE' , 25 , getdate() ) ; -- le nom est trop long 

-- Ajouter à la table la colonne fin d'adhésion en datetime2
alter table Type_de_colonne
add fin_adhesion datetime2 ;

-- Modifier la colonne en char(10) en varchar(200)
alter table Type_de_colonne
alter column nom varchar(200) ;

--- Cette fois ajouter dupont-marché
insert into Type_de_colonne (nom, age, date_adhesion)
values('dupont-marché' , 25 , getdate() ) ;