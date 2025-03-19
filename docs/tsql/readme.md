# **Le Transact-SQL**<a href="../../"><img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"></a>
Le Transact-SQL (T-SQL) est considéré comme un langage de programmation, il s’agit d’une extension au SQL.
## **Le rôle et les fonctionnalités**
Il étant les fonctionnalités permettant une programmation plus riche et flexible.
### L’extension au SQL
Il ajoute au SQL, qui est un langage déclaratif des fonctionnalités de programmation procédurale.  
Il permet donc de définir des séquences d’instructions, des boucles, des conditions, etc., pour un contrôle plus fin des opérations sur les données.
### **La programmation côté serveur**
Il est utilisé pour écrire des procédures stockées, des déclencheurs (triggers) et des fonctions définies par l’utilisateur, qui sont exécutés directement sur le serveur de base de données.  
Cela améliore les performances en réduisant le trafic réseau entre l’application et le serveur.
### **La manipulation de données**
Manipulées de manière avancée, avec des opérations telles que l’insertion, la mise à jour, la suppression et la sélection de données.
### **Le contrôle de flux**
Il offre des structures de contrôle de flux telles que les instructions `IF...ELSE`, `WHILE` et `CASE`, afin de créer des logiques de programmation complexes.
### **Les variables**
Déclarer des variables locales pour stocker des valeurs temporaires durant l’exécution d’un script.
## **Les principaux éléments**
### **les variables**
* Déclaration ; 
* Affectation ;
* Variables locales.
### **Les opérateurs**
* Arithmétiques ;
* Comparaison ;
* Logiques ;
* Manipulation de chaînes.
### **Les instructions de contrôle de flux**
* `IF...ELSE` :
* `WHILE` ;
* `CASE` ;
* `GOTO`.
### **Les procédures stockées**
Il s’agit d’ensembles d’instructions T-SQL précompilées et stockées sur le serveur.
### **Les déclencheurs (triggers)**
Les procédures stockées qui s’exécutent automatiquement en réponse à des événements de modification de données.
### **Les fonctions définies par l’utilisateur**
Ce sont des fonctions personnalisées créer pour effectuer des calculs ou des opérations spécifiques.
### **Les transactions**
Le but de la gestion des transactions est d’assurer l’intégrité des données.
## **Son utilité**
### **Automatiser les tâches**
Les tâches de maintenance de la base de données, telles que les sauvegardes et les vérifications d’intégrité.
### **Création d’applications complexes**
Développer des applications de base de données complexes avec une logique métier avancée.
### **Améliorer les performances**
Optimiser les performances des requêtes en exécutant des opérations complexes directement sur le serveur.
### La sécurité
Implémenter des règles de sécurité complexes au niveau de la base de données.