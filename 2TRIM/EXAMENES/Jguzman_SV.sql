










set serveroutput on;
declare
    dniInt char(9) := '&introduzca_dni';
    type tipoAtleta is record (dni atletas.dni%type, nombre atletas.nombre%type);
    miAtleta tipoAtleta;
    existeAtleta int := 0;
    
begin 
    select count(*) into existeAtleta from atletas where dni = dniInt;
    if existeAtleta = 0 then    
        dbms_output.put_line('No hay atletas con dni ' || dniInt);
    elsif existeAtleta = 1 then  
        dbms_output.put_line('Hay atletas con dni ' || dniInt);
    end if;
end;
/



















/*
select upper(trim(substr(nombre,1,instr(nombre||' ',' ')))) from clientes where telefono like '%333%';
select upper(trim(substr(nombre,instr(nombre,' ')))) from clientes where telefono like '%333%';

select upper(nombre) from ingredientes where substr(nombre,1,1) not in ('A','E','I','O','U') ;

select initcap(trim(replace(replace(nombre,'Plato',''),'Entrante','')))||'.' "Nombre" from platos;

--12. Ingrediente cuyo nombre tiene más caracteres? Pon en una única columna el nombre del ingrediente: número de caracteres. Ej.: Guisante: 8
select nombre||': '|| length(nombre) from ingredientes where length(nombre) = (select max(length(nombre)) from ingredientes);

--13. ¿Cuántas comandas se han hecho en MARTES? Debe dar 11.
select count(*) from comandas where trim(to_char(fecha,'DAY')) = 'MARTES';

15. Lista con el NOMBRE y la LOCALIDAD de los clientes, pero el NOMBRE debe tener todas las letras en mayúsculas y que no haya ningún 
espacio entre nombres compuestos. Ej.: PEDROJUAN.
select upper(replace(nombre,' ','')), localidad from clientes;

--16. Indica el valor medio del PRECIO de los platos con REDONDEO de dos decimales.
select to_char(round(avg(precio),2),'9.00L')"PRECIO" from platos;
SELECT TRIM(TO_CHAR(ROUND(AVG(PRECIO),2),'9.00L'))"PRECIO" FROM PLATOS;

--17. Indica el NOMBRE del plato más caro.
select nombre,to_char(precio,'99.00L')"PRECIO" from platos where precio = (select max(precio) from platos);
*/

/*
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
*/
