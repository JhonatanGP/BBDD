drop table neumaticos cascade constraints;
CREATE TABLE neumaticos (
    id int PRIMARY KEY,
    marca VARCHAR2(50),
    dureza INT,
    resistencia int,
    pais VARCHAR2(50)
);

drop table motores cascade constraints;
CREATE TABLE motores (
    ref char(5) PRIMARY KEY,
    nombre VARCHAR2(50),
    potencia INT,
    pais VARCHAR2(50)
);

drop table equipos cascade constraints;
CREATE TABLE equipos (
    codigo VARCHAR2(10) PRIMARY KEY,
    nombre VARCHAR2(50),
    localidad VARCHAR2(50),
    titulos_conseguidos INT,
    num_empleado INT,
    presupuesto NUMBER(10,2),
    responsable VARCHAR2(50),
    id_motor CHAR(5),
    id_neumatico INT,
    FOREIGN KEY (id_motor) REFERENCES  motores,
    FOREIGN KEY (id_neumatico) REFERENCES  neumaticos
);

drop table pilotos cascade constraints;
CREATE TABLE pilotos (
    id INT PRIMARY KEY,
    nombre VARCHAR2(50),
    apellidos VARCHAR2(50),
    nacionalidad VARCHAR2(100),
    num_victorias INT,
    fecha_nacimiento DATE,
    salario number(10,2),
    id_equipo VARCHAR2(10),
    FOREIGN KEY (id_equipo) REFERENCES equipos
);

drop table entrenamientos cascade constraints;
CREATE TABLE entrenamientos (
    id INT PRIMARY KEY,
    nombre VARCHAR2(50),
    ritmo VARCHAR2(50) CHECK(ritmo in ('BAJO','MEDIO','ALTO')),
    tipo VARCHAR2(50) CHECK(tipo in ('RESISTENCIA','RECTAS','CURVAS')),
    duracion INT
);

drop table pilotos_entrenamientos cascade constraints;
CREATE TABLE pilotos_entrenamientos (
    id_piloto INT,
    id_entrenamiento INT,
    fecha date,
    PRIMARY KEY (id_piloto, id_entrenamiento),
    FOREIGN KEY (id_piloto) REFERENCES pilotos,
    FOREIGN KEY (id_entrenamiento) REFERENCES entrenamientos
);

drop table carreras cascade constraints;
CREATE TABLE carreras (
    id INT PRIMARY KEY,
    circuito VARCHAR2(50),
    distancia_km INT,
    fecha DATE,
    numero_pruebas INT
);

drop table pilotos_carreras cascade constraints;
CREATE TABLE pilotos_carreras (
    id_piloto INT,
    id_carrera INT,
    posicion INT,
    PRIMARY KEY (id_piloto, id_carrera),
    FOREIGN KEY (id_piloto) REFERENCES pilotos,
    FOREIGN KEY (id_carrera) REFERENCES carreras
);


alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO neumaticos VALUES (1,'Bridgestone',90,99,'Japón');
INSERT INTO neumaticos VALUES (2,'Michelin',84,100,'Francia');
INSERT INTO neumaticos VALUES (3,'Pirelli',94,95,'Italia');
INSERT INTO neumaticos VALUES (4,'Goodyear',92,97,'Estados Unidos');

INSERT INTO motores VALUES ('M0001','Honda',650,'Japón');
INSERT INTO motores VALUES ('M0002','Yamaha',625,'Japón');
INSERT INTO motores VALUES ('M0003','Ducati',677,'Italia');
INSERT INTO motores VALUES ('M0004','Suzuki',633,'Japón');

