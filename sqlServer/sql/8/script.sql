-- créer ps_insertion_deuxlignes pour insérer 'Grigner Olivier 67 ans M 1971-10-14' et 'Percheron Isabelle 43 ans F 1983-8-2'
create Procedure ps_insertion_deuxlignes as
insert into contact (nom, prenom, age, sexe, naissance)
values ('Grigner', 'Olivier', 67, 'M', '1971-10-14') ,
       ('Percheron', 'Isabelle', 43, 'F', '1983-8-2') ;

-- Créer la procédure mettant à jour 'percheron' en 'PERCHERON'
create Procedure ps_update_percheron as
update contact
set nom = 'OLIVE'
where nom = 'Percheron' ;

-- Renommer la procédure ps_update_percheron en ps_update_percheron2
exec sp_rename 'ps_update_percheron', 'ps_update_percheron2' ;

-- Modifier la procédure ps_insertion_deuxlignes pour insérer que la première ligne par alter procedure
alter procedure ps_insertion_deuxlignes as
insert into contact (nom, prenom, age, sexe, naissance)
values ('Grigner', 'Olivier', 67, 'M', '1971-10-14') ;

execute procedure ps_insertion_deuxlignes ;