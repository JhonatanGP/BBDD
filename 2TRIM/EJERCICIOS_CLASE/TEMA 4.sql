ALTER SESSION SET nls_date_format='DD-MM-YYYY HH24:MI:SS';
DROP TABLE FUTBOLISTAS CASCADE CONSTRAINTS;
DROP TABLE EQUIPOS CASCADE CONSTRAINTS;
DROP TABLE PARTIDOS CASCADE CONSTRAINTS;

CREATE TABLE FUTBOLISTAS(
ID CHAR(6) PRIMARY KEY CHECK( REGEXP_LIKE( ID, 'F[0-9][0-9][0-9]20' )),
NOMBRE VARCHAR(100),
APELLIDOS VARCHAR(300),
FECHA_NACIMIENTO DATE,
POSICION VARCHAR(50) CHECK( POSICION LIKE 'PORTERO' OR POSICION LIKE 'DEFENSA' OR POSICION LIKE 'MEDIOCENTRO' OR POSICION LIKE 'DELANTERO' ),
SALARIO NUMBER(12,2) CHECK( SALARIO > 50000),
ID_EQUIPO INT
);

CREATE TABLE EQUIPOS(
ID INT PRIMARY KEY,
NOMBRE VARCHAR(100),
ESTADIO VARCHAR(100),
PRESUPUESTO NUMBER(20,2)
);

CREATE TABLE PARTIDOS(
ID INT PRIMARY KEY,
ARBITRO VARCHAR(200),
RESULTADO VARCHAR(5) CHECK( REGEXP_LIKE( RESULTADO, '[0-9][0-9]-[0-9][0-9]' )),
ESTADIO VARCHAR(100),
FECHA DATE,
ID_EQUIPO_CASA INT,
ID_EQUIPO_FUERA INT
);

ALTER TABLE FUTBOLISTAS
ADD CHECK (FECHA_NACIMIENTO > '31/DEC/1974');
ALTER TABLE FUTBOLISTAS
ADD FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID);

ALTER TABLE PARTIDOS
ADD FOREIGN KEY (ID_EQUIPO_CASA) REFERENCES EQUIPOS(ID);
ALTER TABLE PARTIDOS
ADD FOREIGN KEY (ID_EQUIPO_FUERA) REFERENCES EQUIPOS(ID);

DELETE FROM EQUIPOS;
INSERT INTO EQUIPOS VALUES (1,'EQUIPO A', 'ESTADIO A',1000000);
INSERT INTO EQUIPOS VALUES (2,'EQUIPO B', 'ESTADIO B',2000000);
INSERT INTO EQUIPOS VALUES (3,'EQUIPO C', 'ESTADIO C',3000000);

DELETE FROM FUTBOLISTAS;
INSERT INTO FUTBOLISTAS VALUES ('F00120','PEDRO','GOMEZ','22/01/1980','PORTERO',100000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00220','PEDRO LUIS','GOMEZ','20/04/1985','DEFENSA',110000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00320','LUIS','GALVEZ','12/01/1990','DELANTERO',80000,1);
INSERT INTO FUTBOLISTAS VALUES ('F00420','ANTONIO','DOMINGUEZ','25/06/1981','PORTERO',340000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00520','JESUS','FERNANDEZ','02/01/1995','MEDIOCENTRO',140000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00620','DIEGO','DIAZ','05/04/1987','PORTERO',160000,2);
INSERT INTO FUTBOLISTAS VALUES ('F00720','PABLO','CARO','27/01/1988','DEFENSA',200000,3);
INSERT INTO FUTBOLISTAS VALUES ('F00820','ESTEBAN','BENITEZ','29/09/2000','DEFENSA',300000,3);
INSERT INTO FUTBOLISTAS VALUES ('F00920','ENRIQUE','ALVAREZ','30/09/2001','MEDIOCENTRO',120000,3);

