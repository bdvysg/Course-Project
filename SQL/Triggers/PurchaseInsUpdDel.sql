CREATE OR ALTER TRIGGER PurchaseInsUpdDel
on Purchase
for Update, Insert
as 
begin

  update Presence 
  set Pr_Amount = PTL_Amount, Pr_Storage = i.Pr_Storage
  from Presence
  inner join PurchaseTovList on Pr_Tovar = PTL_Tovar
  inner join inserted i on PTL_Doc = i.Pr_Id
  inner join deleted d on PTL_Doc = d.Pr_Id
  where PTL_Doc = i.Pr_Id and i.Pr_IsConifrm <> d.Pr_IsConifrm

  update Purchase
  set Pr_DateConfirm = GETDATE()
  from Purchase p
  inner join inserted i on p.Pr_Id = i.Pr_Id
  where i.Pr_IsConifrm = 1

end
go