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
//  JUEVES 23/01/2025  PDF 00INTRODUCCIÓN PAG 16
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

// PDF 01 CONSTRUCCIÓN DE GUIONES PAG 4
set serveroutput on;
//type
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
//rowtype
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