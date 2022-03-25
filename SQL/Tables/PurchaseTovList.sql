CREATE TABLE PurchaseTovList(
  PTL_Id smallint IDENTITY(1,1) NOT NULL,
  PTL_Tovar smallint NOT NULL,
  PTL_Amount smallint DEFAULT 1
  
  CONSTRAINT PK_PurchaseTovList PRIMARY KEY (PTL_Id),
  CONSTRAINT FK_Tovar FOREIGN KEY (PTL_Tovar) REFERENCES Tovar(Tov_Id)
)
GO