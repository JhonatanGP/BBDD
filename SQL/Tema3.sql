-- CREAR TABLA
CREATE TABLE CCAAS(
    NOMBRE VARCHAR2(50),
    POBLACION INT,
    SUPERFICIE NUMBER(7,2)
);
-- PARA MODIFICAR LA TABLA/A�ADIR
ALTER TABLE CCAAS ADD LOCALIDAD VARCHAR2(100); 
-- PARA BORRAR UNA COLUNMA
ALTER TABLE CCAAS DROP COLUMN NOMBRE;
-- PARA BORRAR LA TABLA
DROP TABLE CCAAS;