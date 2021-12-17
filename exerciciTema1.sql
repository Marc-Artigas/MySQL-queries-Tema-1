/*1.Llista el nom de tots els productos que hi ha en la taula producto.*/
-- SELECT nombre FROM producto
/*2.Llista els noms i els preus de tots els productos de la taula producto.*/
-- SELECT nombre, precio FROM producto
/*3. Llista totes les columnes de la taula producto.*/
-- SELECT * FROM producto
/*4. Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans (USD).*/
-- SELECT nombre, precio, precio * 1.13 AS 'precio dólares (USD)' FROM producto
/*5. Llista el nom dels productos, el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars nord-americans.*/
-- SELECT nombre AS 'nom de producte', precio AS 'euros', precio * 1.13 AS 'dòlars nord-americans' FROM producto
/*6. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.*/ 
-- SELECT UPPER(nombre) AS 'nombre', precio FROM producto
/*7. Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.*/
-- SELECT LOWER(nombre) AS 'nombre', precio FROM producto
/*8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
-- SELECT nombre, CONCAT (UPPER(LEFT(nombre,2)),SUBSTRING(nombre,3)) AS 'nombre mayusc' FROM fabricante
/*9. Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.*/
-- SELECT nombre, ROUND (precio,1) AS precio FROM producto
/*10. Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
-- SELECT nombre, ROUND (precio) AS precio FROM producto
/*11.Llista el codi dels fabricants que tenen productos en la taula producto.*/  	
-- SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo
/*12.Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.*/
-- SELECT DISTINCT codigo_fabricante FROM producto
/*13.Llista els noms dels fabricants ordenats de manera ascendent.*/ 
-- SELECT nombre FROM fabricante ORDER BY nombre
/*14.Llista els noms dels fabricants ordenats de manera descendent.*/
-- SELECT nombre FROM fabricante ORDER BY nombre DESC
/*15.Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.*/
-- SELECT nombre,precio FROM producto ORDER BY nombre, precio DESC
/*16.Retorna una llista amb les 5 primeres files de la taula fabricante.*/
-- SELECT * FROM fabricante LIMIT 5
/*17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.*/
-- SELECT * FROM fabricante LIMIT 3,2
/*18. Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY*/
-- SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1
/*19.Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
-- SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1
/*20.Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.*/
-- SELECT nombre, codigo_fabricante FROM producto WHERE codigo_fabricante = 2
/*21.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
/*22.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricant, per ordre alfabètic.*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre
/*23.Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.*/
-- SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
/*24.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio LIMIT 1
/*25.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY precio DESC LIMIT 1
/*26.Retorna una llista de tots els productes del fabricant Lenovo.*/
-- SELECT producto.nombre, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE codigo_fabricante = 2
/*27.Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE codigo_fabricante = 6 AND precio>200
/*28.Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.*/
-- SELECT producto.nombre, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5
/*29.Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.*/
-- SELECT producto.nombre, fabricante.nombre AS 'nombre fabricante' FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE codigo_fabricante IN ('1','3','5')
/*30.Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre REGEXP 'e$'
/*31.Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE fabricante.nombre REGEXP 'w'
/*32.Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)*/
-- SELECT producto.nombre, precio, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante=fabricante.codigo WHERE precio >=180 ORDER BY precio DESC, producto.nombre
/*33.Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.*/
-- SELECT DISTINCT f.codigo, f.nombre FROM fabricante f JOIN producto p ON f.codigo=p.codigo_fabricante 
/*34.Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.*/
-- SELECT f.codigo, f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo=p.codigo_fabricante 
/*35.Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.*/
-- SELECT f.codigo, f.nombre, p.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo=p.codigo_fabricante WHERE p.nombre IS NULL
/*36.Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).*/
-- SELECT * FROM producto WHERE codigo_fabricante = 2 
/*37.Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense utilitzar INNER JOIN).*/
-- SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2)
/*38.Llista el nom del producte més car del fabricant Lenovo.*/
-- SELECT nombre, MAX(precio) FROM producto WHERE codigo_fabricante = 2
/*39.Llista el nom del producte més barat del fabricant Hewlett-Packard.*/
-- SELECT nombre, MIN(precio) FROM producto WHERE codigo_fabricante = 3
/*40.Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.*/
-- SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = 2) 
/*41.Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.*/
-- SELECT *FROM producto WHERE codigo_fabricante = 1 AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = 1)

/*Base de dades Universidad*/

