--Ejercicio 2. 
/*ddddt*/
/*2.1 �Cu�ntos pilotos pertenecen a los equipos 'Equipo Honda'? Recuerda que son Equipo Honda 1 y Equipo Honda 2. 
Devuelva la cuenta total de los dos equipos en un �nico valor.*/
select * from equipos;
select * from pilotos;
select count(*) from pilotos join equipos on id_equipo = codigo where equipos.nombre='Equipo Honda 2' or equipos.nombre='Equipo Honda 1';

/*2.2 Se quiere saber cu�l es la marca de neum�ticos y nombre de motor que usan menos equipos (la menor cantidad posible de equipos).
Ordena el resultado por marca de la Z a la A.*/
select neumaticos.marca, motores.nombre from neumaticos join equipos on id = id_neumatico join motores on id_motor = ref group by motores.nombre,marca
    having count(motores.nombre) = (select min(count(motores.nombre)) from motores group by motores.nombre)
        and count(marca) = (select min(count(marca)) from neumaticos group by marca) order by marca desc;

/*2.3 Se quiere saber el nombre del piloto, sin repetir, y con alias de columna "Piloto" para aquellos pilotos que tengan m�s de 
10 victorias y cuya nacionalidad sea "Espa�ol". Devuelve ese nombre de piloto en min�sculas. */
select distinct lower(nombre) "Piloto" from pilotos where num_victorias > 10 and pilotos.nacionalidad = 'Espa�ol';

/*2.4 �Cu�l es el nombre del mes y el a�o de la fecha de nacimiento del piloto que est� en el equipo 'Equipo Suzuki 1'? 
No uses join, solo subconsultas. Usa como alias "MES-A�O". Ej.: ABRIL-2003. */
select to_char(fecha_nacimiento,'MONTH'),to_char(fecha_nacimiento,'YYYY') from pilotos join equipos on id_equipo = codigo where equipos.nombre = 'Equipo Suzuki 1';
select to_char(fecha_nacimiento,'MONTH')"MES",to_char(fecha_nacimiento,'YYYY')"A�O" from pilotos where id_equipo = 
    (select codigo from equipos where nombre = 'Equipo Suzuki 1');

/*2.5 Devuelve el nombre y los apellidos, ambos en may�sculas, de los pilotos que no tienen equipo.*/
select upper(nombre),upper(apellidos) from pilotos where  id_equipo is null;

/*2.6 Indica el nombre del piloto concatenado con el n�mero de letras del segundo apellido de ese piloto que cumple que tiene 
el SEGUNDO APELLIDO de menor n�mero de letras de todos los pilotos.*/
select * from pilotos;
select nombre || ': ' || length(substr(apellidos,instr(apellidos,' ')+1,length(apellidos)-instr(apellidos,' '))) from pilotos 
    where length(substr(apellidos,instr(apellidos,' ')+1,length(apellidos)-instr(apellidos,' '))) = 
        (select min(length(substr(apellidos,instr(apellidos,' ')+1,length(apellidos)-instr(apellidos,' ')))) from pilotos);

/*2.7 Indica el valor medio de la distancia de kms de las carreras agrupado por el a�o de la fecha.*/
select to_char(fecha,'yyyy'), avg(distancia_km) from carreras group by to_char(fecha,'yyyy');

/*2.8 Devuelve todos los campos de la tabla motores de aquellas filas que tienen en la cuarta letra de su nombre la "a". 
Ordena por la potencia de mayor a menor.*/
select * from motores where nombre like '___a%' order by potencia desc;
select * from motores where substr(nombre,4,1) = 'a' order by potencia desc;

/*2.9 Indica el nombre del piloto y la fecha del entrenamiento de aquel piloto que no tiene equipo y adem�s la fecha es la m�s reciente.*/
select pilotos.nombre,pilotos_entrenamientos.fecha from pilotos join pilotos_entrenamientos on id = id_piloto ;

/*2.10 Indica la posici�n en la que ha quedado un piloto de nacionalidad espa�ola en el circuito de Catalu�a.*/


/*2.11 �Cu�l es el nombre de los motores que usan equipos que tienen un presupuesto que est� entre 24000000 y 26000000?*/


/*2.12 Devuelve el nombre del pa�s y el n�mero de letras i que tiene ese nombre (tabla neum�ticos). Ejemplo: Italia tiene 2 letras i.*/


/*2.13 �Cu�l es la marca del motor que usa el equipo que se encuentra en la localidad de Madrid, y el pa�s del motor es Jap�n?
Devuelve la marca con todas sus letras en may�sculas.*/


/*2.14 Devuelve la resta de la suma de salarios de pilotos espa�oles menos la suma de los salarios de pilotos italianos.*/


/*2.15 Devuelve el nombre y el responsable del equipo cuando el responsable tiene en su segunda letra una vocal. 
Devuelve el nombre del equipo en may�sculas.*/
select lower(nombre),responsable from equipos where substr(responsable,2,1)  in ('a','e','i','o','u');

/*2.16 Devuelve todos los campos de los pilotos cuyo nacimiento sea entre el 12 de marzo de 1994 y el 31 de marzo de 1995.*/


/*Ejercicio 3.

Se quiere un bloque de c�digo an�nimo en plsql que realice lo siguiente:
3.1 Pide que el usuario introduzca dos salarios por teclado.
3.2 Solo vamos a admitir que el salario segundo sea mayor que el primero. En caso contrario, muestra el mensaje "El primer salario 
    debe ser menor que el segundo".
3.3 Si no hay pilotos que tengan un salario entre los valores anteriores, mostrar el mensaje "No hay pilotos".
3.4 Si hay pilotos que tengan un salario entre los valores introducidos, muestra el nombre en may�sculas de todos los pilotos que 
    lo cumplen.
3.5 Si hay pilotos que tengan un salario entre los valores introducidos, y ya has mostrado todos los nombres de los pilotos, muestra 
el mensaje "Hay un total de AAA pilotos con diferente salario", siendo AAA el n�mero total de pilotos que NO est�n en eses caso.*/