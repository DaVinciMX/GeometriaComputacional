CLS
INPUT "# puntos"; n

DIM p(n-1,1)
'Capturar los puntos de izquierda a derecha
'o sea, con la x incremental
FOR i = 0 TO n-1
  INPUT "x"; p(i,0)
  INPUT "y"; p(i,1)
  CIRCLE p(i,0),p(i,1),5 COLOR 7 FILLED
NEXT

CLS
'Mueve la línea directriz de izquierda a derecha
'en saltos discretos, de un punto al siguiente
FOR il = 0 TO n
  l = p(il, 0)
  'Dibuja la directriz, cada una de un color distinto
  LINE l,0,l,YMAX COLOR il

  'Dibuja los n puntos, cada uno de un color igual que la directriz anterior
  FOR i = 0 TO n-1
    CIRCLE p(i,0),p(i,1),5 COLOR i+1 FILLED
  NEXT

  'Recorre los puntos
  FOR ip = 0 TO n-1
    'Si el punto está más a la izquierda que la línea
    IF p(ip,0) < l THEN
      'Dibujamos su parábola
      FOR x = 0 TO l
        FOR y = 0 TO YMAX
          IF ROUND( d(x,y,p(ip,0),p(ip,1)) ) = ROUND( d(x,y,l,y) ) THEN
            'Dibuja la parábola, del mismo color que la directriz
'            CIRCLE x,y,3 COLOR il+1 FILLED
             PSET x,y,il
          ENDIF
        NEXT
      NEXT
    ENDIF
  NEXT
  DELAY 50
  CLS
NEXT

END

FUNC d(x0,y0,xf,yf)
  d = SQR( (xf-x0)^2 + (yf-y0)^2 )
END FUNC
