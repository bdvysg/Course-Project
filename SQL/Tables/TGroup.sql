CREATE TABLE TGroup(
  Gr_Id smallint IDENTITY(1,1) NOT NULL,
  Gr_Name varchar(300),
  Gr_Description varchar(1000),
  
  CONSTRAINT PK_TGroup PRIMARY KEY (Gr_Id)
)
GO