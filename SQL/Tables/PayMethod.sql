CREATE TABLE PayMethod(
  PM_Id smallint IDENTITY(1,1) NOT NULL,
  PM_Name varchar(300),
  PM_Description varchar(1000),
  
  CONSTRAINT PK_PayMethod PRIMARY KEY (PM_Id)
)
GO