#!/usr/local/bin/sbasic

CLS

'Entrada de datos

INPUT "N° de dimensiones"; numd
DIM dimensions(numd)

'Almacenamos máximo y mínimo para cada dimensión
FOR i = 1 TO numd
	PRINT "Dimensión "; i
	INPUT "Mínimo"; dimensions(i).min
	INPUT "Máximo"; dimensions(i).max
NEXT

INPUT "N° de clusters"; ncentroids
DIM centroids(ncentroids)

'Recorremos todos los centroides
FOR i = 1 TO ncentroids
	PRINT "Cluster #"; i
	DIM coords(numd)
	'Recorremos todas sus dimensiones
	FOR j = 1 to numd
		PRINT "Dimensión #"; j;
		INPUT coords(j)
	NEXT
	centroids(i).coords = coords
	INPUT "Densidad"; centroids(i).d
NEXT

'Creación del cluster

'Recorremos todos los centroides
FOR i = 1 TO ncentroids
	'Creamos tantos puntos como indique ese centroide
	FOR k = 1 TO centroids(i).d
		DIM p(numd)
		'Generamos un punto aleatorio
		REPEAT
			FOR j = 1 TO numd
				p(j) = (dimensions(j).max - dimensions(j).min) * RND
			NEXT
		'que sea el más cercano al centroide
		UNTIL dMinima(p, centroids, i, numd, ncentroids)

		'Imprime todas las dimensiones
		FOR j = 1 TO numd
			PRINT p(j); ",";
		NEXT
		'Imprime la categoría (cluster) a la que pertenece
		PRINT i
	NEXT
NEXT

END

FUNC dMinima( p, centroids, pos, numd, ncentroids )
	LOCAL i, d, d2, result

	'Calculamos la distancia euclidiana en "numd" dimensiones
	'entre el punto y su centroide
	d = Euclidian( p, centroids(pos).coords, numd )

	result = TRUE
	'Recorremos todos los centroides
	i = 1
	WHILE i <= ncentroids AND result = TRUE
		'Calculamos la distancia euclidiana al centroide
		d2 = Euclidian( p, centroids(i).coords, numd )
		'Si es menor que a su propio centroide...
		IF d2 < d THEN
			'...devolvemos FALSO
			result = FALSE
		'...caso contrario...
		ELSE
			'...pasamos al siguiente centroide
			i = i + 1
		ENDIF
	WEND
	dMinima = result
END FUNC


'Distancia euclidiana multidimensional
FUNC Euclidian(p, c, numd)
	LOCAL i, ac

	ac = 0
	'Recorremos cada dimensión
	FOR i = 1 to numd
		'calculamos la hipotenusa de esa dimensión
		'y la acumulamos
		ac = ac + ( p(i) - c(i) )^2
	NEXT j
	'devolvemos la raíz
	Euclidian = SQR(ac)
END FUNC