INSERT INTO equipos VALUES ('AD10005','Equipo Honda 1','Tokio',70,320,28500000,'Pedro García','M0001',1);
INSERT INTO equipos VALUES ('AD10006', 'Equipo Suzuki 1', 'Paris',58,288,24521000, 'Luis Gómez','M0004',1);
INSERT INTO equipos VALUES ('AD10007', 'Equipo Suzuki 2', 'Madrid',15,120,18500000, 'María Pérez','M0004',4);
INSERT INTO equipos VALUES ('AD10008', 'Equipo KTM 1', 'Madrid',4,150,13400000, 'Antonio García','M0003',1);
INSERT INTO equipos VALUES ('AD10009', 'Equipo Honda 2', 'Chicago',72,341,29500000, 'Pedro Álvarez','M0001',1);
INSERT INTO equipos VALUES ('AD10010', 'Equipo KTM 2', 'Roma',22,300,24140000, 'Pedro Gómez','M0003',1);
INSERT INTO equipos VALUES ('AD10011', 'Equipo KTM 3', 'Milán',11,222,21500000, 'Pedro González','M0002',2);
INSERT INTO equipos VALUES ('AD10012', 'Equipo KTM 4', 'Valencia',12,190,20500000, 'Luis Martín','M0003',3);
INSERT INTO equipos VALUES ('AD10013', 'Equipo Yamaha 1', 'Londres',33,270,24111000, 'María García','M0002',2);
INSERT INTO equipos VALUES ('AD10014', 'Equipo Monster', 'Manchester',4,120,9900000, 'Ana Benítez','M0003',3);

INSERT INTO pilotos VALUES (1,'Jorge','Rossi Rossi','Italiano',13,'1994-03-12',200000,'AD10005');
INSERT INTO pilotos VALUES (2,'Jack','Viñales Morbidelli','Francés',0,'1994-09-30',211000,'AD10005');
INSERT INTO pilotos VALUES (3,'Valentino','Quartararo Lorenzo','Italiano',0,'2003-04-13',220000,'AD10006');
INSERT INTO pilotos VALUES (4,'Valentino','Márquez Bagnaia','Alemán',0,'1993-07-30',203000,'AD10007');
INSERT INTO pilotos VALUES (5,'Jack','Miller Márquez','Español',0,'1988-09-28',200040,'AD10008');
INSERT INTO pilotos VALUES (6,'Pecco','Rossi Quartararo','Español',1,'2005-11-07',205500,'AD10008');
INSERT INTO pilotos VALUES (7,'Marc','Quartararo Morbidelli','Español',20,'2001-09-22',204000,'AD10009');
INSERT INTO pilotos VALUES (8,'Fabio','Bagnaia Pedrosa','Español',15,'1988-02-27',260000,'AD10010');
INSERT INTO pilotos VALUES (9,'Franco','Miller Pedrosa','Español',23,'2007-01-03',210000,'AD10011');
INSERT INTO pilotos VALUES (10,'Maverick','Quartararo Márquez','Italiano',0,'1986-01-19',210000,'AD10012');
INSERT INTO pilotos VALUES (11,'Pecco','Pedrosa Lorenzo','Francés',19,'1988-05-05',211000,'AD10013');
INSERT INTO pilotos VALUES (12,'Fabio','Quartararo Rossi','Alemán',14,'2001-01-08',220000,'AD10014');
INSERT INTO pilotos VALUES (13,'Fabio','Márquez Rins','Inglés',27,'2006-11-26',240000,'AD10014');
INSERT INTO pilotos VALUES (14,'Franco','Quartararo Morbidelli','Australiano',6,'1991-07-05',300000,null);


INSERT INTO entrenamientos VALUES (1,'Resistencia','MEDIO','RESISTENCIA',66);
INSERT INTO entrenamientos VALUES (2,'Velocidad','ALTO','RECTAS',49);
INSERT INTO entrenamientos VALUES (3,'Técnica en curvas','BAJO','CURVAS',37);
INSERT INTO entrenamientos VALUES (4,'Frenado','MEDIO','CURVAS',112);
INSERT INTO entrenamientos VALUES (5,'Aceleración','ALTO','RECTAS',110);

