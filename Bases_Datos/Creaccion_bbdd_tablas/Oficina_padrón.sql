#Creamos la base de datos y nos movemos a ella
CREATE DATABASE IF NOT EXISTS Padrones CHARACTER SET utf8;
USE Padrones;

#Creamos las tablas necesarias
CREATE TABLE Habitantes (
    dni CHAR(9) PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    vivienda VARCHAR(200) NOT NULL,
    padre_id CHAR(9),
    FOREIGN KEY (padre_id) REFERENCES Habitantes(dni)
);

CREATE TABLE Municipios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Viviendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(200) NOT NULL,
    piso VARCHAR(20) NULL,
    letra VARCHAR(5) NULL,
    fk_dni_propietario CHAR(9),
    fk_id_municipio INT,
    FOREIGN KEY (fk_dni_propietario) REFERENCES Habitantes(dni),
    FOREIGN KEY (fk_id_municipio) REFERENCES Municipios(id)
);

