--31. Calcular el �ltimo dia del mes (fecha) del mes actual.
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--32. Calcular el �ltimo dia del mes (fecha) del mes actual, con horas, minutos y segundos.
SELECT TO_CHAR(LAST_DAY(SYSDATE),'DD-MM-YYYY HH24:MI:SS') "�LTIMO D�A" FROM DUAL;

--33. Calcular en qu� MES (cifras) se ha contratado cada empleado.
SELECT ENAME "NOMBRE", TO_CHAR(HIREDATE, 'MM')"MES" FROM EMP;

--34. Calcular cu�nto deber� haber cobrado cada empleado en su primer a�o de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese a�o).
SELECT ENAME "NOMBRE", TO_CHAR((SAL*12),'99,999.00L') "SALARIO ANUAL" FROM EMP;

--35. Cu�ntos oficios distintos hay en la tabla de empleados.
SELECT DISTINCT JOB "TRABAJOS" FROM EMP;

--36. Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%.
SELECT ENAME,TO_CHAR(DECODE(JOB, 'CLERK', SAL*0.15, 'ANALYST',SAL*0.20, SAL*0.19),'99,999.00L') "IRPF" FROM EMP;

--37. Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario.
SELECT ENAME, TO_CHAR(DECODE(DEPTNO,10, (SAL*0.05)+SAL, 20,(SAL*0.07)+SAL,30,(SAL*0.08)+SAL, (SAL*0.03)+SAL),'99,999.00L') "SALARIO FINAL" FROM EMP;

--38. Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisi�n, y 'No vendedor' si no la cobra.
SELECT ENAME, DECODE(COMM,NULL,'NO VENDEDOR',0,'NO VENDEDOR','VENDEDOR') FROM EMP;

--39. Calcular cu�nto se paga mensualmente a todos los empleados.
SELECT TO_CHAR(SUM(SAL),'99,999.00L')"GASTO EN SALARIO" FROM EMP;

--40. Calcular cu�nto empleados hay.
SELECT COUNT(ENAME)"TRABAJADORES" FROM EMP;

--41. Calcular el sueldo medio de todos los empleados.
SELECT TO_CHAR(ROUND(AVG(SAL),2),'99,999.00L') "SALARIO MEDIO" FROM EMP;

--42. Calcular la comisi�n media de todos los empleados (teniendo en cuenta aquellos que no tienen comisi�n).
SELECT TO_CHAR(SUM(COMM)/COUNT(ENAME),'99,999.00L') "COMIS�N MEDIA" FROM EMP;

--43. Calcular la comisi�n media de los empleados que s� tienen comisi�n.
SELECT TO_CHAR(AVG(COMM),'99,999.00L') "COMIS�N MEDIA" FROM EMP WHERE COMM IS NOT NULL OR COMM != 0;

--44. Calcular la suma de los sueldos de los empleados del Departamento 20.
SELECT TO_CHAR(SUM(SAL),'99,999.00L')"SUELDO DEPT 20" FROM EMP WHERE DEPTNO = '20';

--45. Calcular el sueldo medio de los empleados que pertenezcan al Dept 10 o 30.
SELECT TO_CHAR(AVG(SAL),'99,999.00L')"SUELDO DEPT 10 O 30" FROM EMP WHERE DEPTNO = '10' OR DEPTNO = '30';

--46. Calcular la suma de sueldos que se pagan en cada uno de los departamentos 10 y 30 (por separado).
SELECT DEPTNO,TO_CHAR(SUM(SAL),'99,999.00L')"SUELDO DEPT 10" FROM EMP WHERE DEPTNO IN (10,30) GROUP BY DEPTNO;

--47. Calcular cu�ntos empleados se han contratado cada a�o.
SELECT DISTINCT(TO_CHAR(HIREDATE,'YYYY'))"A�O",COUNT(*)"CONTRATADOS" FROM EMP GROUP BY TO_CHAR(HIREDATE,'YYYY');

--48. Calcular el sueldo m�ximo y m�nimo de cada departamento.
SELECT DEPT.DNAME,TO_CHAR(MAX(SAL),'99,999.00L')"MAX",TO_CHAR(MIN(SAL),'99,999.00L')"MIN" FROM EMP
    JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO GROUP BY EMP.DEPTNO,DEPT.DNAME;
 
--49. Calcular cu�nto se gana de media por cada oficio. Redondear a 2 decimales.
SELECT JOB,TO_CHAR(ROUND(AVG(SAL),2),'99,999.00L')"SUELDO MEDIO" FROM EMP GROUP BY JOB;

--50. Cu�ntos d�as de vacaciones correspondieron a cada empleado el primer a�o de trabajo (contando 1 d�a por semana entera trabajada).
SELECT ENAME, ROUND((TO_DATE('31-12-'|| EXTRACT(YEAR FROM HIREDATE),'DD-MM-YYYY')-HIREDATE)/7)"D�AS VACACIONES" FROM EMP;
 