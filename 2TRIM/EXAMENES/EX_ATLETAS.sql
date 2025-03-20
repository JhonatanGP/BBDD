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
drop table empresas cascade constraints;
create table empresas(
    id int primary key,
    nombre_empresa varchar2(100),
    direccion varchar2(100),
    telefono varchar2(50),
    nif_club_pertenece char(9),    
    foreign key (nif_club_pertenece) references clubes(nif)
);

--1.2
INSERT INTO empresas VALUES (5,'asociación deporte sl','Glorieta real 2',null,'C24154935');
INSERT INTO empresas VALUES (6,'ferretería pérez','Principal 33',null,'C31006310');
INSERT INTO empresas VALUES (7,'club deportivo gómez',null,'+3411122233','C52766652');
INSERT INTO empresas VALUES (8,'complementos alimentarios',null,'123456789','C32808221');

--1.3
update empresas set telefono = '87654321', nif_club_pertenece = 'C21767463' where id = 5;

--1.4
delete from empresas where id = 6;

/*2.1 Devuelve el número de los dorsales que sea IMPAR que hayan participado en carreras ordenados por número de dorsal de menor a mayor.*/
SELECT DORSAL FROM CARRERAS_PARTICIPAN_ATLETAS WHERE MOD(DORSAL,2) <> 0 ORDER BY DORSAL ASC ;

/*2.2 Nombre del entrenamiento con la primera letra en mayús y el resto en minús, que tiene dureza entre 4 y 5, y la duración es 39.*/
SELECT INITCAP(NOMBRE)FROM ENTRENAMIENTOS WHERE DUREZA IN (4,5) AND DURACION = '39';

/*2.3 Si solo sumamos los minutos del tiempo que han empleado los participantes de la carrera 'Marcha solidaria', ¿qué valor da? (no tengas en 
cuenta horas ni segundos del tiempo, solo minutos)*/
SELECT SUM(TO_NUMBER(SUBSTR(TIEMPO,4,2)))"SUMA" FROM CARRERAS_PARTICIPAN_ATLETAS JOIN CARRERAS ON CARRERAS_PARTICIPAN_ATLETAS.CODIGO_CARRERA = CARRERAS.CODIGO 
    WHERE NOMBRE = 'Marcha solidaria';

/*2.4 ¿Cuál es el nombre del club donde está el atleta más mayor? Devuelve el resultado con todas las letras en mayúsculas.*/
SELECT UPPER(CLUBES.NOMBRE) FROM CLUBES JOIN ATLETAS ON CLUBES.NIF = ATLETAS.NIF_CLUB WHERE FECHA_NACIMIENTO = (SELECT MIN(FECHA_NACIMIENTO) FROM ATLETAS);

/*2.5 ¿Cuál es el dni y nombre del atleta más joven?*/
SELECT DNI,NOMBRE FROM ATLETAS WHERE FECHA_NACIMIENTO = (SELECT MAX(FECHA_NACIMIENTO) FROM ATLETAS);

/*2.6 Devuelve la localidad de la carrera y el número de veces que aparece la 'a'. Para esta segunda columna, usa el alias de columna "Num.a".*/
SELECT LOCALIDAD,LENGTH(LOCALIDAD)-LENGTH(replace(localidad,'a',''))"NUM.a" FROM CARRERAS;

/*2.7 Devuelve el nombre del mes de la fecha de inicio de inscripción en carreras (alias de columna "MES inicio") y el nombre del día de la semana
de la fecha de fin de inscripción en carreras (alias de columna "DÍA fin"), con todas las letras en mayúsculas para ambas columnas, para aquellas
carreras que NO se celebren en la localidad de "Madrid".*/
SELECT UPPER(TRIM(TO_CHAR(F_INICIO_INSCRIP,'MONTH')))"MES INICIO",UPPER(TRIM(TO_CHAR(F_FIN_INSCRIP,'DAY')))"DÍA FIN" FROM CARRERAS WHERE LOCALIDAD <> 'Madrid';

