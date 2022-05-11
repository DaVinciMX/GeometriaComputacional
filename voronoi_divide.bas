
'=============================================
' ENTRADA DE DATOS
'=============================================
'Introducimos el número de puntos
INPUT n

'Creamos un arreglo de "n" puntos (renglones 0..n-1)
'y 2 columnas (0,1)
DIM P(n-1,1)
'Leemos los puntos
FOR i = 0 TO n-1
	' Coordenada x
	INPUT P(i,0)
	'Coordenada y
	INPUT P(i,1)
NEXT

'=============================================
' PROCESAMIENTO DE DATOS
'=============================================
'Voronoi P


'=============================================
' SALIDA (DEPLIEGUE) DE RESULTADOS
'=============================================
FOR i = 0 TO n-1
	PRINT "("; P(i,0); ","; P(i,1); ")"
NEXT

'Si i<15, los colores básicos de SmallBasic
'garantizan que no haya 2 regiones contiguas del mismo color
FOR i = 0 to n-1
	PAINT x,y,i
NEXT

END


'=============================================
' Voronoi
'=============================================
SUB Voronoi( P )
	LOCAL P1, P2

	IF size(P) > 3 THEN
		Dividir P, P1, P2
		Voronoi P1
		Voronoi P2
	ENDIF
	sigma = CadenaPoligona(P1, P2)
	DescartarAristas P1, P2, sigma
END SUB

SUB Dividir( P, P1, P2)
END SUB

SUB DescartarAristas( P1, P2, sigma )
END SUB
