-- CREAR TABLA
CREATE TABLE CCAAS(
    NOMBRE VARCHAR2(50),
    POBLACION INT,
    SUPERFICIE NUMBER(7,2)
);
-- PARA MODIFICAR LA TABLA/A�ADIR
ALTER TABLE CCAAS ADD LOCALIDAD VARCHAR2(100); 
-- PARA BORRAR LA TABLA
DROP TABLE CCAAS;
--PARA RENOMBRAR UNA COLUMNA
ALTER TABLE CCAAS RENAME COLUMN SUPERFICIE TO SUPERF;
-- PARA BORRAR UNA COLUNMA
ALTER TABLE CCAAS DROP COLUMN NOMBRE;
-- PARA BORRAR UNA TABLA Y TODAS SUS RESTRICCIONES DE LAS QUE DEPENDA (PK Y FK) SE USA CASCADE CONSTRAINTS
DROP TABLE ALUMNOS CASCADE CONSTRAINTS SYS_C008321 ;

-- 06/11/2024
--  PDF 1 INTRODUCCI�N
-- EJ 1
DROP TABLE ALUMNOS;

CREATE TABLE ALUMNOS (
    NOMBRE VARCHAR2(15),
    APELLIDOS VARCHAR2(50),
    DNI CHAR(9)
); 
--EJ 2
ALTER TABLE ALUMNOS ADD CP NUMBER(5);
--EJ 3
ALTER TABLE ALUMNOS ADD FEC_NAC DATE;
--EJ 4
ALTER TABLE ALUMNOS DROP COLUMN CP;
ALTER TABLE ALUMNOS RENAME COLUMN FEC_NAC TO F_NAC;
ALTER TABLE ALUMNOS MODIFY APELLIDOS VARCHAR2(200);
--EJ 5
    --5.1
    CREATE TABLE ALUMNOS1 (
        NOMBRE VARCHAR2(15),
        APELLIDOS VARCHAR2(50),
        DNI CHAR(9) PRIMARY KEY
    ); 
    --5.2
    CREATE TABLE ALUMNOS2 (
        NOMBRE VARCHAR2(15),
        APELLIDOS VARCHAR2(50),
        DNI CHAR(9)
    ); 
    ALTER TABLE ALUMNOS2 ADD PRIMARY KEY (DNI) ;
    --5.3
    CREATE TABLE ALUMNOS3 (
        NOMBRE VARCHAR2(15),
        APELLIDOS VARCHAR2(50),
        DNI CHAR(9)
    ); 
    ALTER TABLE ALUMNOS3 ADD CONSTRAINT PKDNIALUMNOS3 PRIMARY KEY(DNI) ;
    --5.4
    CREATE TABLE ALUMNOS4 (
        NOMBRE VARCHAR2(15),
        APELLIDOS VARCHAR2(50),
        DNI CHAR(9),
        PRIMARY KEY (DNI)        
    ); 
    
--EJ 6
DROP TABLE LOCALIDADES;
CREATE TABLE LOCALIDADES (
        ID INT ,
        LOCALIDAD VARCHAR2(100)        
); 
ALTER TABLE LOCALIDADES ADD PRIMARY KEY (ID) ;
ALTER TABLE ALUMNOS ADD ID_LOCALIDAD INT; 
ALTER TABLE ALUMNOS ADD FOREIGN KEY (ID_LOCALIDAD) REFERENCES LOCALIDADES(ID);

--07/11/2024

--PDF 2 AMPLIACI�N DE TABLAS 
--ACT 1
DROP TABLE PIEZAS;
CREATE TABLE PIEZAS (
    ID INT,
    NOMBRE VARCHAR2(100),
    ID_FABRICANTE INT
);
DROP TABLE FABRICANTES;
CREATE TABLE FABRICANTES (
    ID INT,
    MARCA VARCHAR2(50)
);
ALTER TABLE PIEZAS ADD PRIMARY KEY (ID);
ALTER TABLE FABRICANTES ADD PRIMARY KEY (ID);
ALTER TABLE PIEZAS ADD FOREIGN KEY (ID_FABRICANTE) REFERENCES FABRICANTES (ID);

