--PLSQL
set serveroutput on;
declare
    numero int := 7; -- declarar e inicializar
    numero2 int;
    frase varchar2(10) := 'mensaje';
begin
    numero2 := 4;
    dbms_output.put_line(numero);
    numero := 12;
    dbms_output.put_line(numero);
    dbms_output.put_line(numero || ' - ' || numero2);
    dbms_output.put_line(frase);

end;
/
--EJERCICIO
--Calcula el área de un triangulo con base 7 y altura 4. b*h/2
declare
    base int := 7; -- declarar e inicializar
    altura int :=4;
    frase varchar2(100) := 'El area del triangulo es =  ';
begin
    dbms_output.put_line(frase || (base*altura)/2 || '.');
    dbms_output.put_line('Hoy es ' || sysdate || '.');
end;
/
--  JUEVES 23/01/2025  PDF 00INTRODUCCIÓN PAG 16
set serveroutput on;
declare
    v1 int := 5; -- declarar e inicializar
    v2 varchar2(10);
    v3 number(2) := &numero_variable_3;
    v4 varchar2(5) := '&cadena';
begin
    v2 := 'hola';
    dbms_output.put_line(v1);
    dbms_output.put_line(v2);
    dbms_output.put_line(v3);
    dbms_output.put_line(v4);
end;
/
declare
    v1 int := 5; -- declarar e inicializar
    v2 varchar2(10);
    v3 number(2) := &numero_variable_3;
    v4 varchar2(5) := '&'||'&cadena';
begin
    v2 := 'hola';
    dbms_output.put_line(v1);
    dbms_output.put_line(v2);
    dbms_output.put_line(v3);
    dbms_output.put_line(v4);
end;
/

--PDF 01 CONSTRUCCIÓN DE GUIONES PAG 4
set serveroutput on;
--type
declare
    v1 int := 5; -- declarar e inicializar
    v2 varchar2(10);
    v3 number(2) := &numero_variable_3;
    v4 varchar2(5) := '&cadena';
    nombreFutbolista varchar2(100);
    nombreFutbolista2 futbolistas.nombre%type := 'PEDRO';
begin
    v2 := 'hola';
    dbms_output.put_line(v1);
    dbms_output.put_line(v2);
    dbms_output.put_line(v3);
    dbms_output.put_line(v4);
    dbms_output.put_line(nombreFutbolista2);
end;
/
SELECT * FROM futbolistas;
declare
    nombreFutbolista futbolistas.nombre%type := 'PEDRO'; 
begin
    dbms_output.put_line(nombreFutbolista);
end;
/
--  rowtype
declare
    v1 int := 5;
    v2 varchar2(10);
    v3 number(2) := &numero_variable_3;
    v4 varchar2(5) := '&cadena';
    nombreFutbolista varchar2(100);
    nombreFutbolista2 futbolistas.nombre%type := 'PEDRO';
    --rowtype
    filaFutbolista futbolistas%rowtype;
begin
    v2 := 'hola';
    filaFutbolista.id := 1;
    filaFutbolista.nombre := 'INDALECIO';
    dbms_output.put_line(v1);
    dbms_output.put_line(v2);
    dbms_output.put_line(v3);
    dbms_output.put_line(v4);
    dbms_output.put_line(nombreFutbolista2);
    dbms_output.put_line(filaFutbolista.nombre);
end;
/
// PAG 15 CONSTANT
declare
    v1 int := 5;
    v2 varchar2(10);
    v3 number(2) := &numero_variable_3;
    v4 varchar2(5) := '&cadena';
    nombreFutbolista varchar2(100);
    nombreFutbolista2 futbolistas.nombre%type := 'PEDRO';
    --rowtype
    filaFutbolista futbolistas%rowtype;
    miConstante constant int := 5;
    fecha date := '23/01/2025';
begin
    v2 := 'hola';
    filaFutbolista.id := 1;
    filaFutbolista.nombre := 'INDALECIO';
    dbms_output.put_line(v1);
    dbms_output.put_line(v2);
    dbms_output.put_line(v3);
    dbms_output.put_line(v4);
    dbms_output.put_line(nombreFutbolista2);
    dbms_output.put_line(filaFutbolista.nombre || ' ' ||miConstante);
    dbms_output.put_line(to_char(fecha,'yyyy'));
end;
/
/*Ejercicio 1 PAG 16
? Declara una variable tipo fecha sin inicializarla.
? Declara una variable tipo fecha inicializada a día 6 de abril de 2021.
? Declara una variable numérica (NUMBER) con 3 dígitos que no sea null sin inicializar.
? Declara una variable numérica (NUMBER) con 4 dígitos de precisión de los cuales 2 son decimales, e inicialízala a 10,99.
? Declara una variable carácter (VARCHAR2) de tamaño 10 con la frase CLASE DE DAMDAW.
? Declara una constante numérica y valor 11*/
declare
    fecha1 date ;
    fecha2 date := '06/04/2021';
    n1 number(3) not null := 4;
    n2 number(4,2):= 10.99;
    v1 varchar2(20):= 'CLASE DE DAMDAW';
    miConstante constant int := 11;
begin
    dbms_output.put_line(fecha1);
    dbms_output.put_line(fecha2);
    dbms_output.put_line(n1);
    dbms_output.put_line(n2);
    dbms_output.put_line(v1);
    dbms_output.put_line(v1 || ' ' ||miConstante);
end;
/

/*Ejercicio 2
? Declara una variable que tenga el tipo de dato igual que el de la columna ENAME de la tabla EMP.
? Declara una variable que haga referencia a toda una fila de la tabla EMP.*/
SELECT * FROM emp;
declare
    v1 emp.ename%type;
    v2 emp%rowtype;
begin
    v1 := 'PEDRO';
    v2.empno := 1;
    v2.ename := v1;
    dbms_output.put_line(v1);
    dbms_output.put_line('empno = ' || v2.empno || ' | ename = ' || v2.ename);

end;
/
--SELECT INTO

--SELECT * INTO NOMBREVARIABLE FROM emp;
declare
    nombreEmpleado emp.ename%type;
    puestoEmpleado emp.job%type;
    filaEmpleado emp%rowtype;

begin
    SELECT ename INTO nombreEmpleado FROM emp where empno = 7839;
    dbms_output.put_line(nombreEmpleado);
    SELECT ename,job  INTO nombreEmpleado,puestoEmpleado FROM emp where empno = 7839;
    dbms_output.put_line(nombreEmpleado || '|' || puestoEmpleado);
    SELECT ename,job  INTO filaEmpleado.ename,filaEmpleado.job FROM emp where empno = 7839;
    dbms_output.put_line(filaEmpleado.ename || '|' || filaEmpleado.job);
end;
/

-- MIERCOLES 29/01/2025
--ejercicio 3
set serveroutput on;
declare
    variable1 emp.ename%type; --variable1 varchar2(10)
    variable2 emp%rowtype; --variable2.empno, variable2.ename, etc.
begin
    variable2.ename := 'elquesea';
    dbms_output.put_line(variable2.ename);
end;
/
declare
    variable1 emp.ename%type; --variable1 varchar2(10)
    variable2 emp%rowtype; --variable2.empno, variable2.ename, etc.
begin
    select ename into variable1 from emp where empno = 7839;
    dbms_output.put_line('Primer caso: ' || variable1);
    select * into variable2 from emp where empno = 7698;
    dbms_output.put_line('Segundo caso: ' || variable2.ename);
end;
/

--Ejercicio 4

--1. (16 – 8) / 2 = 4   TRUE
--2. (7 + 3) != 10     FALSE
--3. 0 IS NOT NULL     TRUE
--4. (3 = (9/3)) AND NULL. NULL
--5. NULL OR (2 * 5 = 10). TRUE
--6. 0 <> NULL .  TRUE (<> DISTINTO)
--7. 4 BETWEEN 3 AND 9. TRUE
--8. NOT(2 ** 3 = 8).  FALSE
--9. ‘a12’ = ‘a’ || ’12’. TRUE
--10. 0 IS NULL.  FALSE
--11. ‘ANA’ LIKE ‘%N’.  FALSE (QUE ACABE EN N)
--12. ‘B’ IN (‘A’,’D’). FALSE (B ESTA ENTRE A O B)

/*Ejercicio 5
Crea un bloque de código anónimo que pida la base y altura de un triángulo, y devuelva el área de este.
NOTA: El área de un triángulo es base por altura entre dos. */
declare
    base int := &base; 
    altura int :=&altura;
    area int := (base*altura)/2;
    frase varchar2(100) := 'El area del triangulo es =  ';
begin
    dbms_output.put_line(frase || (base*altura)/2 || '.');
    dbms_output.put_line(frase || area || '.');
end;
/
--EJERCICIO 01 COMPLETO
/* Se trata de aplicar los conocimientos adquiridos hasta hoy. Para ello se va a pedir la construcción de una base de datos con algunas 
tablas en un modelo relacional. Una vez creada, tendrás que incorporar los datos que se indican. 
El paso siguiente será realizar algunas query de consulta para obtener distintos datos que se piden de dicha base de datos.
Se terminará pidiendo la creación de un bloque de código anónimo que realice ciertas acciones.

## Parte 1

Crea la siguiente base de datos con esta información de las tablas que contiene. Puedes emplear los tipos de datos que crees 
conveniente siempre y cuando sean coherentes y permitan incluir todos los datos indicados.

TABLA PILOTOS
--
| ID |  NOMBRE    | APELLIDOS | FECHA_NACIMIENTO |  NACIONALIDAD |  ID_ROL |    ID_EQUIPO   |
| 1     FERNANDO    ALONSO      29/07/1981          ESPAÑOLA        1           1           |
| 2     MAX         VERSTAPPEN  30/09/1997          HOLANDESA       1           2           |
| 3     LEWIS       HAMILTON    07/01/1985          BRITÁNICA       1           3           |
| 4     CARLOS      SAINZ       01/09/1994          ESPAÑOLA        1           4           |

TABLA EQUIPOS
--
| ID |  NOMBRE      | SEDE          | DIRECTOR          |  MOTOR    |  NUM_TITULOS | NUM_EMPLEADOS   |
| 1     ASTON MARTIN  SILVERSTONE     ADRIAN NEWEY         MERCEDES    0             800             |
| 2     RED BULL      MILTON KEYNES   CHRISTIAN HORNER     HONDA       6             1000            |
| 3     FERRARI       MARANELLO       JOHN ELKANN          FERRARI     16            1200            |
| 4     WILLIAMS      GROVE           JAMES VOWLES         MERCEDES    9             750             |

TABLA ROLES
--
| ID |  ROL             |
| 1     PRIMER PILOTO   |
| 2     SEGUNDO PILOTO  |
| 3     PILOTO PRUEBAS  |

PILOTOS tiene ID como PK e ID_ROL e ID_EQUIPO son FK. Además, NACIONALIDAD tiene una restricción para que solo valga ESPAÑOLA, 
HOLANDESA o BRITÁNICA.
EQUIPOS tiene ID como PK. Además, NUM_EMPLEADOS tiene una restricción por la que siempre debe valer mayor de cero.
ROLES tiene ID como PK.

## Parte 2

Realiza las siguientes consultas.

1. Indica por cada nacionalidad de los pilotos, el número de estos que hay. Ordena el resultado por el número de estos de mayor a menor, 
   y en caso de que empate, por nacionalidad en orden alfabético.
. Indica en una única columna con el siguiente formato (APELLIDOS, NOMBRE - NOMBRE_EQUIPO ) aquellos pilotos que tenga rol PRIMER PILOTO.
. Muestra el nombre del motor y la suma de títulos que se ha conseguido con ese motor actualmente. Ej.: MERCEDES, 9; HONDA 6; FERRARI 6.
. ¿Cuántos pilotos han nacido en día impar?
. Muestra el nombre, apellidos de los pilotos, además del nombre del director de su equipo y el rol que ocupa dicho piloto actualmente.
. ¿Cuántas vocales tiene el apellido del piloto que está en el equipo que tiene más empleados?

## Parte 3

Realiza un bloque de código anónimo que haga lo siguiente.

1. Realiza llamadas a la tabla equipos y guarda dichos resultados en variables con SELECT INTO.
2. Debes emplear el tipo de datos de los campos de la tabla equipos para tus variables.
3. Debes mostrar un primer mensaje por la salida indicando: "El número total de campeonatos disputados es de XXX", donde XXX debe 
   ser el número sumatorio de títulos obtenidos por los equipos guardados en la tabla equipos.
4. Debes mostrar un segundo mensaje por la salida indicando: "El motor más empleado es XXX con un total de YYY equipos que lo usan", 
   donde XXX es el nombre del motor que se emplea más veces, e YYY el número de equipos que usan ese motor más usado.*/

