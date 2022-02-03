CREATE TABLE Tovar(
  Tov_Id smallint NOT NULL,
  Tov_Name varchar(200) NULL,
  Tov_Price money NULL,
  Tov_Description varchar(500) NULL,
  Tov_Photo varbinary(max),
  Tov_Depart smallint NOT NULL,
  Tov_Group smallint NOT NULL,
  Tov_Measuring smallint NOT NULL,
  Tov_CountryMade varchar(50),
  
  CONSTRAINT PK_Tovar PRIMARY KEY (Tov_Id),
)
GO

ALTER TABLE Tovar
  ADD 
    CONSTRAINT FK_Depart FOREIGN KEY (Tov_Depart) REFERENCES Depart(Dep_Id),
    CONSTRAINT FK_Group FOREIGN KEY (Tov_Depart) REFERENCES TGroup(Gr_Id)
