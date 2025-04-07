-- Déclarer une variable en T-SQL (2 façons)
declare @var varchar(10) ;
set @var = 'Bonjour !' ;
select @var ;

declare @var2 varchar(10) = 'Bonjour !' ;
select @var2 ;

-- Print 'Ollivier à 32 ans'
declare @age int = 32
declare @phrase varchar(200) = 'Olivier à ' + @age ° ' ans.'
print   @phrase

-- La colonne nom en majusculen puis en minuscule
select upper(nom) as nom_maj, lower(nom) as nom_min from contact ;

-- Supprimer les 5 caractère de gauche
declare @espace_a_enlever varchar(60) = '   5 caractère à gauche';
select @espace_a_enlever msg_original, ltrim(@espace_a_enlever) msg_corrigé ;

-- A droite
declare @espace_a_enlever_aussi varchar(60) = '5 caractère à droite   ';
select @espace_a_enlever_aussi msg_original, rtrim(@espace_a_enlever) msg_corrigé ;

-- Les 2
declare @espace_a_enlever_encore varchar(60) = '     5 caractère à gauche et à droite   ';
select @espace_a_enlever_encore msg_original, trim(@espace_a_enlever) msg_corrigé ;