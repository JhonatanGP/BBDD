/*1. Se quiere saber si un a�o es bisiesto o no. Para ello, se debe pedir por pantalla introducir un a�o, y luego se mostrar� un mensaje por 
pantalla indicando "El a�o es bisiesto" o "El a�o no es bisiesto", seg�n corresponda. Un a�o es bisiesto si el resto de dividir el a�o 
entre 4 es cero y adem�s, el resto de dividir ese a�o entre 100 es distinto de cero o bien el resto de dividir ese a�o entre 400 es cero.*/
set serveroutput on;
declare
a�o number := &ingrese_a�o;
begin
    if mod(a�o,4) = 0 or mod(a�o,100) = 0 or mod(a�o,400) = 0 then
        dbms_output.put_line('El a�o es bisiesto');
    else 
        dbms_output.put_line('El a�o no es bisiesto');
    end if;
end;
/

/*2. Realiza el ejercicio anterior pero usando la siguiente condici�n para saber si es bisiesto: "un a�o bisiesto tiene 366 d�as".*/
set serveroutput on;
declare
a�o number := &ingrese_a�o;
dias number ;

begin
    dias := to_date('31-12'||a�o,'dd-mm-yyyy')-to_date('01-01'||a�o,'dd-mm-yyyy')+1;
    -- Se le suma +1 para contar los dias iniciales.
    if dias = 366 then
        dbms_output.put_line('El a�o es bisiesto');
    else 
        dbms_output.put_line('El a�o no es bisiesto');
    end if;
end;
/
/*3. Obtener dos listas con los pares e impares desde el 1 hasta el n�mero que se introduzca por pantalla.*/
declare 
    num int := &ingrese_numero;
    par varchar2(100) := '';
    impar varchar2(100) := '';
begin
    for i in 0..num loop 
        if mod(i,2) = 0 then --CONDICION PAR
            par := par || i || ', ';
        else 
            impar := impar || i || ', '; -- if num != 0 then --CONDICION IMPAR
        end if;
    end loop;
    dbms_output.put_line(par);
    dbms_output.put_line(impar);

end;
/

/*4. Dado un determinado c�digo de departamento (DEPTNO) de la tabla DEPT, devolver por pantalla el nombre (DNAME).*/
declare
    codDeptno dept.deptno%type := &introduzca_codigo;
    nombDname dept.dname%type;
begin
    select dname into nombDname from dept where deptno = codDeptno;
        dbms_output.put_line(nombDname);
end;
/
select * from dept;

/*5. Obtener el nombre (ENAME) y puesto de trabajo (JOB) del empleado (tabla EMP) que tenga el c�digo (EMPNO) igual a 7782.*/
declare
    nombre emp.ename%type;
    puesto emp.job%type;
begin
    select ename, job into nombre, puesto from emp where empno = 7782;
    dbms_output.put_line(nombre || ' - ' || puesto);
end;
/

/*6. Pedir por pantalla un NIF (8 n�meros y una letra). Comprobar si la letra es correcta y luego mostrar por pantalla si ese NIF es correcto.*/
declare 
    nif varchar(9):= '&IntroduzcaNIF';
begin
    if length(nif) = 9 and regexp_like(nif,'[0-9]{8}[A-Z]') then
    dbms_output.put_line('NIF correcto');
    else 
    dbms_output.put_line('NIF incorrecto');
    end if;
end;
/

/*11. Crea un programa que pida dos n�meros enteros por pantalla. Si ambos n�meros son divisibles entre s� (requisito, el primer n�mero 
debe ser mayor o igual que el segundo), entonces que muestre por pantalla el mensaje �Son divisibles�. En caso contrario, que se muestre 
el mensaje "No son divisibles". NOTA: dos n�meros son divisibles si su resto es cero. Puedes usar la funci�n MOD.*/
declare 
    n1 int := &introduzca_numero1;
    n2 int := &introduzca_numero2;
