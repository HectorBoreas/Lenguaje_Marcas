# Crear Nueva Base de datos
CREATE DATABASE IF NOT EXISTS Tablas_Sencillas CHARACTER SET utf8_ci;
USE Tablas_Sencillas;

# Ejercicio 1
-- Ejercicio 1
/* Ejercicio 1 */
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

# Ejercicio 2
-- Ejercicio 2
/* Ejercicio 2 */
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

# Ejercicio 3
-- Ejercicio 3
/* Ejercicio 3 */
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    -- Revisar antes de ejecutar
    fk_id_usuario INT
);

# Ejercicio 4
-- Ejercicio 4
/* Ejercicio 4 */
CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

# Ejercicio 5
-- Ejercicio 5
/* Ejercicio 5 */
-- Revisar antes de ejcutar
ALTER TABLE Productos ADD fk_id_categoria INT;

# Ejercicio 6
-- Ejercicio 6
/* Ejercicio 6 */
CREATE TABLE Comentarios (
    id_comentarios INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_producto INT,
    fk_id_usuario INT,
    comentario TEXT(200)
);

# Ejercicio 7
-- Ejercicio 7
/* Ejercicio 7 */
CREATE TABLE Stocks (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_producto INT,
    cantidad INT
);

# Ejercicio 8
-- Ejercicio 8
/* Ejercicio 8 */
CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(15)
);

# Ejercicio 9
-- Ejercicio 9
/* Ejercicio 9 */
-- Revisar antes de ejcutar
ALTER TABLE Productos ADD fk_id_proveedor INT;

# Ejercicio 10
-- Ejercicio 10
/* Ejercicio 10 */
CREATE TABLE Descuentos (
    id_descuento INT PRIMARY KEY AUTO_INCREMENT,
    porcentaje DECIMAL(5,2),
    fecha_inicio DATE,
    fecha_fin DATE
);

# Ejercicio 11
-- Ejercicio 11
/* Ejercicio 11 */
CREATE TABLE Historial_Precios (
    id_historial_precio INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_producto INT,
    precio DECIMAL(8,2),
    fecha DATE
);

# Ejercicio 12
-- Ejercicio 12
/* Ejercicio 12 */
CREATE TABLE Roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50)
);

# Ejercicio 13
-- Ejercicio 13
/* Ejercicio 13 */
-- Revisar antes de ejcutar
ALTER TABLE Usuarios ADD fk_id_usuario INT;

# Ejercicio 14
-- Ejercicio 14
/* Ejercicio 14 */
CREATE TABLE Metodos_pagos (
    id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

# Ejercicio 15
-- Ejercicio 15
/* Ejercicio 15 */
-- Revisar antes de ejcutar
ALTER TABLE Pedidos ADD fk_id_pedido INT;

# Ejercicio 16
-- Ejercicio 16
/* Ejercicio 16 */
CREATE TABLE Direcciones (
    id_direccion INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_usuario INT,
    direccion VARCHAR(255)
);

# Ejercicio 17
-- Ejercicio 17
/* Ejercicio 17 */
CREATE TABLE Wishlists (
    id_wishlist INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_usuario INT,
    fk_id_producto INT
);

# Ejercicio 18
-- Ejercicio 18
/* Ejercicio 18  Reseñas de productos*/
CREATE TABLE Valoraciones (
    id_valoriacion INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_producto INT,
    fk_id_usuario INT,
    -- Revisar INT, valor entre 1 y 5
    calificacion INT CHECK(calificacion >= 1 AND calificacion<=5),
    comentario TEXT(200)
);

# Ejercicio 19
-- Ejercicio 19
/* Ejercicio 19 */
CREATE TABLE Cupones (
    id_cupon INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50),
    descuento DECIMAL(10,2),
    fecha_expiracion DATE
);

# Ejercicio 20
-- Ejercicio 20
/* Ejercicio 20 */
CREATE TABLE Historial_Pedidos (
    id_historial_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_pedido INT,
    fecha DATE,
    estado VARCHAR(50)
);

# Ejercicio 21
-- Ejercicio 21
/* Ejercicio 21 */

-- Agregar clave foranea de usuario a tabla de direcciones
ALTER TABLE Direcciones ADD fk_id_usuario INT SET FOREIGN KEY;