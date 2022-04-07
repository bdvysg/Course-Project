CREATE OR ALTER TRIGGER SalesInsUpd
on SalesTovList
for Update, Insert
as 
begin

  if exists(select 1 from  Presence
            inner join inserted i on Pr_Tovar = STL_Tovar
            where Pr_Amount > STL_Amount) 
  begin
    update Presence 
    set Pr_Amount = Pr_Amount - STL_Amount
    from Presence
    inner join SalesTovList on Pr_Tovar = STL_Tovar
  end
  else
  begin
    RAISERROR ('Не достаточно товара на складе', 16, 127)
    ROLLBACK TRAN
    delete from Sales
    where sl_id in (select top 1 sl_id from Sales order by sl_id desc)
  end
end
go
