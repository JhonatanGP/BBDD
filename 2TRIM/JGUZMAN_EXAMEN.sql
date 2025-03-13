drop table clubes cascade constraints;
create table clubes(
    nif char(9) primary key,
    nombre varchar2(50),
    localidad varchar2(50),
    telefono int,
    responsable varchar2(50)
);
drop table atletas cascade constraints;
create table atletas(
    dni char(9) primary key,
    tfno int,
    nombre varchar2(50),
    apellidos varchar2(50),
    licencia_federativa_profesional varchar2(50),
    num_victorias_profesional int,
    fecha_nacimiento date,
    nif_club char(9),
    foreign key(nif_club) references clubes(nif)
);
drop table entrenamientos cascade constraints;
create table entrenamientos(
    id int primary key,
    nombre varchar2(50),
    dureza int,
    duracion int
);
drop table atletas_realizan_entrenamientos cascade constraints;
create table atletas_realizan_entrenamientos(
    dni_atleta char(9),
    id_entrenamiento int,
    primary key(dni_atleta,id_entrenamiento),
    foreign key(dni_atleta) references atletas(dni),
    foreign key(id_entrenamiento) references entrenamientos(id)
);
drop table carreras cascade constraints;
create table carreras(
    codigo int primary key,
    f_fin_inscrip date,
    f_inicio_inscrip date,
    fecha date,
    localidad varchar2(50),
    nombre varchar2(50),
    tipoCarrera varchar2(50),
    premio int
);
drop table carreras_participan_atletas cascade constraints;
create table carreras_participan_atletas(
    codigo_carrera int,
    dni_atleta char(9),
    dorsal int,
    tiempo varchar2(9),
    primary key(codigo_carrera,dni_atleta),
    foreign key (codigo_carrera) references carreras(codigo),
    foreign key (dni_atleta) references atletas(dni)
);


alter session set nls_date_format='DD/MM/YYYY HH24:MI:SS';

INSERT INTO clubes VALUES ('C24154935', 'Club Atlético Málaga', 'Málaga', 685440882, 'Pedro García');
INSERT INTO clubes VALUES ('C47833338', 'Triana Club Deportivo', 'Sevilla', 691863039, 'Luis Gómez');
INSERT INTO clubes VALUES ('C70851375', 'Vallecas Deportivo', 'Madrid', 641282713, 'María Pérez');
INSERT INTO clubes VALUES ('C23820873', 'Atletismo Alicante', 'Alicante', 608277551, 'Antonio García');
INSERT INTO clubes VALUES ('C31006310', 'Atletismo Barcelona', 'Barcelona', 623150769, 'Pedro Álvarez');
INSERT INTO clubes VALUES ('C64455931', 'Club Atlético Valencia', 'Valencia', 689209746, 'Pedro Gómez');
INSERT INTO clubes VALUES ('C63427778', 'Club Atlético Bilbao', 'Bilbao', 616968226, 'Pedro González');
INSERT INTO clubes VALUES ('C65577382', 'Club Deportivo Murcia', 'Murcia', 610334594, 'Luis Martín');
INSERT INTO clubes VALUES ('C17902088', 'Club Sevilla 2', 'Sevilla', 615888364, 'María García');
INSERT INTO clubes VALUES ('C52766652', 'Club Madrid 1', 'Madrid', 689142484, 'Ana Benítez');
INSERT INTO clubes VALUES ('C53284900', 'Club Atlético Sevilla', 'Sevilla', 632903186, 'Antonio Casas');
INSERT INTO clubes VALUES ('C21767463', 'Club Atlético Barcelona 2', 'Barcelona', 683183764, 'Juan Gámez');
INSERT INTO clubes VALUES ('C32934541', 'Deportes en Madrid', 'Madrid', 617517928, 'Álvaro Olvera');
INSERT INTO clubes VALUES ('C98072233', 'Alicante sport', 'Alicante', 697503035, 'Pedro Jesús');
INSERT INTO clubes VALUES ('C32808221', 'Madrid sport', 'Madrid', 694640743, 'Antonio David García');