--ACT 2
/*Incluye un nuevo campo en la tabla piezas de la actividad 1 que se llame precio y sea number con cuatro d�gitos, de
los cu�les dos ser�n decimales. Ahora crea una restricci�n CHECK en el campo precio que permita solo valores de 
precio mayores que cero. */
ALTER TABLE PIEZAS ADD PRECIO NUMBER (4,2);
ALTER TABLE PIEZAS ADD CONSTRAINT CHKPRECIO CHECK (PRECIO>0);

--ACT 3
/*Incluye un nuevo campo en la tabla piezas de la actividad 1 que se llame c�digo, tipo char con 5 caracteres con la
siguiente estructura (restricci�n):
    ? Primero la letra P.
    ? Segundo, tres n�meros que van de 0 a 9 cada uno de ellos.
    ? Final una letra cualquiera del abecedario en may�sculas. */
ALTER TABLE PIEZAS ADD CODIGO CHAR(5);
ALTER TABLE PIEZAS ADD CONSTRAINT CHK CHECK (REGEXP_LIKE(CODIGO,'[P],[0-9],[0-9],[0-9],[A-Z]'));

-- ACT4 
/* A�ade una restricci�n al campo marca de la tabla fabricantes, permitiendo que solo se puedan guardar los siguientes
valores en ese campo:
    ? FABRIC1
    ? FABRIC2
    ? FABRIC3
Puedes usar tanto IN como encadenar diferentes condiciones con OR. */
ALTER TABLE FABRICANTES ADD CONSTRAINT MARCA CHECK(MARCA IN ('FABRIC1','FABRIC2','FABRIC3'));

-- PDF 3 ACTIVIDADES
/*Actividad 1
Crea una tabla COCHES que tenga los siguientes campos: La primary key es ID
    � ID: entero
    � Modelo: varchar 100
    � Marca: varchar 50
    � CV: entero
    � Consumo100: number */
CREATE TABLE COCHES(
    ID INT PRIMARY KEY,
    MODELO VARCHAR(100),
    MARCA VARCHAR(50),
    CV INT,
    CONSUMO100 NUMBER
);
 
/*Actividad 2
Crea una tabla COMPRAS que tenga los siguientes campos:
    � ID: entero
    � Cliente: varchar 100
    � FechaCompra: date
    � idCoche: entero
La primary key es ID. idCoche es foreign key de ID en COCHES */   
CREATE TABLE COMPRAS(
    ID INT PRIMARY KEY,
    CLIENTE VARCHAR(100),
    FECHACOMPRA DATE,
    IDCOCHE INT,
    CONSUMO100 NUMBER
);
ALTER TABLE COMPRAS ADD FOREIGN KEY (IDCOCHE) REFERENCES COCHES (ID); 
// ALTER TABLE COMPRAS ADD CONSTRAINT FKIDCOCHE FOREIGN KEY (IDCOCHE) REFERENCES COCHES(ID);

/*Actividad 3
Crea una tabla PIEZAS que tenga los siguientes campos:
    � codigo: entero
    � idAlmacen: entero
    � Nombre: varchar(50)
    � Peso: number
La primary key es compuesta por c�digo y por idAlmacen. */
CREATE TABLE PIEZAS1(
    CODIGO INT,
    IDALMACEN INT,
    NOMBRE VARCHAR(50),
    PESO NUMBER,
    PRIMARY KEY (CODIGO,IDALMACEN)
);
DROP TABLE COCHES CASCADE CONSTRAINTS;

--ACT 5: Borra de la tabla COCHES la PK.
ALTER TABLE COCHES DROP PRIMARY KEY;
--Actividad 6: Renombra la tabla COCHES por la palabra VEHICULOS.
RENAME COCHES TO VEHICULOS;


    
    
    
    
    