--INDALECIO
drop table pilotos cascade constraints;
drop table equipos cascade constraints;
drop table roles cascade constraints;
create table pilotos(
    id int primary key,
    nombre varchar2(100),
    apellidos varchar2(100),
    fecha_nacimiento date,
    nacionalidad varchar2(100) check(nacionalidad in ('ESPAÑOLA','HOLANDESA','BRITÁNICA')),
    id_rol int,
    id_equipo int
);
create table equipos(
    id int primary key,
    nombre varchar2(100),
    sede varchar2(100),
    director varchar2(100),
    motor varchar2(100),
    num_titulos int,
    num_empleados int check (num_empleados >0)
);
create table roles(
    id int primary key,
    rol varchar2(100)
);
alter table pilotos
add foreign key(id_rol) references roles;
alter table pilotos add foreign key(id_equipo) references equipos;
 
insert into equipos values (1,'ASTON MARTIN','SILVERSTONE','ADRIAN NEWEY','MERCEDES',0,800);
insert into equipos values (2,'RED BULL','MILTON KEYNES','CHRISTIAN HORNER','HONDA',6,1000);
insert into equipos values (3,'FERRARI','MARANELLO','JOHN ELKANN','FERRARI',16,1200);
insert into equipos values (4,'WILLIAMS','GROVE','JAMES VOWLES','MERCEDES',9,750);
 
INSERT INTO ROLES VALUES (1,'PRIMER PILOTO');
INSERT INTO ROLES VALUES (2,'SEGUNDO PILOTO');
INSERT INTO ROLES VALUES (3,'PILOTO PRUEBAS');
 
INSERT INTO PILOTOS VALUES (1,'FERNANDO','ALONSO','29/07/1981','ESPAÑOLA',1,1);
INSERT INTO PILOTOS VALUES (2,'MAX','VERSTAPPEN','30/09/1997','HOLANDESA',1,2);
INSERT INTO PILOTOS VALUES (3,'LEWIS','HAMILTON','07/01/1985','BRITÁNICA',1,3);
INSERT INTO PILOTOS VALUES (4,'CARLOS','SAINZ','01/09/1994','ESPAÑOLA',1,4);

--PERA
DROP TABLE piloto CASCADE CONSTRAINTS;
DROP TABLE equipo CASCADE CONSTRAINTS;
DROP TABLE rol CASCADE CONSTRAINTS;
create table piloto(
    id int primary key,
    nombre varchar2(100),
    apellidos varchar2(100),
    fecha_nacimiento date,
    nacionalidad varchar2(100),
    id_rol int,
    id_equipo int
);

insert into piloto  values (1, 'FERNANDO','ALONSO','29/07/1981', 'ESPAÑOLA', 1, 1);
insert into piloto values (2, 'MAX','VERSTAPPEN','30/09/1997', 'HOLANDESA', 1, 2);
insert into piloto  values (3, 'LEWIS','HAMILTON','07/01/1985', 'BRITÁNICA', 1, 3);
insert into piloto  values (4, 'CARLOS','SAINZ','01/09/1994', 'ESPAÑOLA', 1, 4);

insert into equipo  values (1, 'ASTON MARTIN','SILVERSTONE','ADRIAN NEWEY', 'MERCEDES', 0, 800);
insert into equipo values (2, 'RED BULL','MILTON KEYNES','CHRISTIAN HORNER', 'HONDA', 6, 1000);
insert into equipo  values (3, 'FERRARI','MARANELLO','JOHN ELKANN', 'FERRARI', 16, 1200);
insert into equipo  values (4, 'WILLIAMS','GROVE','JAMES VOWLES', 'MERCEDES', 9, 750);
 
create table equipo(
    id int primary key,
    nombre varchar2(100),
    sede varchar2(100),
    director varchar2(100),
    motor varchar2(100),
    num_titulos int,
    num_empleados int
);
 
insert into equipo  values (1, 'ASTON MARTIN','SILVERSTONE','ADRIAN NEWEY', 'MERCEDES', 0, 800);
insert into equipo values (2, 'RED BULL','MILTON KEYNES','CHRISTIAN HORNER', 'HONDA', 6, 1000);
insert into equipo  values (3, 'FERRARI','MARANELLO','JOHN ELKANN', 'FERRARI', 16, 1200);
insert into equipo  values (4, 'WILLIAMS','GROVE','JAMES VOWLES', 'MERCEDES', 9, 750);

create table rol(
    id int primary key,
    rol varchar2(100)
);
insert into rol  values (1, 'primer piloto');
insert into rol values (2, 'segundo piloto');
insert into rol  values (3, 'piloto pruebas');
--Los FK y CHECK:
alter table piloto add foreign key (id_rol)  references rol (id);
alter table piloto add foreign key (id_equipo) references equipo (id);
alter table piloto add check (nacionalidad = 'ESPAÑOLA' or nacionalidad = 'HOLANDESA' or nacionalidad = 'BRITÁNICA');
alter table equipo add check (num_empleados > 0);

-- PARTE 2
--1. Indica por cada nacionalidad de los pilotos, el número de estos que hay. Ordena el resultado por el número de estos de mayor a menor, 
--   y en caso de que empate, por nacionalidad en orden alfabético.
select * from piloto;
select nacionalidad, count(nacionalidad)"RECUENTO" from piloto group by nacionalidad order by count(nacionalidad)desc,nacionalidad;
--2. Indica en una única columna con el siguiente formato (APELLIDOS, NOMBRE - NOMBRE_EQUIPO ) aquellos pilotos que tenga rol PRIMER PILOTO.
select * from piloto;
select * from equipo;
select * from rol;
select piloto.apellidos,piloto.nombre,equipo.nombre,rol.rol 
    from piloto join equipo on piloto.id_equipo = equipo.id 
    join rol on piloto.id_equipo = rol.id where rol.rol = 'primer piloto';

--3. Muestra el nombre del motor y la suma de títulos que se ha conseguido con ese motor actualmente. Ej.: MERCEDES, 9; HONDA 6; FERRARI 16.
SELECT MOTOR,SUM(NUM_TITULOS)"TITULOS" FROM EQUIPO GROUP BY MOTOR ORDER BY SUM(NUM_TITULOS) DESC;
--4. ¿Cuántos pilotos han nacido en día impar?
select NOMBRE,to_char(fecha_nacimiento,'"    "DD') " DIA IMPAR" from piloto where mod(to_char(fecha_nacimiento,'DD'),2) != 0;// EL MOD CALCULA
--EL RESTO DE LA DIV DEL DIA QUE ES 30/2, != 0 IMPRIME LOS IMPAR 
--5. Muestra el nombre, apellidos de los pilotos, además del nombre del director de su equipo y el rol que ocupa dicho piloto actualmente.
select * from piloto;
select * from equipo;
select * from rol;
SELECT PILOTO.NOMBRE,PILOTO.APELLIDOS,EQUIPO.DIRECTOR,ROL.ROL FROM PILOTO JOIN EQUIPO ON piloto.id_equipo = EQUIPO.ID
    JOIN ROL ON piloto.id_rol = ROL.ID;
--6. ¿Cuántas vocales tiene el apellido del piloto que está en el equipo que tiene más empleados?
select 
    length(apellidos) - length(replace(replace(replace(replace(replace(apellidos,'A',''),'E',''),'I',''),'O',''),'U','')) "Núm. Vocales"
        from piloto
          join equipo on equipo.id =  piloto.id_equipo
               where num_empleados = (select max(num_empleados) from equipo);

/*## Parte 3
Realiza un bloque de código anónimo que haga lo siguiente.

1. Realiza llamadas a la tabla equipos y guarda dichos resultados en variables con SELECT INTO.
2. Debes emplear el tipo de datos de los campos de la tabla equipos para tus variables.
3. Debes mostrar un primer mensaje por la salida indicando: "El número total de campeonatos disputados es de XXX", donde XXX debe ser el  
   número sumatorio de títulos obtenidos por los equipos guardados en la tabla equipos.
4. Debes mostrar un segundo mensaje por la salida indicando: "El motor más empleado es XXX con un total de YYY equipos que lo usan", 
   donde XXX es el nombre del motor que se emplea más veces, e YYY el número de equipos que usan ese motor más usado.*/

set serveroutput on;
declare
    totalCampDisp equipo.num_titulos%type;
    motorMasEmpleado equipo.motor%type;
    numEqUsanMotor int;
begin
    select sum(num_titulos) into totalCampDisp from equipo;
    dbms_output.put_line('El número total de campeonatos disputados es de ' || totalCampDisp );
    select motor into motorMasEmpleado from equipo group by motor having count(motor) = (select max(count(motor)) from equipo group by motor);
    select max(count(motor)) into numEqUsanMotor from equipo group by motor;
    dbms_output.put_line('El motor más empleado es ' || motorMasEmpleado ||' con un total de '|| numEqUsanMotor ||' equipos que lo usan ' || totalCampDisp );
end;
/
select motor,count(motor) from equipo group by motor having count(motor) = (select max(count(motor)) from equipo group by motor);
// JUEVES 30 DE ENERO DE 2025
/*Ejercicio 6
Crea un bloque de código anónimo que requiera por pantalla un nombre, luego un apellido y muestre como resultado “Hola nombre apellido”.*/
set serveroutput on;
declare
    nombre varchar2(50) := '&NOMBRE';
    apellidos varchar2(50) := '&APELLIDOS';
begin
    dbms_output.put_line('Hola,' || ' ' ||nombre || ' ' || apellidos);
end;
/

/*Ejercicio 7
Crea un programa que realiza la suma, resta, multiplicación y división de dos números enteros, num1 y num2 (8 y 4). */
declare
    N1 INT := 8;
    N2 INT := 4;
    TOTAL_SUMA INT ;
    TOTAL_RESTA INT := N1-N2;
begin
    total_suma := N1+N2;
    dbms_output.put_line(TOTAL_SUMA);
    dbms_output.put_line(TOTAL_RESTA);
    dbms_output.put_line(N1*N2);
    dbms_output.put_line(N1/N2);
end;
/

SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY "DEL" MONTH') FROM DUAL;
--FUNCIONES AGRUPAMIENTO
-- COUNT() MIN(), MAX(), SUM(), AVG() -> DEVULVEN UN VALOR
SELECT * FROM EMP;
SELECT COUNT (*) FROM EMP;
SELECT MIN(SAL),MAX(SAL) FROM EMP;
SELECT SUM(SAL) FROM EMP;
SELECT AVG(COMM) FROM EMP;

