create table dept(
  deptno number(2,0),
  dname  varchar2(14),
  loc    varchar2(13),
  constraint pk_dept primary key (deptno)
);
 
create table emp(
  empno    number(4,0),
  ename    varchar2(10),
  job      varchar2(9),
  mgr      number(4,0),
  hiredate date,
  sal      number(7,2),
  comm     number(7,2),
  deptno   number(2,0),
  constraint pk_emp primary key (empno),
  constraint fk_deptno foreign key (deptno) references dept (deptno)
);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
--insert into dept values(10, 'ACCOUNTING', 'SEATLE');
 
insert into emp
values(
 7839, 'KING', 'PRESIDENT', null,
 to_date('17-11-1981','dd-mm-yyyy'),
 5000, null, 10
);
insert into emp
values(
 7698, 'BLAKE', 'MANAGER', 7839,
 to_date('1-5-1981','dd-mm-yyyy'),
 2850, null, 30
);
insert into emp
values(
 7782, 'CLARK', 'MANAGER', 7839,
 to_date('9-6-1981','dd-mm-yyyy'),
 2450, null, 10
);
insert into emp
values(
 7566, 'JONES', 'MANAGER', 7839,
 to_date('2-4-1981','dd-mm-yyyy'),
 2975, null, 20
);
insert into emp
values(
 7788, 'SCOTT', 'ANALYST', 7566,
 to_date('13-JUL-87','dd-mm-rr') - 85,
 3000, null, 20
);
insert into emp
values(
 7902, 'FORD', 'ANALYST', 7566,
 to_date('3-12-1981','dd-mm-yyyy'),
 3000, null, 20
);
insert into emp
values(
 7369, 'SMITH', 'CLERK', 7902,
 to_date('17-12-1980','dd-mm-yyyy'),
 800, null, 20
);
insert into emp
values(
 7499, 'ALLEN', 'SALESMAN', 7698,
 to_date('20-2-1981','dd-mm-yyyy'),
 1600, 300, 30
);
insert into emp
values(
 7521, 'WARD', 'SALESMAN', 7698,
 to_date('22-2-1981','dd-mm-yyyy'),
 1250, 500, 30
);
insert into emp
values(
 7654, 'MARTIN', 'SALESMAN', 7698,
 to_date('28-9-1981','dd-mm-yyyy'),
 1250, 1400, 30
);
insert into emp
values(
 7844, 'TURNER', 'SALESMAN', 7698,
 to_date('8-9-1981','dd-mm-yyyy'),
 1500, 0, 30
);
insert into emp
values(
 7876, 'ADAMS', 'CLERK', 7788,
 to_date('13-JUL-87', 'dd-mm-rr') - 51,
 1100, null, 20
);
insert into emp
values(
 7900, 'JAMES', 'CLERK', 7698,
 to_date('3-12-1981','dd-mm-yyyy'),
 950, null, 30
);
insert into emp
values(
 7934, 'MILLER', 'CLERK', 7782,
 to_date('23-1-1982','dd-mm-yyyy'),
 1300, null, 10
);
 commit;
--REPASO
--1. Indica el nombre y sueldo de los empleados que pertenezcan al departamento ubicado en Seatle.
SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT EMP.ENAME,EMP.SAL FROM EMP JOIN DEPT ON(DEPT.DEPTNO=EMP.DEPTNO) WHERE DEPT.LOC='CHICAGO';
/*2. Indica el id, nombre y sueldo de los empleados que estén en departamentos donde haya otros compañeros empleados 
con una letra 'u' en su nombre, y que además ganen sueldos mayores que la media de los sueldos de la empresa.*/
SELECT EMP.EMPNO,EMP.ENAME,EMP.SAL FROM EMP JOIN DEPT ON(DEPT.DEPTNO=EMP.DEPTNO) 
    WHERE ENAME LIKE('%U%') AND SAL >(SELECT(AVG(SAL)) FROM EMP);
--3. Devuelve el id del departamento, nombre y puesto de los empleados que pertenezcan al departamento Executive.

--4. Muestra el nombre y salario de los empleados que tengan a KING como jefe directo.

--5. Devuelve nombre y sueldo de los empleados que ganen más dinero que la media de la empresa, ordenado por sueldo de mayor a menor.


-- MIERCOLES 05 DE MARZO DE 2025

/*# Boletín de ejercicios plsql

Se va a utilizar la bd EMP-DEPT y se repasaran los siguientes conceptos:
- Entrada por teclado.
- Salida por consola.
- Constantes.
- %type y %rowtype.
- select into.
- if / case / loop / while / for
- registros */

