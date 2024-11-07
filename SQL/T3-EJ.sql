--EJ 1
CREATE TABLE CATEGORIAS(
    CODIGO INT,
    DESCRIPCION VARCHAR2(100)
);
ALTER TABLE CATEGORIAS ADD PRIMARY KEY (CODIGO);

CREATE TABLE PRODUCTOS(
    ID INT,
    NOMBRE VARCHAR2(100),
    PRECIO NUMBER
);
ALTER TABLE PRODUCTOS ADD PRIMARY KEY (ID);
--EJ 2
CREATE TABLE CUENTAS_BANCARIAS(
    NUMERO INT PRIMARY KEY,
    SALDO NUMBER
);
CREATE TABLE TRANSACCIONES(
    CODIGO INT PRIMARY KEY,
    TIPO VARCHAR2(100), 
    CANTIDAD INT,
    NUMERO NUMBER
);
ALTER TABLE TRANSACCIONES ADD CONSTRAINT FKNCB FOREIGN KEY(NUMERO) REFERENCES CUENTAS_BANCARIAS(NUMERO);
--EJ 3
DROP TABLE AULAS;
CREATE TABLE AULAS(
    NUMERO INT,
    PLANTA INT,
    SITUACION VARCHAR2(100),
    PRIMARY KEY (NUMERO, PLANTA)
);
DROP TABLE ESTUDIANTES;
CREATE TABLE ESTUDIANTES(
    NUMERO_MATRICULA INT PRIMARY KEY,
    NOMBRE VARCHAR2(50),
    DIRECCION VARCHAR2(100)
);
CREATE TABLE ASIGNATURAS(
    DENOMINACION VARCHAR2(100),
    CICLO VARCHAR2(100),
    PRIMARY KEY (DENOMINACION, CICLO)
);
CREATE TABLE ESTUDIOS(
    NUMERO INT,
    PLANTA INT,
    NUMERO_MATRICULA INT,
    DENOMINACION VARCHAR2(100),
    CICLO VARCHAR2(100),
    HORA DATE,
    PRIMARY KEY (NUMERO, PLANTA, NUMERO_MATRICULA, DENOMINACION,CICLO)
);
ALTER TABLE ESTUDIOS ADD PRIMARY KEY 