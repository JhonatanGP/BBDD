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



    

