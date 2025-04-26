# **Procédure stockée**<a href="../../"> <img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"> </a>
C’est un ensemble d’instruction SQL compilée à la base de données.  
Pouvant contenir les instructions ‘INSERT’, ‘UPDATE’, ‘DELETE’.
Avaantages | Inconvénients
---|:-:
Simplification du code SQL<br>(vue est remplacé par procedure) | -
Bénéficie la puissance du cache d’SQL | -
Sécurité ; l’utilisateur n’ayant pas accés aux tables,<br>passant par les procédures stockées | -

Les procédure doivent commencer par ‘sp_’ pour des raisons de performance ; SQL Server chercher d’abord dans la base système ‘master’, il y a tout de même un rique de conflit.  
Nonobstant, je préfère les nommées ‘ps_’, il ne va pas dans ‘master’ ; ni ralentissement, ni risque de conflit 👏.

Préfixe | Comportement | Risque
:-:|---|---
`sp_` ❌ | 👎 Recherche d’abord dans master | Oui 👎 (performance + conflit futur)
`ps_` 👏 | 👍 Recherche normale, aucun traitement spécial | Aucun