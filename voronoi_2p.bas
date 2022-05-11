REM SmallBASIC
REM created: 22/03/2021

DIM P(2,2)

'Entrada de datos
INPUT P(1,1)	'Ax
INPUT P(1,2)	'Ay
INPUT P(2,1)	'Bx
INPUT P(2,2)	'By

'Procesamiento de datos

'Encontrar la pendiente "m" y la ordenada al origen "b"
'de la recta que divide en 2 el plano
DivisorVoronoi m, b, P(1,1), P(1,2), P(2,1), P(2,2)

'Salida de resultados

'Dibujamos un círculo para cada punto original
CIRCLE P(1,1), P(1,2), 5 COLOR 3
CIRCLE P(2,1), P(2,2), 5 COLOR 3
'Desplegamos la línea divisoria o "mediatriz"
DesplegarDivisor m, b

END

SUB DivisorVoronoi(BYREF m, BYREF b, x0, y0, xf, yf )
	LOCAL cx, cy

	'Calculamos las coordenadas del punto central
	cx = (x0 + xf) / 2
	cy = (y0 + yf) / 2

	'Calculamos la pendiente de la recta perpendicular
	'a la que pasa por ambos puntos
	'NOTA: No funciona si ambas "y" son iguales o ambos "x" son iguales
	m = - (yf - y0) / (xf - x0)
	'Calculamos la ordenada al origen de dicha recta
	b = cy - m * cx
END SUB

SUB DesplegarDivisor( m, b )
	LOCAL x0, xf

	'Calculamos la coordenada x de la línea en la parte superior
	'de la pantalla, donde y = 0
	x0 = -b / m
	'Calculamos la coordenada x de la línea en la parte inferior
	'de la pantalla, donde y = YMAX
	xf = (YMAX - b) / m
	'Dibujamos una línea entre ambos extremos de la pantalla
	LINE x0,0,xf,YMAX 
END SUB