INSERT INTO atletas VALUES ('62895384O', 638263440, 'Iván', 'García Sánchez', 'LIC-5398-C', 27, '11/01/1980', 'C24154935');
INSERT INTO atletas VALUES ('86817706K', 679883852, 'Javier', 'Díaz Sánchez', 'LIC-3544-C', 15, '21/02/1980', 'C24154935');
INSERT INTO atletas VALUES ('90951440I', 687576619, 'Raúl', 'Gómez López', 'LIC-8644-A', 0, '11/05/1988', 'C24154935');
INSERT INTO atletas VALUES ('59592493Y', 679466709, 'Clara', 'Gómez Fernández', 'LIC-1411-A', 4, '22/11/1981', 'C47833338');
INSERT INTO atletas VALUES ('42521647W', 637092124, 'Elena', 'Fernández Martínez', 'LIC-2278-B', 0, '14/09/1983', 'C47833338');
INSERT INTO atletas VALUES ('16310539Z', 626581976, 'Laura', 'Sánchez Pérez', 'LIC-4605-A', 0, '14/03/1980', 'C70851375');
INSERT INTO atletas VALUES ('72643585M', 698379350, 'David', 'Díaz Díaz', 'LIC-6555-C', 15, '09/11/1990', 'C70851375');
INSERT INTO atletas VALUES ('54976888F', 610634349, 'Andrés', 'Gómez Gómez', 'LIC-1844-C', 1, '11/01/1991', 'C70851375');
INSERT INTO atletas VALUES ('39980291S', 634176643, 'David', 'Rodríguez Rodríguez', 'LIC-9445-B', 28, '18/08/1991', 'C23820873');
INSERT INTO atletas VALUES ('44940553B', 698548219, 'Laura', 'Gómez Díaz', 'LIC-2288-B', 0, '07/07/1995', 'C23820873');
INSERT INTO atletas VALUES ('43943310N', 609029675, 'María', 'Díaz Díaz', 'LIC-4184-B', 4, '03/01/1995', 'C31006310');
INSERT INTO atletas VALUES ('64049591M', 659900175, 'Carmen', 'Gómez Martínez', 'LIC-2191-C', 12, '07/03/1994', 'C31006310');
INSERT INTO atletas VALUES ('24994016Q', 665237565, 'Laura', 'López Martínez', 'LIC-8289-A', 8, '05/01/1999', 'C31006310');
INSERT INTO atletas VALUES ('79700980D', 666706063, 'Carmen', 'López González', 'LIC-3558-A', 0, '15/04/1998', 'C31006310');
INSERT INTO atletas VALUES ('57835389P', 654455900, 'Javier', 'Sánchez Gómez', 'LIC-9677-C', 11, '11/01/1990', 'C64455931');
INSERT INTO atletas VALUES ('87934270E', 686625118, 'Javier', 'Pérez Rodríguez', 'LIC-9501-B', 3, '19/05/1991', 'C64455931');
INSERT INTO atletas VALUES ('38496745A', 618757486, 'María', 'Díaz Pérez', 'LIC-7018-B', 0, '16/06/1983', 'C64455931');
INSERT INTO atletas VALUES ('44295008S', 640095151, 'Isabel', 'López Gómez', 'LIC-7074-B', 0, '22/01/1980', 'C64455931');
INSERT INTO atletas VALUES ('47886254T', 681843584, 'Fernando', 'González Gómez', 'LIC-5173-C', 0, '21/07/1992', 'C63427778');
INSERT INTO atletas VALUES ('67219847Z', 618135682, 'Iván', 'García Martínez', 'LIC-8172-B', 0, '11/08/1992', 'C63427778');
INSERT INTO atletas VALUES ('33877585S', 695292043, 'Andrea', 'Gómez Pérez', 'LIC-6921-B', 0, '01/09/1999', 'C63427778');
INSERT INTO atletas VALUES ('39856868S', 672848686, 'Elena', 'González Díaz', 'LIC-5354-B', 0, '31/10/2001', 'C65577382');
INSERT INTO atletas VALUES ('22544320Q', 634609601, 'Carmen', 'González Díaz', 'LIC-8611-A', 14, '22/02/2002', 'C65577382');
INSERT INTO atletas VALUES ('82786500Z', 696202656, 'Marcos', 'López Rodríguez', 'LIC-4516-A', 0, '05/01/1990', 'C65577382');
INSERT INTO atletas VALUES ('61908017D', 633501312, 'Andrés', 'Martínez Sánchez', 'LIC-8554-C', 0, '11/09/1984', 'C65577382');
INSERT INTO atletas VALUES ('19655885U', 654753955, 'Andrea', 'Díaz Rodríguez', 'LIC-9548-B', 1, '11/09/1990', 'C65577382');
INSERT INTO atletas VALUES ('10013970G', 677484763, 'Elena', 'García Gómez', 'LIC-1375-B', 13, '11/11/1981', 'C17902088');
INSERT INTO atletas VALUES ('28402597X', 686470478, 'David', 'González Díaz', 'LIC-7221-C', 15, '12/12/1982', 'C17902088');
INSERT INTO atletas VALUES ('41622317T', 631744841, 'Raúl', 'García López', 'LIC-2487-A', 28, '22/01/1982', 'C17902088');
INSERT INTO atletas VALUES ('29727932A', 689385098, 'Fernando', 'González Díaz', 'LIC-9048-A', 0, '05/01/1985', 'C17902088');
INSERT INTO atletas VALUES ('26595453L', 601327269, 'Andrea', 'Sánchez Pérez', 'LIC-1476-B', 0, '19/11/1994', 'C17902088');
INSERT INTO atletas VALUES ('89391702Q', 617529349, 'Andrés', 'Fernández Gómez', 'LIC-5010-C', 0, '14/01/1995', 'C52766652');
INSERT INTO atletas VALUES ('50074162V', 697246581, 'Javier', 'Sánchez Gómez', 'LIC-9713-B', 10, '05/02/1990', 'C53284900');
INSERT INTO atletas VALUES ('34440101S', 693427368, 'Carlos', 'Sánchez Pérez', 'LIC-3415-C', 0, '22/01/1980', 'C53284900');
INSERT INTO atletas VALUES ('64455622L', 672317439, 'Alejandro', 'González González', 'LIC-2504-A', 0, '16/03/1984', 'C53284900');
INSERT INTO atletas VALUES ('48687742F', 603637647, 'Laura', 'Fernández González', 'LIC-2454-A', 30, '11/05/1990', 'C21767463');
INSERT INTO atletas VALUES ('92544255H', 668010406, 'Andrés', 'Gómez Fernández', 'LIC-2527-B', 0, '11/01/1985', 'C21767463');
INSERT INTO atletas VALUES ('19339612H', 602729613, 'Elena', 'Gómez Gómez', 'LIC-1772-C', 0, '05/02/1980', 'C32934541');
INSERT INTO atletas VALUES ('26284619X', 633585762, 'Elena', 'Rodríguez Pérez', 'LIC-3425-C', 2, '05/02/1990', 'C98072233');
INSERT INTO atletas VALUES ('40076620C', 608204875, 'Javier', 'Díaz Martínez', 'LIC-5024-A', 22, '22/01/1985', 'C32808221');