/*2.8 ¿Cuál es el nombre del atleta que ha realizado más entrenamientos?*/
SELECT ATLETAS.NOMBRE FROM ATLETAS JOIN atletas_realizan_entrenamientos ON DNI = DNI_ATLETA group by nombre having count(*) = 
    (SELECT MAX(COUNT(*)) FROM ATLETAS JOIN atletas_realizan_entrenamientos ON DNI = DNI_ATLETA  group by nombre);
    
/*2.9 Devuelve todos los campos de los clubes cuyo responsable tiene por apellido García y el nif del club tiene un 8 entre sus dígitos.*/
SELECT * FROM CLUBES WHERE RESPONSABLE LIKE '%García' AND NIF LIKE '%8%';

/*2.10 Se quiere saber el nombre, los apellidos y el número de carreras de los atletas que han participado en más carreras (máximo número de 
carreras). Ordena el resultado por orden alfabético de los apellidos de Z a A.*/
SELECT NOMBRE,APELLIDOS,COUNT(*) FROM ATLETAS JOIN carreras_participan_atletas ON DNI = DNI_ATLETA GROUP BY NOMBRE,APELLIDOS HAVING COUNT(*) =
    (SELECT MAX(COUNT(*)) FROM carreras_participan_atletas GROUP BY DNI_ATLETA) ORDER BY APELLIDOS DESC;

SELECT NOMBRE,APELLIDOS,COUNT(*) FROM ATLETAS JOIN carreras_participan_atletas ON DNI = DNI_ATLETA GROUP BY NOMBRE,APELLIDOS HAVING COUNT(*) =
    (SELECT MAX(COUNT(*)) FROM ATLETAS JOIN carreras_participan_atletas ON DNI = DNI_ATLETA GROUP BY NOMBRE,APELLIDOS) ORDER BY APELLIDOS DESC;

/*2.11 Indica el nombre, apellidos, número de caracteres del campo apellidos (ponle como alias de columnas "Num. caracteres") y número de victorias
como profesional del atleta que tiene más victorias.*/
SELECT NOMBRE, APELLIDOS, LENGTH(APELLIDOS) "NUM.CARAC", NUM_VICTORIAS_PROFESIONAL "NUM.VICT" FROM ATLETAS WHERE NUM_VICTORIAS_PROFESIONAL = 
    (SELECT MAX(NUM_VICTORIAS_PROFESIONAL) FROM ATLETAS);

/*2.12 Se quiere mostrar el nombre del club y el número de atletas que hay en él. Solo se quieren mostrar los clubes que tengan 2 atletas o menos.
Ordena el resultado de menor a mayor número de atletas y después por orden alfabético del nombre del club.*/
SELECT CLUBES.NOMBRE,COUNT(*) FROM CLUBES JOIN ATLETAS ON NIF = NIF_CLUB GROUP BY CLUBES.NOMBRE HAVING COUNT(*) <= 2 ORDER BY COUNT(*) ASC;

/*2.13 Se quiere el nombre, apellidos y fecha de nacimiento de los atletas que pertenecen al club 'Club Sevilla 2'. Ordena el resultado por la 
fecha de nacimiento, mostrando primero los atletas más jóvenes. NO USES JOIN, solo SUBCONSULTAS.*/
SELECT NOMBRE,APELLIDOS,FECHA_NACIMIENTO FROM ATLETAS WHERE NIF_CLUB=(SELECT NIF FROM CLUBES WHERE NOMBRE = 'Club Sevilla 2') ORDER BY FECHA_NACIMIENTO DESC;

/*2.14 Apellidos junto al nombre, separado por coma y en una única columna, de los atletas que hayan conseguido 25 o más victorias. Ejemplo: Rodríguez Rodríguez, David*/
SELECT APELLIDOS ||', '||NOMBRE FROM ATLETAS WHERE NUM_VICTORIAS_PROFESIONAL >= 25;

