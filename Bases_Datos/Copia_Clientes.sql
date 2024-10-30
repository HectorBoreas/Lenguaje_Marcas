/*Crea los trigger necesarios y las tablas necesarias para resolver:
Cuando se produce una acción (inserción o borrado) en una 
tabla Clientes(que contiene id, nombre, telefono y dni
se pase la información a otra tabla llamada Copia_Clientes*/
USE EjercicioCompleto;

#Lo primero vamos a crear la tabla que vamos a necesitar
CREATE table IF NOT EXISTS Copia_Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    telefono VARCHAR(12) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL
);

#Campos de Ejemplo
INSERT INTO Clientes VALUES(null, "Alba", "123456789", "12345678a");
INSERT INTO Clientes VALUES(null, "Borja", "234567890", "23456789b");
INSERT INTO Clientes VALUES(null, "Carlos", "012345678", "34567890c");
INSERT INTO Clientes VALUES(null, "Diana", "345678901", "456789012d");
INSERT INTO Clientes VALUES(null, "Esther", "456789012", "45678901e");
INSERT INTO Clientes VALUES(null, "Fabian", "567890123", "56789012f");


#Procedemos a crear el trigger
DELIMITER &&
CREATE trigger BackupClientes 
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Copia_Clientes VALUES (null, OLD.id_Clientes, OLD.nombre_Clientes, OLD.telefono_Clientes, OLD.dni_Clientes);
END &&
DELIMITER ;

DELIMITER &&
CREATE trigger BackupClientes 
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    CASE
    WHEN id=1 THEN
        INSERT INTO Copia_Clientes VALUES (null, OLD.id, OLD.nombre, OLD.telefono, OLD.dni);
    ELSE
        SELECT * FROM Clientes;
    END CASE;
END &&
DELIMITER ;
DELETE FROM Clientes WHERE id = 1;