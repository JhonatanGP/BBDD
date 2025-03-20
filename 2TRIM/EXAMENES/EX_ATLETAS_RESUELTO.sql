--Ejercicio 1.

--1.1

drop table empresas cascade constraints;
create table empresas(
    id int primary key,
    nombre_empresa varchar2(100),
    direccion varchar2(100),
    telefono varchar2(50),
    nif_club_pertenece char(9),
    foreign key(nif_club_pertenece) references clubes
);

--1.2

insert into empresas values (5,'asociaci�n deporte sl','Glorieta real 2',null,'C24154935');
insert into empresas values (6,'ferreter�a p�rez','Principal 33',null,'C31006310');
insert into empresas values (7,'club deportivo g�mez',null,'+34111222333','C52766652');
insert into empresas values (8,'complementos alimentarios',null,'123456789','C32808221');

--1.3

update empresas set telefono = '123456789', nif_club_pertenece = 'C21767463' where nombre_empresa = 'asociaci�n deporte sl';

--1.4

delete from empresas where nombre_empresa = 'ferreter�a p�rez';

--Ejercicio 2.

--2.1 Devuelve el n�mero de los dorsales que sea IMPAR que hayan participado en carreras ordenados por n�mero de dorsal de menor a mayor.
select dorsal from carreras_participan_atletas where mod(dorsal,2) <> 0 order by dorsal;

--2.2 Se quiere el nombre del entrenamiento con la primera letra en may�sculas y el resto en min�sculas, que tiene dureza entre 4 y 5, y adem�s, la duraci�n es 39.
select initcap(nombre) from entrenamientos where dureza between 4 and 5 and duracion = 39;

--2.3 Si solo sumamos los minutos del tiempo que han empleado los participantes de la carrera 'Marcha solidaria', �qu� valor da? (no tengas en cuenta horas ni segundos del tiempo, solo minutos)
select sum(to_number(substr(tiempo,4,2))) from carreras_participan_atletas join carreras on codigo = codigo_carrera where nombre = 'Marcha solidaria';

--2.4 �Cu�l es el nombre del club donde est� el atleta m�s mayor? Devuelve el resultado con todas las letras en may�sculas.
select upper(clubes.nombre) from atletas join clubes on nif = nif_club where fecha_nacimiento = (select min(fecha_nacimiento) from atletas);

--2.5 �Cu�l es el dni y nombre del atleta m�s joven?
select dni, nombre from atletas where fecha_nacimiento = (select max(fecha_nacimiento) from atletas);

--2.6 Devuelve la localidad de la carrera y el n�mero de veces que aparece la 'a' (letras a) en la localidad de la carrera. Para esta segunda columna, usa el alias de columna "Num.a".
select localidad, length(localidad)-(length(replace(localidad,'a',''))) "Num.a" from carreras;

--2.7 Devuelve el nombre del mes de la fecha de inicio de inscripci�n en carreras (alias de columna "MES inicio") y el nombre del d�a de la semana de la fecha de fin de inscripci�n en carreras (alias de columna "D�A fin"), con todas las letras en may�sculas para ambas columnas, para aquellas carreras que NO se celebren en la localidad de "Madrid".
select trim(to_char(f_inicio_inscrip,'MONTH')) "MES inicio",trim(to_char(f_fin_inscrip,'DAY')) "D�A fin" from carreras where localidad <> 'Madrid';

--2.8 �Cu�l es el nombre del atleta que ha realizado m�s entrenamientos?
select nombre from atletas_realizan_entrenamientos join atletas on dni = dni_atleta group by nombre having count(*) = (select max(count(*)) from atletas_realizan_entrenamientos join atletas on dni = dni_atleta group by nombre);

--2.9 Devuelve todos los campos de los clubes cuyo responsable tiene por apellido Garc�a y el nif del club tiene un 8 entre sus d�gitos.
select * from clubes where responsable like '%Garc�a' and nif like '%8%';

--2.10 Se quiere saber el nombre, los apellidos y el n�mero de carreras de los atletas que han participado en m�s carreras (m�ximo n�mero de carreras). Ordena el resultado por orden alfab�tico de los apellidos de Z a A.
select atletas.nombre,atletas.apellidos,count(*) from carreras_participan_atletas cpa join atletas on atletas.dni = cpa.dni_atleta group by nombre,apellidos
having count(*) = (select max(count(*)) from carreras_participan_atletas cpa group by dni_atleta) order by apellidos desc;