/*2.15 ¿Qué nombre de entrenamiento, sin repetir, han realizado los atletas del club 'Madrid sport'? Devuelve el resultado en mayúsculas.*/
SELECT DISTINCT(UPPER(entrenamientos.NOMBRE)) FROM entrenamientos JOIN ATLETAS_REALIZAN_ENTRENAMIENTOS ON entrenamientos.ID = ATLETAS_REALIZAN_ENTRENAMIENTOS.ID_ENTRENAMIENTO 
    JOIN ATLETAS ON ATLETAS_REALIZAN_ENTRENAMIENTOS.DNI_ATLETA = ATLETAS.DNI JOIN CLUBES ON NIF_CLUB = NIF WHERE CLUBES.NOMBRE = 'Madrid sport';
    
/*2.16 Indica el número de atletas que pertenecen al club 'Triana Club Deportivo'. Usa como alias de columna "Total". */
SELECT COUNT(*) FROM ATLETAS JOIN CLUBES ON NIF_CLUB = NIF WHERE CLUBES.NOMBRE = 'Triana Club Deportivo';

/*Ejercicio 3. (3p)
Se quiere un bloque de código anónimo en plsql que realice lo siguiente:
3.1 Pide que el usuario introduzca una fecha de nacimiento (ej.: '11/01/80').

3.2 Crea un registro llamado misAtletas que tenga los campos fecha de nacimiento y nombre de la tabla atletas (mismo nombre de campo y tipo de dato).
Luego crea una variable datosAtleta que sea del tipo misAtletas.

3.3 Se quiere saber si existe algún atleta con esa fecha de nacimiento introducida. Si no hay ninguno, mostrar por la salida el mensaje 
"No hay atletas con la fecha de nacimiento AAA". Ese AAA debe ser la fecha de nacimiento introducida por teclado.

3.4 Si hay más de un atleta con esa fecha de nacimiento, muestra el mensaje "Hay más de un atleta, concreta una fecha de nacimiento que sea única".

3.5 Si existe solo un atleta con esa fecha de nacimiento, muestra los nombres de las carreras en las que haya participado. Guarda en la variable 
datosAtleta el nombre y la fecha de nacimiento del atleta. */

set serveroutput on;
declare 
    fecha_nacIntrod date := '&fecha_nacimiento'; --3.1
    type misAtletas is record (nombre atletas.nombre%type, fecha_nac atletas.fecha_nacimiento%type); --3.2
    datosAtleta misAtletas;
    existeAtleta int := 0; --3.3
    --Necesito una variable dniAtleta para consultar
    dniAtleta atletas.dni%type;
    apAtleta atletas.apellidos%type;
    --Creo las variables cod
    minCod carreras.codigo%type;
    maxCod carreras.codigo%type;
    ExisteCar int:=0;
    nombreCar carreras.nombre%type;
begin
    select count(*) into existeAtleta from atletas where fecha_nacimiento = fecha_nacIntrod;
    if existeAtleta = 0 then -- NO EXISTE
        dbms_output.put_line('No hay atletas con la fecha de nacimiento ' || fecha_nacIntrod);
    elsif existeAtleta = 1 then -- SI EXISTE
        datosAtleta.fecha_nac :=  fecha_nacIntrod; --3.5 Se almacena la fecha de nacimiento en datosAtleta.fecha_nacimiento.
        --Se consulta el nombre y el DNI del atleta y se guardan en datosAtleta.nombre y dniAtleta.
       select nombre,dni,apellidos into datosAtleta.nombre,dniAtleta,apAtleta from atletas where fecha_nacimiento = fecha_nacIntrod; 
       --saco el cod min y max para usarlo en loop, para ello debo tener variables donde guardarlas
       select min(codigo) into minCod from carreras;
       select max(codigo) into maxCod from carreras;
            for i in minCod .. maxCod loop
