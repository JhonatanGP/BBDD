                               --PDF4 EJERCICIOS
--EJ 1
DROP TABLE CATEGORIAS CASCADE CONSTRAINTS;
CREATE TABLE CATEGORIAS(
    CODIGO INT,
    DESCRIPCION VARCHAR2(100)
);
ALTER TABLE CATEGORIAS ADD PRIMARY KEY (CODIGO);

DROP TABLE PRODUCTOS CASCADE CONSTRAINTS;
CREATE TABLE PRODUCTOS(
    ID INT,
    NOMBRE VARCHAR2(100),
    PRECIO NUMBER
);
ALTER TABLE PRODUCTOS ADD PRIMARY KEY (ID);
--EJ 2
DROP TABLE CUENTAS_BANCARIAS CASCADE CONSTRAINTS;
CREATE TABLE CUENTAS_BANCARIAS(
    NUMERO INT PRIMARY KEY,
    SALDO NUMBER
);
DROP TABLE TRANSACCIONES CASCADE CONSTRAINTS;
CREATE TABLE TRANSACCIONES(
    CODIGO INT PRIMARY KEY,
    TIPO VARCHAR2(100), 
    CANTIDAD INT,
    NUMERO NUMBER
);
ALTER TABLE TRANSACCIONES ADD CONSTRAINT FKNCB FOREIGN KEY(NUMERO) REFERENCES CUENTAS_BANCARIAS(NUMERO);
--EJ 3
DROP TABLE AULAS CASCADE CONSTRAINTS;
CREATE TABLE AULAS(
    NUMERO INT,
    PLANTA INT,
    SITUACION VARCHAR2(100),
    PRIMARY KEY (NUMERO, PLANTA)
);
DROP TABLE ESTUDIANTES CASCADE CONSTRAINTS;
CREATE TABLE ESTUDIANTES(
    NUMERO_MATRICULA INT PRIMARY KEY,
    NOMBRE VARCHAR2(50),
    DIRECCION VARCHAR2(100)
);
DROP TABLE ASIGNATURAS CASCADE CONSTRAINTS;
CREATE TABLE ASIGNATURAS(
    DENOMINACION VARCHAR2(100),
    CICLO VARCHAR2(100),
    PRIMARY KEY (DENOMINACION, CICLO)
);
DROP TABLE ESTUDIOS CASCADE CONSTRAINTS;
CREATE TABLE ESTUDIOS(
    NUMERO INT,
    PLANTA INT,
    NUMERO_MATRICULA INT,
    DENOMINACION VARCHAR2(100),
    CICLO VARCHAR2(100),
    HORA DATE,
    PRIMARY KEY (NUMERO, PLANTA, NUMERO_MATRICULA, DENOMINACION,CICLO)
);
ALTER TABLE ESTUDIOS ADD CONSTRAINT FK_NUMERO FOREIGN KEY(NUMERO,PLANTA) REFERENCES AULAS(NUMERO,PLANTA);
ALTER TABLE ESTUDIOS ADD CONSTRAINT FK_NUMEROMATRICULA FOREIGN KEY(NUMERO_MATRICULA) REFERENCES ESTUDIANTES(NUMERO_MATRICULA);
ALTER TABLE ESTUDIOS ADD CONSTRAINT FK_DENOMINACIONCICLO FOREIGN KEY(DENOMINACION,CICLO) REFERENCES ASIGNATURAS(DENOMINACION,CICLO);

--EJ 4
DROP TABLE AULAS1 CASCADE CONSTRAINTS;
CREATE TABLE AULAS1(
    NUMERO INT,
    PLANTA INT,
    SITUACION VARCHAR2(50)
);
ALTER TABLE AULAS1 ADD CONSTRAINT PK_AULAS1 PRIMARY KEY(NUMERO,PLANTA);

DROP TABLE ESTUDIANTES1 CASCADE CONSTRAINTS;
CREATE TABLE ESTUDIANTES1(
    NUMERO_MATRICULA INT,
    NOMBRE INT,
    DIRECCION VARCHAR2(50)
);
ALTER TABLE ESTUDIANTES1 ADD CONSTRAINT PK_ESTUDIANTES1 PRIMARY KEY(NUMERO_MATRICULA);

DROP TABLE ASIGNATURAS1 CASCADE CONSTRAINTS;
CREATE TABLE ASIGNATURAS1(
    DENOMINACION VARCHAR2(50),
    CICLO VARCHAR(50) 
);
ALTER TABLE ASIGNATURAS1 ADD CONSTRAINT PK_ASIGNATURAS1 PRIMARY KEY(DENOMINACION,CICLO);

DROP TABLE ESTUDIOS1 CASCADE CONSTRAINTS;
CREATE TABLE ESTUDIOS1(
    ID INT PRIMARY KEY,
    NUMERO INT,
    PLANTA INT,
    NUMERO_MATRICULA INT,
    DENOMINACION VARCHAR2(50),
    CICLO VARCHAR2(50),
    HORA DATE
);
ALTER TABLE ESTUDIOS1 ADD CONSTRAINT FK_AULAS1 FOREIGN KEY(NUMERO,PLANTA) REFERENCES AULAS1(NUMERO,PLANTA);
ALTER TABLE ESTUDIOS1 ADD CONSTRAINT FK_ESTUDIANTES1 FOREIGN KEY(NUMERO_MATRICULA) REFERENCES ESTUDIANTES1(NUMERO_MATRICULA);
ALTER TABLE ESTUDIOS1 ADD CONSTRAINT FK_ASIGNATURAS1 FOREIGN KEY(DENOMINACION,CICLO) REFERENCES ASIGNATURAS1(DENOMINACION,CICLO);

--EJ 5
DROP TABLE REPRESENTANTES CASCADE CONSTRAINTS;
CREATE TABLE REPRESENTANTES (
    ID_LICENCIA INT PRIMARY KEY,
    NOMBRE VARCHAR2(50)
);
DROP TABLE ACTORES CASCADE CONSTRAINTS;
CREATE TABLE ACTORES(
    ID_CARNE INT PRIMARY KEY,
    NOMBRE_A VARCHAR2(50),
    NOMBRE_B VARCHAR2(50),
    ID_LICENCENCIA_REPRESENTANTE INT,
    CONTRATO VARCHAR2(50)
);
ALTER TABLE ACTORES ADD CONSTRAINT PK_ID