begin
    if n1 >= n2 then
        if mod(n1,n2) = 0 then
            dbms_output.put_line('Son divisibles');
        else
            dbms_output.put_line('No son divisibles');
        end if;
    else 
        dbms_output.put_line('El n�mero 2 no puede ser mayor que el n�mero 1');
    end if;    
end;
/

/*12. Crea un programa que devuelva por pantalla el d�a de la semana que es.*/
declare 
    fecha date; 
begin
    select sysdate into fecha from dual;
    dbms_output.put_line('Hoy es ' || fecha);
end;
/

/*13. Realiza un programa que pida por pantalla tres n�meros y que luego muestre por pantalla el resultado de sumar los tres valores.
Debes contemplar que no se introduzcan n�meros negativos como condici�n.*/
declare
    numero number;
    suma number := 0;
begin
    for i in 1..3 loop
        numero := &numero;
        if numero < 0 then
            dbms_output.put_line('No puede haber n�mero negativos');
        end if;
            suma := suma + numero;
    end loop;
            dbms_output.put_line(suma);
end;
/

/*14. Desarrolla un programa que te pida por pantalla tu salario (n�mero entero). Primero comprueba que es mayor que cero (si es menor que 
cero, devuelve por pantalla el mensaje "Salario no v�lido"). Si el salario es menor de 20000, devuelve el mensaje "Tu salario es bajo". 
Si el salario est� entre 20000 y 40000, indica por pantalla "Tu salario est� bien". Si el salario es mayor de 40000, muestra por pantalla 
"Tu salario est� muy bien!". Debes emplear CASE� WHEN.*/
declare
    sal int:= &salario;
begin
    if sal <= 0 then
        dbms_output.put_line('Salario no v�lido');
    elsif sal < 20000 then
        dbms_output.put_line('Tu salario es bajo');
    elsif sal >= 20000 and sal <= 40000 then
        dbms_output.put_line('Tu salario est� bien');  
    elsif sal > 40000 then
        dbms_output.put_line('Tu salario est� muy bien');
    else 
        dbms_output.put_line('Salario no v�lido');
    end if;
end;
/

/*15. Crea un registro con tres campos, id, nombre y puesto, los cu�les deben tener el mismo tipo de dato que empno, ename y job de la tabla EMP. 
Crea una variable del tipo de ese registro, as�gnale valores y mu�stralo por la salida. Luego mediante un cursor impl�cito obt�n esos campos 
para empno = 7698, guard�ndolo en esa variable del tipo de ese registro, y luego mostr�ndolo por la salida. */
/*declare
    idEmp emp.empno%type;
    nombreEmp emp.ename%type; 
    puestoEmp emp.job%type;
begin
    
end;
/
*/
select * from emp;
declare
    empleado emp%rowtype;
begin
select * into empleado from emp where empno = 7698; --RowType siempre usa el ' * '
    dbms_output.put_line(empleado.empno ||  ' - ' || empleado.ename || ' - ' || empleado.job);
end;
/

/*16. Crea una variable que sea del tipo ROWTYPE (tabla EMP) y una tabla que tenga los siguientes valores en las posiciones 1, 2 y 3: 
7839, 7698 y 7782. Mediante un bucle while que recorra toda la tabla (usa la funci�n count para el tama�o m�ximo del �ndice), 
muestra por la salida de pantalla el nombre del trabajador (campo ename de la tabla emp) que corresponda su empno a cada valor
guardado en la tabla (7839,7698,7782). */
declare
    variable1 emp%rowtype;
    numero number := 1;
begin
    while numero <= 3 loop
        if numero = 1 then
            select * into variable1 from emp where empno = 7839;
        elsif numero = 2 then
            select * into variable1 from emp where empno = 7698;
        elsif numero = 3 then
            select * into variable1 from emp where empno = 7782;
        end if;
    dbms_output.put_line('Empleado : '|| variable1.ename);
    numero := numero + 1;
    end loop;
end;
/