INSERT INTO pilotos_entrenamientos VALUES (1,1,'2024-01-09');
INSERT INTO pilotos_entrenamientos VALUES (1,4,'2024-01-09');
INSERT INTO pilotos_entrenamientos VALUES (2,2,'2024-01-12');
INSERT INTO pilotos_entrenamientos VALUES (4,5,'2024-02-15');
INSERT INTO pilotos_entrenamientos VALUES (4,3,'2024-02-20');
INSERT INTO pilotos_entrenamientos VALUES (5,1,'2024-04-22');
INSERT INTO pilotos_entrenamientos VALUES (5,2,'2024-04-22');
INSERT INTO pilotos_entrenamientos VALUES (5,5,'2024-05-29');
INSERT INTO pilotos_entrenamientos VALUES (6,2,'2024-06-11');
INSERT INTO pilotos_entrenamientos VALUES (7,2,'2024-07-13');
INSERT INTO pilotos_entrenamientos VALUES (8,3,'2024-10-05');
INSERT INTO pilotos_entrenamientos VALUES (8,4,'2024-11-03');
INSERT INTO pilotos_entrenamientos VALUES (8,1,'2024-11-04');
INSERT INTO pilotos_entrenamientos VALUES (10,1,'2024-12-15');
INSERT INTO pilotos_entrenamientos VALUES (11,5,'2025-01-14');
INSERT INTO pilotos_entrenamientos VALUES (13,1,'2025-01-21');
INSERT INTO pilotos_entrenamientos VALUES (13,5,'2025-01-20');
INSERT INTO pilotos_entrenamientos VALUES (13,4,'2025-02-24');
INSERT INTO pilotos_entrenamientos VALUES (14,4,'2025-02-25');
INSERT INTO pilotos_entrenamientos VALUES (14,3,'2025-03-04');

INSERT INTO carreras VALUES (1,'Jerez',200,'2024-12-12',3);
INSERT INTO carreras VALUES (2,'Cataluña',100,'2025-01-19',3);
INSERT INTO carreras VALUES (3,'Valencia',200,'2024-08-09',3);
INSERT INTO carreras VALUES (4,'Le Mans',100,'2024-10-07',4);
INSERT INTO carreras VALUES (5,'Mugello',350,'2024-12-03',2);
INSERT INTO carreras VALUES (6,'Assen',100,'2025-02-15',3);
INSERT INTO carreras VALUES (7,'Silverstone',300,'2024-12-03',3);
INSERT INTO carreras VALUES (8,'Sepang',100,'2024-07-01',4);
INSERT INTO carreras VALUES (9,'Suzuka',250,'2024-10-27',2);
INSERT INTO carreras VALUES (10,'Austin',200,'2024-08-21',1);

INSERT INTO pilotos_carreras VALUES (1,3,12);
INSERT INTO pilotos_carreras VALUES (1,9,18);
INSERT INTO pilotos_carreras VALUES (2,8,2);
INSERT INTO pilotos_carreras VALUES (3,2,17);
INSERT INTO pilotos_carreras VALUES (4,9,8);
INSERT INTO pilotos_carreras VALUES (5,4,9);
INSERT INTO pilotos_carreras VALUES (6,8,2);
INSERT INTO pilotos_carreras VALUES (7,9,14);
INSERT INTO pilotos_carreras VALUES (8,2,3);
INSERT INTO pilotos_carreras VALUES (9,7,18);
INSERT INTO pilotos_carreras VALUES (2,3,14);
INSERT INTO pilotos_carreras VALUES (10,9,8);
INSERT INTO pilotos_carreras VALUES (3,5,20);
INSERT INTO pilotos_carreras VALUES (11,6,3);
INSERT INTO pilotos_carreras VALUES (12,1,7);
INSERT INTO pilotos_carreras VALUES (13,9,5);
INSERT INTO pilotos_carreras VALUES (14,6,6);
INSERT INTO pilotos_carreras VALUES (14,1,12);
INSERT INTO pilotos_carreras VALUES (12,4,1);
INSERT INTO pilotos_carreras VALUES (5,5,2);
INSERT INTO pilotos_carreras VALUES (6,7,20);
INSERT INTO pilotos_carreras VALUES (8,7,3);
INSERT INTO pilotos_carreras VALUES (8,5,8);
INSERT INTO pilotos_carreras VALUES (6,4,13);

--1.1
drop table entrevistas cascade constraints;
CREATE TABLE entrevistas (
    referencia INT primary key,
    entrevistador VARCHAR2(80),
    canal varchar2(70),
    id_piloto int,
    FOREIGN KEY (id_piloto) REFERENCES pilotos
);

