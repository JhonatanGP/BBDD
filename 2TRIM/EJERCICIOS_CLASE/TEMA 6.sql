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