SELECT JOB,COUNT(*) FROM EMP GROUP BY JOB;
SELECT TRIM(TO_CHAR(SYSDATE,'MONTH')) FROM DUAL;
SELECT TRIM(TO_CHAR(SYSDATE,'MONTH')) || TO_CHAR(SYSDATE,'DD') FROM DUAL;

--Estructuras de control
/*
if condición/es then
elsif nuevacondición/es then
else
end if;
*/
declare
    num1 int := 14;
    num2 int := 14;
    total_suma int;
    total_resta int := num1 - num2;
begin
    total_suma := num1 + num2;
    dbms_output.put_line(total_suma);
    if total_resta < 0 then
        dbms_output.put_line('Es negativo');
    elsif total_resta = 0 then
        dbms_output.put_line('Son iguales');
    else
        dbms_output.put_line(total_resta);
    end if;
    dbms_output.put_line(num1*num2);
    dbms_output.put_line(num1/num2);
end;
/

--EJERCICIO 10 con IF / ELSIF / ELSE
/*Crea un programa que tome pida una variable al usuario para que la introduzca por teclado (tiene que ser un número), y según sea su valor 
entre 0 y 10, devuelva por pantalla el valor de la nota: SUSPENSO, APROBADO, BIEN, NOTABLE,SOBRESALIENTE. En caso contrario, que devuelva
‘El valor introducido es incorrecto’.*/
declare
    nota number(3,1) := &nota;
begin
    if nota < 5 and nota >= 0 then
        dbms_output.put_line('SUSPENSO');
    elsif nota >=5 and nota < 6 then
        dbms_output.put_line('APROBADO');
    elsif nota >=6 and nota < 7 then
        dbms_output.put_line('BIEN');
    elsif nota >=7 and nota < 9 then
        dbms_output.put_line('NOTABLE');
    elsif nota >=9 and nota <= 10 then
        dbms_output.put_line('SOBRESALIENTE');
    else
        dbms_output.put_line('El valor introducido es incorrecto');
    end if;
end;
/
--EJERCICIO INDA
/*PIDE AL USUARIO DETNO, DNAME Y LOC Y METE ESOS VALORES CON UN INSERT IN INTO EN LA TABLA DEPT. EJ: 50,MARKETING,SEVILLA*/
DECLARE 
    N_DEPT DEPT.DEPTNO%TYPE := &N_DEPT;
    NAME_DEPT DEPT.DNAME%TYPE := '&NAME_DEPT';
    LOC_DEPT DEPT.LOC%TYPE := '&LOC_DEPT';
BEGIN
    INSERT INTO DEPT VALUES (N_DEPT,NAME_DEPT,LOC_DEPT);
    dbms_output.put_line('FILA INSERTADA CORRECTAMENTE:' || N_DEPT ||'-'||NAME_DEPT || '-' || LOC_DEPT);

END;
/
--Ejemplo: 50, MARKETING, SEVILLA
DECLARE
    NUMDEPARTAMENTO DEPT.DEPTNO%TYPE := &NUMDEPARTAMENTO;
    NOMBREDEPARTAMENTO DEPT.DNAME%TYPE := '&NOMBREDEPARTAMENTO';
    LOCALIZACIONDEPARTAMENTO DEPT.LOC%TYPE := '&LOCALIZACIONDEPARTAMENTO';
BEGIN
    INSERT INTO DEPT VALUES (NUMDEPARTAMENTO,NOMBREDEPARTAMENTO,LOCALIZACIONDEPARTAMENTO);
    DBMS_OUTPUT.PUT_LINE('FILA INSERTADA CORRECTAMENTE: ' || NUMDEPARTAMENTO || '-' || NOMBREDEPARTAMENTO || '-' || LOCALIZACIONDEPARTAMENTO);
END;
/
--JUEVES 05 DE FEBRERO DE 2025
set serveroutput on;
--EJEMPLO 1
declare
    numero int := &introduzca_numero;
begin
    case numero
    when 1 then
        dbms_output.put_line('Ha metido el 1');
    when 2 then
        dbms_output.put_line('Ha metido el 2');
    else
        dbms_output.put_line('Ha metido un número distinto de 1 y 2');
    end case;
end;
/
--EJEMPLO 2

declare
    numero int := &introduzca_numero;
begin
    case 
    when numero = 1 then
        dbms_output.put_line('Ha metido el 1');
    when numero = 2 or numero between 3 and 4 then
        dbms_output.put_line('Ha metido el 2,3,4');
    else
        dbms_output.put_line('Ha metido un número distinto de 1 y 2');
    end case;
end;
/
--Realiza el mismo ejercicio 10 pero utilizando CASE en lugar de IF | ELSIF | END IF.

DECLARE
    NUM INT := &INTRODUZCA_NOTA;
BEGIN
    CASE 
    when NUM between 0 and 4 then
        dbms_output.put_line('SUSPENSO');
    when NUM = 5 THEN
        dbms_output.put_line('APROBADO');
    when NUM = 6 THEN
        dbms_output.put_line('BIEN');
    when NUM = 7 or NUM = 8 then
        dbms_output.put_line('NOTABLE');
    when NUM = 9 or NUM = 10 then -- NUM >=9 AND NUM <=10 THEN
        dbms_output.put_line('SOBRESALIENTE');
    else
        dbms_output.put_line('Ha metido un número distinto de 0 Y 10');
    end case;
END;
/
/*Ejercicio 12 SENCILLO.
Realiza un programa que lea por teclado dos números enteros. El primero será los goles del equipo de casa, y el segundo los goles del equipo
de fuera. Se quiere devolver por pantalla quién ha ganado: “El equipo de casa/visitante ha ganado”. En caso de empate se indicará 
“El resultado del partido ha sido de empate”. */

declare
    eq1 INT := &goles_casa;
    eq2 INT := &goles_fuera;
begin
     if eq1 > eq2  then
        dbms_output.put_line('El equipo de casa ha ganado');
    elsif eq1 = eq2 then
        dbms_output.put_line('El resultado del partido ha sido de empate');
    else
        dbms_output.put_line('El equipo de fuera ha ganado');
    end if;
end;
/

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

ALTER TABLE FUTBOLISTAS ADD CHECK (FECHA_NACIMIENTO > '31/DEC/1974');
ALTER TABLE FUTBOLISTAS ADD FOREIGN KEY (ID_EQUIPO) REFERENCES EQUIPOS(ID);
ALTER TABLE PARTIDOS ADD FOREIGN KEY (ID_EQUIPO_CASA) REFERENCES EQUIPOS(ID);
ALTER TABLE PARTIDOS ADD FOREIGN KEY (ID_EQUIPO_FUERA) REFERENCES EQUIPOS(ID);

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

ALTER TABLE FUTBOLISTAS ADD ALTURA INT;
ALTER TABLE FUTBOLISTAS ADD PESO NUMBER(4,1);
UPDATE FUTBOLISTAS SET ALTURA = 179, PESO = 76 WHERE NOMBRE LIKE 'PEDRO LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 174, PESO = 71.5 WHERE NOMBRE LIKE 'LUIS';
UPDATE FUTBOLISTAS SET ALTURA = 169, PESO = 66 WHERE NOMBRE LIKE 'JESUS';
UPDATE FUTBOLISTAS SET ALTURA = 189, PESO = 82 WHERE NOMBRE LIKE 'DIEGO';
UPDATE FUTBOLISTAS SET ALTURA = 183, PESO = 84 WHERE NOMBRE LIKE 'PABLO';
UPDATE FUTBOLISTAS SET ALTURA = 180, PESO = 81.5 WHERE NOMBRE LIKE 'ESTEBAN';
UPDATE FUTBOLISTAS SET ALTURA = 162, PESO = 60 WHERE NOMBRE LIKE 'ENRIQUE';

--Ejercicio 12 | AMPLIACIÓN
--A partir del campo RESULTADO de la tabla PARTIDOS para el día/fecha 08/01/2020, indica quién ha ganado
declare
    goles_casa int;
    goles_fuera int;
begin
    select to_number(substr(resultado,1,2)) into goles_casa from partidos where fecha = '08/01/2020';
    select to_number(substr(resultado,4,2)) into goles_fuera from partidos where fecha = '08/01/2020';
    case
    when goles_casa > goles_fuera then
        dbms_output.put_line('El equipo de casa ha ganado');
    when goles_casa < goles_fuera then
        dbms_output.put_line('El equipo visitante ha ganado');
    else
        dbms_output.put_line('El resultado del partido ha sido empate');
    end case;
end;
/

// ## JUEVES 6 DE FEBRERO DE 2025
// PAG 47 PDF1 CONSTRUCCION DE GUIONES

DECLARE 
     NUM1 INT := 2;
BEGIN
    LOOP
        dbms_output.put_line(NUM1);
        IF NUM1 = 0 THEN -- 1 FORMA
            EXIT;
        END IF;
        EXIT WHEN NUM1 = 1; -- 2 FORMA
        -- NUM1--
        -- NUM2++
        NUM1 := NUM1 -2;
    END LOOP;
END;
/
--BUCLES
set serveroutput on;
declare
    i int := 0;
begin
    loop 
        if i <= 10 then
    dbms_output.put_line(i);
    elsif i = 11 then
        exit;
        end if;
        i := i+1; --i++ no, i+=1
    end loop;
end;
/
--otro ejemplo
declare
    i int := 0;
begin
    loop 
        dbms_output.put_line(i);
        i := i+1;
        exit when i >=1;
    end loop;
end;
/
--Ejercicio 13
/*Realiza un programa que ejecute un bucle LOOP y se salga con un EXIT WHEN. Para ello crea una variable entero inicializada a 0 y que se vaya
incrementando en el bucle, además de mostrar por pantalla su valor; la condición de salida será cuando dicha variable valga más de 20.*/
declare
    num1 int := 0;
begin
    loop 
        dbms_output.put_line(num1);
        num1 := num1+1; --me lo suma segun ponga el numero
        exit when num1 >= 20;
    end loop;
end;
/
--Ejercicio 14. Realiza un programa que haga lo indicado en el ejercicio 13 pero que se salga mediante un IF condición THEN EXIT.
declare
    var1 int := 0;
begin   
    loop
        dbms_output.put_line(var1);
        var1 := var1 + 1;
        if var1 > 20 then exit;
        end if;
    end loop;
end;
/
// WHILE
declare
    var1 int := 0;
begin   
    WHILE var1 >= 0 loop
        dbms_output.put_line(var1);
        var1 := var1 + 1;
        if var1 > 20 then exit;
        end if;
    end loop;
end;
/
--Ejercicio 15. Realiza un programa que haga lo indicado en el ejercicio 13 pero emplea un bucle WHILE.
declare
    num1 int := 0;
begin
    while num1 <= 20 loop
        dbms_output.put_line(num1);
        num1 := num1 + 1; --me lo suma segun ponga el numero
    end loop;
end;
/

// FOR
--Ejercicio 16. el 13 pero con FOR
declare
begin
    for i in 1..20 loop
        dbms_output.put_line(i);
    end loop;
end;
/
-- Ejercicio 17. El 13 pero con FOR in reverse
declare
begin
    for i in reverse 0..20 loop
        dbms_output.put_line(i);
    end loop;
end;
/
--Ejercicio 18 
/*Realiza un programa que muestre por pantalla los números pares hasta llegar a 40, inclusive.
Nota: la función MOD(m,n) devuelve el resto de dividir el parámetro m entre el parámetro n.*/
declare 
    i int;
begin
    for indice in 0..40 loop
        i := mod(indice,2); 
        if i = 0 and indice != 0 then --CONDICION PAR
     -- if i != 0 then --CONDICION IMPAR
            dbms_output.put_line(indice);
        end if;
    end loop;
