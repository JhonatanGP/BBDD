
--Boletín ejercicios con excepciones
/*1 Pide al usuario que introduzca un código de asignatura y muestra el código junto al curso y descripción. Controla las siguiente excepciones 
mostrando un mensaje de error: no existe ese código en la tabla asignaturas.

/*2 Se quiere pedir al usuario que introduzca un nivel de curso (primer curso o segundo), introduciendo 1 o 2 por teclado. Una vez se meta el nivel, muestra
por la salida todas las descripciones de las asignaturas de ese nivel. Excepciones a tener en cuenta mostrando un mensaje de error: el nivel no es un número
válido y el número no existe en la tabla asignaturas. NOTA: para saber si han introduciendo un número, puedes controlarlo con la excepción value_error a la 
que se accede cuando se produce un error en una conversión (por ejemplo al llamar a to_number() y no puede hacer la conversión). */

/*3 Se quiere una lista donde se muestre el curso y cuántas asignaturas hay en ese curso (una línea por cada curso). Ejemplo: Curso 1: 4 asignaturas. 
Excepciones a tener en cuenta: crea una excepción personalizada llamada cursoConRedes de forma que si el curso tiene la asignatura con descripción "Redes" 
no debes mostrarlo por pantalla, terminando la ejecución de tu código y mostrando en tu excepción el siguiente mensaje: "No se puedes mostrar datos porque
existe la asignatura de Redes".*/

/*4 Se quiere mostrar por la salida el nombre de cada asignatura y la nota media obtenida en las matrículas de esa asignatura por parte de los alumnos. 
Excepciones a tener en cuenta: crea una excepción personalizada menosDeCinco que, una vez mostradas todas las notas media, si alguna tiene un valor menor
a cinco, llamar a esa excepción personalizada indicando el mensaje "Hay alguna asignatura con una media inferior a cinco", sustituyendo AAA por el valor 
concreto.*/

/*5 Modifica el ejercicio 4 para mostrar por la salida solo las asignaturas que tienen una media superior a 5. A continuación, si has mostrado una o más 
asignaturas con una media con decimales, llama a una excepción personalizada tienenDecimales que muestre todas esas asignaturas con decimales, separadas 
por coma. */

/*6 Se quiere pedir por teclado el código de una asignatura. Muestra una lista de todos los alumnos que están matriculados (dni y nombre de los almnos) y la
nota que han sacado. Ten en cuenta las siguientes excepciones: el código de asignatura es un número, existe en la tabla asignaturas y además hay matrículas 
de alumnos en esa asignatura. Para esa última excepción, crea una excepción personalizada que se llame noMatriculas.*/



----------     04. Ejercicios Fáciles PLSQL  ----------------    Enunciado de la práctica facil de PL/SQL 

/*Ejercicio 1
Haz una función llamada DevolverCodDept que reciba el nombre de un departamento y devuelva su código.*/
set serveroutput on;
create or replace function DevolverCodDept(nombredepartamento dept.dname%type)
return dept.deptno%type
is
    resultado dept.deptno%type;
begin
    select deptno into resultado from dept where dname = nombredepartamento;
return resultado;
exception
    when no_data_found then return -1;
end;
/
declare
    nombredpto dept.dname%type := '&mete_nombre_departamento';
begin
    dbms_output.put_line(DevolverCodDept(nombredpto));
end;
/
CREATE OR REPLACE FUNCTION DevolverCodDept2 (nombredepartamento dept.dname%type) 
RETURN dept.deptno%type 
IS
    v_codigo dept.deptno%type;
BEGIN
    SELECT CODIGO INTO v_codigo FROM DEPARTAMENTOS WHERE UPPER(NOMBRE) = UPPER(p_nombre_depto); -- Comparación sin sensibilidad a mayúsculas
    RETURN v_codigo;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- No se encontró el departamento
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Más de un departamento tiene ese nombre');
    WHEN OTHERS THEN
        RAISE; -- Propaga otros errores
END;
/
/*Ejercicio 2
Realiza un procedimiento llamado HallarNumEmp que recibiendo un nombre de departamento, muestre en pantalla el número de empleados de dicho departamento.
Puedes utilizar la función creada en el ejercicio 1. Si el departamento no tiene empleados deberá mostrar un mensaje informando de ello. Si el departamento
no existe se tratará la excepción correspondiente.*/

/*Ejercicio 3
Realiza una función llamada CalcularCosteSalarial que reciba un nombre de departamento y devuelva la suma de los salarios y comisiones de los empleados de
dicho departamento. Trata las excepciones que consideres necesarias.*/

