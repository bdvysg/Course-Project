CREATE TABLE Storage(
  St_Id smallint IDENTITY(1,1) NOT NULL,
  St_Tovar smallint NULL,
  St_Amount float NULL,
  St_DateInput smalldatetime NULL,
  
  CONSTRAINT PK_Storage PRIMARY KEY (St_Id)  
)
GO