--1.2
INSERT INTO entrevistas VALUES (1,'Luis Gómez','DAZN',1);
INSERT INTO entrevistas VALUES (2,'Luisa Álvarez','DAZN',3);
INSERT INTO entrevistas VALUES (3,'Manuel Pérez','MOVISTAR',5);
INSERT INTO entrevistas VALUES (4,'Anthony Rows','PLUSDEPORTES',6);
INSERT INTO entrevistas VALUES (5,'Michael Columns','MEXICO LINE',7);
INSERT INTO entrevistas VALUES (6,'Jessica Tables','SPORTS UK',1);
INSERT INTO entrevistas VALUES (7,'Isabel Benítez','MOVISTAR',9);

--1.3
update entrevistas set id_piloto = 8,entrevistador = 'John Films', canal = 'DAZN' where referencia = 5;

--1.4
delete from entrevistas where referencia = 7;

--2.1
select id,upper(nombre),upper(apellidos),upper(nacionalidad),num_victorias,fecha_nacimiento,salario,id_equipo from pilotos where fecha_nacimiento between '1986-01-02' and '1988-09-30';

--2.2
select lower(nombre),responsable from equipos where substr(responsable,instr(responsable,1),3)  in ('a','e','i','o','u');


--2.3
select (select sum(salario) from pilotos where nombre = 'Fabio')-(select sum(salario) from pilotos where nombre = 'Valentino')"Diferencia" from dual ;

--2.4
select * from motores;
select motores.nombre from motores join equipos on ref = id_motor where titulos_conseguidos between 50 and 60 and pais = 'Japón';

--2.5
select nombre,length(nombre)-length(replace(replace(nombre,'r',''),'R'))"Num.r" from entrenamientos ;
select nombre||' tiene ' ||to_char(length(nombre)-length(replace(replace(nombre,'r',''),'R')))||' letra r.' "Num.r" from entrenamientos ;

--2.6
select localidad from equipos join motores on id_motor = ref where potencia between 650 and 675;

--2.7
select pilotos.apellidos, pilotos_carreras.posicion from pilotos join pilotos_carreras on id = id_piloto join carreras on id_carrera = carreras.id where nacionalidad = 'Francés' and circuito = 'Sepang';

--2.8
select * from pilotos;
select fecha from pilotos_entrenamientos join pilotos on id_piloto = id where trim(to_char('DD-MM-YYYY','MONTH')) = 'JULIO' and id_equipo is not null ;
select fecha from pilotos_entrenamientos join pilotos on id_piloto = id where trim(to_char(substr(fecha_nacimiento,0,10),'MONTH')) = 'JULIO' and id_equipo is not null ;
select substr(fecha_nacimiento,0,10) from pilotos;

--2.9
select * from motores where substr(nombre,0,2) like '%u%' order by pais asc;

select substr(nombre,0,2) from motores;
--2.10
--select fecha from carreras where fecha ;

--2.11
select nombre ||' '||length(substr(apellidos,1,instr(apellidos,' '))) from pilotos where length(substr(apellidos,1,instr(apellidos,' '))) = (select min(length(substr(apellidos,1,instr(apellidos,' ')))) from pilotos);

--2.12
select lower(nombre),lower(apellidos),lower(nacionalidad) from pilotos where id_equipo is null;

--2.13

--2.14
select distinct(lower(nombre)) from pilotos where salario > 270000 and nacionalidad = 'Australiano';

--2.15
select marca,motores.nombre from neumaticos join equipos on id = id_neumatico join motores on id_motor = ref group by marca,motores.nombre having count(*) = 
    (select max(count(*)) from neumaticos join equipos on id = id_neumatico join motores on id_motor = ref group by marca,motores.nombre) order by marca asc;

--2.16
select * from equipos;
--select count(*) from pilotos join equipos on id_equipo = ;

set serveroutput on;
declare
    numero1 int := &introduce_num1;
    numero2 int := &introduce_num2;
begin
    dbms_output.put_line(numero1||numero2);
end;
/



