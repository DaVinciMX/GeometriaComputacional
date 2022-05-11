
'Encuentra los parámetros a,b,c
'de una parábola ax²+bx+c = 0
'que pasa por los puntos P1,P2 y P3

DIM P(2,1)

'Entrada de datos
FOR i = 0 TO 2
	INPUT P(i,0)	'Coordenada x
	INPUT P(i,1)	'Coordenada y
NEXT i

'Procesamiento de datos

FindParabole a, b, c, P

'Salida de resultados
PRINT a; "x^2 + "; b; "*x + "; c

END

SUB FindParabole( BYREF a, BYREF b, BYREF c, P)
	LOCAL i

	DIM M(2,2)
	DIM T(2,0	)

	FOR i = 0 TO 2
		M(i,0) = P(i,0)^2
		M(i,1) = P(i,0)
		M(i,2) = 1
		T(I,0) = P(i,1)
	NEXT i
	R=LINEQN(M,T) 	'Resuelve el sistema de ecuaciones A y pone
			'los resultados en R
PRINT M,T,R
	a = R(0,0)
	b = R(1,0)
	c = R(2,0)
END SUB	