-- Para cada código de carrera (i), se consulta en carreras_participan_atletas si hay registros donde dni_atleta = dniAtleta.Necesito var ExisteCar
                select count(*) into existeCar from carreras_participan_atletas where dni_atleta = dniAtleta and i = codigo_carrera;
                if existeCar >=1 then
                    select nombre into nombreCar from carreras  join carreras_participan_atletas on codigo = codigo_carrera where dni_atleta = dniAtleta and i = codigo_carrera; 
            dbms_output.put_line(nombreCar);
                end if;
            end loop;
            dbms_output.put_line('Atleta con fecha de nacimiento: '||fecha_nacIntrod||', es '||apAtleta||datosAtleta.nombre||' con DNI '||dniAtleta);
    else                                                                                              --3.4
        dbms_output.put_line('Hay más de un atleta, concreta una fecha de nacimiento que sea única');
    end if;
end;
/
select fecha_nacimiento from atletas order by fecha_nacimiento;
select min(codigo) from carreras;
select * from carreras;
select * from carreras_participan_atletas;

/*2.1 Devuelve el número de los dorsales que sea IMPAR que hayan participado en carreras ordenados por número de dorsal de menor a mayor.*/
select dorsal from carreras_participan_atletas where mod(dorsal,2) != 0 order by dorsal asc;

/*2.2 Nombre del entrenamiento con la primera letra en mayús y el resto en minús, que tiene dureza entre 4 y 5, y la duración es 39.*/
select initcap(nombre) from entrenamientos where dureza in (4,5) and duracion = 39; -- dureza between 4 and 5

/*2.3 Si solo sumamos los minutos del tiempo que han empleado los participantes de la carrera 'Marcha solidaria', ¿qué valor da? (no tengas en 
cuenta horas ni segundos del tiempo, solo minutos)*/
select sum(to_number(substr(tiempo,4,2)))"Tiempo" from carreras_participan_atletas join carreras on codigo_carrera = codigo where nombre = 'Marcha solidaria';

/*2.4 ¿Cuál es el nombre del club donde está el atleta más mayor? Devuelve el resultado con todas las letras en mayúsculas.*/
select upper(clubes.nombre),fecha_nacimiento from clubes join atletas on nif = nif_club where fecha_nacimiento = (select min(fecha_nacimiento) from atletas);

/*2.5 ¿Cuál es el dni y nombre del atleta más joven?*/
select nombre,dni from atletas where fecha_nacimiento = (select max(fecha_nacimiento) from atletas);

/*2.6 Devuelve la localidad de la carrera y el número de veces que aparece la 'a'. Para esta segunda columna, usa el alias de columna "Num.a".*/
select localidad,length(localidad) - length(replace(localidad,'a',''))"Num.a" from carreras ;

/*2.7 Devuelve el nombre del mes de la fecha de inicio de inscripción en carreras (alias de columna "MES inicio") y el nombre del día de la semana
de la fecha de fin de inscripción en carreras (alias de columna "DÍA fin"), con todas las letras en mayúsculas para ambas columnas, para aquellas
carreras que NO se celebren en la localidad de "Madrid".*/
select trim(to_char(f_inicio_inscrip,'MONTH')) "MES inicio", trim(to_char(f_fin_inscrip,'DAY')) "DÍA fin" from carreras where localidad != 'Madrid';

/*2.8 ¿Cuál es el nombre del atleta que ha realizado más entrenamientos?*/
select nombre from atletas join atletas_realizan_entrenamientos on dni = dni_atleta group by nombre having count(*) = 
    (select max(count(*)) from atletas join atletas_realizan_entrenamientos on dni = dni_atleta group by nombre);
    
/*2.9 Devuelve todos los campos de los clubes cuyo responsable tiene por apellido García y el nif del club tiene un 8 entre sus dígitos.*/
select * from clubes where responsable like '%García' and nif like '%8%';

