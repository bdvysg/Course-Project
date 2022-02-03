CREATE TABLE Place(
  Pl_Id smallint IDENTITY(1,1) NOT NULL,
  Pl_Name varchar(200) NULL,
  Pl_Addres varchar(200) NULL,
  Pl_Storage smallint NOT NULL,
  
  CONSTRAINT PK_Place PRIMARY KEY (Pl_Id)
) 
GO