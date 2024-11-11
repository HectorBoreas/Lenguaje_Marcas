#Creamos la base de datos y nos movemos a ella
CREATE DATABASE IF NOT EXISTS Alquiler CHARACTER SET utf8;
USE Alquiler;

#Creamos las tablas necesarias
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dni VARCHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE Garajes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    direccion VARCHAR(200) NOT NULL
);

CREATE TABLE Agencias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Vehiculos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(12) UNIQUE NOT NULL,
    modelo VARCHAR(50) NULL,
    fk_id_garaje INT,
    fk_id_agencia INT,
    FOREIGN KEY (fk_id_garaje) REFERENCES Garajes(id),
    FOREIGN KEY (fk_id_agencia) REFERENCES Agencias(id)
);

CREATE TABLE Reservas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    fk_id_cliente INT,
    FOREIGN KEY (fk_id_cliente) REFERENCES Clientes(id)
);

CREATE TABLE Reservas_Vehiculos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_vehiculo INT,
    fk_id_reserva INT,
    FOREIGN KEY (fk_id_vehiculo) REFERENCES Vehiculos(id),
    FOREIGN KEY (fk_id_reserva) REFERENCES Reservas(id)
);