/*2.10 Se quiere saber el nombre, los apellidos y el número de carreras de los atletas que han participado en más carreras (máximo número de 
carreras). Ordena el resultado por orden alfabético de los apellidos de Z a A.*/
select nombre,apellidos,count(*) from atletas join carreras_participan_atletas on dni = dni_atleta group by nombre,apellidos having count(*) =
    (select max(count(*)) from atletas join carreras_participan_atletas on dni = dni_atleta group by nombre,apellidos) order by apellidos desc;

/*2.11 Indica el nombre, apellidos, número de caracteres del campo apellidos (ponle como alias de columnas "Num. caracteres") y número de victorias
como profesional del atleta que tiene más victorias.*/
select nombre,apellidos,length(apellidos)"Num.Carac",num_victorias_profesional"Vict" from atletas where num_victorias_profesional = 
    (select max(num_victorias_profesional) from atletas);

/*2.12 Se quiere mostrar el nombre del club y el número de atletas que hay en él. Solo se quieren mostrar los clubes que tengan 2 atletas o menos.
Ordena el resultado de menor a mayor número de atletas y después por orden alfabético del nombre del club.*/
select clubes.nombre,count(*) from clubes join atletas on nif = nif_club group by clubes.nombre having count(*) <= 2 order by 2,1;

/*2.13 Se quiere el nombre, apellidos y fecha de nacimiento de los atletas que pertenecen al club 'Club Sevilla 2'. Ordena el resultado por la 
fecha de nacimiento, mostrando primero los atletas más jóvenes. NO USES JOIN, solo SUBCONSULTAS.*/
select atletas.nombre,apellidos,fecha_nacimiento from atletas where nif_club = (select nif from clubes where clubes.nombre = 'Club Sevilla 2')
    order by fecha_nacimiento desc;

/*2.14 Apellidos junto al nombre, separado por coma y en una única columna, de los atletas que hayan conseguido 25 o más victorias. Ejemplo: Rodríguez Rodríguez, David*/
select apellidos||', '||nombre from atletas where num_victorias_profesional >= 25;

/*2.15 ¿Qué nombre de entrenamiento, sin repetir, han realizado los atletas del club 'Madrid sport'? Devuelve el resultado en mayúsculas.*/
select distinct(upper(entrenamientos.nombre)) from entrenamientos join atletas_realizan_entrenamientos on id = id_entrenamiento join atletas on dni_atleta = dni
    join clubes on nif_club = nif where clubes.nombre = 'Madrid sport';
    
/*2.16 Indica el número de atletas que pertenecen al club 'Triana Club Deportivo'. Usa como alias de columna "Total". */
select count(*)"Total" from clubes join atletas on nif = nif_club where clubes.nombre = 'Triana Club Deportivo';

/*Ejercicio 3. (3p)
Se quiere un bloque de código anónimo en plsql que realice lo siguiente:
3.1 Pide que el usuario introduzca una fecha de nacimiento (ej.: '11/01/80').

3.2 Crea un registro llamado misAtletas que tenga los campos fecha de nacimiento y nombre de la tabla atletas (mismo nombre de campo y tipo de dato).
Luego crea una variable datosAtleta que sea del tipo misAtletas.

3.3 Se quiere saber si existe algún atleta con esa fecha de nacimiento introducida. Si no hay ninguno, mostrar por la salida el mensaje 
"No hay atletas con la fecha de nacimiento AAA". Ese AAA debe ser la fecha de nacimiento introducida por teclado.

3.4 Si hay más de un atleta con esa fecha de nacimiento, muestra el mensaje "Hay más de un atleta, concreta una fecha de nacimiento que sea única".

3.5 Si existe solo un atleta con esa fecha de nacimiento, muestra los nombres de las carreras en las que haya participado. Guarda en la variable 
datosAtleta el nombre y la fecha de nacimiento del atleta. */