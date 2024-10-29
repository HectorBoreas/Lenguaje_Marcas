/*Crea los trigger necesarios y las tablas necesarias para resolver:
Cuando se produce una acción (inserción o borrado) en una 
tabla Clientes(que contiene id, nombre, telefono y dni
se pase la información a otra tabla llamada Copia_Clientes*/
/*USE EjercicioCompleto;

-- Lo primero vamos a crear la tabla que vamos a necesitar
CREATE table Copia_Clientes IF NOT EXISTS Copia_Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    nombre_cliente VARCHAR(200) NOT NULL,
    telefono_cliente VARCHAR(12) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL
);*/

-- Procedemos a crear el trigger
DELIMITER //
CREATE trigger InsertarClientes 
BEFORE INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Copia_Clientes VALUES (null, CONCAT());
END //

DELIMITER ;