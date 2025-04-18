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