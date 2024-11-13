--PDF 5 EJERCICIOS RESTRICCIONES
--EJ 1
DROP TABLE LOTES CASCADE CONSTRAINTS;
CREATE TABLE LOTES(
    CODIGO INT,
    NUM_KG NUMBER(8,2),
    PRECIO_KG_SALIDA NUMBER(8,2),
    PRECIO_KG_VENDIDO NUMBER(8,2),
    FECHA DATE
);
ALTER TABLE LOTES ADD CONSTRAINT PK_LOTES PRIMARY KEY(CODIGO);
ALTER TABLE LOTES ADD CONSTRAINT NUM_KG CHECK(NUM_KG > 0);
ALTER TABLE LOTES ADD CONSTRAINT PRECIO_KG_SALIDA CHECK(PRECIO_KG_SALIDA > 0);
ALTER TABLE LOTES ADD CONSTRAINT PRECIO_KG_VENDIDO CHECK(PRECIO_KG_VENDIDO > 0 AND PRECIO_KG_VENDIDO > PRECIO_KG_SALIDA);
ALTER TABLE LOTES ADD CONSTRAINT FECHA_NOT_NULL CHECK (FECHA IS NOT NULL);

--PARA CAMBIAR EL NOMBRE DE UNA RESTRICCION
ALTER TABLE LOTES RENAME CONSTRAINT PRECIO_KG_SALIDA TO NUEVO;
-- EJ 2
DROP TABLE PERSONAS CASCADE CONSTRAINTS;
CREATE TABLE PERSONAS(
    DNI CHAR(9) PRIMARY KEY CHECK(REGEXP_LIKE(DNI,'[0-9]{8}[A-Z]')),
    NOMBRE VARCHAR2(50)
);
--EJ 3
ALTER TABLE PERSONAS ADD TALLA VARCHAR2(2) CHECK (TALLA IN ('S','M','L','XL'));
 
 --ACTIVIDADES REPASOEXAMEN
CREATE TABLE PRODUCTOS1(
     ID INT,
     NOMBRE VARCHAR2(100),
     TIPO VARCHAR2(50)
);
CREATE TABLE CLIENTES(
     CODIGO INT,
     NOMBRE VARCHAR2(50),
     FECHA_NACIMIENTO DATE
);
CREATE TABLE PEDIDOS(
     ID_PRODUCTO INT,
     ID_CLIENTE INT,
     FECHA_COMPRA DATE
);

--4. Tienes que hacer PK el campo id de la tabla productos, el campo codigo en la tabla clientes y la suma de id_producto e id_cliente en la tabla pedidos.
ALTER TABLE PRODUCTOS1 ADD CONSTRAINT PK_PRODUCTO1 PRIMARY KEY(ID);
ALTER TABLE CLIENTES ADD CONSTRAINT PK_CLIENTES PRIMARY KEY(CODIGO);
ALTER TABLE PEDIDOS ADD CONSTRAINT PK_PEDIDOS PRIMARY KEY(ID_PRODUCTO,ID_CLIENTE);

--5. Haz FK del campo id_producto de la tabla pedidos respecto del campo id de la tabla productos. El nombre de esta FK tiene que ser fk_pedidos_productos.
ALTER TABLE  ADD CONSTRAINT PK_PRODUCTO1 PRIMARY KEY(ID);

--6. Haz FK del campo id_cliente de la tabla pedidos respecto del campo codigo de la tabla clientes. El nombre de esta FK tiene que ser fk_pedidos_clientes.

/*7. Hay que cambiar el nombre de la tabla productos por products pero se quiere hacer siguiendo estos pasos:
- Borrar la FK de otras tablas que apunten al campo PK id de productos.
- Cambiar el nombre de la tabla.
- Volver a crear la FK correspondiente con el mismo nombre que tenía la restricción, pero ahora haciendo referencia a products.*/

--8. Cambia el nombre de la restricción fk_pedidos_clientes por fk_ped_cli.

/*9. Añade un nuevo campo a la tabla clientes que sea:
- provincia varchar tamaño 50.*/

/*10. Cambia los siguientes datos del campo creado para la tabla clientes:
- Ahora se llamará id_provincia en lugar de provincia.
- El tipo de dato ahora será id. */
    