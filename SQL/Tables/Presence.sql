CREATE TABLE Presence(
  Pr_Tovar smallint NOT NULL,
  Pr_Amount smallint NOT NULL DEFAULT 0,
  Pr_Storage smallint NULL

  FOREIGN KEY (Pr_Tovar) REFERENCES Tovar(Tov_Id),
  FOREIGN KEY (Pr_Storage) REFERENCES Storage(St_Id)
) 
GO