DELETE FROM PARTIDOS;
INSERT INTO PARTIDOS VALUES (1,'ARBITRO A','00-00','ESTADIO A','01/01/2020',1,2);
INSERT INTO PARTIDOS VALUES (2,'ARBITRO B','01-00','ESTADIO A','08/01/2020',1,3);
INSERT INTO PARTIDOS VALUES (3,'ARBITRO C','01-01','ESTADIO B','15/01/2020',2,3);
INSERT INTO PARTIDOS VALUES (4,'ARBITRO B','02-00','ESTADIO B','22/01/2020',2,1);
INSERT INTO PARTIDOS VALUES (5,'ARBITRO A','04-01','ESTADIO C','29/01/2020',3,1);
INSERT INTO PARTIDOS VALUES (6,'ARBITRO A','03-03','ESTADIO C','05/02/2020',3,2);

UPDATE FUTBOLISTAS SET ID_EQUIPO = 2 WHERE ID LIKE 'F00120';
UPDATE FUTBOLISTAS SET ID_EQUIPO = 3 WHERE ID LIKE 'F00420';
UPDATE FUTBOLISTAS SET ID_EQUIPO = 1 WHERE ID LIKE 'F00920';

DELETE FROM FUTBOLISTAS WHERE ID LIKE 'F00120' OR ID LIKE 'F00420';

--PDF 1 TEMA 4
 /*EJ 1 
?Obtén el nombre de todos los futbolistas de la base de datos. 
? Ahora queremos saber la posición que ocupan estos futbolistas (aunque se repitan los valores).
? Se quiere saber las posiciones existentes por lo que se requiere la posición de los futbolistas sin que se repitan los valores.*/
SELECT * FROM FUTBOLISTAS;
SELECT NOMBRE FROM FUTBOLISTAS;
SELECT POSICION FROM FUTBOLISTAS;
SELECT DISTINCT POSICION FROM FUTBOLISTAS;

SELECT * FROM PARTIDOS;
SELECT ESTADIO "ESTADIO", ID_EQUIPO_CASA "ID LOCAL" FROM PARTIDOS;

/*EJ 2
? Obtén todas las posiciones posibles (diferentes) de los futbolistas bajo el encabezado “Demarcaciones”.
? Muestra todos los datos almacenados de todos los futbolistas. */
SELECT DISTINCT POSICION "DEMARCACIONES" FROM FUTBOLISTAS;
SELECT * FROM FUTBOLISTAS;

/* EJ 3
? Devuelve los apellidos de los futbolistas que su posición sea DEFENSA. Aplica un alias a apellidos
para que se muestre “Futbolista” y asigna el alias F a la tabla futbolistas. */
SELECT F.APELLIDOS "FUTBOLISTA" FROM FUTBOLISTAS F WHERE F.POSICION = 'DEFENSA';

SELECT * FROM FUTBOLISTAS ORDER BY NOMBRE;
SELECT * FROM futbolistas ORDER BY 2; --ES LO MISMO

/*Ejercicio 4
Devuelve los apellidos de los futbolistas que su posición sea DEFENSA ordenador de la Z a la A.*/
SELECT APELLIDOS FROM FUTBOLISTAS WHERE POSICION  = 'DEFENSA' ORDER BY APELLIDOS DESC;

/*Ejercicio 5
Devuelve todos los datos de futbolistas ordenados primero por posición y luego por apellidos.*/
SELECT * FROM FUTBOLISTAS ORDER BY POSICION,APELLIDOS;

--  DUAL Y OPERADORES
SELECT * FROM DUAL;
SELECT 5*4 AS "RESULTADO" FROM DUAL;

SELECT *FROM futbolistas;
SELECT NOMBRE FROM FUTBOLISTAS WHERE NOMBRE LIKE 'P%'; -- % DETRAS DE % DA IGUAL LA PRIMERA DEBE SER P
SELECT NOMBRE FROM FUTBOLISTAS WHERE NOMBRE LIKE '%E%'; -- % PARA QUE EMPIECE O TERMINE PERO QUE TENGA E 
SELECT NOMBRE FROM FUTBOLISTAS WHERE NOMBRE LIKE '_E%'; -- % DELANTE DE E SE PONE _ PUEDE SER CUALQUIERA, DETRAS DE % DA IGUAL
SELECT NOMBRE FROM FUTBOLISTAS WHERE NOMBRE LIKE '%E'; -- % QUE TERMINE EN E

