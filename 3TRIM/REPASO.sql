
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