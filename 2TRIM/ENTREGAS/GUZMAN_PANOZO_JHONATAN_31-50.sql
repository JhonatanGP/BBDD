--31. Calcular el último dia del mes (fecha) del mes actual.
SELECT LAST_DAY(SYSDATE) FROM DUAL;
--32. Calcular el último dia del mes (fecha) del mes actual, con horas, minutos y segundos.
SELECT SYSDATE,'DD-MM-YYYY HH24:MI:SS' FROM DUAL;
select last_day(sysdate) || ' - ' || to_char(last_day(sysdate),'"("HH24")"') || ' ' ||to_char(last_day(sysdate),'MI') || ' ' ||to_char(last_day(sysdate),'SS') from dual;
--33. Calcular en qué MES (cifras) se ha contratado cada empleado.

--34. Calcular cuánto deberá haber cobrado cada empleado en su primer año de trabajo (desde la fecha de contrato hasta el 31 de diciembre de ese aÃ±o).

--35. Cuántos oficios distintos hay en la tabla de empleados.

--36. Calcular el IRPF de cada empleado, teniendo en cuenta que para los 'CLERK' se les retiene un 15%, y a los 'ANALYST" un 20%. Al resto se les retiene un 19%.

--37. Efectuar una propuesta de aumento salarial: Para los empleados del Dept. 10 un 5%, Dept. 20 un 7%, Dept 30 un 8% y al resto un 3% del salario.

--38. Listar los nombres de los empleados, identificando como 'Vendedor' si cobra comisión, y 'No vendedor' si no la cobra.

--39. Calcular cuánto se paga mensualmente a todos los empleados.

--40. Calcular cuánto empleados hay.

--41. Calcular el sueldo medio de todos los empleados.

--42. Calcular la comisión media de todos los empleados (teniendo en cuenta aquellos que no tienen comisión).

--43. Calcular la comisión media de los empleados que sí tienen comisión.

--44. Calcular la suma de los sueldos de los empleados del Departamento 20.

--45. Calcular el sueldo medio de los empleados que pertenezcan al Dept 10 o 30.

--46. Calcular la suma de sueldos que se pagan en cada uno de los departamentos 10 y 30 (por separado).

--47. Calcular cuántos empleados se han contratado cada año.

--48. Calcular el sueldo máximo y mínimo de cada departamento.

--49. Calcular cuánto se gana de media por cada oficio. Redondear a 2 decimales.

--50. Cuántos días de vacaciones correspondieron a cada empleado el primer aÃ±o de trabajo (contando 1 día por semana entera trabajada).