end;
/
begin
    for indice in 0..40 loop 
        if mod(indice,2)= 0 and indice != 0 then --CONDICION PAR
            dbms_output.put_line(indice);
        end if;
    end loop;
end;
/
-- Ejercicio 19. Realiza un programa que muestre por pantalla las tablas de multiplicar del 1 al 10.
begin
    for i in 1..10 loop
        for j in 1..10 loop
            dbms_output.put_line(i || 'x' || j || '=' || i*j);
        end loop;
    end loop;
end;
/
-- MIÉRCOLES 12 DE FEBRERO DE 2025
-- TEMA6 PDF 02. REGISTROS Y TABLAS
set serveroutput on;
declare
    V1 dept.deptno%type;
    fila1 dept%rowtype; --FILA1.DEPTNO, FILA.DNAME, FILA1.LOC
    type departSinLoc is record(
        codigoDept dept.deptno%type, 
        dname dept.dname%type
        );
        filaDepartamento departSinLoc;
begin
    filaDepartamento.codigoDept := 1;
    filaDepartamento.dname := 'TIC';    
    dbms_output.put_line(filaDepartamento.dname);
    
end;
/




----------------------------------- 3º TRIMESTRE MIERCOLES 26 DE MARZO DE 2025.--------------------------------------------
-- TEMA6 PDF 02. REGISTROS Y TABLAS .PAG 17
set serveroutput on;
declare
    type tipoTabla is table of varchar2(50) index by binary_integer;
    datos tipoTabla;
begin
    datos(1) := 'casa';
    datos(2) := 'perro';
    dbms_output.put_line(datos(1));
    dbms_output.put_line(datos(2));
end;
/

/*Ejercicio 7
Declarar una tabla de números y asignarle con un bucle for los números del 1 al 10. Además de asignar el valor dentro 
del bucle, mostrar el valor de la tabla por pantalla en cada iteración. */
set serveroutput on;
declare
    type tablaNum is table of number index by binary_integer;
    datos tablaNum;
begin
    for indice in 1 ..10 loop 
    datos(indice) := indice;
    dbms_output.put_line(datos(indice));
    end loop;
end;
/

/*Ejercicio 8
Declarar una tabla de ‘personas’. Donde ‘personas’ es un tipo registro que almacena nombre, apellido1 y apellido2.
Asignarle valores para una persona e imprimirlos por pantalla.*/
set serveroutput on;
declare
    type personas is record (
    nombre varchar2(50),
    apellido1 varchar2(50),
    apellido2 varchar2(50)
    );
    type tablaPersonas is table of personas index by binary_integer;
    datos tablaPersonas;
begin
    datos(1).nombre := 'Jhonatan';
    datos(1).apellido1 := 'Guzman';
    datos(1).apellido2 := 'Panozo';
    datos(2).nombre := 'Antonio';
    datos(2).apellido1 := 'Martin';
    datos(2).apellido2 := 'Lopez';
    dbms_output.put_line(datos(1).nombre ||' '|| datos(1).apellido1 ||' '|| datos(1).apellido2 ||'.');
    dbms_output.put_line(datos(2).nombre ||' '|| datos(2).apellido1 ||' '|| datos(2).apellido2 ||'.');
    dbms_output.put_line(datos.first);
    dbms_output.put_line(datos.last);
    dbms_output.put_line(datos.count);
    datos.delete(datos.last);
    dbms_output.put_line(datos.count);
    if datos.exists(3) then
    dbms_output.put_line(datos(3).apellido1);
    end if;    
end;
/
/*Funciones de tablas
Cuando trabajamos con tablas de PL/SQL podemos utilizar las siguientes funciones:
    nombredetabla.funcion
FIRST. Devuelve el menor índice de la tabla.
NULL si está vacía.
LAST. Devuelve el mayor índice de la tabla.
NULL si está vacía.
EXISTS(i). Utilizada para saber si en un cierto índice hay almacenado un valor. Devolverá
TRUE si en el índice i hay un valor. Se emplea en estructuras de control.
COUNT. Devuelve el número de elementos de la tabla PL/SQL.
PRIOR (n). Devuelve el número del índice anterior a n en la tabla.
NEXT(n). Devuelve el número del índice posterior a n en la tabla.*/

/*Ejercicio 9
Sobre el ejercicio 7:
1. Utilizar la función COUNT para devolver el número de elementos.
2. Recorrerlo con FIRST Y LAST.
3. Eliminar el último de la tabla y devolver el número total de elementos.
4. Preguntar si existe valor en la posición 10.*/
set serveroutput on;
declare
    type tablaNum is table of number index by binary_integer;
    datos tablaNum;
begin
    for indice in 1 ..10 loop 
    datos(indice) := indice;
    dbms_output.put_line(datos(indice));
    end loop;
    -- 1
    dbms_output.put_line(datos.count);
    -- 2
    for i in datos.first ..datos.last loop
    dbms_output.put_line(datos(i));
    end loop;
    -- 3
    datos.delete(datos.last);
    -- 4
    if datos.exists(10) then
    dbms_output.put_line('Existe: ' || datos(10));
    else
    dbms_output.put_line('No existe.');
    end if; 
end;
/

/*Ejercicio 10
Se quiere mostrar por pantalla los datos de ciertos empleados (tabla emp). Se pide:
? Se pedirá al usuario por la entrada de plsql que introduzca dos valores integer que coincidan con dos empnos de la tabla
emp, y se guardarán en una tabla de integers.
? Se debe crear una tabla que contendrá como valores todos los campos de las filas de emp cuyo empno coincida con los de la
tabla anterior. Puedes usar registros o %rowtype.
? Recorre la tabla anterior mostrando por la salida los valores de cada columna de los dos registros.
NOTA: debes usar las funciones FIRST, LAST, COUNT, etc. para los índices de tus bucles. Usa por ejemplo empno 7839 y 7698.*/

declare
    valor1 emp.empno%type := '&mete_valor1';
    valor2 emp.empno%type := '&mete_valor2';
    type tabla1 is table of emp.empno%type index by binary_integer;
    misEmp1 tabla1;
    cont1 int;
    cont2 int;
    type tabla2 is table of emp%rowtype index by binary_integer;
    misEmp2 tabla2;
begin
    misEmp1(1) := valor1;
    misEmp1(2) := valor2;
    dbms_output.put_line(misEmp1(2));
    select count(*) into cont1 from emp where empno = misEmp1(1);
    select count(*) into cont2 from emp where empno = misEmp1(2);
    

end;
/

declare
    valor1 emp.empno%type := '&mete_valor1';
    valor2 emp.empno%type := '&mete_valor2';
    type tablaInt is table of emp.empno%type index by binary_integer;
    misEmpnos tablaInt;
    contador1 int;
    contador2 int;
    type tablaEmp is table of emp%rowtype index by binary_integer;
    datosEmp tablaEmp;
begin
    misEmpnos(1) := valor1;
    misEmpnos(2) := valor2;
    dbms_output.put_line(misEmpnos(2));
    select count(*) into contador1 from emp where empno = misEmpnos(1);
    select count(*) into contador2 from emp where empno = misEmpnos(2);
    if contador1 > 0 and contador2 > 0 then
        for i in misEmpnos.first..misEmpnos.last loop
            select * into datosEmp(i) from emp where empno = misEmpnos(i);
        end loop;
        dbms_output.put_line(datosEmp(1).ename);
    else
        dbms_output.put_line('No existe empno');
    end if;
end;
/
------------------- MIERCOLES 02 de ABRIL DE 2025 -----------------
-------- PDF 03 CURSORES ---------------
SELECT *  FROM ASIGNATURAS;
SELECT *  FROM ESTUDIANTES;
SELECT *  FROM MATRICULAS;

set serveroutput on;
DECLARE
    DATOS ESTUDIANTES%ROWTYPE;
BEGIN
    SELECT * INTO DATOS FROM ESTUDIANTES WHERE CODIGO = 6;
    dbms_output.put_line('OK');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('NO HAY DATOS');
    WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line('HAY MÁS DE UN DATO');
END;
/

/* Cursores implícitos. Excepciones.
Ejercicio 1.
1. Definir un cursor implícito para obtener por pantalla el nombre y los apellidos del estudiante con DNI=’00000000T’ de la tabla ESTUDIANTES. 
NOTA: tener en cuenta que el DNI puede no existir en la tabla.
2. Prueba ahora con el DNI 97898989T*/
set serveroutput on;
DECLARE
    NOMBRE1 ESTUDIANTES.NOMBRE%TYPE;
    APELLIDOS1 ESTUDIANTES.APELLIDOS%TYPE;
BEGIN
    SELECT NOMBRE,APELLIDOS INTO NOMBRE1,APELLIDOS1 FROM ESTUDIANTES WHERE DNI = '97898989T';
    dbms_output.put_line(NOMBRE1 || '|' || APELLIDOS1);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('NO HAY DATOS');
END;
/
-- Los Cursores implicitos llevan  SELECT * INTO DATOS ;

/*Ejercicio 2.
1. Definir un cursor implícito para obtener por pantalla el dni y los apellidos del estudiante cuyo nombre sea Marta en la tabla ESTUDIANTES
NOTA: tener en cuenta tanto que puede no existir ningún estudiante que se llame así o que pueda haber varios con el mismo nombre.
2. Prueba ahora con el nombre Blanca.  */
set serveroutput on;
DECLARE
    DNI1 ESTUDIANTES.NOMBRE%TYPE;
    APELLIDOS1 ESTUDIANTES.APELLIDOS%TYPE;
BEGIN
    SELECT DNI,APELLIDOS INTO DNI1,APELLIDOS1 FROM ESTUDIANTES WHERE NOMBRE = 'Blanca';
    dbms_output.put_line(DNI1 || '|' || APELLIDOS1);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line('HAY MÁS DE UN DATO');
END;
/
----  OTRA FORMA CON ROWTYPE---------
DECLARE
    DATOS ESTUDIANTES%ROWTYPE;
BEGIN
    SELECT DNI,APELLIDOS INTO DATOS.DNI, DATOS.APELLIDOS FROM ESTUDIANTES WHERE NOMBRE = 'Marta';
    dbms_output.put_line(DATOS.DNI || '|' || DATOS.APELLIDOS);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line('HAY MÁS DE UN DATO');
END;
/
--- EJEMPLO --
DECLARE
    DATOS ESTUDIANTES%ROWTYPE;
    CURSOR CURSORESTUDIANTES IS SELECT * FROM ESTUDIANTES;
    CONT INT := 0;
BEGIN
    OPEN CURSORESTUDIANTES;
    LOOP
        FETCH CURSORESTUDIANTES INTO DATOS;
        EXIT WHEN CURSORESTUDIANTES%NOTFOUND;
        dbms_output.put_line(DATOS.NOMBRE);
        CONT := +1;
    END LOOP;
    CLOSE CURSORESTUDIANTES;
END;
/
-- Los Cursores explícitos NO  llevan  INTO DATOS ;

/*Ejercicio 3.
Definir un cursor explícito que seleccione el nombre, apellidos y DNI de la tabla ESTUDIANTES. Abrir el cursor, extraer el primer dato, mostrar 
cuántos registros se han procesado (uno) y cerrarlo. Luego mostrar el nombre del estudiante del registro procesado en el cursor.
¿Qué sucede si ponemos dos FETCH? */
set serveroutput on;
DECLARE
    DATOS ESTUDIANTES%ROWTYPE;
    CURSOR C_EST IS SELECT * INTO DATOS FROM ESTUDIANTES; -- * PORQUE ES ROWTYPE, SINO NO
