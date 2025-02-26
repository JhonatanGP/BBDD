drop table maquinas cascade constraints;
drop table piezas cascade constraints;
drop table piezas_maquinas cascade constraints;
drop table clientes cascade constraints;
drop table avances_lineas_fabricacion cascade constraints;
create table maquinas (
    ref int primary key,
    nombre varchar(100) not null,
    precio_venta number(8,2),
    t_fabricacion int
);
create table piezas (
    idpie int primary key,
    nombre varchar(100) not null,
    tipo varchar(30) check(tipo in ('ELECTRICO','MECANICO','HIDRAULICO','NEUMATICO','OTROS')),
    estado varchar(30) check( estado in ('NUEVA','2MANO'))
);
create table piezas_maquinas (
    id_pieza int,
    id_maquina int,
    cantidad int
);
alter table piezas_maquinas
add foreign key (id_pieza) references piezas(idpie);
alter table piezas_maquinas
add foreign key (id_maquina) references maquinas(ref);
create table clientes(
    cif char(9) primary key,
    nombre_empresa varchar(100) not null,
    tfno varchar(10),
    loc varchar(100) not null
);
create table avances_lineas_fabricacion(
    id int primary key,
    linea_fabricacion int,
    id_cliente char(9),
    id_maquina int,
    estado varchar(30) check( estado in ('PUESTA A PUNTO','APROVISIONAMIENTO','MONTAJE','FINALIZADO')),
    fecha date,
    hora char(5)
);
alter table avances_lineas_fabricacion
add foreign key (id_cliente) references clientes(cif);
alter table avances_lineas_fabricacion
add foreign key (id_maquina) references maquinas(ref);

alter session set nls_date_format='DD-MM-YYYY HH24:MI:SS';

insert into maquinas values (1,'Cortadora de cesped',1200.50,300);
insert into maquinas values (2,'Bomba para piscinas',700.50,500);
insert into maquinas values (3,'Lijadora industrial',240.25,99);
insert into maquinas values (4,'Amasadora pan',3000,2500);
insert into maquinas values (5,'Horno inductivo',500.99,850);

insert into piezas values (1,'Tornillo','MECANICO','NUEVA');
insert into piezas values (2,'Arandela tigre doble','MECANICO','2MANO');
insert into piezas values (3,'Elastico','OTROS','NUEVA');
insert into piezas values (4,'Muelle tubular','OTROS','NUEVA');
insert into piezas values (5,'Valvula 200','NEUMATICO','2MANO');
insert into piezas values (6,'Valvula 100','NEUMATICO','2MANO');
insert into piezas values (7,'Cable electrico','ELECTRICO','2MANO');
insert into piezas values (8,'Cable de red','ELECTRICO','2MANO');
insert into piezas values (9,'Alimentacion 220','ELECTRICO','2MANO');
insert into piezas values (10,'Alimentacion 12','ELECTRICO','NUEVA');
insert into piezas values (11,'Alimentacion 5','ELECTRICO','NUEVA');
insert into piezas values (12,'Servomotor','ELECTRICO','2MANO');
insert into piezas values (13,'Freno hidraulico','HIDRAULICO','2MANO');
insert into piezas values (14,'Freno de disco','MECANICO','2MANO');
insert into piezas values (15,'Caja ranurada','OTROS','2MANO');
insert into piezas values (16,'Caja hermetica','OTROS','2MANO');
insert into piezas values (17,'Cuchilla','OTROS','NUEVA');
insert into piezas values (18,'Rueda grande','OTROS','NUEVA');
insert into piezas values (19,'Rueda pequeña','OTROS','NUEVA');
insert into piezas values (20,'Tubo','OTROS','2MANO');
insert into piezas values (21,'Piedra lisa','OTROS','2MANO');
insert into piezas values (22,'Aspa','MECANICO','2MANO');
insert into piezas values (23,'Sistema de control','ELECTRICO','2MANO');
insert into piezas values (24,'Piezoelectrico','ELECTRICO','2MANO');
insert into piezas values (25,'Ceramica','OTROS','NUEVA');

