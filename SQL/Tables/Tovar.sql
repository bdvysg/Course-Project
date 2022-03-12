CREATE TABLE Tovar(
  Tov_Id smallint IDENTITY(1,1) NOT NULL,
  Tov_Name varchar(200) NULL,
  Tov_Price money NULL,
  Tov_Description varchar(500) NULL,
  Tov_Photo varchar(250),
  Tov_Depart smallint NOT NULL,
  Tov_Measuring smallint NOT NULL,
  Tov_CountryMade varchar(50),
  
  CONSTRAINT PK_Tovar PRIMARY KEY (Tov_Id),
)
GO

ALTER TABLE Tovar
  ADD 
    Tov_PriceOpt money NULL,
    CONSTRAINT FK_Measuring FOREIGN KEY (Tov_Measuring) REFERENCES Measuring(Ms_Id),
    CONSTRAINT FK_Depart FOREIGN KEY (Tov_Depart) REFERENCES Depart(Dep_Id),
    CONSTRAINT FK_Group FOREIGN KEY (Tov_Group) REFERENCES TGroup(Gr_Id)
GO