/*Ejercicio 6
? Obtén el nombre de los futbolistas que cobran más de 150.000 euros (SALARIO).
? Muestra el ID de los futbolistas cuyo apellido sea GÓMEZ.
? Indica los apellidos de los futbolistas que empiezan por G.
? Devuelve todos los datos de los futbolistas cuya posición sea DEFENSA o DELANTERO.
? Obtén el nombre de los futbolistas que cobran entre 100.000 y 200.000 euros (SALARIO). */
SELECT NOMBRE FROM FUTBOLISTAS WHERE SALARIO > 150000;
SELECT ID FROM FUTBOLISTAS WHERE APELLIDOS = 'GOMEZ';
SELECT ID FROM FUTBOLISTAS WHERE APELLIDOS LIKE 'G%';

--ejercicio 6
select nombre from futbolistas where salario > 150000;
select id from futbolistas where apellidos = 'GOMEZ';
select apellidos from futbolistas where apellidos like 'G%';
select * from futbolistas where posicion = 'DEFENSA' or posicion = 'DELANTERO';
select * from futbolistas where posicion in ('DEFENSA','POSICION');
select nombre from futbolistas where salario between 100000 and 200000;
select nombre from futbolistas where salario > 100000 and salario < 200000;
select 4*5+2 from dual;
--SEGUIMOS POR LA TRANSPARENCIA 37

--5/12/2024

--Ejercicio 7
select nombre,apellidos "Apellidos",salario*1.10 "Nuevo salario" from futbolistas where posicion = 'PORTERO'order by apellidos;
ALTER SESSION SET nls_date_format='DD/MM/YYYY';
select 'hola' || sysdate from dual;
select 'La posición del futbolista ' || nombre || ' es ' || posicion "Descripción de los futbolistas" from futbolistas;
--Función concat(cad1,cad2) --> cad1cad2
select concat('hola',sysdate) from dual;
--Ejercicio 8
select nombre || ' es ' || posicion "Posiciones" from futbolistas;
 
select futbolistas.nombre || ' juega en ' || equipos.nombre from futbolistas,equipos where id_equipo = equipos.id;
--multitabla
--join
--subconsultas
 
--Ejercicio 9
select * from futbolistas where (salario > 150000) and (posicion = 'DEFENSA');
select * from futbolistas where (posicion = 'DEFENSA') and (salario > 150000);
 
--Ejercicio 11
select upper(lower(nombre)),salario,salario*1.5 || ' euros' "Salario bruto"	from futbolistas;
select concat(concat(id,' '),concat(nombre || ' ',apellidos)) "Ejemplo concat" from futbolistas;

select  nombre,salario,salario*1.5 || ' euros' "Salario Bruto" from futbolistas;

--18/12/2024 transaparencia 54
select upper(substr('hola',1,1))||'ola' from dual;
select initcap('hola') from dual;
--CONCAT() ||
select concat(concat(concat(concat(concat('1','.'),' '),'soy'),' '),'groot') from dual;
--1. Soy groot
select ceil(11) from dual;
select ceil(11.9) from dual;
select ceil(11.1) from dual;
select floor(11) from dual;
select floor(11.9) from dual;
select floor(11.1) from dual;
select mod(10,6) from dual; 
--10 / 6 = 1 _ 4
select power(10,2) from dual;
select round(17.5) from dual;
select round(17.4) from dual;
select round(17.4346,-1) from dual;
select sign(-5) from dual;

/*Ejercicio 12
Realiza las siguientes operaciones utilizando funciones numéricas:
1. Calcula el valor absoluto de -10.
2. Obtén el exponente en base e de 4.
3. Redondea el número 15,3 a 16.
4. Redondea el número anterior (15,3) a 15.
5. Calcula el resto de 15 entre 3 (15/3).
6. Eleva 15 al exponente 2 (152). */

select abs(-10) from dual;
select exp(4) from dual;
select ceil(15.3) from dual;
select round(15.3) from dual;
select ceil(15.3) from dual;


--  2 TRIMESTRE 8 DE ENERO 2025

/* DIAPOSITIVA 71. REPLACE(CADENA,ANT,NUEVA). Devuelve cadena donde se ha sustituido la aparición de 
ant por la cadena nue en todos los casos */

