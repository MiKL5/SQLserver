-- L'opétateur hash join
select * from client cl
inner join commande com on cl.idclient = com.idclient ; -- Correspondance de hash

select * from client cl
join commande com on cl.idclient = com.idclient ; -- correspondance de hash

select * from client cl
inner hash join commande com on cl.idclient = com.idclient ; -- correspondance de hash

-- la merge
select * from client cl
inner merge join commande com on cl.idclient = com.idclient ; -- jointure de fusion

--  La jointure de boucle imbriquée 'nested loop'
select * from client cl
inner loop join commande com on cl.idclient = com.idclient ; -- boucles imbriquées`

-- jointure pour un serveur lié
select * from client cl
inner remote join commande com on cl.idclient = com.idclient ; -- correspondance de hash

-- Autres manières
select * from client cl
inner join commande com on cl.idclient = com.idclient
option (hash join) ; -- correspondance de hash

select * from client cl
inner join commande com on cl.idclient = com.idclient
option (merge join) ; -- jointure de fusion

select * from client cl
inner join commande com on cl.idclient = com.idclient
option (loop join) ; -- boucles imbriquées