-- if/else
declare @SafetyStockLevel integer
set  @SafetyStockLevel = 999
if   @SafetyStockLevel = (select SafetyStockLevel
                          from [AdventureWorks2022].[Production].[Product]
                          where SafetyStockLevel = @SafetyStockLevel) ;

    (select SafetyStockLevel
     from [AdventureWorks2022].[Production].[Product]
     where SafetyStockLevel = @SafetyStockLevel = @SafetyStockLevel) ;
else
    (select SafetyStockLevel
     from [AdventureWorks2022].[Production].[Product]
     where SafetyStockLevel = @SafetyStockLevel <= 999) ;


-- waitfor
begin
waitfor delay '0:0:2' ; -- 2s
execute sp_helpdb ; -- liste les datasets
end

begin
waitfor delay '0:0:0:500' ; -- 2s
exec sp_helpdb ;
use master ;
execute sp_info_sqlserver ;
end

begin transaction ;
begin try
    -- génération d'une violation de contrainte
    delete from production.product
    where productid = 980 ;
end try
-- l'erreur passe à catch
begin catch
    select
        error_number()    Numéro,
        error_severity()  Sévérité ,
        error_state()     Etat ,
        error_procedure() ErreurDeProcédure ,
        error_line()      Ligne ,
        error_message()   Message ;

    if @@trancount < 0
        rollback transaction ;
end catch ;
-- sans erreur, il y a le commit
if @@trancount > 0
    commit transaction ; -- non exécutée car il y a une erreur à la ligne 4

