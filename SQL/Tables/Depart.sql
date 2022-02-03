CREATE TABLE Depart(
  Dep_Id smallint IDENTITY(1,1) NOT NULL,
  Dep_Name varchar(300),
  Dep_Description varchar(1000),
  
  CONSTRAINT PK_Depart PRIMARY KEY (Dep_Id)
)
GO