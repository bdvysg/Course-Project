CREATE TABLE PurchaseTovList(
  PTL_Id smallint IDENTITY(1,1) NOT NULL,
  PTL_Doc smallint NOT NULL,
  PTL_Tovar smallint NOT NULL,
  PTL_Amount smallint DEFAULT 1
  
  PRIMARY KEY (PTL_Id),
  FOREIGN KEY (PTL_Tovar) REFERENCES Tovar(Tov_Id)
)
GO