BEGIN
    OPEN C_EST;
    FETCH C_EST INTO DATOS;
    FETCH C_EST INTO DATOS;
    dbms_output.put_line(DATOS.NOMBRE || '|' || DATOS.APELLIDOS || '|' || DATOS.DNI);
    CLOSE C_EST;
END;
/

/*Ejercicio 4.
Definir un cursor explícito que seleccione el nombre, apellidos y DNI de la tabla ESTUDIANTES. Recorrerlo y mostrar todos los datos recuperados.
Escribir al final el número de filas recuperadas en total. */
set serveroutput on;
DECLARE
    DATOS ESTUDIANTES%ROWTYPE;
    CURSOR C_EST IS SELECT *  FROM ESTUDIANTES; 
BEGIN
    OPEN C_EST;
    LOOP
        FETCH C_EST INTO DATOS;
        EXIT WHEN C_EST%NOTFOUND;
    dbms_output.put_line(DATOS.NOMBRE);
    END LOOP;
    dbms_output.put_line('Total:' || C_EST%rowcount);
    CLOSE C_EST;
END;
/
--- con while --
DECLARE
    DATOS ESTUDIANTES%ROWTYPE;
    CURSOR C_EST IS SELECT *  FROM ESTUDIANTES; 
BEGIN
    OPEN C_EST;
    FETCH C_EST INTO DATOS;
    WHILE C_EST%FOUND LOOP
        dbms_output.put_line(DATOS.NOMBRE);
        FETCH C_EST INTO DATOS;
    END LOOP;
    dbms_output.put_line('Total:' || C_EST%rowcount);
    CLOSE C_EST;
END;
/

/*Ejercicio 5.
Definir un cursor explícito que seleccione el nombre y la fecha de nacimiento de la tabla ESTUDIANTES. Recorrerlo y mostrar todos los datos 
recuperados con WHILE LOOP. Escribir al final el número de filas recuperadas en total. */
set serveroutput on;
DECLARE
    DATOS ESTUDIANTES%ROWTYPE;
    CURSOR C_EST IS SELECT *  FROM ESTUDIANTES; -- O TMB CURSOR DATOS IS SELECT NOMBRE,FECHA_NACIMIENTO FROM ESTUDIANTES;
BEGIN
    OPEN C_EST;
    FETCH C_EST INTO DATOS; -- DATOS.NOMBRE, DATOS.FECHA_NACIMIENTO;
    WHILE C_EST%FOUND LOOP
        dbms_output.put_line(DATOS.NOMBRE ||' - '||DATOS.FECHA_NACIMIENTO);
        FETCH C_EST INTO DATOS; -- DATOS.NOMBRE, DATOS.FECHA_NACIMIENTO;
    END LOOP;
    dbms_output.put_line('Total:' || C_EST%rowcount);
    CLOSE C_EST;
END;
/

-- FOR: CON FOR NO SE PUEDE USAR FOUND NI ROWCOUNT, NINGUN ATRIBUTO.
DECLARE
    CURSOR C_EST IS SELECT *  FROM ESTUDIANTES; -- O TMB CURSOR DATOS IS SELECT NOMBRE,FECHA_NACIMIENTO FROM ESTUDIANTES;
    CONT INT := 0;
BEGIN
    FOR I IN C_EST LOOP
        dbms_output.put_line(I.NOMBRE ||' - '||I.FECHA_NACIMIENTO);
        CONT := CONT + 1;
    END LOOP;
    dbms_output.put_line('Total:' || CONT);
END;
/
--- O DE OTRA FORMA SIN CURSOR --
DECLARE
    CONT INT := 0;
BEGIN
    FOR I IN (SELECT *  FROM ESTUDIANTES) LOOP
        dbms_output.put_line(I.NOMBRE ||' - '||I.FECHA_NACIMIENTO);
        CONT := CONT + 1;
    END LOOP;
    dbms_output.put_line('Total:' || CONT);
END;
/

/*Ejercicio 7.
Se quiere mostrar por pantalla el nombre y apellidos de los estudiantes que se llamen de cierta forma. Para ello se pedirá al usuario que introduzca 
el nombre a buscar. El formato requerido para mostrar por pantalla es el siguiente (todo en mayús): “APELLIDOS, NOMBRE”. Ej.: CARRASCO PEREZ, MARTA.
En el supuesto de que SELECT no se traiga ningún registro, mostrar por pantalla “NO HAY DATOS”. Utiliza un bucle WHILE.
Lanza la ejecución para el nombre “Marta” y después para el nombre “Luis”. */
set serveroutput on;
DECLARE
    NOMBRE1 VARCHAR2(50):= '&NOMBRE';
    APELLIDOS1 VARCHAR2(50):= '&APELLIDOS';
    DATOS ESTUDIANTES%ROWTYPE;
    CURSOR C_EST IS SELECT *  FROM ESTUDIANTES where nombre = NOMBRE1 and apellidos = APELLIDOS1; 
BEGIN
    OPEN C_EST;
    FETCH C_EST INTO DATOS; 
    WHILE C_EST%FOUND LOOP
        dbms_output.put_line(DATOS.NOMBRE ||' - '||DATOS.apellidos);
        FETCH C_EST INTO DATOS; 
    END LOOP;
    CLOSE C_EST;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('NO HAY DATOS');
    WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line('HAY MÁS DE UN DATO');
END;
/


------------ JUEVES 03 DE ABRIL DE 2025 ----------------------------

create table dept(
  deptno number(2,0),
  dname  varchar2(14),
  loc    varchar2(13),
  constraint pk_dept primary key (deptno)
);
 
create table emp(
  empno    number(4,0),
  ename    varchar2(10),
  job      varchar2(9),
  mgr      number(4,0),
  hiredate date,
  sal      number(7,2),
  comm     number(7,2),
  deptno   number(2,0),
  constraint pk_emp primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);

insert into dept
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept
values(20, 'RESEARCH', 'DALLAS');
insert into dept
values(30, 'SALES', 'CHICAGO');
insert into dept
values(40, 'OPERATIONS', 'BOSTON');
 
insert into emp
values(
 7839, 'KING', 'PRESIDENT', null,
 to_date('17-11-1981','dd-mm-yyyy'),
 5000, null, 10
);
insert into emp
values(
 7698, 'BLAKE', 'MANAGER', 7839,
 to_date('1-5-1981','dd-mm-yyyy'),
 2850, null, 30
);
insert into emp
values(
 7782, 'CLARK', 'MANAGER', 7839,
 to_date('9-6-1981','dd-mm-yyyy'),
 2450, null, 10
);
insert into emp
values(
 7566, 'JONES', 'MANAGER', 7839,
 to_date('2-4-1981','dd-mm-yyyy'),
 2975, null, 20
);
insert into emp
values(
 7788, 'SCOTT', 'ANALYST', 7566,
 to_date('13-JUL-87','dd-mm-rr') - 85,
 3000, null, 20
);
insert into emp
values(
 7902, 'FORD', 'ANALYST', 7566,
 to_date('3-12-1981','dd-mm-yyyy'),
 3000, null, 20
);
insert into emp
values(
 7369, 'SMITH', 'CLERK', 7902,
 to_date('17-12-1980','dd-mm-yyyy'),
 800, null, 20
);
insert into emp
values(
 7499, 'ALLEN', 'SALESMAN', 7698,
 to_date('20-2-1981','dd-mm-yyyy'),
 1600, 300, 30
);
insert into emp
values(
 7521, 'WARD', 'SALESMAN', 7698,
 to_date('22-2-1981','dd-mm-yyyy'),
 1250, 500, 30
);
insert into emp
values(
 7654, 'MARTIN', 'SALESMAN', 7698,
 to_date('28-9-1981','dd-mm-yyyy'),
 1250, 1400, 30
);
insert into emp
values(
 7844, 'TURNER', 'SALESMAN', 7698,
 to_date('8-9-1981','dd-mm-yyyy'),
 1500, 0, 30
);
insert into emp
values(
 7876, 'ADAMS', 'CLERK', 7788,
 to_date('13-JUL-87', 'dd-mm-rr') - 51,
 1100, null, 20
);
insert into emp
values(
 7900, 'JAMES', 'CLERK', 7698,
 to_date('3-12-1981','dd-mm-yyyy'),
 950, null, 30
);
insert into emp
values(
 7934, 'MILLER', 'CLERK', 7782,
 to_date('23-1-1982','dd-mm-yyyy'),
 1300, null, 10
);
commit;

--Boletín ejercicios con cursores EMP-DEPT
/*1 Se quiere visualizar el nombre y la fecha de alta de todos los empleados, ordenados por el nombre de Z a A.*/
set serveroutput on;
DECLARE
    CURSOR C_E IS SELECT *  FROM EMP ORDER BY ENAME DESC; 
    CONT INT := 0;
BEGIN
    FOR I IN C_E LOOP
        dbms_output.put_line(I.ENAME ||' - '||I.HIREDATE);
        CONT := CONT + 1;
    END LOOP;
    dbms_output.put_line('Total:' || CONT);
END;
/
--- O DE OTRA FORMA SIN CURSOR --
DECLARE
BEGIN
    FOR I IN (SELECT *  FROM EMP ORDER BY ENAME DESC) LOOP
        dbms_output.put_line(I.ENAME ||' - '||I.HIREDATE);
    END LOOP;  
END;
/
/*2 Encuentra el primer empleado con un sueldo mayor que 2000. Muestra su nombre y su salario (solo del primero). 
NOTA: siempre puedes salir de un bucle con exit;*/
set serveroutput on;
DECLARE
    CURSOR C_E IS SELECT *  FROM EMP WHERE SAL > 2000; 
BEGIN
    FOR I IN C_E LOOP
        dbms_output.put_line(I.ENAME ||' - '||I.SAL);
        EXIT;
    END LOOP;
END;
/
--- O DE OTRA FORMA  --
DECLARE
    CURSOR C_E IS SELECT *  FROM EMP WHERE SAL > 2000; 
    EMPLEADO EMP%ROWTYPE;
BEGIN
    FOR EMPLEADO IN C_E LOOP
        dbms_output.put_line(EMPLEADO.ENAME ||' - '||EMPLEADO.SAL);
        EXIT;
    END LOOP;
END;
/
/*3 Pide al usuario que introduzca un empno y te muestre por la salida el empno, ename y la loc del departamento en el que trabaja*/
set serveroutput on;
DECLARE
    EMPNO1 EMP.EMPNO%TYPE := &EMPNO;
    CURSOR C_E IS SELECT *  FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE EMPNO1 = EMP.EMPNO; 
    CONT INT := 0;
BEGIN
    FOR I IN C_E LOOP
        dbms_output.put_line(I.EMPNO ||' - '||I.ENAME||' - '||I.LOC);
        CONT := CONT + 1 ;
    END LOOP;
    IF CONT = 0 THEN
        dbms_output.put_line('NO EXISTE');
    END IF;    
END;
/
--- OTRA FORMA----
set serveroutput on;
DECLARE
    EMPNO1 EMP.EMPNO%TYPE := &EMPNO;
    CURSOR C_E IS SELECT *  FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE EMPNO1 = EMP.EMPNO; 
BEGIN
    FOR I IN C_E LOOP
        dbms_output.put_line(I.EMPNO ||' - '||I.ENAME||' - '||I.LOC);
    END LOOP;
END;
/
--- CURSOR EXPLICITO NO SE NECESITA EXCEPCIONES
/*4 En la tabla EMP incrementar el salario el 10% a los empleados que tengan una comisi?n superior al 5% del salario. Para ello recorre cada uno de 
los empleados, y en caso de que se de esa condici?n del 5%, realiza el update y muestra un mensaje con el nombre del empleado con sal actualizado.*/
set serveroutput on;
DECLARE
    salNuevo emp.sal%type;
