#Creamos la base de datos y nos movemos a ella
CREATE DATABASE IF NOT EXISTS Seguros CHARACTER SET utf8;
USE Seguros;

#Creamos las tablas necesarias
CREATE TABLE Clientes (
    dni VARCHAR(9) PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_carnet DATE NOT NULL
);

CREATE TABLE Vehiculos (
    matricula VARCHAR(12) PRIMARY KEY NOT NULL,
    modelo VARCHAR(50) NULL,
    num_bastidor VARCHAR(30) UNIQUE NULL,
    fk_dni VARCHAR(9), 
    FOREIGN KEY (fk_dni) REFERENCES Clientes(dni)
);
CREATE TABLE Accidentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    localidad VARCHAR(200) NOT NULL,
    fk_matricula VARCHAR(12),
    FOREIGN KEY (fk_matricula) REFERENCES Vehiculos(matricula)
);