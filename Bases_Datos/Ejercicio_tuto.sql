#DROP DATABASE Instituto;
CREATE DATABASE Instituto CHARACTER SET utf8;
USE Instituto;

CREATE table Cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL
);

CREATE table Alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    num_expediente VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(300) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE table Cursos_Alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_delegado INT NOT NULL,
    fk_id_curso INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY(fk_id_delegado) REFERENCES Alumnos(id) ON DELETE CASCADE,
    FOREIGN KEY(fk_id_curso) REFERENCES Cursos(id) 
);

CREATE table Profesores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(300) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    direccion VARCHAR(300),
    telefono VARCHAR(12) NOT NULL
);

CREATE table Modulos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    fk_id_profesor INT,
    FOREIGN KEY(fk_id_profesor) REFERENCES Profesores(id)
);

CREATE table Modulos_Alumnos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_alummno INT,
    fk_id_modulo INT,
    FOREIGN KEY(fk_id_alummno) REFERENCES Alumnos(id) ON DELETE SET NULL,
    FOREIGN KEY(fk_id_modulo) REFERENCES Modulos(id) ON DELETE CASCADE
);


