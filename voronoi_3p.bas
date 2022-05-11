' Calcular la intersección de 3 espacios de Voronoi
' a través de la circunferencia
' (c) 2021, Wannabes de Geometría Computacional

DIM P(2,1)	'3 renglones (0,1 y 2) y 2 columnas (0=x, 1=y)

'Entrada de datos
'Capturar coordenadas x,y de dos puntos
FOR i = 0 TO 2
	INPUT P(i,0)	'x del punto i
	INPUT P(i,1)	'y del punto i
NEXT

'Procesamiento de datos
CalcularCirculo h, k, radius, P

'Salida de resultados
PRINT "h= "; h
PRINT "k= "; k
PRINT "r= "; radius

END

SUB CalcularCirculo( BYREF h, BYREF k, BYREF radius, P )
	LOCAL i, D, E, F

	DIM M(2,2)	'3 renglones y 3 columnas, numerados desde cero
	DIM T(2,0)	'3 renglones y 1 columna, numerados desde cero
	DIM R(2,0)	'3 renglones y 1 columna, numerados desde cero

	FOR i = 0 TO 2	'recorremos cada uno de los puntos en P
		M(i,0) = P(i,0)
		M(i,1) = P(i,1)
		M(i,2) = 1
		T(i,0) = -( P(i,0)^2 + P(i,1)^2 )
	NEXT
PRINT M
PRINT T

R = LineQn( M, T )

	D = R(0,0)
	E = R(1,0)
	F = R(2,0)

	h = -D/2
	k = -E/2
	radius = SQR( -F + h^2 + k^2 )
END SUB
