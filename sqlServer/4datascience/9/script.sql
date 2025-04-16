-- Les fonctions de date
select dateadd(year  , -10 , '20250412') ;
select dateadd(month ,  1  , '20250412') ;
select dateadd(day   ,  2  , '20250412') ;

-- Livraison dans 2 jours
select selesoerderid , orderdate , 
       dataadd(day , 2 , orderdate) PromiseShipDate
from salses.selesorderheader ;

-- Le premier jour dupremier  trimestre
select dateadd(qq , datediff(qq , 0 , getdate() ) -1 ,0 ) ;

-- Le dernier du premier trimestre
select dateadd(dd , -1 , dateadd(qq , datediff(qq , 0 , getdate() ) , 0) ) ;

-- Le premier jour de l'actuel trimestre
select dateadd(qq , datediff(qq , 0 , getdate() ) , 0 ) ;

-- Le permier jour du trimestre suivant
select dateadd(qq , datediff(qq , 0 , getdate() ) +1 , 0) ;

-- Le premier jour de la semaine précédante
select dateadd(wk , -1 , dateadd(day , 1-datepart(weekday , getdate() ) , datediff(dd , 0 , getdate() ) ) ) ;

-- Le premier de la semaine
select dateadd(wk , 0 , dateadd(day , 1-datepart(weekday , getdate() ) , datediff(dd , 0 , getdate() ) ) ) ;

-- Le premier de la semaine prochaine
select dateadd(wk , 1 , dateadd(day , 1-datepart(weekday , getdate() ) , datediff(dd , 0 , getdate() ) ) ) ;

-- Le dermier de la semaine passée
select dateadd(wk , 0 , dateadd(day , 0-datepart(weekday , getdate() ) , datediff(dd , 0 , getdate() ) ) ) ;

-- Le dermier de la semaine
select dateadd(wk , 1 , dateadd(day , 0-datepart(weekday , getdate() ) , datediff(dd , 0 , getdate() ) ) ) ;

-- Le dermier de la suivante
select dateadd(wk , 2 , dateadd(day , 0-datepart(weekday , getdate() ) , datediff(dd , 0 , getdate() ) ) ) ;

-- Le dermier dans 2 semaines
select dateadd(wk , 3 , dateadd(day , 0-datepart(weekday , getdate() ) , datediff(dd , 0 , getdate() ) ) ) ;

-- Quelle différence entre 13h et 17h ?
select datediff(hh , '13:0' , '17:0') ;

-- Combien de mois entre le 30 septembre et le 2 novembre ?
select datediff(mm , '2011-09-30' , '2011-11-02') ;

-- Combien de jour du 9 janvier au premier de la même année
select datediff(day , '2011-1-9' , '2011-1-1') ;
select datediff(day , '2011-1-9 0:0:0' , '2011-1-1 0:0:0') ;

-- Combien du premier au 9 janvier
select datediff(day , '2011-1-1' , '2011-1-9') ;

-- Du permier janvier 2025 à 2024 ?
select datediff(day , '2025-1-1' , '2024-1-1') ;

-- Du 2 au 1er ?
select datediff(day , '2025-1-2' , '2025-1-1') ;
select datediff(day , '2025-1-2 23:59:59' , '2025-1-1') ;

-- Remonter l'année
select datename(yy , '2025/4/16') ;

-- Remonter l'heure
select datename(hour , '2025/4/16 16:16:16') ;

-- Rmonter les munites
select datename(minute , '2025/4/16 16:16:16') ;

-- Remonter les secondes
select datename(second , '2025/4/16 16:16:16') ;

-- Remonter le mois
select datename(month , '2025/4/16') ;

-- le date
select getdate() ;

-- la date UTC (Universal ime Communicatte ou Greenwich Mean Time)
select getutcdate() ;

-- Déclarer et afficher les dates locales et universales
declare @local_time datetime ;
declare @utc_time datetime ;
set @local_time = getdate() ;
set @utc_time   = getutcdate() ;
select 'Server local time' + convert(varchar(40) , @local_time) 'local time' ;
select 'Server UTC time'   + convert(varchar(40) , @utc_time) 'universal time' ;

-- le dernier jour de ce mois
select eomonth(getdate() ) ;

-- du mois prochain
select eomonth(getdate() , 1) ;

-- dernier jour de décembre
select eomonth(getdate() , -4) ;
select eomonth(getdate() , 8) ;

-- le dernier jour du mois dernier
select eomonth(getdate() , -1) ;
select dateadd(month , datediff(month , 1 , getdate() ) , -1) ;

-- le premier du mois
select dateadd(month , datediff(month , 0 , getdate() ) , 0) ;

-- du mois précédent
select dateadd(month , datediff(month , 0 , getdate() ) -1, 0) ;

-- le premier du prochain mois
select dateadd(month , datediff(month , 0 , getdate() ) +1, 0) ;

-- En français, anglais et allemand
select top(1)
format(eomonth(sellStartDate) , 'D' , 'fr-FR') français ,
format(eomonth(sellStartDate) , 'D' , 'en-US') anglais ,
format(eomonth(sellStartDate) , 'D' , 'de-de') allemand 
from [adventureworks2022].[Production].[Product] ;