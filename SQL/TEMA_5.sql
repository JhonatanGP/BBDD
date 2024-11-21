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
insert into estudiantes (id,nombre,apellidos) 
    values (1,'Luis','García');
insert into estudiantes (id,nombre) 
    values (2,'Pedro');
--select * from estudiantes;
 
--Actividad 2
insert into estudiantes (id,nombre,apellidos)
	values (1,'Luis','García');--No puedo tener 2 ids valor 1
insert into estudiantes 
    values (3,'Antonio','Domínguez',21,'Sevilla');--Falta columna
insert into estudiantes (id,nombre,apellidos)
	values (11,'Luis','García');
alter table estudiantes
    add localidad varchar2(50);
insert into estudiantes 
    values (3,'Antonio','Domínguez',21,'Sevilla');
insert into estudiantes
    values (4,'Pedro','Pérez',22,null);
select * from estudiantes;
--Actividad 3
alter table estudiantes
	add ciclo varchar2(50) default 'DAMDAW';
insert into estudiantes (id,nombre) values (5,'María');
insert into estudiantes (id,nombre,ciclo) values (6,'Tomás','DAW');
select * from estudiantes;

-- PRACTICA EXAMEN 
drop table estaciones cascade constraints;
create table estaciones(
    nombre varchar2(50) primary key,
    num_andenes int,
    volumen_entr number,
    direccion varchar2(50),
    tfno_info varchar2(50),
    localidad varchar2(50),
    num_empresas int,
    dni_responsable char(9)
);
drop table responsables cascade constraints;
create table responsables(
    dni char(9) check(regexp_like(dni,'[0-9]{8}[A-Z]')) primary key,
    nombre varchar2(50),
    apellidos varchar2(50),
    edad int,
    direccion varchar2(50)
);
drop table telefonos cascade constraints;
create table telefonos(
    numero int primary key,
    tipo varchar2(50)
);
drop table trayectos cascade constraints;
create table trayectos(
    codigo int primary key,
    num_plazas_v int,
    hora_llegada varchar2(50),
    fecha_llegada date,
    hora_salida varchar2(50),
    fecha_salida date,
    direccion varchar2(50),
    nombre_estacion_origen varchar2(50),
    nombre_estacion_destino varchar2(50),
    codigo_empresa int,
    foreign key(nombre_estacion_origen) 
        references estaciones(nombre),
    constraint fk_nombre_estacion_destino_trayectos 
        foreign key(nombre_estacion_destino) 
        references estaciones(nombre)
);
drop table trabajadores cascade constraints;
create table trabajadores(
    dni char(9) primary key,
    nombre varchar2(50),
    direccion varchar2(50),
    apellidos varchar2(50),
    tipoTrabajador varchar2(50),
    numero_carne_conductor int,
    anos_carne_conductor int,
    turno_venta varchar2(50),
    codigo_empresa int
);
drop table autobuses cascade constraints;
create table autobuses(
    num_bastidor int primary key,
    matricula varchar2(50),
    anos int,
    fecha_rev date,
    kms int,
    codigo_empresa int
);
drop table empresas cascade constraints;
create table empresas(
    codigo int primary key,
    cif char(9),
    nombre_comercial varchar2(50),
    direccion varchar2(50),
    codigo_empresa_filial int,
    foreign key(codigo_empresa_filial) references empresas(codigo)
);
drop table estaciones_empresas cascade constraints;
create table estaciones_empresas(
    nombre_estacion varchar2(50),
    codigo_empresa int,
    primary key(nombre_estacion,codigo_empresa),
    foreign key(nombre_estacion) references estaciones(nombre),
    foreign key(codigo_empresa) references empresas(codigo)
);
alter table estaciones
    add foreign key(dni_responsable) references responsables(dni);
alter table trayectos
    add foreign key(codigo_empresa) references empresas(codigo);
alter table trabajadores
    add foreign key(codigo_empresa) references empresas(codigo);
alter table autobuses
    add foreign key(codigo_empresa) references empresas(codigo);
--1. Crear un campo stock en estaciones_empresas que sea integer
alter table estaciones_empresas add stock integer;
--2. Modifica el tipo de dato anterior para que sea un number con 4 cifras y una de ellas decimal
alter table estaciones_empresas modify stock number(4,1);
--3. Elimina la PK de estaciones_empresas
 alter table estaciones_empresas drop primary key;
--4. Quiero que el campo nombre_estacion sea ahora PK y ponle el nombre a la restricción siguiente: pk_nombre_estacion_empresa
 alter table estaciones_empresas add constraint pk_nombre_estacion_empresa primary key(nombre_estacion);
--5. Cambia el nombre de la restricción anterior por el siguiente: pk_nom_est_emp
 
--6. Haz lo que tengas que hacer (lo que sea necesario) para borrar la tabla estaciones_empresas sin usar cascade constraints.