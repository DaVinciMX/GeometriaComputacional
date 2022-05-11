REM SmallBASIC
REM created: 08/03/2021
REM Despliegue de Campos (gravitacionales, eléctricos, magnéticos, etc.)
REM (c) 2021, Wannabes de Geometría Computacional

CONST k = 10000

' Entrada de datos
CLS
INPUT "N° Puntos"; n
DIM p(n,3)
FOR i = 1 TO n
	INPUT "x"; p(i,1)
	INPUT "y"; p(i,2)
	INPUT "cantidad"; p(i,3)
NEXT
' Procesamiento de datos
' Aplicar la ley de Gravitación Universal de Newton
' o la Ley de Coulomb
' o cualquier ley parecida
' F = k . c1.c2/d²

  FOR x = 0 TO XMAX
	FOR y = 0 TO YMAX
		F = 0
		FOR i = 1 TO n
			d2 = (x - p(i,1))^2 + (y - p(i,2))^2
			IF d2 <> 0 THEN
				F = F + k * p(i,3) / d2
			ENDIF
		NEXT
		'Despliegue de resultados
		PSET x,y COLOR -F
	NEXT
  NEXT
END
