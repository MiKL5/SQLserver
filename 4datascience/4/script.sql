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