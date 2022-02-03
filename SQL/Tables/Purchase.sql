CREATE TABLE Purchase(
  Pr_Id smallint IDENTITY(1,1) NOT NULL,
  Pr_Tovar smallint NULL,
  Pr_Amount float DEFAULT 1,
  Pr_Date smalldatetime NULL,
  Pr_Place smallint NULL,
  Pr_PayMethod smallint NULL
  
  CONSTRAINT PK_Purchase PRIMARY KEY (Pr_Id)  
)
GO

ALTER TABLE Purchase
  ADD 
    CONSTRAINT FK_PayMethod FOREIGN KEY (Pr_PayMethod) REFERENCES PayMethod(PM_Id),
    CONSTRAINT FK_Tovar FOREIGN KEY (Pr_Tovar) REFERENCES Tovar(Tov_Id),
    CONSTRAINT FK_Place FOREIGN KEY (Pr_Place) REFERENCES Place(Pl_Id)
GO
