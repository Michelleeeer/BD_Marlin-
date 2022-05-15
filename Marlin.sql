-- DROP DATABASE marlin-db; 
CREATE DATABASE marlin-db;
USE marlin-db ;

-- -----------------------------------------------------
-- Table `marlin-db`.`state`
-- -----------------------------------------------------
CREATE TABLE state (
id_state INT NOT NULL IDENTITY(1,1),
state_name VARCHAR(50) NULL
PRIMARY KEY (id_state));

INSERT INTO state VALUES 
('BAJA CALIFORNIA'), 
('BAJA CALIFORNIA SUR'),
('CAMPECHE'),
('CHIAPAS'),
('COLIMA'), 
('GUERRERO'), 
('JALISCO'),
('MICHOACAN'),
('NAYARIT'),
('OAXACA'),
('QUINTA ROO'),
('SINALOA'),
('SONORA'), 
('TABASCO'),
('TAMAULIPAS'),
('VERACRUZ'),
('YUCATAN');




-- -----------------------------------------------------
-- Table `marlin-db`.`city`
-- -----------------------------------------------------
CREATE TABLE city (
  id_city INT NOT NULL IDENTITY(1,1),
  city_name VARCHAR(50) NULL,
  id_state INT NOT NULL,
  PRIMARY KEY (id_city),
  INDEX fk_city_state_idx (id_state ASC),
  CONSTRAINT fk_city_state
    FOREIGN KEY (id_state)
    REFERENCES state (id_state)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO city VALUES 
('TIJUANA',1),
('LA PAZ',2), 
('CIUDAD DEL CARMEN',3),
('TONALÁ',4),
('ARMERÍA',5),
('ACAPULCO',6),
('PUERTO VALLARTA',7),
('AQUILA',8),
('BAHÍA DE BANDERAS',9),
('HUATULCO',10),
('CANCÚN',11),
('BAHÍA DE ALTATA',12),
('BAHÍA DE KINO',13),
('CARDENAS',14),
('ALDAMA',15),
('MARTÍNEZ DE LA TORRE',16),
('TELCHAC',17);



-- -----------------------------------------------------
-- Table `marlin-db`.`beach_statistics`
-- -----------------------------------------------------
CREATE TABLE beach_statistics(
  id_beach_statistics INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  contamination_level VARCHAR(10) NULL,
  quality VARCHAR(50) NULL,
  year INTEGER NULL
);

INSERT INTO beach_statistics VALUES
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022),
('Media', 'Apta',2022);




-- -----------------------------------------------------
-- Table `marlin-db`.`beach`
-- -----------------------------------------------------
CREATE TABLE beach (
  id_beach INT NOT NULL IDENTITY(1,1),
  beach_name VARCHAR(100) NULL,
  id_city INT NOT NULL,
  id_beach_statistics INT NOT NULL,
  PRIMARY KEY (id_beach),
  INDEX fk_beach_city1_idx (id_city ASC),
  INDEX fk_beach_statistics1_idx (id_beach_statistics ASC),
  CONSTRAINT fk_beach_city1
    FOREIGN KEY (id_city)
    REFERENCES city (id_city)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_beach_Statistics1
    FOREIGN KEY (id_beach_statistics)
    REFERENCES beach_statistics (id_beach_statistics)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO beach Values 
('Playa de Tijuana',1,1),
('Playa Coromuel, El tecolote',2,2),
('Playa Manigua, Playa Norte 1',3,3),
('Playa Boca del cielo',4,4),
('Cuyutlan, El Paraiso',5,5),
('Caleta, La Roqueta',6,6),
('Playa Yelapa, Playa Quimixto',7,7),
('Playa Nexpa, Playa Maruata',8,8),
('Playa Nuevo Vallarta 1, Playa Bucerias',9,9),
('Playa Maguey, Playa Bahia Santa Cruz',10,10),
('Playa Puerto Morelos, Playa Delfines',11,11),
('Playa Altada',12,12),
('Playa Bahia de Kino 1 ',13,13),
('Playa Sánchez Magallanes',14,14),
('Playa Barra del Tordo',15,15),
('Playa Tecolutla, Playa Noray',16,16),
('Playa Telchac',17,17);


-- -----------------------------------------------------
-- Table `marlin-db`.`post`
-- -----------------------------------------------------
CREATE TABLE post (
  id_post INT NOT NULL IDENTITY(1,1),
  name VARCHAR(50) NULL,
  beach_name VARCHAR(40) NULL,
  title VARCHAR(40) NULL,
  description VARCHAR(100) NULL,
  file_name VARCHAR(100) NULL,
  PRIMARY KEY (id_post)
);



-- -----------------------------------------------------
-- Table `marlin-db`.`post_has_beach`
-- -----------------------------------------------------
CREATE TABLE post_has_beach (
  id_post INT NOT NULL,
  id_beach INT NOT NULL,
  PRIMARY KEY (id_post, id_beach),
  INDEX fk_post_has_beach_beach1_idx (id_beach ASC),
  INDEX fk_post_has_beach_post1_idx (id_post ASC),
  CONSTRAINT fk_post_has_beach_post1
    FOREIGN KEY (id_post)
    REFERENCES post (id_post)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_post_has_beach_beach1
    FOREIGN KEY (id_beach)
    REFERENCES beach (id_beach)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


