CREATE TABLE Purchase(
  Pr_Id smallint IDENTITY(1,1) NOT NULL,
  Pr_TovList smallint NULL,
  Pr_Date smalldatetime DEFAULT GETDATE(),
  Pr_Place smallint NOT NULL,
  Pr_IsConifrm bit NULL DEFAULT 0
  
  CONSTRAINT PK_Purchase PRIMARY KEY (Pr_Id) ,
  CONSTRAINT FK_Place FOREIGN KEY (Pr_Place) REFERENCES Place(Pl_Id)
)
GO
