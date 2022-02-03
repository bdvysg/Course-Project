CREATE TABLE Person(
  Pe_Id smallint IDENTITY(1,1) NOT NULL,
  Pe_Name varchar(70) NULL,
  Pe_SurName varchar(70) NULL,
  Pe_FatherName varchar(70) NULL,
  Pe_Gender char NULL,
  Pe_DateOfBirth smalldatetime NULL,
  Pe_DateOnWork smalldatetime NULL,
  Pe_Posistion varchar(100) NULL,
  Pe_PlaceOfWork smallint NULL,
  Pe_Wage money NULL,
  
  CONSTRAINT PK_Person PRIMARY KEY (Pe_Id)
)
GO

ALTER TABLE Person
ADD
  CONSTRAINT FK_PlaceOfWork FOREIGN KEY (Pe_PlaceOfWork) REFERENCES Place(Pl_Id),
  Pe_Photo varbinary(max) NULL
GO