INSERT INTO entrenamientos VALUES (1, 'Fuerza', 2, 73);
INSERT INTO entrenamientos VALUES (2, 'Velocidad', 5, 39);
INSERT INTO entrenamientos VALUES (3, 'Resistencia', 4, 67);
INSERT INTO entrenamientos VALUES (4, 'Técnica', 10, 48);
INSERT INTO entrenamientos VALUES (5, 'Flexibilidad', 10, 87);


INSERT INTO atletas_realizan_entrenamientos VALUES ('40076620C',1);
INSERT INTO atletas_realizan_entrenamientos VALUES ('26284619X',1);
INSERT INTO atletas_realizan_entrenamientos VALUES ('19339612H',1);
INSERT INTO atletas_realizan_entrenamientos VALUES ('92544255H',2);
INSERT INTO atletas_realizan_entrenamientos VALUES ('48687742F',3);
INSERT INTO atletas_realizan_entrenamientos VALUES ('64455622L',4);
INSERT INTO atletas_realizan_entrenamientos VALUES ('34440101S',4);
INSERT INTO atletas_realizan_entrenamientos VALUES ('50074162V',5);
INSERT INTO atletas_realizan_entrenamientos VALUES ('40076620C',5);


INSERT INTO carreras VALUES ('1001','28/02/2024','01/02/2024','15/03/2024','Madrid','Grand Prix Madrid','Urbana',5500);
INSERT INTO carreras VALUES ('1002','01/03/2024','01/01/2024','21/05/2024','Barcelona','Marcha solidaria','Solidaria',6500);
INSERT INTO carreras VALUES ('1003','31/05/2024','01/01/2024','01/06/2024','Madrid','Carrera popular','Urbana',7500);
INSERT INTO carreras VALUES ('1004','31/08/2024','01/05/2024','15/09/2024','Sevilla','Nocturna Sevillana','Nocturna',2000);
INSERT INTO carreras VALUES ('1005','30/09/2024','01/09/2024','12/11/2024','Córdoba','Competición 2','Montaña',3000);