BEGIN
    for fila in ( select * from emp where comm > 0.05*sal ) LOOP
        update emp set sal = sal * 1.10 where empno = fila.empno;
        select sal into salNuevo from emp where empno = fila.empno;
        dbms_output.put_line(fila.ename||': ' || salNuevo);
    end loop;
end;
/


/*5 Modifica el ejercicio anterior para, tras actualizar el salario, mostrar el nombre del empleado, la comisi?n, el salario antiguo y el salario 
nuevo. Adem?s, cuando no se actualice el salario, indicar un mensaje "El empleado XXX no ha tenido subida en su salario".*/
set serveroutput on;
DECLARE
    salNuevo emp.sal%type;
BEGIN
    for fila in ( select * from emp ) LOOP
        if fila.comm > 0.05*fila.sal then
            update emp set sal = sal * 1.10 where empno = fila.empno;
            select sal into salNuevo from emp where empno = fila.empno;
            dbms_output.put_line(fila.ename||', ' || fila.comm || ', ' || fila.sal || ': ' || salNuevo);
        ELSE
            dbms_output.put_line('El empleado ' || fila.ename || ' no ha tenido subida en su salario');
        end if;
    end loop;
end;
/
/*6 Pide que introduzca el usuario una cadena de caracteres por teclado. Muestra el empno y el ename de todos los empleados que tengan en su ename 
esa cadena introducida. Al finalizar, muestra un mensaje con el n?mero total de empleados que lo tienen.*/
set serveroutput on;
DECLARE
    CAD VARCHAR2(50) := '&CADENA';
    CONT INT := 0;
BEGIN
    for fila in (select EMPNO,ENAME from emp WHERE ENAME LIKE '%'||CAD||'%') 
    LOOP
        dbms_output.put_line(fila.EMPNO||', ' || fila.ENAME);
    end loop;
    SELECT COUNT(EMPNO) INTO CONT FROM EMP WHERE ENAME LIKE '%'||CAD||'%';
    dbms_output.put_line('TOTAL: ' || CONT);
end;
/

/*7 Muestra el nombre de cada departamento junto al n?mero de empleados que tiene, incluso si no tiene empleados.*/
set serveroutput on;
BEGIN
    for fila in (select dname,count(empno) as contador from emp right join dept on dept.deptno = emp.deptno group by dname) LOOP
        dbms_output.put_line(fila.dname || '-' || fila.contador);
    end loop;
end;
/

/*8 Busca todos los empleados que tienen salario + comisi?n mayor a 2000, y asignarles como salario esa suma. Solo puedes hacerlo si tienen comisi?n.
Muestra por la salida el nombre de todos los empleados que modifiquen su salario, as? como el n?mero total de empleados que se han actualizados.*/

/*9 Muestra el ename y sal de los cinco empleados con el salario m?s alto.*/

/*10 Por cada puesto de trabajo(job), muestra el puesto y luego los dos empleados que tienen ese puesto y cobran menos. Si hay menos de dos empleados,
muestra los que haya.*/





--------------------------------------------------------  JUEVES 10 DE ABRIL  ------------------------------------------------------------------------ 
--Excepciones
set serveroutput on;
declare
    miDescripcion asignaturas.descripcion%type;
    num int := 5;
    miExcepcion exception;
    numMiError int := -20001;
begin
    --dbms_output.put_line(4/0);
    --Si num es menor de 5 no quiero que se siga ejecutando
    if num < 5 then
        raise miExcepcion;
    else
        raise_application_error(numMiError,'Este es un error personalizado');
    end if;
    --Primera excepción es no data found
    --select descripcion into miDescripcion from asignaturas where codigo = 11;
    --Segunda excepción es too many rows
    select descripcion into miDescripcion from asignaturas where curso = 1;
    dbms_output.put_line(miDescripcion);
exception
    when miExcepcion then
        dbms_output.put_line(SQLCODE);
        dbms_output.put_line('No se permite que valga menos de 5');
    when others then
        if sqlcode = -1422 then
            dbms_output.put_line('Hay demasiados valores');
        elsif sqlcode = -20001 then
            dbms_output.put_line('El mío');
        else 
            dbms_output.put_line(SQLCODE);
            dbms_output.put_line(SQLERRM);
            dbms_output.put_line('Error');
        end if;
end;
/
 
--Ejercicio 1
set serveroutput on;
declare
    v_numerador number := 10;
    v_denominador number := 0;
    v_resultado number;
begin
    v_resultado := v_numerador / v_denominador;
    dbms_output.put_line('resultado: ' || v_resultado);
exception
    when others then
        dbms_output.put_line('código de error: ' || sqlcode);
        dbms_output.put_line('mensaje de error: ' || sqlerrm);
end;
/
--Ejercicio 1.1
set serveroutput on;
declare
    numerador number := 10;
    denominador number := 0;
    resultado number;
begin
    resultado := numerador / denominador;
    dbms_output.put_line('resultado: ' || resultado);
exception
    when others then
        dbms_output.put_line(substr(SQLERRM,instr(SQLERRM,': ') +2));
end;
/
 
--Ejercico 2
set serveroutput on;
declare
    total_estudiantes number;
    nalumnos exception;
begin
    select count(*) into total_estudiantes from estudiantes;
 
    if total_estudiantes = 0 then
        raise nalumnos;
    else
        dbms_output.put_line('número total de estudiantes: ' || total_estudiantes);
    end if;
exception
    when nalumnos then
        dbms_output.put_line('no hay alumnos en la tabla estudiantes.');
end;
/
--Ejercicio 3
set serveroutput on;
declare
    total_estudiantes number;
    nalumnos exception;
    muchos_alumnos exception;
begin
    select count(*) into total_estudiantes from estudiantes;
    if total_estudiantes = 0 then
        raise nalumnos;
    elsif total_estudiantes >= 5 then
        raise muchos_alumnos;
    else
        dbms_output.put_line('número total de estudiantes: ' || total_estudiantes);
    end if;
exception
    when nalumnos then
        dbms_output.put_line('no hay alumnos en la tabla estudiantes.');
    when muchos_alumnos then
        dbms_output.put_line('Hay menos de 5 estudiantes.');
end;
/
----------------------   Boletín ejercicios con excepciones 

/*1 Pide al usuario que introduzca un código de asignatura y muestra el código junto al curso y descripción. Controla las siguiente excepciones 
mostrando un mensaje de error: no existe ese código en la tabla asignaturas.*/
set serveroutput on;
declare
    v_codigo_asignatura asignaturas.codigo%type := &codigo_asignatura;
    v_curso asignaturas.curso%type;
    v_descripcion asignaturas.descripcion%type;
begin
    select curso, descripcion
    into v_curso, v_descripcion
    from asignaturas
    where codigo = v_codigo_asignatura;
    dbms_output.put_line('Código: ' || v_codigo_asignatura || ', Curso: ' || v_curso || ', Descripción: ' || v_descripcion);
exception
    when no_data_found then
        dbms_output.put_line('Error: No existe una asignatura con el código proporcionado.');
end;
/
/*2 Se quiere pedir al usuario que introduzca un nivel de curso (primer curso o segundo), introduciendo 1 o 2 por teclado. Una vez se meta el nivel,
muestra por la salida todas las descripciones de las asignaturas de ese nivel. Excepciones a tener en cuenta mostrando un mensaje de error: el nivel no
es un número válido y el número no existe en la tabla asignaturas. NOTA: para saber si han introduciendo un número, puedes controlarlo con la excepción
value_error a la que se accede cuando se produce un error en una conversión (por ejemplo al llamar a to_number() y no puede hacer la conversión).*/
--variables para probar: 1, 2, 3, S
set serveroutput on;
declare
    numeroCadena varchar2(100) := '&metevalor';
    numeroNumerico int;
    numeroNoValido exception;
    cuantosHay int := 0;
    noExisteCurso exception;
begin
    --lanzar value_error si falla to_number(). '5' > to_number('5') = 5 no falla. to_number('H') FALLA -> value_error
    numeroNumerico := to_number(numeroCadena);
    if numeroNumerico = 1 or numeroNumerico = 2 then
        select count(curso) into cuantosHay from asignaturas where curso = numeroNumerico;
        if cuantosHay > 0 then
            for fila in (select descripcion from asignaturas where curso = numeroNumerico) loop
                dbms_output.put_line(fila.descripcion);
            end loop;
        else
            raise noExisteCurso;
        end if;
    else
        raise numeroNoValido;
    end if;
exception
    when value_error then
        dbms_output.put_line('Tienes que meter un número, no una letra');
    when numeroNoValido then
        dbms_output.put_line('Número distinto a 1 o 2, no se puede.');
    when noExisteCurso then
        dbms_output.put_line('No existe ese curso en bd.');
end;
/
 
/*3 Se quiere una lista donde se muestre el curso y cuántas asignaturas hay en ese curso (una línea por cada curso). 
Ejemplo: Curso 1: 4 asignaturas. Excepciones a tener en cuenta: crea una excepción personalizada llamada cursoConRedes de forma que si el curso tiene
la asignatura con descripción "Redes" no debes mostrarlo por pantalla, terminando la ejecución de tu código y mostrando en tu excepción el siguiente
mensaje: "No se puedes mostrar datos porque existe la asignatura de Redes".*/
set serveroutput on;
SELECT CURSO,COUNT(CURSO) FROM ASIGNATURAS GROUP BY CURSO;

declare
    cursor misCursos is select curso,count(curso) from asignaturas group by curso;
    miCurso asignaturas.curso%type;
    miCuenta int := 0;
    cursoConRedes exception;
    existeRedes asignaturas.codigo%type;
begin
    select codigo into existeRedes from asignaturas where descripcion = 'Redes2';
    raise cursoConRedes;
exception
    when no_data_found then
        open misCursos;
        fetch misCursos into miCurso,miCuenta;
        dbms_output.put_line('Curso ' || miCurso || ': ' || miCuenta || ' asignaturas');
        fetch misCursos into miCurso,miCuenta;
        dbms_output.put_line('Curso ' || miCurso || ': ' || miCuenta || ' asignaturas');
        close misCursos;
    when cursoConRedes then
        dbms_output.put_line('No se puedes mostrar datos porque existe la asignatura de Redes');
end;
/

/*4 Se quiere mostrar por la salida el nombre de cada asignatura y la nota media obtenida en las matrículas de esa asignatura por parte de los alumnos.
Excepciones a tener en cuenta: crea una excepción personalizada menosDeCinco que, una vez mostradas todas las notas media, si alguna tiene un valor 
menor a cinco, llamar a esa excepción personalizada indicando el mensaje "Hay alguna asignatura con una media inferior a cinco".*/
set serveroutput on;
SELECT * FROM MATRICULAS;
SELECT * FROM ASIGNATURAS;
select asignaturas.descripcion,avg(matriculas.nota) from asignaturas join matriculas on cod_asignatura = codigo group by asignaturas.descripcion;
declare
    cursor misCursos is select asignaturas.descripcion,avg(matriculas.nota) from asignaturas join matriculas on cod_asignatura = codigo group by asignaturas.descripcion;
    menosDeCinco exception;
    cuantosHay int := 0;
begin
    numeroNumerico := to_number(numeroCadena);
    if numeroNumerico = 1 or numeroNumerico = 2 then
        select count(curso) into cuantosHay from asignaturas where curso = numeroNumerico;
        if cuantosHay > 0 then
            for fila in (select descripcion from asignaturas where curso = numeroNumerico) loop
                dbms_output.put_line(fila.descripcion);
            end loop;
        else
            raise noExisteCurso;
        end if;
    else
        raise numeroNoValido;
    end if;
