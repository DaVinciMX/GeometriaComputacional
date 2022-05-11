REM SmallBASIC
REM created: 14/02/2022
REM Subdivisión del espacio en regiones coloreadas
REM (c) 2022, Wannabes de Geometría Computacional
CLS
'Entrada de datos
'INPUT "# de partículas"; n
n = 50 * RND
DIM p(n,2)
FOR i = 1 TO n
'  PRINT "Partícula #"; i
'  INPUT "x"; P(i,1)
'  INPUT "y"; P(i,2)
  p(i,1) = XMAX * RND
  p(i,2) = YMAX * RND
NEXT
'Procesamiento de datos
FOR y = 0 TO YMAX
  FOR x = 0 TO XMAX
    dmin = Euclidiana(x, y, p(1,1), p(1,2))
    c = 1
    FOR i = 2 TO n
      d = Euclidiana(x, y, p(i,1), p(i,2))
      IF d < dmin THEN
        dmin = d
        c = i
      ENDIF
    NEXT
    PSET x,y COLOR c
  NEXT
NEXT
FOR i = 1 TO n
  CIRCLE p(i,1),p(i,2),5 COLOR 0 FILLED
NEXT
END

FUNC Euclidiana(x0, y0, xf, yf)
  Euclidiana = SQR( (xf-x0)^2 + (yf-y0)^2 )
END FUNC