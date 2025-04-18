# **Quelle est la version d’SQL server ?**<a href="../../"><img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"></a>
## **Information détaillées**
```sql
SELECT @@VERSION AS Version ;
```
## **La version du produit**
```sql
SELECT SERVERPROPERTY('ProductVersion') AS ProductVersion ;
```
<!-- ## **Toutes les infos**
```sql
select @@version 'Version d’SQL Server', 
serverproperty('MachineName')              'Nom de la machine',
serverproperty('ServerName')               'Nom du serveur SQL',
serverproperty('InstanceName')             'Nom de l’instance',
serverproperty('Edition')                  'Édition d’SQL Server',
serverproperty('ProductLevel')             'Niveau de produit (SP/CU)',
serverproperty('ProductVersion')           'Version du produit',
serverproperty('EngineEdition')            'Type d’édition (valeur numérique)',
serverproperty('IsClustered')              'En cluster (1 = oui)',
serverproperty('IsIntegratedSecurityOnly') 'Authentification Windows uniquement',
serverproperty('Collation')                'Collation (classement)',
serverproperty('IsHadrEnabled')            'HADR (Always On) activé',
serverproperty('EngineEdition')            'Édition de moteur (valeur numérique)' ;
``` -->
## **Procédure stockée**
```sql
create or alter procedure dbo.sp_info_sqlserver
as
begin
    set nocount on ; -- N'affiche pas le nombre de ligne pour être plus propre

    select
        @@version [Version d’SQL Server] ,
        serverproperty('MachineName')              [Nom de la machine] ,
        serverproperty('ServerName')               [Nom du serveur SQL] ,
        serverproperty('InstanceName')             [Nom de l’instance] ,
        serverproperty('Edition')                  [Édition d’SQL Server] ,
        serverproperty('ProductLevel')             [Niveau de produit (SP/CU)] ,
        serverproperty('ProductVersion')           [Version du produit] ,
        serverproperty('EngineEdition')            [Type d’édition (version numérique)] ,
        serverproperty('IsClustered')              [En cluster (1 = oui)] ,
        serverproperty('IsIntegratedSecurityOnly') [Authentification Windows uniquement] ,
        serverproperty('Collation')                [Collation (classement)] ,
        serverproperty('IsHadrEnabled')            [HADR (Always On) activé] ,
        serverproperty('EngineEdition')            [Édition de moteur (valeur numérique)] ;
end ;

exec dbo.sp_info_sqlserver ;
```
’dpo’ : Shéma par défaut pour les objets créés par les utilisateurs.