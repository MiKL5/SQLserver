# **Qu’est ce que SARGABLE ?**<a href="../../"> <img src="../../assets/Microsoft_SQL_Server.svg" alt="SQL Server" align="right" height="64px"> </a>
Ce terme anglais signifie ‘Search ARGument ABLE’ → capable d’utiliser un argument de recherche. En SQL, il designe les performances.

Quand l’index est utiliseé, le temsps de réponse est meilleur.

Si l’index n’est pas utiliser ; il y a un balayage de l’index, autrement dit, le parcours l’intégralité de la table.

Non sargable | Sargable
:-:|:-:
`like` ’%valeur’ | `or` & `and`
`like` ’%valeur%’ | `in` & `not in`
`not (colonne) like` ’…’ | `between`
(colonne) `not like` ’…’ | `like` ‘valeur%’
`not exists` | `exists`
`where` fonction (colonne)=valeur | `=` , `>` , `>=` , `<=` , `<>`
· | colonne = fonction(valeur, …)
· | not between
⟹ Cluster Index Scan est l’opérateur logique et physique<br>parcours tout de gauche à droite et de haut en bas. | ⟹ Cluster Index Seek est un opérateur logique et physique<br>va directemnt à l’information.
___
Si chercher toute l’année 1996 n’est pas sargable, chercher du 1er janvier au 31 décezmbre 1996 est sargable.  
Une fonction devant un ‘where’, ne sera jamais sargable, mettre par exemple le cast aprés l’idclient.  
Par exeple sortir datecommande des parenthèse, ça évite datediff devant ‘where’ ; c’est sargable.