exception
    when value_error then
        dbms_output.put_line('Tienes que meter un número, no una letra');
    when numeroNoValido then
        dbms_output.put_line('Número distinto a 1 o 2, no se puede.');
    when noExisteCurso then
        dbms_output.put_line('No existe ese curso en bd.');
end;
/
 
/*5 Modifica el ejercicio 4 para mostrar por la salida solo las asignaturas que tienen una media superior a 5. A continuación, si has mostrado una o más
asignaturas con una media con decimales, llama a una excepción personalizada tienenDecimales que muestre todas esas asignaturas con decimales, separadas
por coma.*/
 
 
/*6 Se quiere pedir por teclado el código de una asignatura. Muestra una lista de todos los alumnos que están matriculados (dni y nombre de los almnos) 
y la nota que han sacado. Ten en cuenta las siguientes excepciones: el código de asignatura es un número, existe en la tabla asignaturas y además hay 
matrículas de alumnos en esa asignatura. Para esa última excepción, crea una excepción personalizada que se llame noMatriculas.*/



-------------       MIERCOLES 23 DE ABRIL DE 2025  ------------------------

-- PROCEDIMIENTO SIN PARAMETROS
set serveroutput on;
CREATE OR REPLACE PROCEDURE MIPROCEDIMIENTO
IS
    CONT INT := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE(CONT);
END;
/
BEGIN
    MIPROCEDIMIENTO;
    MIPROCEDIMIENTO;
    MIPROCEDIMIENTO;
END;
/

-- PROCEDIMIENTO CON PARAMETROS DE ENTRADA
set serveroutput on;
CREATE OR REPLACE PROCEDURE MIPROCEDIMIENTO2(MINUM IN INT)
IS
    CONT INT := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(CONT + MINUM);
END;
/
BEGIN
    MIPROCEDIMIENTO2(5);
    MIPROCEDIMIENTO2(1);
    MIPROCEDIMIENTO2(4);
END;
/
-- PROCEDIMIENTO CON PARAMETROS DE SALIDA
set serveroutput on;
CREATE OR REPLACE PROCEDURE MIPROCEDIMIENTO3(MINUM IN INT,RESTA OUT INT)
IS
    CONT INT := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(CONT + MINUM);
    RESTA := MINUM - CONT;
END;
/
DECLARE
    PARAM2 INT;
BEGIN
    MIPROCEDIMIENTO3(5,PARAM2);
    DBMS_OUTPUT.PUT_LINE(PARAM2);
    MIPROCEDIMIENTO3(1,PARAM2);
    DBMS_OUTPUT.PUT_LINE(PARAM2);
    MIPROCEDIMIENTO3(4,PARAM2);
    DBMS_OUTPUT.PUT_LINE(PARAM2);
END;
/
-- PROCEDIMIENTO CON PARAMETROS DE ENTRADA/SALIDA
set serveroutput on;
CREATE OR REPLACE PROCEDURE MIPROCEDIMIENTO4(MINUM IN INT,RESTA IN OUT INT)
IS
    CONT INT := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(CONT + MINUM);
    RESTA := RESTA + MINUM - CONT;
END;
/
DECLARE
    PARAM2 INT := 4;
BEGIN
    MIPROCEDIMIENTO4(5,PARAM2);
    DBMS_OUTPUT.PUT_LINE(PARAM2);
    MIPROCEDIMIENTO4(1,PARAM2);
    DBMS_OUTPUT.PUT_LINE(PARAM2);
    MIPROCEDIMIENTO4(4,PARAM2);
    DBMS_OUTPUT.PUT_LINE(PARAM2);
END;
/
-- PROCEDIMIENTO CON PARAMETROS DE ENTRADA/SALIDA
set serveroutput on;
CREATE OR REPLACE PROCEDURE MIPROCEDIMIENTO5(RESTA OUT INT)
IS
    CONT INT := 10;
BEGIN
    RESTA := CONT * 2;
END;
/
DECLARE
    PARAM2 INT := 4;
BEGIN
    DBMS_OUTPUT.PUT_LINE(PARAM2); -- 4
    MIPROCEDIMIENTO5(PARAM2);
    DBMS_OUTPUT.PUT_LINE(PARAM2); -- 20
END;
/

--- PDF 05 PROCEDIMIENTOS Y FUNCIONES
/*Ejercicio 1
Crea un procedimiento que se llame consultarEmpleado. Debe tomar una variable de entrada v_empno con el tipo de dato del campo empno de la tabla emp.
Debe tomar como variables de salida v_ename y v_job, cuyos tipos de datos deben coincidir con los de los campos ename y job de la tabla emp. 
Controla con una excepción que no se encuentre ningún dato con el valor de v_empno de entrada, mostrando el mensaje “No se encontraron datos”. */
--  DEL PERA
set serveroutput on;
create or replace procedure consultarEmpleado(v_empno in emp.empno%type, v_ename out emp.ename%type, v_job out emp.job%type)
is 
    cont int;
    noData exception;
begin
    select count(*) into cont from emp where v_empno = empno;
    if cont = 0 then
        raise noData;
    else
        select ename,job into v_ename,v_job from emp where v_empno = empno;
    end if;
exception
    when noData then
        dbms_output.put_line('No se encuentran datos');
end;
/
declare
codigo emp.empno%type := &introduzcaEmpno;
nombre emp.ename%type;
trabajo emp.job%type;
begin
    consultarEmpleado(codigo,nombre,trabajo);
if nombre is not null and trabajo is not null then
    dbms_output.put_line('Nombre: ' || nombre || ' - Trabajo: ' || trabajo);
end if;
end;
/

-- DE INDA
create or replace procedure consultarEmpleado(
    v_empno in emp.empno%type,
    v_ename out emp.ename%type,
    v_job out emp.job%type)
IS
BEGIN
    select ename,job into v_ename,v_job from emp where empno = v_empno;
EXCEPTION
    when no_data_found THEN
        dbms_output.put_line('No se encontraron datos');
end;
/
create or replace procedure consultarEmpleadoCE(
    v_empno in emp.empno%type,
    v_ename out emp.ename%type,
    v_job out emp.job%type)
IS
    --cursor misDatos is select * from emp;
    contador int := 0;
    noHaydatos exception;
BEGIN
    --for datos in misDatos LOOP
    for datos in (select * from emp) loop
        if datos.empno = v_empno THEN
            v_ename := datos.ename;
            v_job := datos.job;
            contador := 1;
        end if;
    end loop;
    if contador = 0 THEN
        raise noHaydatos;
    end if;
EXCEPTION
    when noHaydatos THEN
        dbms_output.put_line('No se encontraron datos');
end;
/
--Ejercicio 2 Invoca al procedimiento consultarEmpleado pasando tres variables (id, nombre y  uesto). La variable id debe obtener su valor pidiéndola
--por pantalla al usuario. Se debe  mostrar por pantalla el resultado devuelto del procedimiento anterior en las variables de salida nombre y puesto.
DECLARE
    miEname emp.ename%type;
    miJob emp.job%type;
    miCodigo emp.empno%type := 7831;
BEGIN
    consultarEmpleadoCE(miCodigo,miEname,miJob);
    if miEname is not null and miJob is not null then
        dbms_output.put_line(miEname || ' ' || miJob);
    end if;
end;
/
select * from emp;

/* Ejercicio 4
Escribe un procedimiento denominado is_today que muestre por pantalla la fecha de hoy, y luego llámalo desde un bloque anónimo.*/
create or replace procedure IS_TODAY(HOY DATE)
IS
BEGIN
     dbms_output.put_line(HOY);
end;
/
BEGIN   
    IS_TODAY(SYSDATE);
END;
/
CREATE OR REPLACE PROCEDURE today_is is
BEGIN
  DBMS_OUTPUT.PUT_LINE( 'Hoy es ' || TO_CHAR(SYSDATE, ' DD/MM/YYYY') );
END today_is;
/
BEGIN
    TODAY_IS(); 
END;
/

/*Ejercicio 5
Escribe un procedimiento denominado is_today2 que, dada la fecha de hoy, la escriba por pantalla. Invoca al procedimiento con la fecha de hoy*/
CREATE OR REPLACE PROCEDURE today2_is ( fecha DATE ) IS
BEGIN
  DBMS_OUTPUT.PUT_LINE( 'Hoy es ' || TO_CHAR(fecha, ' DD/MM/YYYY') );
END;
/
DECLARE 
BEGIN
  today2_is(sysdate);  
END;
/


----------------    JUEVES 24 DE ABRIL DE 2025   -----------------------
-- FUNCIONES  ---
-- FUNCIONES SIN PARAMETROS
set serveroutput on;
CREATE OR REPLACE FUNCTION MIFUNCION
RETURN VARCHAR2
IS
BEGIN
    -- DBMS_OUTPUT.PUT_LINE('HOLA');
    RETURN 'OK';
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE(MIFUNCION);
END;
/

-- ¿QUÉ SUCEDE SI TENGO UNA EXCEPTION?
SELECT * FROM DEPT;
--CREAR LA FUNCION DAMEDEPTNO QUE RECIBA DNAME Y DEVUELVE SU DEPTNO
create or replace function dameDeptno (v_name dept.dname%type)
return dept.deptno%type
is
depar dept.deptno%type;
begin
    select deptno into depar from dept where dname  = v_name;
    return depar;
Exception 
        when no_data_found then
            dbms_output.put_line('No hay datos'); 
        return -1;
end;
/
declare
nombre dept.dname%type := '&Introduzca_Deptno';
resultado dept.deptno%type;
begin
    resultado := dameDeptno(nombre);
    dbms_output.put_line(resultado); 
end;
/

-- FUNCIONES CON PARAMETROS
/*Queremos una función datoFecha a la que le pasaremos dos parámetros (siempre son de entrada). El primer parámetro es una fecha y el 
segundo puede ser 'DIA' o 'MES', de forma que la función devuelva el nombre del mes o el nombre del día de la semana de esa fecha. 
Ej. sysdate,'DIA' > JUEVES. sysdate,'MES' > ABRIL */
create or replace function datoFecha(fecha in date,datoAMostrar in varchar2)
return varchar2
is
begin
    if datoAMostrar = 'DIA' then
        return to_char(fecha,'DAY');
    elsif datoAMostrar = 'MES' then
        return to_char(fecha,'MONTH');
    else
        return 'No es correcto, debes pasar dia o mes';
    end if;
end;
/
begin
    dbms_output.put_line(datoFecha(sysdate,'DIA'));
    dbms_output.put_line(datoFecha('01/01/2025', 'MES'));
    dbms_output.put_line(datoFecha('31/12/2025', 'DIA'));
end;
/
drop function datoFecha;

--Ejercicio 6
--Crea una función nombreEstudiante, que dado un código de estudiante, devuelva su nombre y apellidos. Ten en cuenta que el no código exista.
set serveroutput on;
create or replace function nombreEstudiante(v_codigo estudiantes.codigo%type)
return varchar2
is
nombreCompleto varchar2(250);
begin
    select nombre || ' ' || apellidos into nombreCompleto from estudiantes where codigo = v_codigo;
    return nombreCompleto;
exception 
    when no_data_found then
    return 'No hay estudiantes con ese codigo'; 
end;
/
declare
codigoE estudiantes.codigo%type := &IntroduzcaCodigo;
begin
    dbms_output.put_line(nombreEstudiante(codigoE));
end;
/
--de inda
create or replace function nombreEstudiante(codigoEstudiante estudiantes.codigo%type)
return VARCHAR2
IS
    vnombre estudiantes.nombre%type;
    vapellidos estudiantes.apellidos%type;
