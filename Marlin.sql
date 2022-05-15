CREATE DATABASE Marlin;
DROP DATABASE Marlin; 
USE Marlin ;

-- -----------------------------------------------------
-- Table `Marlin`.`State`
-- -----------------------------------------------------
CREATE TABLE State (
idState INT NOT NULL,
name VARCHAR(50) NULL
PRIMARY KEY (idState));

INSERT INTO State VALUES 
(NULL,'BAJA CALIFORNIA'), 
(NULL,'BAJA CALIFORNIA SUR'),
(NULL,'CAMPECHE'),
(NULL,'CHIAPAS'),
(NULL,'COLIMA'), 
(NULL,'GUERRERO'), 
(NULL,'JALISCO'),
(NULL,'MICHOACAN'),
(NULL,'NAYARIT'),
(NULL,'OAXACA'),
(NULL,'QUINTA ROO'),
(NULL,'SINALOA'),
(NULL,'SONORA'), 
(NULL,'TABASCO'),
(NULL,'TAMAULIPAS'),
(NULL,'VERACRUZ'),
(NULL,'YUCATAN');




-- -----------------------------------------------------
-- Table `Marlin`.`City`
-- -----------------------------------------------------
CREATE TABLE City (
  idCity INT NOT NULL,
  name VARCHAR(50) NULL,
  State_idState INT NOT NULL,
  PRIMARY KEY (idCity),
  INDEX fk_City_State_idx (State_idState ASC),
  CONSTRAINT fk_City_State
    FOREIGN KEY (State_idState)
    REFERENCES Marlin.State (idState)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO City VALUES 
(NULL,'TIJUANA',1),
(NULL,'LA PAZ',2), 
(NULL,'CIUDAD DEL CARMEN',3),
(NULL,'TONALÁ',4),
(NULL,'ARMERÍA',5),
(NULL,'ACAPULCO',6),
(NULL,'PUERTO VALLARTA',7),
(NULL,'AQUILA',8),
(NULL,'BAHÍA DE BANDERAS',9),
(NULL,'HUATULCO',10),
(NULL,'CANCÚN',11),
(NULL,'BAHÍA DE ALTATA',12),
(NULL,'BAHÍA DE KINO',13),
(NULL,'CARDENAS',14),
(NULL,'ALDAMA',15),
(NULL,'MARTÍNEZ DE LA TORRE',16),
(NULL,'TELCHAC',17);



-- -----------------------------------------------------
-- Table `Marlin`.`Statistics`
-- -----------------------------------------------------
CREATE TABLE Estadisticas(
  idStatistics INT NOT NULL PRIMARY KEY,
  conta_level ENUM('Alta', 'Media', 'Baja') NULL,
  quality VARCHAR(50) NULL,
  year YEAR(2022) NULL
  
);

INSERT INTO Estadisticas VALUES
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022),
(NULL,'Media', 'Apta',2022);




-- -----------------------------------------------------
-- Table `Marlin`.`Beach`
-- -----------------------------------------------------
CREATE TABLE Beach (
  idBeach INT NOT NULL,
  nombre VARCHAR(100) NULL,
  City_idCity INT NOT NULL,
  Estadisticas_idStatistics INT NOT NULL,
  PRIMARY KEY (idBeach),
  INDEX fk_Beach_City1_idx (City_idCity ASC),
  INDEX fk_Beach_Statistics1_idx (Estadisticas_idStatistics ASC),
  CONSTRAINT fk_Beach_City1
    FOREIGN KEY (City_idCity)
    REFERENCES Marlin.City (idCity)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Beach_Statistics1
    FOREIGN KEY (Estadisticas_idStatistics)
    REFERENCES Marlin.Estadisticas (idStatistics)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO Beach Values 
(NULL,'Playa de Tijuana',1,1),
(NULL,'Playa Coromuel, El tecolote',2,2),
(NULL,'Playa Manigua, Playa Norte 1',3,3),
(NULL,'Playa Boca del cielo',4,4),
(NULL,'Cuyutlan, El Paraiso',5,5),
(NULL,'Caleta, La Roqueta',6,6),
(NULL,'Playa Yelapa, Playa Quimixto',7,7),
(NULL,'Playa Nexpa, Playa Maruata',8,8),
(NULL,'Playa Nuevo Vallarta 1, Playa Bucerias',9,9),
(NULL,'Playa Maguey, Playa Bahia Santa Cruz',10,10),
(NULL,'Playa Puerto Morelos, Playa Delfines',11,11),
(NULL,'Playa Altada',12,12),
(NULL,'Playa Bahia de Kino 1 ',13,13),
(NULL,'Playa Sánchez Magallanes',14,14),
(NULL,'Playa Barra del Tordo',15,15),
(NULL,'Playa Tecolutla, Playa Noray',16,16),
(NULL,'Playa Telchac',17,17);


-- -----------------------------------------------------
-- Table `Marlin`.`Post`
-- -----------------------------------------------------
CREATE TABLE Post (
  idPost INT NOT NULL,
  name VARCHAR(40) NULL,
  title VARCHAR(40) NULL,
  description TEXT(100) NULL,
  fileName BLOB NULL,
  PRIMARY KEY (idPost)
);



-- -----------------------------------------------------
-- Table `Marlin`.`Post_has_Beach`
-- -----------------------------------------------------
CREATE TABLE Post_has_Beach (
  Post_idPost INT NOT NULL,
  Beach_idBeach INT NOT NULL,
  PRIMARY KEY (Post_idPost, Beach_idBeach),
  INDEX fk_Post_has_Beach_Beach1_idx (Beach_idBeach ASC),
  INDEX fk_Post_has_Beach_Post1_idx (Post_idPost ASC),
  CONSTRAINT fk_Post_has_Beach_Post1
    FOREIGN KEY (Post_idPost)
    REFERENCES Marlin.Post (idPost)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Post_has_Beach_Beach1
    FOREIGN KEY (Beach_idBeach)
    REFERENCES Marlin.Beach (idBeach)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);



