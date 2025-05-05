
--Bolet�n ejercicios con excepciones
/*1 Pide al usuario que introduzca un c�digo de asignatura y muestra el c�digo junto al curso y descripci�n. Controla las siguiente excepciones 
mostrando un mensaje de error: no existe ese c�digo en la tabla asignaturas.

/*2 Se quiere pedir al usuario que introduzca un nivel de curso (primer curso o segundo), introduciendo 1 o 2 por teclado. Una vez se meta el nivel, muestra
por la salida todas las descripciones de las asignaturas de ese nivel. Excepciones a tener en cuenta mostrando un mensaje de error: el nivel no es un n�mero
v�lido y el n�mero no existe en la tabla asignaturas. NOTA: para saber si han introduciendo un n�mero, puedes controlarlo con la excepci�n value_error a la 
que se accede cuando se produce un error en una conversi�n (por ejemplo al llamar a to_number() y no puede hacer la conversi�n). */

/*3 Se quiere una lista donde se muestre el curso y cu�ntas asignaturas hay en ese curso (una l�nea por cada curso). Ejemplo: Curso 1: 4 asignaturas. 
Excepciones a tener en cuenta: crea una excepci�n personalizada llamada cursoConRedes de forma que si el curso tiene la asignatura con descripci�n "Redes" 
no debes mostrarlo por pantalla, terminando la ejecuci�n de tu c�digo y mostrando en tu excepci�n el siguiente mensaje: "No se puedes mostrar datos porque
existe la asignatura de Redes".*/

/*4 Se quiere mostrar por la salida el nombre de cada asignatura y la nota media obtenida en las matr�culas de esa asignatura por parte de los alumnos. 
Excepciones a tener en cuenta: crea una excepci�n personalizada menosDeCinco que, una vez mostradas todas las notas media, si alguna tiene un valor menor
a cinco, llamar a esa excepci�n personalizada indicando el mensaje "Hay alguna asignatura con una media inferior a cinco", sustituyendo AAA por el valor 
concreto.*/

/*5 Modifica el ejercicio 4 para mostrar por la salida solo las asignaturas que tienen una media superior a 5. A continuaci�n, si has mostrado una o m�s 
asignaturas con una media con decimales, llama a una excepci�n personalizada tienenDecimales que muestre todas esas asignaturas con decimales, separadas 
por coma. */

/*6 Se quiere pedir por teclado el c�digo de una asignatura. Muestra una lista de todos los alumnos que est�n matriculados (dni y nombre de los almnos) y la
nota que han sacado. Ten en cuenta las siguientes excepciones: el c�digo de asignatura es un n�mero, existe en la tabla asignaturas y adem�s hay matr�culas 
de alumnos en esa asignatura. Para esa �ltima excepci�n, crea una excepci�n personalizada que se llame noMatriculas.*/



----------     04. Ejercicios F�ciles PLSQL  ----------------    Enunciado de la pr�ctica facil de PL/SQL 

/*Ejercicio 1
Haz una funci�n llamada DevolverCodDept que reciba el nombre de un departamento y devuelva su c�digo.*/
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
    SELECT CODIGO INTO v_codigo FROM DEPARTAMENTOS WHERE UPPER(NOMBRE) = UPPER(p_nombre_depto); -- Comparaci�n sin sensibilidad a may�sculas
    RETURN v_codigo;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL; -- No se encontr� el departamento
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001, 'M�s de un departamento tiene ese nombre');
    WHEN OTHERS THEN
        RAISE; -- Propaga otros errores
END;
/
/*Ejercicio 2
Realiza un procedimiento llamado HallarNumEmp que recibiendo un nombre de departamento, muestre en pantalla el n�mero de empleados de dicho departamento.
Puedes utilizar la funci�n creada en el ejercicio 1. Si el departamento no tiene empleados deber� mostrar un mensaje informando de ello. Si el departamento
no existe se tratar� la excepci�n correspondiente.*/

/*Ejercicio 3
Realiza una funci�n llamada CalcularCosteSalarial que reciba un nombre de departamento y devuelva la suma de los salarios y comisiones de los empleados de
dicho departamento. Trata las excepciones que consideres necesarias.*/

/*Ejercicio 4
Realiza un procedimiento MostrarCostesSalariales que muestre los nombres de todos los departamentos y el coste salarial de cada uno de ellos. Puedes 
usar la funci�n del ejercicio 3.

/*Ejercicio 5
Realiza un procedimiento MostrarAbreviaturas que muestre las tres primeras letras del nombre de cada empleado.*/

/*Ejercicio 6
Realiza un procedimiento MostrarMasAntiguos que muestre el nombre del empleado m�s antiguo de cada departamento junto con el nombre del departamento. 
Trata las excepciones que consideres necesarias.*/

/*Ejercicio 7
Realiza un procedimiento MostrarJefes que reciba el nombre de un departamento y muestre los nombres de los empleados de ese departamento que son jefes de
otros empleados.Trata las excepciones que consideres necesarias.*/

/*Ejercicio 8
Realiza un procedimiento MostrarMejoresVendedores que muestre los nombres de los dos
vendedores con m�s comisiones. Trata las excepciones que consideres necesarias.*/

/*Ejercicio 9
Realiza un procedimiento MostrarsodaelpmE que reciba el nombre de un departamento al rev�s
y muestre los nombres de los empleados de ese departamento. Trata las excepciones que
consideres necesarias.*/

/*Ejercicio 10
Realiza un procedimiento RecortarSueldos que recorte el sueldo un 20% a los empleados cuyo
nombre empiece por la letra que recibe como par�metro.Trata las excepciones que consideres
necesarias.*/

/*Ejercicio 11
Realiza un procedimiento BorrarBecarios que borre a los dos empleados m�s nuevos de cada
departamento. Trata las excepciones que consideres necesarias.*/