BEGIN
    select nombre,apellidos into vnombre,vapellidos from estudiantes where codigo = codigoEstudiante;
    return vnombre || ' ' || vapellidos;
EXCEPTION
    when no_data_found THEN
        return 'No existe ese código';
end;
/
create or replace function nombreEstudiante2(codigoEstudiante estudiantes.codigo%type)
return VARCHAR2
IS
    cursor datosEstudiantes is select nombre,apellidos from estudiantes where codigo = codigoEstudiante;
    vnombre estudiantes.nombre%type;
    vapellidos estudiantes.apellidos%type;
    noHayDatos exception;
BEGIN
    open datosEstudiantes;
    fetch datosEstudiantes into vnombre,vapellidos;
    if datosEstudiantes%rowcount = 0 THEN
        raise noHayDatos;
    end if;
    close datosEstudiantes;
    return vnombre || ' ' || vapellidos;
EXCEPTION
    when noHayDatos THEN
        return 'No existe ese código';
end;
/
BEGIN
    dbms_output.put_line(nombreEstudiante(20));
    dbms_output.put_line(nombreEstudiante2(2));
    dbms_output.put_line(nombreEstudiante2(20));
end;
/
/*Ejercicio 7
Crear una función totalEstudiantes, que devuelva el número total de estudiantes.*/
set serveroutput on;
create or replace function totalEstudiantes
return int
is
cont int;
begin
    select count(*) into cont from estudiantes;
    return cont;
exception 
    when no_data_found then
    return 'No hay estudiantes con ese codigo'; 
end;
/
begin
    dbms_output.put_line('Hay ' || totalEstudiantes || ' estudiantes.');
end;
/

--42 CREA UN PROCEDIMIENTO MOSTRARBECARIOS QUE MUESTRE A LOS DOS EMP MÁS NUEVOS DE CADA DEPART. TRATA LAS EXCEPCIONES QUE CONSIDERES NECESARIAS.
CREATE OR REPLACE PROCEDURE MOSTRARBECARIOS 
IS
    cont int := 0;
    noHayEmp exception;
BEGIN
    --Lo más fácil es recorrer todos los departamentos
    for filaDept in (select * from dept) loop
        cont := 0;
        DBMS_OUTPUT.PUT_LINE(filaDept.deptno);
        --Recorrer todos los empleados y mostrar los dos más nuevos
        for filaEmp in (select * from emp where deptno = filaDept.deptno order by hiredate desc) loop
            if cont >= 2 then
                exit;
            end if;
            cont := cont +1;
        DBMS_OUTPUT.PUT_LINE(filaEmp.ename);
        end loop;
    end loop;
exception
    when noHayEmp then
        DBMS_OUTPUT.PUT_LINE('No hay empleados.');
END;
/
DECLARE 
BEGIN
    MOSTRARBECARIOS;
END;
/
------------------ 01.ACTIVIDADES 1  ----------------------------------

/*1.Se quiere saber si un año es bisiesto o no. Para ello, se debe pedir por pantalla introducir un año, y luego se mostrará un mensaje por
pantalla indicando "El año es bisiesto" o "El año no es bisiesto", según corresponda. Un año es bisiesto si el resto de dividir el año 
entre 4 es cero y además, el resto de dividir ese año entre 100 es distinto de cero o bien el resto de dividir ese año entre 400 es cero.*/

/*2.Realiza el ejercicio anterior pero usando la siguiente condición para saber si es bisiesto: "un año bisiesto tiene 366 días".*/

/*3.Obtener dos listas con los pares e impares desde el 1 hasta el número que se introduzca por pantalla.*/

/*4.Dado un determinado código de departamento (DEPTNO) de la tabla DEPT, devolver por pantalla el nombre (DNAME).*/

/*5.Obtener el nombre (ENAME) y puesto de trabajo (JOB) del empleado (tabla EMP) que tenga el código (EMPNO) igual a 7782.*/

/*6.Pedir por pantalla un NIF (8 números y una letra). Comprobar si la letra es correcta y luego mostrar por pantalla si ese NIF es correcto.*/



----------------    Miércoles 14 DE Mayo DE 2025   -----------------------
----------------    06. PAQUETES   -----------------------

set serveroutput on;
-- EJEMPLO DE PAQUETE CON UN TIPO DE DATO REGISTRO DECLARADO EN ÉL Y USADO DESPUÉS EN UNA FUNCIÓN COMO TIPO DE DATO DEVULETO
CREATE OR REPLACE PACKAGE PRUEBAS
IS
    TYPE DATOS IS RECORD(
        NOMBRE DEPT.DNAME%TYPE,
        CIUDAD DEPT.LOC%TYPE
    );
    FUNCTION OBTENERDEPT (ID_DEPT DEPT.DEPTNO%TYPE) RETURN DATOS;
END;
/
CREATE OR REPLACE PACKAGE BODY PRUEBAS
IS
    FUNCTION OBTENERDEPT (ID_DEPT DEPT.DEPTNO%TYPE) RETURN DATOS
    IS
        RESULTADO DATOS;
    BEGIN
        SELECT DNAME,LOC INTO RESULTADO.NOMBRE,RESULTADO.CIUDAD FROM DEPT WHERE DEPTNO = ID_DEPT;
        RETURN RESULTADO;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO EXISTE ESE DEPTNO');
            RETURN NULL;
    END;
END;
/
SET SERVEROUTPUT ON;
BEGIN
    DBMS_OUTPUT.PUT_LINE(PRUEBAS.OBTENERDEPT(21).NOMBRE);
    DBMS_OUTPUT.PUT_LINE(PRUEBAS.OBTENERDEPT(20).NOMBRE);
    DBMS_OUTPUT.PUT_LINE(PRUEBAS.OBTENERDEPT(30).CIUDAD);
END;
/

--EJEMPLO 1
CREATE OR REPLACE PACKAGE PAQUETE1
IS
    PROCEDURE RESET_CONT(V_NUEVO NUMBER);
END;
/

CREATE OR REPLACE PACKAGE BODY PAQUETE1
IS
    PROCEDURE RESET_CONT(V_NUEVO NUMBER)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(V_NUEVO);
    END;

END;
/

BEGIN
    PAQUETE1.RESET_CONT(2);
END;
/

--EJEMPLO 2 
CREATE OR REPLACE PACKAGE PAQUETE1
IS
    PROCEDURE RESET_CONT(V_NUEVO NUMBER);
    TYPE MIREGISTRO IS RECORD(
    ID INT,
    NOMBRE VARCHAR2(50)
    );
END;
/

CREATE OR REPLACE PACKAGE BODY PAQUETE1
IS
    PROCEDURE RESET_CONT(V_NUEVO NUMBER)
    IS
        MIVARIABLE MIREGISTRO;
    BEGIN
        MIVARIABLE.ID := 1;
        DBMS_OUTPUT.PUT_LINE(V_NUEVO || '-' || MIVARIABLE.ID);
    END;

END;
/

BEGIN
    PAQUETE1.RESET_CONT(2);
END;
/

/*Ejercicio 1
Escriba un paquete llamado operaciones con:
? Función suma que dados dos números devuelva la suma de ellos.
? Función resta que dado dos números devuelva la resta de ellos.
? Función positivo que devuelva true si es positivo o false en caso contrario.
Llamar a dichas funciones en un bloque anónimo.*/

CREATE OR REPLACE PACKAGE OPERACIONES
IS
    FUNCTION SUMA(N1 INT, N2 INT) RETURN INT;
    FUNCTION RESTA(N1 INT, N2 INT) RETURN INT;
    FUNCTION POSITIVO(N1 INT) RETURN BOOLEAN;
    
END OPERACIONES;
/

CREATE OR REPLACE PACKAGE BODY OPERACIONES
IS
    FUNCTION SUMA (N1 INT, N2 INT) RETURN INT
    IS
    BEGIN
    RETURN N1 + N2;
    END;
    
    FUNCTION RESTA (N1 INT, N2 INT) RETURN INT
    IS
    BEGIN
    RETURN N1 - N2;
    END;
    
    FUNCTION POSITIVO(N1 INT) RETURN BOOLEAN
    IS
    BEGIN
        IF N1 >= 0 THEN
         RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(OPERACIONES.SUMA(2,2));
    DBMS_OUTPUT.PUT_LINE(OPERACIONES.RESTA(2,2));
    DECLARE
        estado varchar2(40) := 'Negativo';
        numResta int;
    BEGIN
        numResta := operaciones.resta(10, 50);
        if OPERACIONES.POSITIVO(numResta) then
            estado := 'Positivo';
        end IF;
        DBMS_OUTPUT.PUT_LINE('El resultado es ' || numResta || ' y es ' || estado);
    END;
END;
/
/*Ejercicio 2
Escriba un paquete gestionEMP con:
? Procedimiento nuevoEmpleado que inserte un nuevo empleado con los siguientes datos:
? Empno = 8000
? Ename = JUAN
? JOB = CLERK
? MGR = 7902
? HIREDATE = 01/05/22
? SAL = 1500
? COMM = NULL
? DEPTNO = 20
? Al insertar el nuevo empleado, debe mostrar un mensaje “Registro creado correctamente”.
Llamar al procedimiento en un bloque anónimo y muestra el mensaje.*/
CREATE OR REPLACE PACKAGE GESTIONEMP 
IS
    PROCEDURE nuevoEmpleado (EMP1 EMP%ROWTYPE);
END GESTIONEMP;
/

CREATE OR REPLACE PACKAGE BODY GESTIONEMP
IS
    PROCEDURE nuevoEmpleado (EMP1 EMP%ROWTYPE)
    IS
    BEGIN
        INSERT INTO EMP VALUES EMP1;
    END;
END;
/

DECLARE
    EMP1  EMP%ROWTYPE;
BEGIN
    EMP1.EMPNO := 8000;
    EMP1.ENAME := 'JUAN';
    EMP.JOB := 'CLERK';
    EMP1.MGR := 7902;
    EMP1.HIREDATE := '01/05/22';
    EMP1.SAL := 1500;
    EMP1.COMM := NULL;
    EMP1.DEPTNO := 20;
    GESTIONEMP.nuevoEmpleado(EMP1);
    dbms_output.put_line('Registro creado correctamente');
END;
/

-- EL DE INDA
create or replace package gestionEMP
IS
    procedure nuevoEmpleado(
    id emp.empno%type,
    nombre emp.ename%type,
    puesto emp.job%type,
    jefe emp.mgr%type,
    fecha emp.hiredate%type,
    salario emp.sal%type,
    comision emp.comm%type,
    departamento emp.deptno%type
    );
end;
/
create or replace package body gestionEMP
is
    procedure nuevoEmpleado(
        id emp.empno%type,
        nombre emp.ename%type,
        puesto emp.job%type,
        jefe emp.mgr%type,
        fecha emp.hiredate%type,
        salario emp.sal%type,
        comision emp.comm%type,
        departamento emp.deptno%type
        )
    IS
        numEmpleadosEmpno int;
        yaExiste exception;
    BEGIN
        select count(empno) into numEmpleadosEmpno from emp where empno = id;
        if numEmpleadosEmpno = 0 then
            insert into emp values (id,nombre,puesto,jefe,fecha,salario,comision,departamento);
            commit;
            dbms_output.put_line('Registro creado correctamente');
        ELSE
            raise yaExiste;
        end if;
    EXCEPTION
        when yaExiste THEN
            dbms_output.put_line('Ya existe ese empno, no se puede insertar');
    end;
end;
/
BEGIN
    gestionEMP.nuevoEmpleado(8001,'JUAN','CLERK',7902,'01/05/22',1500,null,20);
end;
/
drop procedure nuevoEmpleado;
select * from emp;
delete from emp where empno = 8000;
commit;












