CREATE TABLE Sales(
  SL_Id smallint IDENTITY(1,1) NOT NULL,
  SL_Date smalldatetime NULL,
  SL_Place smallint NULL,
  SL_PayMethod smallint NULL
  
  PRIMARY KEY (SL_Id),
  FOREIGN KEY (SL_PayMethod) REFERENCES PayMethod(PM_Id),
  FOREIGN KEY (SL_Place) REFERENCES Place(Pl_Id)
)
GO



