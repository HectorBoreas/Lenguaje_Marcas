CREATE DATABASE IF NOT EXISTS Ejercicio2 CHARACTER SET utf8;
USE Ejercicio2
CREATE TABLE Vehiculos (
        id_vehiculo INT AUTO_INCREMENT,
        matricula CHAR(9) UNIQUE NOT NULL,
        modelo VARCHAR(100),
        tipo VARCHAR(100),
        potencia VARCHAR(10),
        PRIMARY KEY(id_vehiculo)
);
INSERT INTO Vehiculos VALUES(null, "1234abc", "Boxer", "Furgoneta", "120CV");
INSERT INTO Vehiculos VALUES(null, "2345bcd", "Vívaro", "Furgoneta", "110CV");
INSERT INTO Vehiculos VALUES(null, "3456cde", "Sprinter", "Furgoneta", "160CV");
INSERT INTO Vehiculos VALUES(null, "4567def", "Boxer", "Camión", "200CV");
INSERT INTO Vehiculos VALUES(null, "5678efg", "Atlon", "Camión", "120CV");
INSERT INTO Vehiculos VALUES(null, "6789fgh", "MAN", "Camión", "250CV");

CREATE TABLE Conductores (
        id_conductor INT AUTO_INCREMENT,
        dni VARCHAR(9) UNIQUE NOT NULL,
        nombre VARCHAR(100),
        teléfono INT(9),
        dirección VARCHAR(300),
        salario DECIMAL(8,2),
        población VARCHAR(200),
        PRIMARY KEY(id_conductor)
);
INSERT INTO Conductores VALUES(null, "12345678a", "Ramón", "123456789", "Calle de la rue 27", 1300.25, "Madrid");
INSERT INTO Conductores VALUES(null, "23456789b", "Raúl", "234567890", "Calle del percebe 27", 1400.25, "Barcelona");
INSERT INTO Conductores VALUES(null, "34567890c", "Pepe", "345678901", "Calle del hacha 13", 1100.25, "Guadarrama");
INSERT INTO Conductores VALUES(null, "45678901d", "Miguel", "456789012", "Calle Real 50", 1600.75, "Alpedrete");
INSERT INTO Conductores VALUES(null, "56789012e", "Juan", "567890123", "Calle Anchoa 7", 1300.25, "Los Molinos");
INSERT INTO Conductores VALUES(null, "67890123f", "Paco", "678901234", "Calle Mortadelo", 1100.25, "Becerril");
INSERT INTO Conductores VALUES(null, "78901234g", "Rita", "789012345", "Calle y Filemón", 1400.25, "Moral");
INSERT INTO Conductores VALUES(null, "89012345h", "Raúl", "890123456", "Calle de la rue 27", 1600.75, "Madrid");

CREATE TABLE Vehiculos_Conductores (
        id_vehiculo_conductor INT AUTO_INCREMENT,
        fk_id_vehículo INT,
        fk_id_conductor INT,
        fecha DATE,
        PRIMARY KEY(id_vehiculo_conductor),
        FOREIGN KEY(fk_id_vehículo) REFERENCES Vehiculos(id_vehiculo),
        FOREIGN KEY(fk_id_conductor) REFERENCES Conductores(id_conductor)
);
INSERT INTO Vehiculos_Conductores VALUES(null, 1, 8, "2023/03/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 1, 7, "2023/05/13");
INSERT INTO Vehiculos_Conductores VALUES(null, 2, 8, "2024/03/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 3, 1, "2023/04/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 5, 2, "2023/03/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 6, 2, "2024/08/15");
INSERT INTO Vehiculos_Conductores VALUES(null, 4, 3, "2022/03/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 3, 4, "2023/09/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 5, 8, "2023/11/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 2, 1, "2020/03/11");
INSERT INTO Vehiculos_Conductores VALUES(null, 3, 6, "2024/10/11");


CREATE TABLE Provincias (
        id_provincia INT AUTO_INCREMENT,
        código_provincia VARCHAR(12) UNIQUE NOT NULL,
        nombre VARCHAR(200),
        PRIMARY KEY(id_provincia)
);
INSERT INTO Provincias VALUES(null, "CP28", "Madrid");
INSERT INTO Provincias VALUES(null, "CP27", "Barcelona");
INSERT INTO Provincias VALUES(null, "CP26", "Salamanca");
INSERT INTO Provincias VALUES(null, "CP25", "Burgos");
INSERT INTO Provincias VALUES(null, "CP24", "Zamora");
INSERT INTO Provincias VALUES(null, "CP23", "León");
INSERT INTO Provincias VALUES(null, "CP22", "Ciudad Real");


CREATE TABLE Paquetes (
        id_paquete INT AUTO_INCREMENT,
        código VARCHAR(12) UNIQUE NOT NULL,
        descripción VARCHAR(100),
        destinatario VARCHAR(300),
        dir_destinatario VARCHAR(300),
        fk_id_provincia INT,
        PRIMARY KEY(id_paquete),
        FOREIGN KEY(fk_id_provincia) REFERENCES Provincias(id_provincia)
);
INSERT INTO Paquetes VALUES(null, "abcd", "Ventilador", "Miguel", "Alfonso Senra 51", 1);
INSERT INTO Paquetes VALUES(null, "bcde", "Bombilla", "Alberto", "Guadarrama 13", 1);
INSERT INTO Paquetes VALUES(null, "cdef", "Radiador", "Juana", "Sierra Nevada 15", 1);
INSERT INTO Paquetes VALUES(null, "defg", "CPU", "Alan", "Pirineos 158", 1);
INSERT INTO Paquetes VALUES(null, "1abc", "Pinceles", "Da Vinci", "Calle Real 58", 1);
INSERT INTO Paquetes VALUES(null, "2bcd", "Lampara", "Tesla", "Ignacio Gonzalez 14", 1);
INSERT INTO Paquetes VALUES(null, "3cde", "Mesa", "Ikea", "Severo Ochoa 38", 1);
INSERT INTO Paquetes VALUES(null, "4def", "Silla", "Rosa", "Valmayor 60", 1);
INSERT INTO Paquetes VALUES(null, "11ab", "Sofa", "Homer", "Lanzada 55", 1);
INSERT INTO Paquetes VALUES(null, "12bc", "Olla", "Bapu", "Samil 7", 1);
INSERT INTO Paquetes VALUES(null, "13cd", "Sarten", "Rapunzel", "La Venta 51", 1);