/*1. Se quiere un programa en plsql que pida al usuario que introduzca el job que quiera, y si existe, muestre por la salida el número de trabajadores
que tienen ese puesto/job. En caso de que no haya ninguno, que muestre el mensaje 'No hay empleados de ese puesto'. */
select * from emp;
set serveroutput on;
declare
    puesto VARCHAR2(100) := '&escriba_puesto'; -- o para que este perfercto: emp.job%type
    contador int := 0;
begin
    select count(*) into contador from emp where job = puesto; -- into es para guardar en la variable contador
        if contador > 0 then
            dbms_output.put_line('Hay ' ||contador || ' puesto de ' || puesto || '.');
        else
        dbms_output.put_line('No hay empleados de ese puesto');
    end if;
end;
/

/*2. Crea un programa plsql que haga lo siguiente. Utiliza una constante MIFECHA del tipo date con el valor '17-09-1981'. A continuación, muestra el 
nombre de cada departamento, junto con el nombre de cada empleado de ese departamento cuya fecha de contratación/hiredate sea menor a la constante 
MIFECHA. Debes mostrar el nombre del departamento y luego todos los nombres de empleados de ese departamento. Después el siguiente nombre de 
departamento y todos los empleados de ese departamento, y así sucesivamente hasta terminar con todos los departamentos.
NOTA: se sabe que el deptno se incrementa en 10 unidades cada vez para cada registro.*/
--INDALECIO
DECLARE
    MIFECHA CONSTANT DATE := '17-09-1981';
    MINDEPARTAMENTO INT;
    MAXDEPARTAMENTO INT;
    CUENTA INT;
    CUENTAEMP INT;
    NOMBREDEPARTAMENTO DEPT.DNAME%TYPE;
    MINEMPLEADO INT;
    MAXEMPLEADO INT;
    NOMBREEMPLEADO EMP.ENAME%TYPE;
BEGIN
    SELECT MIN(DEPTNO),MAX(DEPTNO) INTO MINDEPARTAMENTO, MAXDEPARTAMENTO FROM DEPT;
    SELECT MIN(EMPNO),MAX(EMPNO) INTO MINEMPLEADO, MAXEMPLEADO FROM EMP;
    --RECORREMOS TODOS LOS DEPARTAMENTOS POSIBLES
    FOR I IN MINDEPARTAMENTO..MAXDEPARTAMENTO LOOP
        SELECT COUNT(*) INTO CUENTA FROM DEPT WHERE DEPTNO = I;
        --SI HAY UN DEPTNO VÁLIDO
        IF CUENTA > 0 THEN
            SELECT DNAME INTO NOMBREDEPARTAMENTO FROM DEPT WHERE DEPTNO = I;
            DBMS_OUTPUT.PUT_LINE('--' || NOMBREDEPARTAMENTO);
            --OBTENER EMPLEADOS DE ESE DEPARTAMENTO
            --RECORRER TODOS LOS EMPNOS POSIBLES
            FOR J IN MINEMPLEADO..MAXEMPLEADO LOOP
                SELECT COUNT(*) INTO CUENTAEMP FROM EMP WHERE EMPNO = J AND DEPTNO = I AND HIREDATE < MIFECHA;
                --SI HAY UN EMPNO VÁLIDO, ES DEL DEPARTAMENTO I Y ADEMÁS HIREDATE ES MENOR QUE MIFECHA
                IF CUENTAEMP > 0 THEN
                    SELECT ENAME INTO NOMBREEMPLEADO FROM EMP WHERE EMPNO = J;
                    DBMS_OUTPUT.PUT_LINE(NOMBREEMPLEADO);                    
                END IF;
            END LOOP;
        END IF;
    END LOOP;
END;
/
-- ÁNGEL
DECLARE
    MIFECHA DATE := '17-09-1981';
    CONTADOR NUMBER;
    CONTADORMAX NUMBER;
    NOMBRE VARCHAR2(50);
    JOB VARCHAR2(50);
    COINCIDENCIA NUMBER;
    CONTADOREMPMIN NUMBER;
    CONTADOREMPMAX NUMBER;
    COINCIDENCIA2 NUMBER;