insert into piezas_maquinas values (1,1,200);
insert into piezas_maquinas values (2,1,400);
insert into piezas_maquinas values (4,1,50);
insert into piezas_maquinas values (7,1,10);
insert into piezas_maquinas values (9,1,1);
insert into piezas_maquinas values (10,1,1);
insert into piezas_maquinas values (12,1,4);
insert into piezas_maquinas values (14,1,4);
insert into piezas_maquinas values (15,1,1);
insert into piezas_maquinas values (17,1,100);
insert into piezas_maquinas values (19,1,4);
insert into piezas_maquinas values (23,1,1);
insert into piezas_maquinas values (1,2,40);
insert into piezas_maquinas values (2,2,80);
insert into piezas_maquinas values (5,2,2);
insert into piezas_maquinas values (6,2,1);
insert into piezas_maquinas values (7,2,10);
insert into piezas_maquinas values (11,2,1);
insert into piezas_maquinas values (12,2,2);
insert into piezas_maquinas values (16,2,1);
insert into piezas_maquinas values (20,2,6);
insert into piezas_maquinas values (22,2,3);
insert into piezas_maquinas values (23,2,1);
insert into piezas_maquinas values (1,3,20);
insert into piezas_maquinas values (2,3,30);
insert into piezas_maquinas values (3,3,6);
insert into piezas_maquinas values (7,3,1);
insert into piezas_maquinas values (10,3,1);
insert into piezas_maquinas values (17,3,100);
insert into piezas_maquinas values (21,3,1);
insert into piezas_maquinas values (23,3,1);
insert into piezas_maquinas values (1,4,20);
insert into piezas_maquinas values (2,4,40);
insert into piezas_maquinas values (3,4,2);
insert into piezas_maquinas values (4,4,2);
insert into piezas_maquinas values (5,4,1);
insert into piezas_maquinas values (6,4,1);
insert into piezas_maquinas values (7,4,3);
insert into piezas_maquinas values (9,4,1);
insert into piezas_maquinas values (11,4,2);
insert into piezas_maquinas values (12,4,4);
insert into piezas_maquinas values (16,4,1);
insert into piezas_maquinas values (22,4,3);
insert into piezas_maquinas values (23,4,1);
insert into piezas_maquinas values (1,5,10);
insert into piezas_maquinas values (2,5,20);
insert into piezas_maquinas values (7,5,3);
insert into piezas_maquinas values (8,5,1);
insert into piezas_maquinas values (9,5,1);
insert into piezas_maquinas values (11,5,2);
insert into piezas_maquinas values (16,5,1);
insert into piezas_maquinas values (21,5,8);
insert into piezas_maquinas values (23,5,1);
insert into piezas_maquinas values (24,5,4);
insert into piezas_maquinas values (25,5,2);

insert into clientes values ('B11223344','Industrias carnicas del sur',111111111,'Vejer de la Frontera');
insert into clientes values ('B88888844','Hierros Juan Perez SL',222222222,'Bollullos Par del Condado');
insert into clientes values ('B23423455','Panificadora industrial de Mairena',333333333,'Mairena del Aljarafe');

insert into avances_lineas_fabricacion values (1,1,'B11223344',3,'PUESTA A PUNTO','01-10-2023','8:00');
insert into avances_lineas_fabricacion values (2,1,'B11223344',1,'PUESTA A PUNTO','11-11-2023','20:05');
insert into avances_lineas_fabricacion values (3,2,'B88888844',3,'PUESTA A PUNTO','09-12-2023','00:05');
insert into avances_lineas_fabricacion values (4,2,'B88888844',4,'PUESTA A PUNTO','18-12-2023','15:05');
insert into avances_lineas_fabricacion values (5,1,'B11223344',3,'APROVISIONAMIENTO','01-10-2023','15:10');
insert into avances_lineas_fabricacion values (6,2,'B88888844',3,'APROVISIONAMIENTO','11-12-2023','20:15');
insert into avances_lineas_fabricacion values (7,2,'B88888844',4,'APROVISIONAMIENTO','21-12-2023','21:16');
insert into avances_lineas_fabricacion values (8,2,'B88888844',2,'PUESTA A PUNTO','01-12-2023','10:16');
insert into avances_lineas_fabricacion values (9,1,'B11223344',1,'APROVISIONAMIENTO','12-11-2023','01:25');
insert into avances_lineas_fabricacion values (10,1,'B11223344',5,'PUESTA A PUNTO','02-01-2024','20:25');
insert into avances_lineas_fabricacion values (11,2,'B88888844',5,'PUESTA A PUNTO','20-02-2024','21:26');
insert into avances_lineas_fabricacion values (12,2,'B88888844',2,'APROVISIONAMIENTO','31-12-2023','15:35');
insert into avances_lineas_fabricacion values (13,1,'B11223344',5,'APROVISIONAMIENTO','11-01-2024','21:37');
insert into avances_lineas_fabricacion values (14,2,'B88888844',5,'APROVISIONAMIENTO','03-03-2024','11:18');
insert into avances_lineas_fabricacion values (15,1,'B11223344',3,'MONTAJE','02-10-2023','01:50');
insert into avances_lineas_fabricacion values (16,1,'B11223344',1,'MONTAJE','12-11-2023','20:00');
insert into avances_lineas_fabricacion values (17,1,'B11223344',5,'MONTAJE','10-02-2024','11:50');
insert into avances_lineas_fabricacion values (18,1,'B88888844',3,'MONTAJE','03-01-2024','16:00');
insert into avances_lineas_fabricacion values (19,1,'B88888844',4,'MONTAJE','04-01-2024','01:50');
insert into avances_lineas_fabricacion values (20,1,'B88888844',2,'MONTAJE','04-01-2024','08:00');
insert into avances_lineas_fabricacion values (21,1,'B88888844',5,'MONTAJE','03-03-2024','15:50');
insert into avances_lineas_fabricacion values (22,1,'B23423455',3,'PUESTA A PUNTO','02-02-2024','10:05');
insert into avances_lineas_fabricacion values (23,1,'B23423455',1,'PUESTA A PUNTO','03-02-2024','21:10');
insert into avances_lineas_fabricacion values (24,1,'B23423455',2,'PUESTA A PUNTO','11-02-2024','11:11');
insert into avances_lineas_fabricacion values (25,1,'B23423455',1,'APROVISIONAMIENTO','13-02-2024','11:12');
insert into avances_lineas_fabricacion values (26,1,'B23423455',3,'APROVISIONAMIENTO','12-02-2024','08:00');
insert into avances_lineas_fabricacion values (27,1,'B23423455',2,'APROVISIONAMIENTO','01-03-2024','21:27');
insert into avances_lineas_fabricacion values (28,1,'B23423455',5,'PUESTA A PUNTO','02-03-2024','01:00');
insert into avances_lineas_fabricacion values (29,1,'B23423455',5,'APROVISIONAMIENTO','02-03-2024','21:00');
insert into avances_lineas_fabricacion values (30,1,'B23423455',3,'MONTAJE','28-02-2024','15:05');
insert into avances_lineas_fabricacion values (31,1,'B88888844',2,'FINALIZADO','02-02-2024','19:55');
insert into avances_lineas_fabricacion values (32,1,'B11223344',3,'FINALIZADO','03-10-2023','18:50');


