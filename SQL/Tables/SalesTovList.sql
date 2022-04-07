CREATE TABLE SalesTovList(
  STL_Tovar smallint NULL,
  STL_Amount float DEFAULT 1,
  STL_Doc smallint NOT NULL
  
  FOREIGN KEY (STL_Tovar) REFERENCES Tovar(Tov_Id),

)
GO





