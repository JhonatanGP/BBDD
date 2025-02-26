--101. Listar las diferentes ciudades de la tabla sin repetición explícitamente (aunque no haya datos que se repitan).
SELECT DISTINCT LOC FROM DEPT;

--102. Listar el nombre de departamento y nombre de ciudad para los departamentos ubicados en New York y Dallas.
SELECT DNAME, LOC FROM DEPT WHERE LOC = 'NEW YORK' OR LOC = 'DALLAS'; -- o select dname, loc from dept where loc in ('NEW YORK', 'DALLAS');  

--103. Seleccionar el nombre de los empleados y el nombre de la ciudad donde está el departamento al que pertenecen.
SELECT EMP.ENAME, DEPT.LOC FROM DEPT JOIN EMP ON DEPT.DEPTNO = EMP.DEPTNO;

--104. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son MANAGER.
SELECT EMP.ENAME, EMP.JOB, DEPT.DNAME, DEPT.LOC FROM EMP JOIN DEPT ON emp.deptno = dept.deptno WHERE JOB != 'MANAGER';

--105. Listar el nombre de los trabajadores, puesto, nombre del departamento y ciudad del departamento de aquellos que no son ni ANALYST ni CLERK.
SELECT EMP.ENAME, EMP.JOB, DEPT.DNAME, DEPT.LOC FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE JOB NOT IN ('ANALYST','CLERK');
--106. Seleccionar el nombre del empleado, código y nombre del departamento al que pertenecen los empleados.
SELECT EMP.ENAME, DEPT.DEPTNO, DEPT.DNAME FROM EMP JOIN DEPT ON  EMP.DEPTNO = DEPT.DEPTNO ;

--107. Seleccionar el nombre de los empleados que trabajan en el departamento cuyo código es el más bajo de todos los existentes (utiliza subconsultas).
SELECT EMP.ENAME, DEPT.DEPTNO, DEPT.DNAME FROM EMP JOIN DEPT ON  EMP.DEPTNO = DEPT.DEPTNO WHERE dept.deptno = (SELECT MIN(DEPTNO) FROM DEPT);

--108. Seleccionar nombre de empleado, nombre de departamento y ubicación del departamento para los empleados que tienen comisión.
SELECT EMP.ENAME, DEPT.DNAME, DEPT.LOC FROM EMP JOIN DEPT ON  EMP.DEPTNO = DEPT.DEPTNO WHERE COMM != 0;

--109. Seleccionar nombre de empleado, nombre de departamento y localización, para los empleados que no tienen comisión (o esta vale cero).
SELECT EMP.ENAME, DEPT.DNAME, DEPT.LOC FROM EMP JOIN DEPT ON  EMP.DEPTNO = DEPT.DEPTNO WHERE COMM = 0 OR COMM IS NULL;

--110. Seleccionar nombre de empleado y nombre de departamento para los empleados que tengan una 'A' en su nombre.
SELECT EMP.ENAME, DEPT.DNAME FROM EMP JOIN DEPT ON  EMP.DEPTNO = DEPT.DEPTNO WHERE ENAME LIKE ( '%A%');

--111. Seleccionar nombre de empleado y nombre departamento para los empleados que tengan una vocal al menos (A, E, I, O, U) en su nombre.
--SELECT EMP.ENAME, DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE ENAME IN( '%A%','%E%','%I%','%O%','%U%');
SELECT EMP.ENAME, DEPT.DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE ENAME LIKE '%A%' OR ENAME LIKE '%E%'OR ENAME LIKE '%I%' OR ENAME LIKE '%O%'OR ENAME LIKE '%U%';

--112. Seleccionar nombre y puesto de empleado, código de departamento y nombre de departamento de los empleados cuyo departamento está ubicado en 'Chicago'. Todos los valores deben devolverse en minúsculas.
SELECT LOWER(EMP.ENAME), LOWER(EMP.JOB),DEPT.DEPTNO, LOWER(DEPT.DNAME) FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO WHERE LOC = 'CHICAGO';

--113. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (no se deben mostrar los que no tienen jefe).
SELECT E1.ENAME, E1.EMPNO, E2.ENAME, E2.EMPNO FROM EMP E1 JOIN EMP E2 ON E1.MGR = E2.EMPNO;
-- SELECT E1.ENAME, E1.EMPNO, E2.ENAME, E2.EMPNO FROM EMP E1 JOIN EMP E2 ON E2.MGR = E1.EMPNO; ESTE NO

--114. Seleccionar nombre, código de empleado, nombre de su jefe y código de empleado de su jefe para todos los empleados (se deben mostrar TODOS, incluso los que no tienen jefe).
SELECT E1.ENAME, E1.EMPNO, E2.ENAME, E2.EMPNO FROM EMP E1 LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO;

--115. Seleccionar código departamento, nombre de empleado y nombre de jefe de cada empleado del departamento que está en BOSTON.
SELECT E1.DEPTNO, E1.ENAME, E2.ENAME FROM EMP E1 LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO JOIN DEPT ON E1.DEPTNO = DEPT.DEPTNO WHERE LOC = 'BOSTON';

--116. Seleccionar nombre y fecha contrato de los empleados contratados posteriormente al empleado 'WARD'.
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'WARD');

--117. Seleccionar nombre y fecha de contrato de los empleados, además del nombre y fecha de contrato de su jefe, siempre y cuando la fecha del contrato del empleado fuera anterior a la fecha de contrato de su jefe.
SELECT A.ENAME, A.HIREDATE, B.ENAME, B.HIREDATE FROM EMP A JOIN EMP B ON A.MGR = B.EMPNO AND A.HIREDATE < B.HIREDATE;

--118. Listar todos los nombres cuya longitud sea menor que la media de todas las longitudes de nombres de empleados redondeado al entero superior.
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) < (SELECT AVG(LENGTH(ENAME)) FROM EMP);

--119. Seleccionar el nombre de los empleados y el nombre del departamento al que pertenecen, siempre y cuando el nombre del departamento comience por la letra 'S'.
SELECT E.ENAME, D.DNAME FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO WHERE D.DNAME LIKE '%S';
