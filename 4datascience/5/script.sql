use ds ;

-- Séléctionner les initiales
select nom , prenom , upper(substring(nom, 1, 1) + substring(prenom, 1, 1)) initiales from contact ;

-- Sélectionner dés la troisième lettre du prénom jusqu'aux trois suivantes
select nom , prenom , substring(prenom ,3,3)initiale from contact ;

-- Supprimer les caractères de gauche
select ltrim('    Hello !') msg ;

-- à droite
select rtrim('Hello !    ') msg ;

-- les deux
select trim(ltrim('    Hello !         ') ) msg ;

-- Les noms et prénom de contact en minuscule
select * , lower(nom) + ' ' + lower(prenom) from contact ;


-- Afficher toute la table et les dates en japonnais
select nom , prenom , format(date_de_naissance, 'd', 'ja-JP') 'Date japonaise' from contact ;

-- En chinois
select nom , prenom , format(date_de_naissance, 'd', 'zh_cn') 'Date choinoise' from contact ;

-- En brésilien
select nom , prenom , format(date_de_naissance, 'd', 'pt-br') 'Date brésilienne' from contact ;

-- Au format international
select nom , prenom , convert(char(10), date_de_naissance, 23) AS 'Dateinternationale' from contact ;

-- Quel jour sommes nous au format suisse ?
select format(getdate(), 'd', 'fr-CH') 'Date suisse' ;

-- 12345.678 au fromat américain
SELECT FORMAT(CAST('12345.678' AS decimal(10, 3)), 'N2', 'en-US') AS montant en américain ;

-- Au fromat français
SELECT FORMAT(CAST('12345.678' AS decimal(10, 3)), 'N2', 'fr-FR') AS montant en français ;

-- Au format chinois
SELECT FORMAT(CAST('12345.678' AS decimal(10, 3)), 'N2', 'zh-CN') AS montant en chinois ;

-- première deu prénom en minuscule et le reste en majuscule

select lower(LEFT(prenom,1)) + upper(substring(prenom,2,len(prenom))) 'prenom capitalise' from contact ;

-- Afficher l'inital de prénom et le nom en majuscule
select concat(left(prenom,1), '. ', upper(nom)) 'Contact abrégé' from contact ;

-- Remplacer 'Hello' par 'Bonjour'
select replace('Hello !, Comment ça va ?', 'Hello', 'Bonjour') Sentence ;

-- Coment de caractère a l'expression : 'Bonjour !, Comment ça va ?                                ' ?
        /* len exclu les espaces à droite s'il y en a */
select len('Bonjour !, Comment ça va ?                                ') 'Nb de caractères' , -- 26
datalength('Bonjour !, Comment ça va ?                                ') 'Nb de caractères' ; -- 58

-- repliquer le nom 4 fois
select nom , prenom , replicate(nom, 4) repliquer from contact ;

-- Reverse le prénom
select nom , prenom , reverse(prenom) 'Prénom inversé' from contact ;

-- Charindex recherche une expression de caractère à l'intérieur d'une autre expression et retourne la position de la première occurrence
declare @document varchar(64) ;
select @document = 'Bonjour !, Comment ça va ?'
select charindex('va' , @document) ; -- 23

-- 
______________________________________________________________________________________________________
-- Retravriller les upper et substring avec les procedures stockées à la tables contact
-- Créer une procédure affichant madame si le sexe est une femme et monsieur pour un homme dans la colonne civilité, les prénom dant la première lettre est en majuscule et les nom en majuscule dans la colonnes contact et la date de naissance en fromat suisse et en détail du jour en texte et mois en texte dans la colonne date
create procedure sp_Contact
as
begin
    select
        -- 1. Civilité
        case 
            when sexe = 'F' then 'Madame'
            when sexe = 'M' then 'Monsieur'
            else 'Inconnu'
        end Civilité,

        -- 2. Contact formaté : Prénom (1re lettre majuscule), nom en majuscules
        concat(
            upper(left(prenom, 1 ) ) , lower(substring(prenom, 2 , len(prenom) ) ) , ' ', upper(nom)
        ) Contact,

        -- 3. Date au format suisse avec jour et mois en lettres
        format(date_naissance, 'dddd d MMMM yyyy', 'fr-CH') date
    from contact;
end ;

exec sp_contact ;

-- Modifié le nom de la colonne date par Né· e le , plus la première lettre du jour en majuscule
create or alter procedure sp_contact
as
begin
    select
        -- 1. Civilité
        case 
            when sexe = 'F' then 'Madame'
            when sexe = 'M' then 'Monsieur'
            else 'Inconnu'
        end Civilité,

        -- 2. Contact formaté : Prénom (1re lettre majuscule), nom en majuscules
        concat(
            upper(left(prenom, 1 ) ) , lower(substring(prenom, 2 , len(prenom) ) ) , ' ', upper(nom)
        ) Contact,

        -- 3. Date au format suisse avec jour et mois en lettres, jour avec 1re lettre majuscule
        concat(
            upper(left(format(date_de_naissance, 'dddd d MMMM yyyy', 'fr-CH'), 1) ),
            lower(substring(format(date_de_naissance, 'dddd d MMMM yyyy', 'fr-CH'), 2, len(format(date_de_naissance, 'dddd d MMMM yyyy', 'fr-CH') ) ) )
        ) 'Né·e le' 
    from contact ;
end ;

exec sp_contact ;

-- ajouter l'âge et l'apge réel
create or alter procedure sp_contact
as
begin
    select
        -- 1. Civilité
        case 
            when sexe = 'F' then 'Madame'
            when sexe = 'M' then 'Monsieur'
            else 'Non binaire'
        end Civilité ,

        -- 2. Contact formaté : Prénom (1re lettre majuscule), nom en majuscules
        concat(
            upper(left(prenom, 1 ) ) , lower(substring(prenom, 2 , len(prenom) ) ) , ' ' , upper(nom)
        ) Contact,

        -- 3. Date au format suisse avec jour et mois en lettres, jour avec 1re lettre majuscule
        concat(
            upper(left(format(date_de_naissance, 'dddd d MMMM yyyy', 'fr-ch'), 1) ),
            lower(substring(format(date_de_naissance, 'dddd d MMMM yyyy', 'fr-ch'), 2 , len(format(date_de_naissance, 'dddd d MMMM yyyy', 'fr-CH') ) ) )
        ) 'Né·e le' ,

        -- 4. Age
        age 'Âge connu' ,
        -- 5. Age réel
        datediff(year , date_de_naissance, getdate() ) 'Âge réel' ,
        -- 6. äge en jour avec éparateur de milliers et la culture suisse
        format(datediff(day, date_de_naissance, getdate() ) , 'N0' , 'fr-ch') 'Jours vécus'
    from contact ;
end ;

exec sp_contact ;