REM SmallBASIC
REM created: 26/04/2021
' Trazo de una parábola mediante Geometría Clásica o Euclidiana

CLS
'Introducimos las coordenadas del foco
INPUT "x0"; x0
INPUT "y0"; y0
'Introducimos la coordenada "x" de la línea directriz
INPUT "x directriz"; xd

CIRCLE x0,y0,5 COLOR 7 FILLED
LINE xd,0,xd,YMAX

FOR x = 0 TO XMAX
  FOR y = 0 TO YMAX
    'Si la distancia del punto actual al foco
    'es la misma que del punto actual a la directriz...
    IF round(d(x,y,x0,y0)) = round(d(x,y,xd,y)) THEN
      'trazamos el punto
      CIRCLE x,y,3 COLOR 15 FILLED
    ENDIF
  NEXT
NEXT
END

FUNC d(x1,y1,x2,y2)
  d = SQR( (x2-x1)^2 + (y2-y1)^2 )
END FUNC