INSERT INTO carreras_participan_atletas VALUES ('1001','40076620C',7801,'01h20m34s');
INSERT INTO carreras_participan_atletas VALUES ('1001','26284619X',1801,'01h21m04s');
INSERT INTO carreras_participan_atletas VALUES ('1001','19339612H',2801,'01h21m24s');
INSERT INTO carreras_participan_atletas VALUES ('1001','92544255H',3801,'01h22m11s');
INSERT INTO carreras_participan_atletas VALUES ('1001','48687742F',4801,'01h22m14s');
INSERT INTO carreras_participan_atletas VALUES ('1001','64455622L',5801,'01h25m33s');

INSERT INTO carreras_participan_atletas VALUES ('1002','40076620C',6802,'02h02m04s');
INSERT INTO carreras_participan_atletas VALUES ('1002','26284619X',7801,'02h21m34s');
INSERT INTO carreras_participan_atletas VALUES ('1002','19339612H',7433,'03h29m34s');
INSERT INTO carreras_participan_atletas VALUES ('1002','92544255H',8151,'03h05m34s');
INSERT INTO carreras_participan_atletas VALUES ('1002','48687742F',9875,'03h11m10s');
INSERT INTO carreras_participan_atletas VALUES ('1002','64455622L',1206,'03h11m14s');
INSERT INTO carreras_participan_atletas VALUES ('1002','62895384O',1881,'03h11m25s');
INSERT INTO carreras_participan_atletas VALUES ('1002','86817706K',2497,'04h45m34s');
INSERT INTO carreras_participan_atletas VALUES ('1002','90951440I',3618,'05h50m13s');
INSERT INTO carreras_participan_atletas VALUES ('1002','42521647W',4601,'06h11m34s');

INSERT INTO carreras_participan_atletas VALUES ('1003','40076620C',4807,'01h21m34s');
INSERT INTO carreras_participan_atletas VALUES ('1003','26284619X',5418,'01h22m14s');
INSERT INTO carreras_participan_atletas VALUES ('1003','19339612H',6819,'01h23m29s');
INSERT INTO carreras_participan_atletas VALUES ('1003','92544255H',7825,'01h24m58s');
INSERT INTO carreras_participan_atletas VALUES ('1003','48687742F',8639,'01h25m57s');
INSERT INTO carreras_participan_atletas VALUES ('1003','64455622L',9851,'01h26m35s');
INSERT INTO carreras_participan_atletas VALUES ('1003','62895384O',1869,'01h26m13s');

INSERT INTO carreras_participan_atletas VALUES ('1004','40076620C',1809,'01h10m34s');
INSERT INTO carreras_participan_atletas VALUES ('1004','26284619X',3119,'01h12m22s');
INSERT INTO carreras_participan_atletas VALUES ('1004','19339612H',4102,'01h21m11s');
INSERT INTO carreras_participan_atletas VALUES ('1004','92544255H',6351,'01h24m14s');
INSERT INTO carreras_participan_atletas VALUES ('1004','64455622L',7461,'01h26m04s');

INSERT INTO carreras_participan_atletas VALUES ('1005','40076620C',7801,'01h20m34s');
INSERT INTO carreras_participan_atletas VALUES ('1005','26284619X',8809,'01h21m32s');
INSERT INTO carreras_participan_atletas VALUES ('1005','92544255H',9828,'01h22m11s');
INSERT INTO carreras_participan_atletas VALUES ('1005','48687742F',1807,'02h10m15s');
INSERT INTO carreras_participan_atletas VALUES ('1005','64455622L',2871,'02h11m19s');
INSERT INTO carreras_participan_atletas VALUES ('1005','62895384O',3806,'02h13m22s');
INSERT INTO carreras_participan_atletas VALUES ('1005','86817706K',4841,'02h15m45s');
INSERT INTO carreras_participan_atletas VALUES ('1005','90951440I',5805,'02h45m47s');
INSERT INTO carreras_participan_atletas VALUES ('1005','42521647W',6831,'03h20m49s');
INSERT INTO carreras_participan_atletas VALUES ('1005','64049591M',7804,'04h21m51s');
INSERT INTO carreras_participan_atletas VALUES ('1005','24994016Q',8201,'04h22m52s');
INSERT INTO carreras_participan_atletas VALUES ('1005','44940553B',9803,'04h23m54s');

commit;