/*22. Muestra por la salida el nombre de cada departamento junto al n�mero de empleados que tiene.*/
declare
    nombre dept.dname%type;
    numeroTraba number;
begin 
    for i in (select deptno, dname from dept) loop
        select count() into numeroTraba
        from emp
        where deptno = i.deptno;
        dbms_output.put_line('Nombre: ' || i.dname || ' | Trabajan: ' || numeroTraba);
    end loop;
end;
/

/*23. Obt�n el salario medio de los empleados y muestra por pantalla ese salario medio junto al resultado del 21% de ese importe y para 
finalizar, poner la suma del salario medio junto al 21% de dicho valor. Ej.: Importe de salario medio 1000, con 210 del 21% y total 1210. */
declare
 salario emp.sal%type; 
begin
    select avg(sal) into salario from emp;
    dbms_output.put_line('Medio: ' || round(salario,2) || '� | 21%: ' || round((salario*0.21),2)|| '� | Total: ' || round((salario + (salario*0.21)),2)|| '�.');
end;
/
/*24. Muestra por la salida el nombre y salario de los empleados que hayan sido contratados en septiembre.*/

/*25. Pide por la entrada de teclado un determinado mes y devuelve por la salida el nombre del empleado que haya sido contratado en dicho mes. 
En el caso de que no haya ninguno, mostrar el mensaje "No hay empleados que hayan sido contratados en ese mes". */

/*26. Se quiere hacer un bloque de c�digo an�nimo que pida todos los campos de la tabla emp e introduzca dicho registro en la tabla.*/

/*27. Se quiere un c�digo de bloque an�nimo que borre registros de la tabla emp. Para ello pedir� un c�digo empno por teclado, y si una vez 
comprobado que existe, se borrar� de la tabla. Se debe mostrar un mensaje "No hay registros con ese c�digo" cuando no haya empleados con
ese empno. Si se borra el registro, debes indicarlo por la pantalla con el mensaje "Se ha borrado adecuadamente el empleado". */

/*28. Se quiere saber el nombre de los empleados que hayan sido contratados en un determinado mes. Para ello debes crear un bloque de c�digo 
an�nimo que pida un mes por el teclado con letras. Con esa informaci�n debes obtener todos los registros de la tabla emp cuyo hiredate haya 
sido en dicho mes, recuperar el nombre y mostrarlo por la salida.*/

/*29. Se quiere saber cu�ntos empleados hay en cada departamento. Para ello crea un bloque de c�digo an�nimo que pida por teclado el c�digo 
de departamento deptno. Despu�s, habr� que comprobar que dicho c�digo existe o no en la tabla dept mostrando un mensaje en caso positivo 
y otro en caso negativo. Si hay departamentos con ese c�digo, se comprobar� que hay o no empleados de ese departamento en la tabla emp, 
mostrando mensajes en ambos casos (positivo y negativo). Para finalizar, s� y solo s� hay empleados de ese departamento, debes calcular el 
n�mero de empleados que hay de ese departamento e indicarlo en un mensaje como el que sigue �Hay xx empleados en ese departamento�, 
donde xx es el n�mero obtenido del total de empleados de ese departamento. */

/*30. Se quiere saber el n�mero de veces de cierta vocal que tienen los nombres de los empleados. Para ello se pedir� al usuario por teclado 
una vocal, que habr� que comprobar inicialmente si realmente lo es o no. Si es vocal, se contar� cuantas veces aparece en cada nombre de 
cada empleado, indicando un mensaje como el que sigue: "KING tiene 1 vez la vocal i" donde se debe haber introducido inicialmente por teclado 
"i". Deben mostrarse todos los empleados con el n�mero de veces que aparece la vocal introducida. */

/*31. Se quiere un bloque de c�digo an�nimo que busque el empleado que tiene el nombre m�s largo y el que tiene el nombre m�s corto. En caso de 
coincidencia en el tama�o de los nombres, se pondr�n todos.*/ 


