CREATE TABLE Presence(
  Pr_Id int IDENTITY(1,1) NOT NULL,
  Pr_Tovar varchar(200) NULL,
  Pr_Amount varchar(200) NULL,
  Pr_Storage smallint NOT NULL,
  
  PRIMARY KEY (Pr_id)
) 
GO