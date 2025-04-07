-- Adventure Works
use master ;


-- Quel est le chemin et le nom logique nécessaires
restore filelistonly
from disk = N'C:\AdventureWorks2022.bak';


-- Restauration
restore database AdventureWorks2022
from disk = N'C:\AdventureWorks2022.bak'
with
	move 'AdventureWorks2022' to 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2022.mdf' ,
	move 'AdventureWorks2022_log' to 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureWorks2022_log.ldf' ,
    stats = 10 , -- prévenu de l'avancée tous les 10 pourcent
	replace ;
go


use AdventureWorks2022 ;

--------------------------------------------------------------------------------------------------------------------------

-- Replique les nom 4 fois
select name , ProductLine , replicate(0 , 4) + [ProductLine] LineCode
from [Production].[Product]
where [ProductLine] = 'T'
order by [name] ;

select name , ProductLine , replicate('0' , 4) + [ProductLine] LineCode
from [Production].[Product]
where [ProductLine] = 'T'
order by [name] ;  -- même résultat, mais c'est plus clair de mettre le '0' entre les côtes

-- Replique le 0 4 fois
select name , ProductLine , replicate(0 , 4) + [ProductLine] LineCode
from [Production].[Product]
where [ProductLine] = 'T'
order by [name] ;

select name , ProductLine , replicate('0' , 4) + [ProductLine] LineCode
from [Production].[Product]
where [ProductLine] = 'T'
order by [name] ;  -- même résultat, mais c'est plus clair de mettre le '0' entre les côtes

-- inverser le prénom
select firstname , reverse(firstname) reverse
from person.person
where businessentityid < 5
order by firstname ;

-- Quelle est la position d’uee chaîne de caractères dans l'expression
declare @document varchar(64)
select @document = 'Bonjour !, Comment ça va ?'
select charindex('comment' , @document) ; --12

-- Fractionner l'expression de caractères (en mode compatibilité pour sql server 2022)
use db ;
select * from string_split('1,2,3,4,5' , ',') ;

-- Insérer les trois prochains caractères à la position 2
select stuff('abcdef' , 2 , 3 , 'ijklm') ;

-- Concatenner les chaînes de caractères
select concat('happy' , 'birthday' , 11 , '/' , '25') result

-- Avec les céparations
select database_id , recovery_model_desc , containment_desc from sys.databases ;
select concat_ws(' - ' , database_id , recovery_model_desc , containment_desc) databaseInfo from sys.databases ;