BEGIN
    SELECT MIN(DEPTNO) INTO CONTADOR FROM DEPT;
    SELECT MAX(DEPTNO) INTO CONTADORMAX FROM DEPT;
    SELECT MIN(EMPNO) INTO CONTADOREMPMIN FROM EMP;
    SELECT MAX(EMPNO) INTO CONTADOREMPMAX FROM EMP;
    FOR I IN CONTADOR .. CONTADORMAX LOOP
        SELECT COUNT(*) INTO COINCIDENCIA FROM EMP WHERE DEPTNO = I AND HIREDATE < MIFECHA;
        IF COINCIDENCIA > 0 THEN
            SELECT DNAME INTO NOMBRE FROM DEPT WHERE DEPTNO = I;
            DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO: ' || NOMBRE);
            FOR J IN CONTADOREMPMIN .. CONTADOREMPMAX LOOP
                SELECT COUNT(*) INTO COINCIDENCIA2 FROM EMP WHERE DEPTNO = I AND EMPNO = J AND HIREDATE < MIFECHA;
                IF COINCIDENCIA2 > 0 THEN
                    SELECT ENAME, JOB INTO NOMBRE, JOB FROM EMP WHERE DEPTNO = I AND EMPNO = J AND HIREDATE < MIFECHA;
                    DBMS_OUTPUT.PUT_LINE('EMPLEADO: ' || NOMBRE || ' - ' || JOB);
                END IF;
            END LOOP;
        END IF;
    END LOOP;
END;
/
/*3. Se quiere un plsql que pregunte dos fechas y compruebe:
- Que la segunda fecha es más reciente que la primera.
- Que no son iguales en ningún caso.
- Que hay empleados que se contrataron (tienen ese hiredate) en ese intervalo.
Si se cumplen todas las condiciones anteriores, mostrar por la salida el número total de empleados que lo cumplen. En caso contrario, mostrar 
el mensaje "No se cumplen las condiciones".*/
declare
    F1 DATE := '&METE_FECHA1';
    F2 DATE := '&METE_FECHA2';
    N_EMPLEA INT;
begin
    --condiciones
    select count(*) into N_EMPLEA from emp where hiredate between f1 and f2; -- into es para guardar en la variable contador
        if F2 > F1 and N_EMPLEA > 0 then
            dbms_output.put_line(N_EMPLEA || '.');
        else
            dbms_output.put_line('No se cumplen las condiciones.');
    end if;
end;
/

/*4. Se quiere crear con plsql un script que tenga un registro llamado empleado con los campos empno, ename y job, pertenecientes a la tabla emp. 
Además, deberá tener un campo departamento que sea a su vez un registro departamentos con deptno y dname de la tabla dept. Crea una variable 
empleadoMasNovel que sea del tipo empleado y que tenga todos los datos de emp y dept correspondientes al empleado cuyo hiredate sea el más reciente 
a día de hoy.*/

DECLARE
    TYPE DEPARTAMENTO IS RECORD(
        CODIGO DEPT.DEPTNO%TYPE,
        NOMBRE DEPT.DNAME%TYPE
    );
    TYPE EMPLEADO IS RECORD(
        CODIGO EMP.EMPNO%TYPE,
        NOMBRE EMP.ENAME%TYPE,
        PUESTO EMP.JOB%TYPE,
        DEPARTAMENTOV DEPARTAMENTO
    );
    EMPLEADOMASNOVEL EMPLEADO;
BEGIN
    SELECT EMPNO,ENAME,JOB,DEPT.DEPTNO,DNAME
    INTO EMPLEADOMASNOVEL.CODIGO,EMPLEADOMASNOVEL.NOMBRE,EMPLEADOMASNOVEL.PUESTO,EMPLEADOMASNOVEL.DEPARTAMENTOV.CODIGO,EMPLEADOMASNOVEL.DEPARTAMENTOV.NOMBRE
        FROM EMP
        JOIN DEPT ON DEPT.DEPTNO = EMP.DEPTNO
    WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
    DBMS_OUTPUT.PUT_LINE(EMPLEADOMASNOVEL.CODIGO);
    DBMS_OUTPUT.PUT_LINE(EMPLEADOMASNOVEL.NOMBRE);
    DBMS_OUTPUT.PUT_LINE(EMPLEADOMASNOVEL.PUESTO);
    DBMS_OUTPUT.PUT_LINE(EMPLEADOMASNOVEL.DEPARTAMENTOV.CODIGO);
    DBMS_OUTPUT.PUT_LINE(EMPLEADOMASNOVEL.DEPARTAMENTOV.NOMBRE);
END;
/
-- JUEVES 6 DE MARZO DE 2025

--Boletín de ejercicios GROUP BY  BBDD EMP-DEPT.SQL

--1. Muestra la cantidad de empleados en cada departamento.
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT DEPT.DNAME,COUNT(*) FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DEPT.DNAME;

--2. Calcula el salario promedio de los empleados en cada departamento.
SELECT DEPT.DNAME,ROUND(AVG(EMP.SAL),2) FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DEPT.DNAME;