-- Ejercicio 1
create table PROVEEDORES(
    id int primary key,
    nombre varchar2(100),
    telefono varchar2(12),
    id_pieza int
);
alter table PROVEEDORES add foreign key (id_pieza) references piezas(idpie);
insert into PROVEEDORES values (1,'tornillo S.L', null, 1);
insert into PROVEEDORES values (2,'motores slu', +34111111111, 12);
insert into PROVEEDORES values (3,'frenos lowcost', null, 13);

update PROVEEDORES SET telefono = '+34111111112' WHERE ID = 3; 

DELETE FROM PROVEEDORES WHERE id = 3; 

SELECT * FROM PROVEEDORES;
--Ejercicio 2
--2.1
select * from clientes;
select replace(nombre_empresa,' ','') from clientes where cif not in ('A%','E%', 'I%','O%','U%') ;
select substr(nombre_empresa,1,1) from clientes where cif not in ('A%','E%', 'I%','O%','U%') ;

--2.2
select * from piezas;

select nombre from piezas where nombre not like 'A%' and nombre not like 'E%' and nombre not like 'I%' and nombre not like 'O%' and nombre not like 'U%' 
    and estado = 'NUEVA';
    
--2.3
SELECT * FROM PIEZAS_MAQUINAS;
SELECT MAX(CANTIDAD)-MIN(CANTIDAD) || ' UNIDADES' "DIFERENCIA TOTAL" FROM PIEZAS_MAQUINAS;

--2.4
SELECT * FROM MAQUINAS;
SELECT LOWER(REPLACE(REPLACE(REPLACE(REPLACE(NOMBRE,'de',''),'para'),'industrial'),' '))||'.' FROM MAQUINAS;

--2.5
SELECT * FROM avances_lineas_fabricacion;
SELECT * FROM PIEZAS_MAQUINAS;
SELECT * FROM PIEZAS;

SELECT MAQUINAS.NOMBRE,PIEZAS.ESTADO FROM MAQUINAS JOIN PIEZAS_PIEZAS ON ;

--2.6
SELECT * FROM PIEZAS;
SELECT LOWER(NOMBRE) FROM PIEZAS WHERE TIPO = 'MECANICO' AND ESTADO = '2MANO';

--2.7
SELECT DISTINCT(NOMBRE) FROM PIEZAS ORDER BY NOMBRE DESC;

--2.8
SELECT IDPIE,UPPER(NOMBRE),TIPO,ESTADO FROM PIEZAS WHERE ESTADO = '2MANO';

--2.9
SELECT  COUNT(*) FROM AVANCES_LINEAS_FABRICACION WHERE TO_CHAR(FECHA,'DD-MM-YYYY')  = 'SUNDAY';

--2.10

--2.11
SELECT UPPER(REPLACE(NOMBRE_EMPRESA,' ',''))"NOMBRE EMPRESA",LOC FROM CLIENTES;

--2.12
SELECT * FROM AVANCES_LINEAS_FABRICACION;
SELECT NOMBRE FROM MAQUINAS WHERE ID_MAQUINA = (SELECT ID_MAQUINA FROM AVANCES_LINEAS_FABRICACION WHERE ESTADO = 'PUESTA A PUNTO' AND FECHA = '11-11-2023' AND HORA = '20:05');


