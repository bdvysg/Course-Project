CREATE TABLE Storage(
  St_Id smallint IDENTITY(1,1) NOT NULL,
  St_Name varchar(100),
  St_Tovar smallint NULL,
  St_Amount int NULL,
  St_Place smallint not null
  
  CONSTRAINT PK_Storage PRIMARY KEY (St_Id)
  CONSTRAINT FK_Tovar FOREIGN KEY (St_Tovar) REFERENCES Tovar(Tov_Id), 
  CONSTRAINT FK_Place FOREIGN KEY (St_Place) REFERENCES Place(Pl_Id), 
)
GO