--3. Encuentra el salario más alto y más bajo en cada departamento.
SELECT DEPT.DNAME,MAX(SAL),MIN(SAL) FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DEPT.DNAME;

--4. Suma los salarios de todos los empleados por departamento.
SELECT DEPT.DNAME, SUM(EMP.SAL) FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DEPT.DNAME;

--5. Cuenta cuántos empleados hay en cada tipo de cargo (JOB).
SELECT E1.JOB,COUNT(*) FROM EMP E1 JOIN EMP E2 ON E1.DEPTNO = E2.DEPTNO GROUP BY E1.JOB; -- NO SÉ
SELECT E1.JOB, COUNT(*) FROM EMP E1 GROUP BY E1.JOB;

--6. Calcula el salario promedio por cargo.
SELECT JOB,ROUND(AVG(EMP.SAL),2) FROM EMP GROUP BY JOB;

--7. Muestra solo los departamentos que tienen más de 5 empleados.
SELECT DEPT.DNAME,COUNT(*) FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DEPT.DNAME HAVING COUNT(*) >= 5;

--8. Calcula el salario promedio de cada cargo y ordénalo de mayor a menor.
SELECT E1.JOB,ROUND(AVG(SAL),2) FROM EMP E1 GROUP BY E1.JOB ORDER BY ROUND(AVG(SAL),2) DESC;

--9. Suma la comisión total otorgada en cada departamento.
SELECT DEPT.DNAME,DECODE(SUM(COMM),NULL,0,SUM(COMM)) FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY DEPT.DNAME;

--10. Cuenta cuántos empleados tienen comisión (COMM IS NOT NULL) y cuántos no (COMM IS NULL).
SELECT COUNT(*) FROM EMP WHERE COMM IS NOT NULL UNION SELECT COUNT(*) FROM EMP WHERE COMM IS NULL;

--11. Cuenta cuántos empleados fueron contratados cada año.
SELECT TO_CHAR(HIREDATE,'YYYY'),COUNT(*) FROM EMP GROUP BY TO_CHAR(HIREDATE,'YYYY');

--12. Cuenta cuántos empleados fueron contratados en cada mes.


--13. Encuentra el departamento con el mayor total de salarios.

--14. Encuentra el cargo con el menor salario promedio.

--15. Lista los departamentos con al menos 3 empleados.

--16. Calcula el salario promedio de empleados que tienen comisión y los que no.

--17. Cuenta cuántos empleados hay por combinación de cargo y departamento.

--18. Suma los salarios de los empleados por combinación de cargo y departamento.

--19. Lista los departamentos con un salario promedio mayor a 2000.

--20. Lista los departamentos donde hay al menos un empleado que gana más de 2900.


--PLSQL
set serveroutput on;
declare
    type jefe is record(  -- IS RECORD CREA UN OBJETO Y ABAJO SUS VARIABLES
        nombre emp.ename%type,
        codigo emp.empno%type,
        salario emp.sal%type
    );
    type empleado is record(  --CREO EMPLEADO Y SUS ATRIBUTOS
        nombre emp.ename%type,
        codigo emp.empno%type,
        salario emp.sal%type,
        sujefe jefe
    );
    empleado1 empleado;  -- CREO EMPLEADO1 DE TIPO EMPLEADO
    empleado2 empleado;  -- CREO EMPLEADO2 DE TIPO EMPLEADO
    jefe1 jefe;          -- CREO JEFE1 DE TIPO JEFE
begin
    jefe1.nombre := 'Alejandro'; -- LE DOY VALOR A CADA VARIABLE
    empleado1.nombre := 'Inda';
    empleado1.sujefe := jefe1;
    --Empleado2, su nombre, codigo y salario sean los del empleado que haya sido contratado el primero
    select ename,empno,sal,mgr into empleado2.nombre,empleado2.codigo,empleado2.salario,empleado2.sujefe from emp where hiredate = (select min(hiredatae) from emp);
    
    --Empleado2 tiene sujefe, rellénalo con su jefe de verdad (MGR)
    select ename,sal into empleado2.sujefe.nombre, empleado2.sujefe.salario from emp where empno = empleado2.sujefe.codigo;
    
    dbms_output.put_line(empleado1.nombre);
    dbms_output.put_line(empleado1.sujefe.nombre);
    dbms_output.put_line('--');
    dbms_output.put_line(empleado2.nombre||'|'||empleado2.codigo||'|'||empleado2.salario);
    dbms_output.put_line(empleado2.sujefe.nombre||'|'||empleado2.sujefe.codigo||'|'||empleado2.sujefe.salario);
end;
/
 
select * from emp order by hiredate;




