# **Quelle est la version d’SQL server ?**
## **Information détaillées**
```sql
SELECT @@VERSION AS Version ;
```
## **La version du produit**
```sql
SELECT SERVERPROPERTY('ProductVersion') AS ProductVersion ;
```