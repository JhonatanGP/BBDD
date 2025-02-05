--1. Obtener el nombre de todos los departamentos en min鷖culas.
SELECT LOWER(DNAME) FROM DEPT;

--2. Seleccionar todos los datos de la tabla empleados (todas las columnas).
SELECT * FROM EMP;

--3. Devuelve ename, job, sal y comm de los empleando usando los siguientes alias de columnas: nombre, puesto, salario y comisi髇.
SELECT ENAME "NOMBRE",JOB "PUESTO",SAL "SALARIO",COMM "COMISI覰" FROM EMP;

--4. Calcula cu醤tas semanas completas(de lunes a domingo) ha trabajado cada empleado, y devuelve dicho valor y el nombre del empleado.
SELECT ENAME,CEIL((SYSDATE-HIREDATE)/7) "SEMANAS" FROM EMP;

--5. Calcula sueldo neto de cada empleado, la retencion IRPF mensual, sabiendo que la retenci髇 es 19% para el sueldo y 10% de la comisi髇, (redondear a 2 decimales). Si el empleado no tiene comisi贸n, se debe mostrar el valor 0.
SELECT SAL "NETO", ROUND((SAL*0.19) + (NVL(COMM,0)*0.1),2) "IRPF" FROM EMP;--NVL A LOS COMM QUE ESTEN EN NULL SE LES PONE 0

--6. Hacer un listado de empleados (nombre y salario) con sueldo superior a 1000.
SELECT ENAME,SAL FROM EMP WHERE SAL > 1000;

--7. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto igual a CLERK.
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE JOB = 'CLERK';

--8. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK.
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE JOB != 'CLERK';

--9. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan puesto distinto a CLERK y sueldo superior a 1500.
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE JOB != 'CLERK' AND SAL > 1500;

--10. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que tengan asignada comisi贸n.
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE COMM IS NOT NULL;

--11. Hacer un listado de empleados (nombre, puesto, sueldo, comision) que NO tengan asignada comisi贸n.
SELECT ENAME,JOB,SAL,COMM FROM EMP WHERE COMM IS NULL;

--12. Seleccionar los empleados cuyo nombre empieza por 'A'.
SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%';

--13. Seleccionar los empleados cuyo nombre tienen una A en cualquier posici贸n.
SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%';

--14. Seleccionar los empleados cuyo nombre no contiene ninguna 'A'.
SELECT ENAME FROM EMP WHERE ENAME LIKE 'A%';

--15. Seleccionar los empleados cuyo nombre empieza por una vocal.
SELECT ENAME FROM EMP WHERE SUBSTR(ENAME,1,1) IN ('A','E','I','O','U');

--17. Seleccionar los empleados con sueldo igual a 1000, 2000, 3000, 4000 o 5000.
SELECT ENAME,SAL FROM EMP WHERE SAL IN (1000,2000,3000,4000,5000);

--18. Seleccionar los empleados cuyo nombre comienza por A,B,C,J,K,M.
SELECT ENAME FROM EMP WHERE SUBSTR(ENAME,1,1) IN ('A','B','C','J','K','M');
--select ename emp where ename like ('A%') or ename like ('B%')or ename like ('C%')or ename like ('J%')or ename like ('K%')or ename like ('M%');

--19. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 o 5000-1000.
SELECT ENAME,SAL FROM EMP WHERE SAL = (5000/2) + 500 OR SAL = 5000-1000;

--20. Seleccionar los empleados cuyo sueldo es la 5000/2 + 500 ,5000-1000 o el salario m谩ximo de todos los empleados.
SELECT ENAME,SAL FROM EMP WHERE SAL = (5000/2) + 500 OR SAL = 5000-1000 OR SAL =(SELECT MAX(SAL) FROM EMP);

--21. Seleccionar nombre, sueldo y sueldo formateado (ej.: 1,000.00) de todos los empleados. Se puede usar las m谩scaras de to_number en to_char.
SELECT ENAME "NOMBRE",SAL "SALARIO",TO_CHAR(SAL,'9,999.00')"SUELDO FORMATEADO"  FROM EMP;

--22. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Dolar' (ej.: $1,000.00) de todos los empleados. Se puede usar las m醩caras de to_number en to_char.
SELECT ENAME "NOMBRE",SAL "SALARIO",TO_CHAR(SAL,'9,999.00$')"SUELDO FORMATEADO"  FROM EMP;

--23. Seleccionar nombre, sueldo y sueldo formateado con el simbolo 'Euro' (ej.: 1,000.00� de todos los empleados. Se puede usar las m醩caras de to_number en to_char.
SELECT ENAME "NOMBRE",SAL "SALARIO",TO_CHAR(SAL,'9,999.00L')"SUELDO FORMATEADO"  FROM EMP;

--24. Seleccionar la fecha del sistema (d韆, mes, a駉, horas (24):minutos:segundos).
SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY HH24:MI:SS') FROM DUAL;

--25. Seleccionar la fecha del sistema(nomb d韆, d韆, nomb mes, a駉, horas (24):minutos:segundos). No debe haber espacios sobrantes en el nombre del d韆 o del mes.
SELECT TO_CHAR(SYSDATE,'DAY')|| ',' || to_char(sysdate,'DD') || ',' || TRIM(to_char (sysdate,'MONTH')) || ',' || to_char(sysdate,'YYYY') || ',' || to_char(sysdate,'HH24') || ':' || to_char(sysdate,'MI') || ':' || to_char(sysdate,'SS') "FECHA" from dual;

--26. Mostrar la fecha del d韆 "1 de enero de 2005", usando una tira de caracteres y su m醩caras de formato (ej.: 01012021), convertirlo en fecha y empleado en el to_char. No deben aparecer espacios adicionales en el nombre del mes.
SELECT TO_CHAR(TO_DATE(10012021,'DD-MM-YYYY'), 'DD "de" MONTH "de" YYYY')"FECHA" FROM DUAL; 
--27. Calcular el n鷐ero de d韆 vividos hasta hoy por una persona nacida el d韆 3 de julio de 1970.
SELECT TRUNC(SYSDATE - TO_DATE('03-07-1970','DD,MM,YYYY')) "D虯S " FROM DUAL;

--28. Calcular el n鷐ero de segundos transcurridos desde la 鷏tima medianoche (m醩cara 'sssss' en to_char).
SELECT TO_CHAR(SYSDATE, 'sssss') "SEGUNDOS" FROM DUAL;

--29. Calcular el n鷐ero horas completas transcurridas desde la 鷏tima medianoche.
SELECT TO_CHAR(SYSDATE, 'HH24') "SEGUNDOS" FROM DUAL;

--30. Calcular el n鷐ero de meses transcurridos entre la fecha de contrataci髇 de cada empleado y hoy.
SELECT CEIL(MONTHS_BETWEEN(SYSDATE,HIREDATE)) "MESES" FROM EMP;





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
 
insert into emp values( 7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981','dd-mm-yyyy'), 5000, null, 10);
insert into emp values( 7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981','dd-mm-yyyy'), 2850, null, 30);
insert into emp values( 7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'), 2450, null, 10);
insert into emp values( 7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'), 2975, null, 20);
insert into emp values( 7788, 'SCOTT', 'ANALYST', 7566, to_date('13-JUL-87','dd-mm-rr') - 85, 3000, null, 20);
insert into emp values( 7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'), 3000, null, 20);
insert into emp values( 7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'), 800, null, 20);
insert into emp values( 7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, to_date('13-JUL-87', 'dd-mm-rr') - 51, 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-yyyy'), 1300, null, 10);

commit;
