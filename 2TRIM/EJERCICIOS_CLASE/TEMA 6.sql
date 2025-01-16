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