--2.11 Indica el nombre, apellidos, n�mero de caracteres del campo apellidos (ponle como alias de columnas "Num. caracteres") y n�mero de victorias como profesional del atleta que tiene m�s victorias.
select nombre, apellidos, length(apellidos) "Num. caracteres", num_victorias_profesional from atletas where num_victorias_profesional = (select max(num_victorias_profesional) from atletas);

--2.12 Se quiere mostrar el nombre del club y el n�mero de atletas que hay en �l. Solo se quieren mostrar los clubes que tengan 2 atletas o menos. Ordena el resultado de menor a mayor n�mero de atletas y despu�s por orden alfab�tico del nombre del club.
select clubes.nombre,count(*) from atletas join clubes on clubes.nif = atletas.nif_club group by clubes.nombre having count(*) <= 2 order by 2, 1;

--2.13 Se quiere el nombre, apellidos y fecha de nacimiento de los atletas que pertenecen al club 'Club Sevilla 2'. Ordena el resultado por la fecha de nacimiento, mostrando primero los atletas m�s j�venes. NO USES JOIN, solo SUBCONSULTAS.
select nombre, apellidos, fecha_nacimiento from atletas where nif_club = (select nif from clubes where nombre = 'Club Sevilla 2') order by fecha_nacimiento desc;

--2.14 Se quiere saber los apellidos junto al nombre, separado por coma y en una �nica columna, de los atletas que hayan conseeguido 25 o m�s victorias. Ejemplo: Rodr�guez Rodr�guez, David
select apellidos || ', ' || nombre from atletas where num_victorias_profesional >= 25;

--2.15 �Qu� nombre de entrenamiento, sin repetir, han realizado los atletas del club 'Madrid sport'? Devuelve el resultado con todas las letras en may�sculas.
select distinct upper(e.nombre) from entrenamientos e join atletas_realizan_entrenamientos aten on aten.id_entrenamiento = e.id join atletas atl on atl.dni = aten.dni_atleta join clubes on clubes.nif = atl.nif_club where clubes.nombre = 'Madrid sport';

--2.16 Indica el n�mero de atletas que pertenecen al club 'Triana Club Deportivo'. Usa como alias de columna "Total".
select count(*) "Total" from atletas join clubes on nif = nif_club where clubes.nombre = 'Triana Club Deportivo';


--Ejercicio 3.

set serveroutput on;
declare
    fechaNacimientoIntroducida atletas.fecha_nacimiento%type := '&mete_fecha_nacimiento';
    type misAtletas is record(fecha_nacimiento atletas.fecha_nacimiento%type,nombre atletas.nombre%type);
    datosAtleta misAtletas;
    existeAtleta int := 0;
    
    dniAtleta atletas.dni%type;
    minCodigoCarrera carreras.codigo%type;
    maxCodigoCarrera carreras.codigo%type;
    existeCarrera int := 0;
    nombreCarrera carreras.nombre%type;
begin
    select count(*) into existeAtleta from atletas where fecha_nacimiento = fechaNacimientoIntroducida;
    if existeAtleta = 0 then
        dbms_output.put_line('No hay atletas con la fecha de nacimiento ' || fechaNacimientoIntroducida);
    elsif existeAtleta = 1 then
        datosAtleta.fecha_nacimiento := fechaNacimientoIntroducida;
        select nombre,dni into datosAtleta.nombre,dniAtleta from atletas where fecha_nacimiento = fechaNacimientoIntroducida;
        select min(codigo) into minCodigoCarrera from carreras;
        select max(codigo) into maxCodigoCarrera from carreras;
        for i in minCodigoCarrera..maxCodigoCarrera loop
            select count(*) into existeCarrera from carreras_participan_atletas where codigo_carrera = i and dni_atleta = dniAtleta;
            if existeCarrera >= 1 then
                select nombre into nombreCarrera from carreras_participan_atletas join carreras on codigo = codigo_carrera where dni_atleta = dniAtleta and codigo_carrera = i;
                dbms_output.put_line(nombreCarrera);
            end if;
        end loop;
    else --2 o m�s
        dbms_output.put_line('Hay m�s de un atleta, concreta una fecha de nacimiento que sea �nica');
    end if;
end;
/