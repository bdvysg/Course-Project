CREATE TABLE Purchase(
  Pr_Id smallint IDENTITY(1,1) NOT NULL,
  Pr_DateIntput smalldatetime DEFAULT GETDATE(),
  Pr_DateConfirm smalldatetime NULL,
  Pr_Storage smallint NOT NULL,
  Pr_IsConifrm bit NOT NULL DEFAULT 0
  
  PRIMARY KEY (Pr_Id) ,
  FOREIGN KEY (Pr_Storage) REFERENCES Storage(St_Id)
)
GO
