REM SmallBASIC
REM created: 14/02/2022
REM Subdivisión del espacio en "regiones de influencia"
REM (c) 2022 Wannabes de Geometría Computacional
CLS
'Entrada de datos
'INPUT "# de partículas"; n
n = 30 * RND
DIM p(n)
FOR i = 1 TO n
'  PRINT "Partícula #"; i
'  INPUT "x"; p(i).x
'  INPUT "y"; p(i),y
  p(i).x = XMAX * RND
  p(i).y = YMAX * RND
NEXT
'Procesamiento de datos
FOR y = 0 TO YMAX
  FOR x = 0 TO XMAX
    dmin = Manhattan(x, y, p(1).x, p(1).y)
    c = 1
    FOR i = 2 TO n
      d = Manhattan(x, y, p(i).x, p(i).y)
      IF d < dmin THEN
        dmin = d
        c = i
      ENDIF
    NEXT
    'Salida de resultados
    PSET x, y, -65535*c/30
  NEXT
NEXT
'Pintar las partículas
FOR i = 1 TO n
  CIRCLE p(i).x, p(i).y, 4 COLOR 0 FILLED
NEXT
END

FUNC Euclidiana(x0, y0, xf, yf)
  Euclidiana = SQR( (xf-x0)^2 + (yf-y0)^2 )
END FUNC

FUNC Manhattan(x0, y0, xf, yf)
  Manhattan = ABS(xf-x0) + ABS(yf-y0)
END FUNC