--1.1
drop table empresas;
create table empresas(
    id int,
    nombre_empresa varchar2(100) primary key,
    direccion varchar2(100),
    telefono varchar2(50),
    nif_club_pertenece char(9),
    foreign key (nif_club_pertenece) references clubes(nif)
);
--1.2
INSERT INTO empresas VALUES (5,'asociación deportes sl','Glorieta real 2', null,'C24154935');
INSERT INTO empresas VALUES (6,'ferretería pérez','Principal 33', null,'C31006310');
INSERT INTO empresas VALUES (7,'club deportivo gómez','null','+34111222333','C52766652');
INSERT INTO empresas VALUES (8,'complementos alimentarios','null', '123456789','C32808221');
--1.3
update empresas set telefono = '987654321',nif_club_pertenece = 'C21767463' where id = 5;
--1.4
delete from empresas where id = 6;

--2.1
select * from CARRERAS_PARTICIPAN_ATLETAS;
select dorsal from CARRERAS_PARTICIPAN_ATLETAS where mod(dorsal,2) < 1 ;

--2.2
select * from entrenamientos;
select initcap(nombre) from entrenamientos where dureza in (4,5) and duracion = 39;

--2.3
select * from CARRERAS_PARTICIPAN_ATLETAS;
select tiempo from carreras join CARRERAS_PARTICIPAN_ATLETAS on carreras.codigo = CARRERAS_PARTICIPAN_ATLETAS.codigo_carrera
    where nombre = 'Marcha solidaria' ;
select to_char(tiempo,'MI') from CARRERAS_PARTICIPAN_ATLETAS;

--2.4
select upper(clubes.nombre)"NOMBRE" from clubes join atletas on clubes.nif = atletas.nif_club where atletas.fecha_nacimiento = 
  (select min(fecha_nacimiento) from atletas) ;

--2.5
select dni,nombre from atletas where atletas.fecha_nacimiento = (select max(fecha_nacimiento) from atletas) ;

--2.6
select localidad,count() from carreras where localidad = ();

--2.7
select * from carreras;
select upper(trim(to_char(f_inicio_inscrip,'MONTH'))) "MES inicio", upper(to_char(f_fin_inscrip,'DAY')) "DÍA fin" from carreras where localidad != 'Madrid';

--2.8
select atletas.nombre from atletas join atletas_realizan_entrenamientos on atletas.dni = atletas_realizan_entrenamientos.dni_atleta ;
select atletas.nombre,count(atletas.nombre) from atletas join atletas_realizan_entrenamientos on atletas.dni = atletas_realizan_entrenamientos.dni_atleta group by atletas.nombre;

--2.9
select nif,nombre,localidad,telefono,trim(substr(responsable,instr(responsable,' '))) from clubes where nif like '%8%' and trim(substr(responsable,instr(responsable,' '))) = 'García' ;

--2.10
select * from entrenamientos;
select * from atletas_realizan_entrenamientos;
select * from clubes;


--2.11
select nombre,apellidos,length(apellidos)"Num.caracteres",num_victorias_profesional from atletas where num_victorias_profesional = (select max(num_victorias_profesional) from atletas);

--2.12
select clubes.nombre from clubes join atletas on clubes.nif = atletas.nif_club ;

--2.13
select * from atletas; 
select nombre,apellidos,fecha_nacimiento from atletas where nif_club = 'C17902088' order by fecha_nacimiento desc;
select nombre,apellidos,fecha_nacimiento from atletas where nif_club = (select ) order by fecha_nacimiento desc;

--2.14
select apellidos||','|| nombre "NOMBRE" from atletas where NUM_VICTORIAS_PROFESIONAL >= 25;

--2.15
select * from clubes;
select * from entrenamientos;

select distinct(entrenamientos.nombre) from entrenamientos join ATLETAS_REALIZAN_ENTRENAMIENTOS on entrenamientos.id = ATLETAS_REALIZAN_ENTRENAMIENTOS.id_entrenamiento 
    join atletas on ATLETAS_REALIZAN_ENTRENAMIENTOS.dni_atleta = atletas.dni
    join clubes on atletas.nif_club = clubes.nif where clubes.nombre = 'Madrid sport';

--2.16
select sum(atletas.dni)  from entrenamientos join ATLETAS_REALIZAN_ENTRENAMIENTOS on entrenamientos.id = ATLETAS_REALIZAN_ENTRENAMIENTOS.id_entrenamiento 
    join atletas on ATLETAS_REALIZAN_ENTRENAMIENTOS.dni_atleta = atletas.dni
    join clubes on atletas.nif_club = clubes.nif where clubes.nombre = 'Triana Club Deportivo';

select sum(atletas.dni)"Total" from atletas join clubes on atletas.nif_club = clubes.nombre where clubes.nombre = 'Triana Club Deportivo';


set serveroutput on; 

declare
fecha varchar := '&ingrese_fecha_nacimiento';
begin
    
end;
/




