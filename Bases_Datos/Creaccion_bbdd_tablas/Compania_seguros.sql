#Creamos la base de datos y nos movemos a ella
CREATE DATABASE IF NOT EXISTS Seguros CHARACTER SET utf8;
USE Seguros;

#Creamos las tablas necesarias
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT;
    dni CHAR(9) UNIQUE NOT NULL;
    nombre VARCHAR(100) NOT NULL;
    fecha_carnet DATE NOT NULL;
);

CREATE TABLE Vehiculos (
    id INT PRIMARY KEY AUTO_INCREMENT;
    matricula CHAR(9) UNIQUE NOT NULL;
    modelo VARCHAR(50) NULL;
    num_bastidor VARCHAR(30) UNIQUE NOT NULL;
    dni CHAR(9)
)