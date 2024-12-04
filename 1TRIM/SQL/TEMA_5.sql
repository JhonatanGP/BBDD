-- Tema 5
drop table agencias cascade constraints;
create table agencias(
    id int,
    direccion varchar2(100),
    telefono char(13),
    nombre varchar2(50),
    num_empleados int
);
insert into agencias (id,direccion,telefono,nombre,num_empleados)
    values (1,'c\real 5','+341111111111','Agencia test',4);
insert into agencias (id,nombre) values (2,'Nueva Bormujos');
insert into agencias (nombre,id) values ('Mairenador',3);
insert into agencias values (4,'Avda.Italia 4','',null,10);
select * from agencias;
 
--Actividad 1
drop table estudiantes cascade constraints;
create table estudiantes(
    id int primary key,
    nombre varchar(50),
    apellidos varchar(100),
    edad int
);
insert into estudiantes (id,nombre,apellidos) values (1,'Luis','García');
insert into estudiantes (id,nombre) values (2,'Pedro');
--select * from estudiantes;
 
--Actividad 2
insert into estudiantes (id,nombre,apellidos)
	values (1,'Luis','García');--No puedo tener 2 ids valor 1
insert into estudiantes values (3,'Antonio','Domínguez',21,'Sevilla');--Falta columna
insert into estudiantes (id,nombre,apellidos) values (11,'Luis','García');
alter table estudiantes add localidad varchar2(50);
insert into estudiantes values (3,'Antonio','Domínguez',21,'Sevilla');
insert into estudiantes values (4,'Pedro','Pérez',22,null);
select * from estudiantes;
--Actividad 3
alter table estudiantes	add ciclo varchar2(50) default 'DAMDAW';
insert into estudiantes (id,nombre) values (5,'María');
insert into estudiantes (id,nombre,ciclo) values (6,'Tomás','DAW');
insert into estudiantes values (7,'Tomás',null,null,null,'DAW');
select * from estudiantes;

update estudiantes set apellidos = 'González' where id = 1;
update estudiantes set nombre = 'Pedro Luis', edad = 30 where id = 3;
update estudiantes set ciclo = 'DAW';
update estudiantes set nombre = 'Jua' where id = 2;
update estudiantes set nombre = 'Juan' where id = 2;
--'28/11/2024' '28-11-2024' '28/11/24'
update estudiantes set edad = 23 where id = 2 or id = 3;
update estudiantes set edad = 24 where id in (1,2,3);
/*Actividad 4
Se han preguntado las edades de Luis y Pedro (23 y 19 años respectivamente). 
Modifica sus registros de la tabla estudiantes. */
insert into estudiantes (id,nombre) values (8,'Luis'); 
insert into estudiantes (id,nombre) values (9,'Pedro'); 
update estudiantes set edad = 23 where id = 8;
update estudiantes set edad = 19 where id = 9;
/* Actividad 5
Cambia todos los registros de la tabla estudiantes para que tengan 19 años de edad.*/
update estudiantes set edad = 19;
/*Actividad 6
Borra el registro con id número 3 de la tabla estudiantes.*/
delete from estudiantes where id = 3;
--ejemplo
drop table notas cascade constraints;
create table notas(
    id int primary key,
    valor number(3,1),
    id_estudiante int,
    foreign key(id_estudiante) references estudiantes(id)
);
insert into notas values (1,7,1);
insert into notas values (2,4,2);
select * from notas;
delete from estudiantes where id = 2; -- no se puede, habría que hacer lo de abajo

--ejemplo on delete cascade
drop table notas cascade constraints;
create table notas(
    id int primary key,
    valor number(3,1),
    id_estudiante int,
    foreign key(id_estudiante) references estudiantes(id) on delete cascade
);
insert into notas values (1,7,1);
insert into notas values (2,4,2);
select * from notas;
delete from estudiantes where id = 2;
select * from notas;

--ejemplo on delete set null
drop table notas cascade constraints;
create table notas(
    id int primary key,
    valor number(3,1),
    id_estudiante int,
    foreign key(id_estudiante) references estudiantes(id) on delete set null
);
insert into notas values (1,7,1);
insert into notas values (2,4,2);
select * from notas;
delete from estudiantes where id = 2;
select * from notas;


-- PDF EJERCICICIOS
DROP TABLE BARCOS CASCADE CONSTRAINTS;
CREATE TABLE BARCOS(
    MATRICULA CHAR(7) PRIMARY KEY check (REGEXP_LIKE( MATRICULA, '[A-Z][A-Z]-[0-9][0-9][0-9][0-9]')),
    NOMBRE VARCHAR(50),
    CLASE VARCHAR(50),
    ARMADOR VARCHAR(50),
    CAPACIDAD NUMBER(8,2),
    NACIONALIDAD VARCHAR(50)
);

DROP TABLE LOTES CASCADE CONSTRAINTS;
CREATE TABLE LOTES(
    CODIGO INT PRIMARY KEY,
    MATRICULA CHAR(7),
    NUM_KG NUMBER(8,2) CHECK (NUM_KG>0),
    PRECIO_KG_SALIDA NUMBER(8,2) CHECK (PRECIO_KG_SALIDA>0),
    PRECIO_KG_VENDIDO NUMBER(8,2) CHECK (PRECIO_KG_VENDIDO>0),
    FECHA_VENTA DATE NOT NULL, --PARA PONER QUE LA FECHA NO ADMITE NULL
    COD_ESPECIE INT
);

