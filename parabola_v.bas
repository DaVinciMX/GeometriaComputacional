
' Calcula la Ecuación de una Parábola
' que pasa por 3 puntos, usando la fórmula general
' a*x² + b*x + c = y
' (c) 2021, Wannabes de Geometría Computacional

DIM P(2,1)	'3 renglones (0,1 y 2) y 2 columnas (0=x, 1=y)

'Entrada de datos
'Capturar coordenadas x,y de dos puntos
FOR i = 0 TO 2
	INPUT P(i,0)	'x del punto i
	INPUT P(i,1)	'y del punto i
NEXT

'Procesamiento de datos
CalcularParabola a, b, c, P

'Salida de resultados
PRINT "y= ";a; "*x� +"; b; "*x + "; c

END

SUB CalcularParabola( BYREF a, BYREF b, BYREF c, P )
	LOCAL i

	DIM M(2,2)	'3 renglones y 3 columnas, numerados desde cero
	DIM T(2,0)	'3 renglones y 1 columna, numerados desde cero
	DIM R(2,0)	'3 renglones y 1 columna, numerados desde cero

	FOR i = 0 TO 2	'recorremos cada uno de los puntos en P
		M(i,0) = P(i,0)^2
		M(i,1) = P(i,0)
		M(i,2) = 1
		T(i,0) = P(i,1)
	NEXT

	R = LineQn( M, T )

	a = R(0,0)
	b = R(1,0)
	c = R(2,0)
END SUB
