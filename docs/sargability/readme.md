# **Sagabilité**<a href="../"><img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"></a>
## **✨ Explication**
> SARGABILITY, c’est un mot pour dire “est-ce que ton ordinateur peut trouver vite ?”  

Imagine que tu as une grande armoire avec plein de tiroirs.
* Si tu cherches un jouet en regardant juste l’étiquette du tiroir, tu vas le trouver très vite.
* Mais si tu dois ouvrir tous les tiroirs, fouiller à l’intérieur, ça prend beaucoup de temps.

En SQL (quand tu cherches dans une base de données),
* Si ta question est bien posée (SARGABLE), l’ordinateur regarde directement dans les bons tiroirs.
* Si ta question est mal posée (non-SARGABLE), l’ordinateur doit ouvrir tous les tiroirs et chercher dedans, et c’est beaucoup plus lent !

**🛠 Exemple pour l’enfant**
Question SARGABLE : “Donne-moi tous les livres où l’étiquette dit ‘HISTOIRE’.”
Question non-SARGABLE (lent) : “Ouvre chaque tiroir, lis chaque livre, et dis-moi si ça parle d’histoire.”

## **🎯 Résumé très simple**:
Mot | Facilité
---|---
SARGABLE | L’ordinateur trouve vite avec une étiquette.
Non-SARGABLE | L’ordinateur doit tout ouvrir pour chercher.

## **🛒 L’analogie du supermarché**
Chaque rayon (fruits, jouets, livres, etc.) est bien étiqueté.

Si tu cherches “des pommes”, tu vas directement au rayon fruits ➔ C’est rapide ! ; c’est SARGABLE 🍏✅.  
Nonobstant, si quelqu’un te dit “trouve quelque chose qui est rouge et qui croque” sans t’indiquer le rayon, tu dois aller partout, goûter tous les produits ➔ C’est lent ! Donc, non-SARGABLE 🍎❌.

## **🏴‍☠️ L’analogie du trésor caché**
Tu as une carte qui te dit exactement où creuser ➔ Tu trouves vite  ; c’est SARGABLE 🗺️✅.
Cependant, si tu n’as pas de carte, tu dois creuser partout jusqu’à tomber sur le trésor ➔ Ça prend des heures, c’est non-SARGABLE 🏝️❌.

## **🎯 Résumé avec images**
Exemple	| Vitesse | SARGABLE ?
---|:-:|:-:
Aller au bon rayon du magasin | Rapide 🚀 |  ✅
Chercher partout sans info | Lent 🐢 | ❌
Creuser au bon endroit avec carte | Rapide 🏴‍☠️ | ✅
Creuser partout sans carte | Lent 🏖️	| ❌
## **🧠 Simple à retenir**
SARGABLE, c’est quand ce qu’il faut pour aller vite !
```
    La colonne reste “nue”, sans transformation, pour que l’index puisse être utilisé.  
    L’exécution de la requête est plus rapide grâce à l’Index Seek.
```
## **🎯 Résumé “SARGABILITY”**
SARGABILITY (Search ARGument ABILITY) est la capacité d’une requête SQL à profiter d’un index pour accéder efficacement aux données.

* La requête est sargable si les colonnes indexées apparaissent dans des conditions simples et exploitables (comparaison directe =, <, >, BETWEEN, etc.).
* La requête est non-sargable si des opérations compliquent l’utilisation de l’index :
  * Fonctions appliquées sur la colonne (WHERE YEAR(date_col) = 2024) ;
  * Calculs sur la colonne (WHERE col + 1 = 10) ;
  * Comparaisons sur expressions complexes.

> 👉 Si c’est non-sargable, l’optimiseur ne peut pas utiliser efficacement les index ; il fait un scan complet.

## **📈 Exemple simple**
Requête | Index ? | SARGABLE ?
---|:-:|:-:
WHERE age = 25 | Oui | ✅
WHERE YEAR(birthdate) = 1990 | Non | ❌
WHERE salary * 2 > 60000 | Non | ❌
WHERE lastname LIKE ‘Dup%’ | Index possible | ✅
WHERE UPPER(lastname) = ‘DUPONT’ | Non ; fonction sur la colonne | ❌
## **🛠️ En pratique**
* Écrire les requêtes de façon à laisser la colonne “nue” dans les prédicats.
* Éviter les transformations sur les colonnes dans le WHERE ou JOIN.
* Concevoir les index en lien avec les usages métiers réels (WHERE, JOIN, ORDER BY, etc.).

## **🔥 Résumé ultra-court**
Sargable ⟹ Requête utilisant les index efficacement ➡️ Moins d’I/O ; meilleures performances.
<div align="center"><br><br><a href="../../"><img src="../../assets/sstsql2.png"></a>