CREATE DATABASE Instituto;
USE Instituto;

CREATE table Profesoeres (
    id_profesor INT AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    direccion VARCHAR(300),
    telefono VARCHAR(12),
    PRIMARY KEY(id_profesor)
);

INSERT INTO Profesoeres VALUES(null, "Miguel", "12345678a", "Calle Real 17", "111111111");
INSERT INTO Profesoeres VALUES(null, "Carlos", "23456789b", "Avenida de América 203", "222222222");
INSERT INTO Profesoeres VALUES(null, "Tatiana", "34567891c", "Calle Nicolasa Fernadez", "333333333");
INSERT INTO Profesoeres VALUES(null, "Esther", "34567891d", "Calejón de sal si puedes", "444444444");
INSERT INTO Profesoeres VALUES(null, "Oscar", "45678912e", "Calle Real 63", "555555555");
INSERT INTO Profesoeres VALUES(null, "Gema", "56789123f", "Calle Plateros 42", "+34666666666");

CREATE table Modulos (
    id_modulo INT AUTO_INCREMENT,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    fk_id_profesor INT NOT NULL,
    PRIMARY KEY(id_modulo),
    FOREIGN KEY(fk_id_profesor) REFERENCES Profesoeres(id_profesor)
);

INSERT INTO Modulos VALUES(null, "ISO", "Instalación de Sistemas Operativos", 1);
INSERT INTO Modulos VALUES(null, "PAR", "Protocolos Administración de Redes", 3);
INSERT INTO Modulos VALUES(null, "LM", "Lenguaje de marcas", 2);
INSERT INTO Modulos VALUES(null, "FP", "Fundamentos de programción", 2);
INSERT INTO Modulos VALUES(null, "FH", "Fundamentos del Hardware", 6);
INSERT INTO Modulos VALUES(null, "GBBDD", "Gestión de BAses de datos", 5);
INSERT INTO Modulos VALUES(null, "ITE", "Intinerario de trabajo en empresa", 4);

CREATE table Alumnos (
    id_alumno INT AUTO_INCREMENT,
    num_expediente INT UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(300) NOT NULL,
    fecha_nacimiento DATE,
    PRIMARY KEY(id_alumno)
);

INSERT INTO Alumnos VALUES(null, "1234", "Frodo", "Bolson", "1953/05/10");
INSERT INTO Alumnos VALUES(null, "2345", "Sam Sagaz", "Ganji", "1964/03/05");
INSERT INTO Alumnos VALUES(null, "3456", "Peregrin", "Tuk", "1959/07/13");
INSERT INTO Alumnos VALUES(null, "4567", "Meriadoc", "Brandigamo", "1953/01/01");
INSERT INTO Alumnos VALUES(null, "5678", "Gandalf", "El Gris", "0033/12/25");
INSERT INTO Alumnos VALUES(null, "6789", "Aragorn", "Hijo de Arathorn", "1821/06/11");
INSERT INTO Alumnos VALUES(null, "7890", "Gimli", "El enano", "1827/05/23");
INSERT INTO Alumnos VALUES(null, "8901", "Legolas", "De Curtis", "0513/09/26");
INSERT INTO Alumnos VALUES(null, "9012", "Boromir", "Hijo de Denethor", "1978/02/14");

CREATE table Cursos (
    id_curso INT AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    fk_id_alummno INT NOT NULL,
    PRIMARY KEY(id_curso),
    FOREIGN KEY(fk_id_alummno) REFERENCES Alumnos(id_alumno)
);

INSERT INTO Cursos VALUES(null, "Primero SMR", 3);
INSERT INTO Cursos VALUES(null, "Segundo SMR", 4);
INSERT INTO Cursos VALUES(null, "Primero ASIR", 1);
INSERT INTO Cursos VALUES(null, "Segundo ASIR", 2);
INSERT INTO Cursos VALUES(null, "Primero DAW", 7);
INSERT INTO Cursos VALUES(null, "Segundo DAW", 6);

CREATE table Modulos_Alumnos (
    id_modulo_alumno INT AUTO_INCREMENT,
    fk_id_alummno INT NOT NULL,
    fk_id_modulo INT NOT NULL,
    PRIMARY KEY(id_modulo_alumno),
    FOREIGN KEY(fk_id_alummno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY(fk_id_modulo) REFERENCES Modulos(id_modulo)
);

INSERT INTO Modulos_Alumnos VALUES(null, 8, 6);
INSERT INTO Modulos_Alumnos VALUES(null, 3, 1);
INSERT INTO Modulos_Alumnos VALUES(null, 5, 2);
INSERT INTO Modulos_Alumnos VALUES(null, 7, 4);
INSERT INTO Modulos_Alumnos VALUES(null, 1, 2);
INSERT INTO Modulos_Alumnos VALUES(null, 7, 5);
INSERT INTO Modulos_Alumnos VALUES(null, 9, 3);
INSERT INTO Modulos_Alumnos VALUES(null, 4, 1);
INSERT INTO Modulos_Alumnos VALUES(null, 2, 2);
INSERT INTO Modulos_Alumnos VALUES(null, 6, 6);

