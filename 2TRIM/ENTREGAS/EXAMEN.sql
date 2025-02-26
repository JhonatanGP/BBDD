

































/*set serveroutput on;
declare
    numero int := 7; -- declarar e inicializar
    frase varchar2(10) := 'mensaje';
begin
    dbms_output.put_line(numero || ' - ' || numero2);
end;
/
*/



--EJERCICIO 10 con IF / ELSIF / ELSE
/*Crea un programa que tome pida una variable al usuario para que la introduzca por teclado (tiene que ser un número), y según sea su valor 
entre 0 y 10, devuelva por pantalla el valor de la nota: SUSPENSO, APROBADO, BIEN, NOTABLE,SOBRESALIENTE. En caso contrario, que devuelva
‘El valor introducido es incorrecto’.*/

/*
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
/*
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
-- WHILE
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

-- FOR
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
/*
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

*/