--SUSTITUIR LA LETRA O POR * EN LOS NOMBRES ANTERIORES
SELECT REPLACE(NOMBRE,'O','*') "NOMBRE" FROM FUTBOLISTAS;

-- QUIERO QUE LA QUERY ANTERIOR SEA INSENSIBLE A MAYUS Y MINUS
SELECT REPLACE(LOWER(NOMBRE),'o','*') "NOMBRE" FROM FUTBOLISTAS;
SELECT REPLACE(REPLACE(NOMBRE,'o','*'),'O','*') "NOMBRE" FROM FUTBOLISTAS;

select * from futbolistas where posicion = 'DEFENSA' and nombre like 'P%' order by nombre desc;
--Sustituir la letra O por * en los nombres anteriores Y sea insensible a mayúsculas y minúsculas
select id,replace(replace(nombre,'o','*'),'O','*') "NOMBRE",apellidos,fecha_nacimiento,posicion,salario,id_equipo
    from futbolistas where posicion = 'DEFENSA' and nombre like 'P%' order by nombre desc;
    
/*Primero inserta un nuevo futbolista con los siguientes datos:
ID: F80120
NOMBRE: MIGUEL
APELLIDOS: GARCIA
FECHA_NACIMIENTO: 22/02/1980
POSICION: DEFENSA
SALARIO: 350000
ID_EQUIPO: 1 */
-- PRIMERO COMPROBAMOS QUE NO HAY USUARIO CON ES ID.
SELECT * FROM FUTBOLISTAS WHERE ID = 'F80120';
INSERT INTO FUTBOLISTAS VALUES('F80120','MIGUEL','GARCIA','22/02/1980','DEFENSA',350000,1);

-- CAMBIAR EL NOMBRE DE MIGUEL A MINUS
UPDATE FUTBOLISTAS SET  NOMBRE = 'miguel' where id = 'F80120';
SELECT ID,REPLACE(REPLACE(NOMBRE,'E','*'),'e','*') "NOMBRE",APELLIDOS,FECHA_NACIMIENTO,POSICION,SALARIO,ID_EQUIPO
FROM FUTBOLISTAS WHERE POSICION = 'DEFENSA' ORDER BY NOMBRE DESC;

-- QUIERO QUEDARME EL PRIMER NOMBRE DE LOS FUTBOLISTAS
SELECT SUBSTR(NOMBRE,1,3) FROM futbolistas;
SELECT SUBSTR(NOMBRE,2) FROM futbolistas;
UPDATE FUTBOLISTAS SET  NOMBRE = ' miguel   ' where id = 'F80120';
SELECT NOMBRE,LENGTH(NOMBRE) FROM futbolistas;
SELECT NOMBRE,LENGTH(NOMBRE),TRIM(NOMBRE),LENGTH(TRIM(NOMBRE)) FROM futbolistas;
SELECT NOMBRE,REPLACE(NOMBRE,' ','') FROM futbolistas;
SELECT REPLACE(NOMBRE,' ','$') FROM futbolistas;
--INSTR
SELECT NOMBRE,INSTR(NOMBRE,' ') FROM FUTBOLISTAS;
SELECT NOMBRE,INSTR(NOMBRE,' '),INSTR(NOMBRE,' ',1,2) FROM FUTBOLISTAS;
SELECT NOMBRE,INSTR(NOMBRE,' '),INSTR(NOMBRE,' ',1,2),INSTR(NOMBRE,' ',2,2) FROM FUTBOLISTAS;
--SOLUCION
SELECT NOMBRE FROM FUTBOLISTAS;
select trim(substr(nombre,1,instr(nombre,' '))) from futbolistas where id = 'F00220';
SELECT SUBSTR(nombre, 1, INSTR(nombre, ' ') - 1)  FROM futbolistas;
select substr(nombre,1,(instr(nombre||' ',' '))) from futbolistas;
select substr(TRIM(nombre),1,(instr(TRIM(nombre)||' ',' '))) from futbolistas;

-- FECHAS
SELECT SYSDATE FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'JUEVES') FROM DUAL;
SELECT EXTRACT(MONTH FROM SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MONTH') FROM DUAL;
SELECT TO_CHAR(TO_DATE('25/12/2024'),'MONTH') FROM DUAL;

