
' Calcula la línea divisoria de Voronoi
' entre dos puntos en un plano
' (c) 2021, Wannabes de Geometría Computacional

DIM P(1,1)	'2 renglones (0 y 1) y 2 columnas (0=x, 1=y)

'Entrada de datos
'Capturar coordenadas x,y de dos puntos
FOR i = 0 TO 1
	INPUT P(i,0)	'x del punto i
	INPUT P(i,1)	'y del punto i
NEXT

'Procesamiento de datos

DivisorVoronoi m, b, P

'Salida de resultados
'Dibujamos los puntos P1 y P2 mediante círculo
FOR i = 0 TO 1
	CIRCLE P(i,0),P(i,1),5 COLOR 3
NEXT
'Dibujamos la mediatriz
DesplegarMediatriz m, b
'Imprimimos la ecuación de la recta mediatriz
PRINT "y = "; m; "*x +"; b
END

SUB DivisorVoronoi(BYREF m, BYREF b, P)
	LOCAL Cx, Cy

	'Coordenadas del punto medio entre P(1) y P(2)
	Cx = ( P(0,0) + P(1,0) ) / 2
	Cy = ( P(0,1) + P(1,1) ) / 2

	'Pendiente de la mediatriz: m = (y2-y1)/(x2-x1)
	m = - ( P(1,1) - P(0,1) ) / ( P(1,0) - P(0,0) )
	b = Cy - m * Cx
END SUB

SUB DesplegarMediatriz( m, b )
	LOCAL x0,xf

	x0 = -b/m
	xf = (YMAX - b)/m

	LINE x0,0,xf,YMAX
END SUB