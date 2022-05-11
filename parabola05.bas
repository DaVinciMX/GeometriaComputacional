REM SmallBASIC
REM created: 26/04/2021
'Dibuja un punto, barre el plano XY con la línea L y redibuja la parábola a su paso

CLS
'Coordenadas del punto
INPUT "x"; xf
INPUT "y"; yf

'El barrido horizontal de la línea
FOR l = 0 TO XMAX
  'Dibuja el punto
  CIRCLE xf,yf,3 COLOR 5 FILLED
  'Dibuja la línea
  LINE l,0,l,YMAX COLOR 15
  'Recorremos todos los x
  FOR x = 0 TO l
    'Si x está a la izquierda de l
    IF l > xf THEN
      'Recorremos todos los y
      FOR y = 0 TO YMAX
        'Si la distancia entre el punto actual y la directriz
        'es igual que entre el punto actual y el foco...
        IF ROUND( d(x,y,xf,yf) ) = ROUND( d(x,y,l,y) ) THEN
          'Dibujamos el punto
'          CIRCLE x,y,3 COLOR 15 FILLED
           PSET x,y
        END IF
      NEXT
    ENDIF
  NEXT
  DELAY 20
  CLS
NEXT
END

FUNC d(x0, y0, xf, yf)
  d = SQR( (xf-x0)^2 + (yf-y0)^2 )
END FUNC
