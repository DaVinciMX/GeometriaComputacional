REM SmallBASIC
REM created: 26/04/2021
' Trazo de una elipse mediante técnicas de Geometría Clásica

CLS
INPUT "x1"; x1
INPUT "y1"; y1
INPUT "x2"; x2
INPUT "y2"; y2
INPUT "cuerda"; cuerda

CIRCLE x1,y1,5 COLOR 7 FILLED
CIRCLE x2,y2,5 COLOR 7 FILLED
FOR x = 0 TO XMAX
  FOR y = 0 TO YMAX
 			IF ROUND	(d(x,y,x1,y1) + d(x,y,x2,y2)) = cuerda THEN
     CIRCLE x,y,3 COLOR 15 FILLED
   END IF
  NEXT
NEXT
END

FUNC d(x1,y1,x2,y2)
  d = sqr( (x1-x2)^2 + (y1-y2)^2 )
END FUNC
