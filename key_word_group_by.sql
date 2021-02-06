/*
    Ejemplos de consultas utilizando el key word GROUP BY...
    
    NOTA: Cuando se desea agrupar por filas, entonces se requiere de la cláusula GROUP BY. 
*/

-- Obtener el promedio de los salarios de mayor a menor, por departamento.
SELECT ROUND(AVG(salary)), department_id 
FROM employees
GROUP BY department_id
ORDER BY department_id DESC;


-- Mostrar el total de empleadosque tiene cada tipo de manager de manera desendente y de los que no tengann manager asignado al final.
SELECT COUNT(*), manager_id
FROM employees
GROUP BY manager_id
ORDER BY 1 DESC, 2 NULLS LAST;

-- Obtener el salario más alto por departamento el total de trabajadores.
-- No es necesario que se proyecte (que parezca en el selesct) la columna por la que se agrupará.
SELECT MAX(salary) AS "salario max", COUNT(*) AS "num. emp."
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- Agrupar el total de paices que hay por región.
SELECT region_id AS "Región", COUNT(*) AS "Total de paices"
FROM countries
GROUP BY region_id;

-- Mostrar los empleados que han renunciado por cada año de meneor a mayor.
SELECT TO_CHAR(end_date, 'YYYY') AS "Año", COUNT(*) AS "Num. Empleados"
FROM job_history
GROUP BY TO_CHAR(end_date, 'YYYY')
ORDER BY COUNT(*) DESC;

-- Agrupar por total de empleados que han trabajado y mostrar las fehcas en las que trabajron.
SELECT start_date, end_date, COUNT(*)
FROM job_history
GROUP BY end_date, start_date; -- NOTAR que no importa el orden que se agregen las columnas a agrupar.

-- Agrupar por id de departamento y trabajadir y mostrar la suma de su comición.
SELECT department_id, job_id, SUM(commission_pct)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id, job_id;

/*
    EJERCICIO
    Crear un reporte que contenga el número de empleados que han dejado sus trabajos, agrupados por el 
    año en el cual se fueron. Los trabajos que realizaron también deben mostrarse. Los resultados deben 
    ser ordenados de manera desendente con base en el número de empleados en cada grupo. Serequiere que 
    que el reporte debe listar el año, id del empleado y el número de empleados que dejaron ese año. 
*/
SELECT TO_CHAR(end_date, 'YYYY') AS "año de renun.", job_id AS "id empl,", COUNT(*) AS "total"
FROM job_history
GROUP BY  TO_CHAR(end_date, 'YYYY'), job_id
ORDER BY COUNT(*) DESC;