-- Taller 2 — SELECT y NULL
-- Integrantes: Andres Arias , Jose Badillo
-- Fecha: 2026-08-05
-- Punto 1
SELECT COUNT(*) FROM ejemplar;
SELECT COUNT(*) FROM ejemplar WHERE estado =  'prestado';
SELECT COUNT(*) FROM ejemplar WHERE estado <> 'prestado';
-- Explicación:
-- a. No por que el resultado es 18 cuando son 20 datos
-- b. Faltan BU-0019 y BU-0020 
-- c. Porque el <> deja por fuera las filas que estan en NULL 
--Punto 2
SELECT nombre || ' (' || nacionalidad || ')' AS ficha FROM autor;
--a. El faltante es el autor Ricardo Socas Gutiérrez y sale un NULL en su lugar 
--b. Se muestra en NULL por que en Postgre la concatenacion con NULL deja todo en NULL 
--c. SELECT nombre || ' (' || COALESCE(nacionalidad, 'Sin nacionalidad') || ')' AS ficha FROM autor;
--Punto 3
SELECT  id_prestamo, fecha_devolucion_esperada, DATE '2026-08-05' - fecha_devolucion_esperada 
AS dias_retraso
FROM prestamo
WHERE fecha_devolucion_real IS null AND fecha_devolucion_esperada < DATE '2026-08-05';
-- Punto 4
	SELECT titulo,
	       2026 - anio_publicacion AS antiguedad
	FROM   libro
	WHERE  antiguedad > 10
	ORDER BY antiguedad DESC;
-- a. El Where procesa el alias del select porque que se procesa antes que el select y el order by despues del select
-- b.
	SELECT titulo, 2026 - anio_publicacion as antiguedad
	FROM   libro 
	WHERE  anio_publicacion  > 10
	ORDER BY antiguedad desc;
-- c. lo que falta es libro Introducción a los sistemas NoSQL que es el que no tiene año de publicacion y esta bien por que cumple la condicion de tener mas de 10 años de antiguedad
--Punto 5 
	select titulo,
	    anio_publicacion,
	    COALESCE(editorial, 'Editorial no registrada') AS editorial
	FROM libro
	ORDER BY anio_publicacion DESC NULLS LAST;
--Al ordenar de forma descendente, el motor asigna el valor más alto a los nulos, enviándolos al inicio del resultado. Si no se usa NULLS LAST, un libro sin año de publicación encabezaría injustificadamente el «top de novedades» como si fuese la última edición.
--Punto 6
	SELECT DISTINCT estado FROM ejemplar;
--vota como resultado los estados que tiene la tabla sin repetirlos osea esta seleccionando uno de cada estado
	SELECT COUNT(*) FROM ejemplar WHERE estado IS NULL;
--Y en el otro caso esta contando la cantidad de veces que estado es NULL por eso salen 2-
