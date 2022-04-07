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
  Pe_Photo varchar(2000) NULL,  --https://boredhumans.b-cdn.net/faces2/345.jpg

  FOREIGN KEY (Pe_PlaceOfWork) REFERENCES Place(Pl_Id),
  PRIMARY KEY (Pe_Id)
)
GO
