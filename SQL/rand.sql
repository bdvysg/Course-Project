--rand date
Declare @DateStart	Datetime = '2022-01-01',
		    @DateEnd	Datetime = getdate()
--Select DateAdd(SECOND, Rand() * DateDiff(SECOND, @DateStart, @DateEnd), @DateStart)

--Return a random number >= 1 and <=3: paymethod
--SELECT FLOOR(RAND()*(3-1+1)+1);

--Return a random number >= 1 and <=6: place
--SELECT FLOOR(RAND()*(6-1+1)+1);

--select min(Tov_Id), max(Tov_Id) from tovar
--SELECT FLOOR(RAND()*(541-62+1)+62);

insert into Sales(SL_Date, SL_Place, SL_PayMethod) values(DateAdd(SECOND, Rand() * DateDiff(SECOND, @DateStart, @DateEnd), @DateStart), FLOOR(RAND()*(6-2+1)+2), FLOOR(RAND()*(3-1+1)+1))
  insert into SalesTovList(STL_Tovar, STL_Amount, STL_Doc) values(FLOOR(RAND()*(541-62+1)+62), FLOOR(RAND()*(4-1+1)+1), (select top 1 sl_id from Sales order by sl_id desc))
  --insert into SalesTovList(STL_Tovar, STL_Amount, STL_Doc) values(FLOOR(RAND()*(541-62+1)+62), FLOOR(RAND()*(4-1+1)+1), (select top 1 sl_id from Sales order by sl_id desc))
  --insert into SalesTovList(STL_Tovar, STL_Amount, STL_Doc) values(FLOOR(RAND()*(541-62+1)+62), FLOOR(RAND()*(4-1+1)+1), (select top 1 sl_id from Sales order by sl_id desc))
  --insert into SalesTovList(STL_Tovar, STL_Amount, STL_Doc) values(FLOOR(RAND()*(541-62+1)+62), FLOOR(RAND()*(4-1+1)+1), (select top 1 sl_id from Sales order by sl_id desc))


select * from SalesTovList inner join Presence on Pr_Tovar = STL_Tovar
select * from Sales
--truncate table salestovlist truncate table sales


  

