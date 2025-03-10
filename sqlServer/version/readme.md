# **Quelle est la version d’SQL server ?**<a href="../../"><img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"></a>
## **Information détaillées**
```sql
SELECT @@VERSION AS Version ;
```
## **La version du produit**
```sql
SELECT SERVERPROPERTY('ProductVersion') AS ProductVersion ;
```