/*1.Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
-- SELECT apellido1, apellido2, nombre FROM persona WHERE tipo ='alumno' ORDER BY apellido1, apellido2, nombre
/*2.Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
-- SELECT nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL AND tipo ='alumno'
/*3.Retorna el llistat dels alumnes que van néixer en 1999.*/
-- SELECT * FROM persona WHERE tipo ='alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'
/*4.Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.*/
-- SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k'
/*5.Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/
-- SELECT * FROM asignatura WHERE cuatrimestre = '1' AND curso ='3' AND id_grado = '7'
/*6.Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
-- SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre FROM profesor p JOIN departamento d ON p.id_departamento = d.id JOIN persona pe ON p.id_profesor = pe.id ORDER BY pe.apellido1, pe.apellido2, pe.nombre
/*7.Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.*/
-- SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona PE JOIN alumno_se_matricula_asignatura ama ON pe.id = ama.id_alumno JOIN asignatura a ON ama.id_asignatura = a.id JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id WHERE nif ='26902806M'
/*8.Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
-- SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a  ON p.id_profesor = a.id_profesor WHERE id_grado = 4
/*9.Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
-- SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno WHERE p.tipo = 'alumno' AND ama.id_curso_escolar = 5

/*Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.*/

/*1.Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
-- SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d	ON pr.id_departamento = d.id WHERE tipo = 'profesor' ORDER BY departamento, p.apellido1, p.apellido2, p.nombre
/*2.Retorna un llistat amb els professors que no estan associats a un departament.*/
/*SELECT * FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE tipo = 'profesor' AND id_departamento IS NULL*/
-- tots els professors tenen un departament associat.
/*3.Retorna un llistat amb els departaments que no tenen professors associats.*/
-- SELECT d.nombre AS departamento FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE id_profesor IS NULL
/*4.Retorna un llistat amb els professors que no imparteixen cap assignatura.*/
-- SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.nombre IS NULL ORDER BY p.nombre
/*5.Retorna un llistat amb les assignatures que no tenen un professor assignat.*/
-- SELECT a.nombre AS asignatura FROM persona p RIGHT JOIN asignatura a ON p.id = a.id_profesor WHERE a.id_profesor IS NULL
/*6.Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.*/
-- SELECT DISTINCT d.id, d.nombre FROM alumno_se_matricula_asignatura ama JOIN asignatura a ON ama.id_asignatura = a.id RIGHT JOIN profesor p ON a.id_profesor = p.id_profesor JOIN departamento d ON p.id_departamento = d.id WHERE a.id_profesor IS NULL

/*Consultes resum*/

/*1.Retorna el nombre total d'alumnes que hi ha.*/
-- SELECT COUNT(tipo) AS 'numero de alumnos'FROM persona WHERE tipo ='alumno'
/*2.Calcula quants alumnes van néixer en 1999.*/
-- SELECT COUNT(fecha_nacimiento) AS 'alumnes del 1999' FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'
/*3.Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.*/
-- SELECT d.nombre, COUNT(id_profesor) AS 'numero de profesores' FROM profesor p JOIN departamento d  ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(id_profesor) DESC
/*4.Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.*/
-- SELECT d.nombre, COUNT(id_profesor) AS 'numero de profesores' FROM profesor p RIGHT JOIN departamento d  ON p.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(id_profesor) DESC
/*5.Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/
-- SELECT g.nombre, COUNT(a.nombre) AS 'numero asignaturas' FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre ORDER BY COUNT(a.nombre) DESC
/*6.Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.*/
-- SELECT g.nombre, COUNT(a.nombre) AS 'numero asignaturas' FROM asignatura a RIGHT JOIN grado g ON a.id_grado = g.id GROUP BY g.nombre HAVING COUNT(a.nombre) > '40';
/*7.Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.*/
-- SELECT g.nombre, a.tipo, SUM(a.creditos) AS 'total creditos' FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo
/*8.Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.*/
-- SELECT ce.anyo_inicio, COUNT(DISTINCT ama.id_alumno) AS 'numero de alumnos' FROM alumno_se_matricula_asignatura ama JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id GROUP BY id_curso_escolar
/*9.Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.*/
-- SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS 'numero de asignaturas' FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id ORDER BY COUNT(a.id) DESC
/*10.Retorna totes les dades de l'alumne més jove.*/
-- SELECT * FROM persona WHERE tipo ='alumno' ORDER BY fecha_nacimiento DESC LIMIT 1
/*11.Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.*/
-- SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2 FROM profesor p LEFT JOIN asignatura a  ON p.id_profesor = a.id_profesor JOIN persona pe  ON p.id_profesor = pe.id WHERE a.id IS NULL ORDER BY p.id_profesor

