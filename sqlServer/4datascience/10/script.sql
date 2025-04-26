-- dans ce merge on va updater les colonnes quantit� en rajoutant 
-- la colonne quantit� de la table BookInventory et BookOrder
merge BookInventory bi -- ca sera la table de destination 
using BookOrder bo --- table source
on bi.TitleID = bo.TitleID -- jointure sur les deux tables 
when matched then -- Quand ca matche 
  update
  set bi.Quantity = bi.Quantity + bo.Quantity;

-- regardons le resultat
-- Quantit� 1 =6 +3 9 ,3+0=3,5+0=5

select bi.TitleID,bi.Quantity from BookInventory bi 
INNER JOIN BookOrder bo
ON bi.TitleID = bo.TitleID;

-- On peut mettre aussi un delete et un insert 

select * from BookInventory
select * from BookOrder


merge BookInventory bi -- ca sera la table de destination
USING BookOrder bo --table source
ON bi.TitleID = bo.TitleID
when matched and -- Quand ca matche 
  bi.Quantity + bo.Quantity = 0 then -- si la quantit� fait 0 je supprime
  delete
when NOT matched then --insere moi des nouvelles lignes dans la table BookInventory
  insert (TitleID, Title, Quantity) --nom des colonnes
  values (bo.TitleID, bo.Title,bo.Quantity);

select * from BookInventory
-- la ligne 3 qui avait la somme de 0 qui a été supprimée 
-- la ligne 7 a été insérée car elle ne matchait pas