/*Ejercicio 4
Realiza un procedimiento MostrarCostesSalariales que muestre los nombres de todos los departamentos y el coste salarial de cada uno de ellos. Puedes 
usar la función del ejercicio 3.

/*Ejercicio 5
Realiza un procedimiento MostrarAbreviaturas que muestre las tres primeras letras del nombre de cada empleado.*/

/*Ejercicio 6
Realiza un procedimiento MostrarMasAntiguos que muestre el nombre del empleado más antiguo de cada departamento junto con el nombre del departamento. 
Trata las excepciones que consideres necesarias.*/

/*Ejercicio 7
Realiza un procedimiento MostrarJefes que reciba el nombre de un departamento y muestre los nombres de los empleados de ese departamento que son jefes de
otros empleados.Trata las excepciones que consideres necesarias.*/

/*Ejercicio 8
Realiza un procedimiento MostrarMejoresVendedores que muestre los nombres de los dos
vendedores con más comisiones. Trata las excepciones que consideres necesarias.*/

/*Ejercicio 9
Realiza un procedimiento MostrarsodaelpmE que reciba el nombre de un departamento al revés
y muestre los nombres de los empleados de ese departamento. Trata las excepciones que
consideres necesarias.*/

/*Ejercicio 10
Realiza un procedimiento RecortarSueldos que recorte el sueldo un 20% a los empleados cuyo
nombre empiece por la letra que recibe como parámetro.Trata las excepciones que consideres
necesarias.*/

/*Ejercicio 11
Realiza un procedimiento BorrarBecarios que borre a los dos empleados más nuevos de cada
departamento. Trata las excepciones que consideres necesarias.*/



-----------------------------------------------------------------------------------------------------------------------------------------------
--ACTIVIDAD 3 EVALUACION SIMULACRO

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
alter session set nls_language='Spanish';

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

commit;

--EJERCICO 1.
--1.1
drop table empresas cascade constraints;
create table empresas (
    id int primary key,
    nombre_empresa varchar2(100),
    telefono int,
    direccion varchar2(100),
    ref_maquina int
);
select * from empresas;
alter table EMPRESAS add foreign key(ref_maquina) references maquinas(ref);
--1.2
insert into empresas values (4,'cortadora slu',          111222333,null,1);
insert into empresas values (5,'amasadoras compactas sl',123456789,null,4);
insert into empresas values (6,'todo hornos',    null       ,'c/real 5',5);
--1.3
update empresas set telefono = 111222444, direccion = 'c/principal 4',ref_maquina = 3 where id = 6 ;
--1.4
delete empresas where nombre_empresa = 'cortadora slu';

--2.1
select * from clientes;
select * from avances_lineas_fabricacion;  
select distinct upper(nombre_empresa) from clientes join avances_lineas_fabricacion on cif = id_cliente 
    where loc like '%Par%' and trim(to_char(fecha,'month')) = 'diciembre';
--2.2
select maquinas.nombre, sum(cantidad) from maquinas join piezas_maquinas on ref=id_maquina join piezas on idpie = id_pieza
    group by  maquinas.nombre having sum(cantidad) >100 order by sum(cantidad) desc;
    
--2.3 
select substr(nombre,instr(nombre,' ')+1,length(nombre)-instr(nombre,' ')) "Casos alimentación" from piezas where nombre like 'Alimentacion%';
--2.4
select lower(estado)"ESTADO", to_char(fecha,'day')"DIA",hora from avances_lineas_fabricacion where id_maquina 
    in (select ref from maquinas where precio_venta > 500 and precio_venta <1000);
--2.5
select cif, count(*)"Total" from clientes join avances_lineas_fabricacion on cif = id_cliente group by cif order by count(*) asc;
select cif, count(*)"Total" from clientes join avances_lineas_fabricacion on cif = id_cliente group by cif order by 2;
--2.6
select fecha, hora, clientes.cif, maquinas.nombre  from avances_lineas_fabricacion join clientes on id_cliente = cif 
    join maquinas on id_maquina = ref where estado = 'PUESTA A PUNTO' and extract(year from fecha) = 2023;
--2.7
select nombre,precio_venta from maquinas where length(nombre)-length(replace(nombre,' ','')) = 1 and precio_venta = (select max(precio_venta)
    from maquinas where length(nombre)-length(replace(nombre,' ','')) = 1);
    
SELECT SUBSTR(nombre, 1, INSTR(nombre || ' ', ' ') - 1) AS primera_palabra, precio_venta FROM maquinas;
--2.8
select tipo, count(*) from piezas group by tipo having tipo like '%ICO' order by count(*) desc;

    