DROP TABLE ESPECIES CASCADE CONSTRAINTS;
CREATE TABLE ESPECIES(
    CODIGO INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    TIPO VARCHAR(50),
    CUPO_BARCO NUMBER(8,2),
    CALADERO_PPAL INT
);

DROP TABLE CALADEROS CASCADE CONSTRAINTS;
CREATE TABLE CALADEROS(
    CODIGO INT PRIMARY KEY,
    NOMBRE VARCHAR(50) CHECK (NOMBRE LIKE UPPER(NOMBRE)),
    UBICACION VARCHAR(100) CHECK (UBICACION LIKE UPPER(UBICACION)),
    ESPECIE_PPAL INT
);

DROP TABLE FECHAS_CAPTURAS CASCADE CONSTRAINTS;
CREATE TABLE FECHAS_CAPTURAS(
    COD_ESPECIE INT,
    COD_CALADERO INT,
    FECHA_INICIO DATE CHECK ( FECHA_INICIO NOT BETWEEN DATE '2020-02-02' AND DATE '2020-03-28' ),
    FECHA_FIN DATE CHECK ( FECHA_FIN NOT BETWEEN DATE '2020-02-02' AND DATE '2020-03-28' ),
    PRIMARY KEY( COD_ESPECIE, COD_CALADERO )
);

--04 / 12 / 2024
-- 2.PDF EJERCICIOS  02
drop table socios cascade constraints;
create table socios(
    codigo_socio CHAR(8) PRIMARY KEY CHECK(REGEXP_LIKE(codigo_socio,'S[0-9]{5}24')),
    dni CHAR(9) CHECK(REGEXP_LIKE(dni,'[0-9]{8}[A-Z]')),
    nombre varchar(100),
    apellidos varchar(200) ,
    direccion varchar(300),
    telefono number(9)
);
drop table libros cascade constraints;
create table libros(
    isbn CHAR(17) CHECK(REGEXP_LIKE(isbn,'[0-9]{13}[A-Z]{4}')) PRIMARY KEY,
    titulo VARCHAR(200),
    editorial VARCHAR(50),
    ano_publicacion INT,
    autores VARCHAR(300),
    ano INT,
    edicion INT,
    deteriorado CHAR(2) CHECK(deteriorado in ('Si','No'))
    --otro ejemplo deteriorado char(2) check(deteriorado = 'Si' or deteriorado = 'No')
);
drop table prestamos cascade constraints;
create table prestamos(
    codigo_socio CHAR(8) CHECK(REGEXP_LIKE(codigo_socio,'S[0-9]{5}24')),
    isbn CHAR(17) CHECK(REGEXP_LIKE(isbn,'[0-9]{13}[A-Z]{4}')),
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    fecha_real_devolucion DATE,
    --AHORA CREO LA PK COMPUESTA Y DESP LA FK DE CADA UNA
    PRIMARY KEY(codigo_socio,isbn),
    FOREIGN KEY(codigo_socio) references socios(codigo_socio) on delete set null, --on delete set null: Si se borran registros del que dependen los campos FK deben modificarse dichas columnas a NULL.
    FOREIGN KEY(isbn) references libros(isbn) on delete set null, --on delete set null: Si se borran registros del que dependen los campos FK deben modificarse dichas columnas a NULL.
    --La fecha de devolución tiene que ser mayor que la fecha de préstamo exactamente en 15 días.
    CHECK(fecha_devolucion > fecha_prestamo+15),
    CHECK(fecha_real_devolucion >= fecha_prestamo)
);
--2. Crea un par de socios
insert into socios values ('S0000024','12345678X','Nombre','Apellidos','Dirección',123456789);
insert into socios values ('S1111124','11145678X','Socio 2','Apellidos','Dirección',123456711);
select * from socios;
--3
insert into libros values ('0000000000000AAAA','Libro 1','Editorial',1995,'Autor 1',1998,4,'No');
insert into libros values ('0000000000011BBAA','Libro 2','Editorial',2015,'Autor 2',2015,1,'Si');
insert into libros values ('0000000000022CCAA','Libro 3','Editorial 3',2010,'Autor 1',2011,2,'No');
select * from libros;
--4
ALTER SESSION SET nls_date_format='DD/MM/YYYY';
insert into prestamos values ('S0000024','0000000000000AAAA','01/11/2024','17/11/2024','18/11/2024');
insert into prestamos values ('S0000024','0000000000011BBAA','01/12/2024','17/12/2024','16/12/2024');
--Otros ejercicios
--1
insert into prestamos values ('S1111124','0000000000011BBAA','17/12/2024','02/01/2025','02/01/2025');
--2
update socios set nombre='Socio 1', apellidos='AP1' where codigo_socio = 'S0000024';
update socios set nombre='Socio 2 new', apellidos='AP2' where codigo_socio = 'S1111124';
select * from socios;
--3
update libros set edicion = 2018;
select * from libros;
--no pongo where porque me dicen todos
--4
select * from libros;
update libros set deteriorado = 'Si' where isbn = '0000000000000AAAA';

select deteriorado from libros;
select distinct deteriorado from libros;
select * from prestamos;
select * from libros,prestamos where libros.isbn = prestamos.isbn;
select * from libros where autores = 'Autor 1';
select * from libros 


