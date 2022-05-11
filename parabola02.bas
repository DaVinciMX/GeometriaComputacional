REM SmallBASIC
REM created: 26/04/2021
' Trazado de una parábola mediante Geometría Analítica

CLS
WINDOW -500,-100,500,100
FOR y = -100 TO 100
  x = -(y^2)
  CIRCLE x,y,3 COLOR 15 FILLED
NEXT

END
	