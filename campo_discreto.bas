REM SmallBASIC
REM created: 31/01/2022
REM División de un plano euclidiano en zonas discretas
REM (c) 2022, wannabes de Geometría Computacional

CLS
REM Entrada
'INPUT "# de partículas"; n
'n = 15 * RND()
n = 16
DIM p(n,2)  '"n" partículas, su posición "x" y "y"
FOR i = 1 to n
'  PRINT "Partícula #"; i
'  INPUT "x"; P(i,1)
'  INPUT "y"; P(i,2)
  p(i,1) = XMAX * RND()
  p(i,2) = YMAX * RND()
NEXT

REM Procesamiento
FOR y = 0 TO YMAX
  FOR x = 0 TO XMAX
    'Calculamos la distancia hasta la primera partícula
    dmin = Hamming(x,y, P(1,1), P(1,2))
    'Y determinamos que dicho punto es el "punto de influencia"
    pinf = 1
    'Ahora calculamos la distancia para cada uno de los otros
    FOR i = 2 TO n
      'Calculamos la distancia a la partícula i-ésima
      d = Hamming(x,y, P(i,1),P(i,2))
      'Si la nueva distancia es menor que la mínima actual...
      IF d < dmin THEN
        '... la convertimos en la mínima actual
        dmin = d
        'y en el punto de influencia
        pinf = i
      ENDIF
    NEXT
    'REM Salida
    'Ahora pintamos el pixel (x,y) con el color del punto de influencia pinf
    PSET x,y,pinf
  NEXT
NEXT
'Por último, dibujamos las partículas
FOR i = 1 TO n
  CIRCLE P(i,1),P(i,2),5 COLOR 0 FILLED
NEXT

END

' Cálculo de la distancia Euclidiana
FUNC Euclideana(x0, y0, xf, yf)
  Euclideana = SQR( (xf-x0)^2 + (yf-y0)^2 )
END FUNC

' Cálculo de la distancia Manhattan
FUNC Manhattan(x0, y0, xf, yf)
  Manhattan = ABS(xf - x0) + ABS(yf - y0)
END FUNC

' Cálculo de la distancia Hamming
' NOTA: Este código está escrito así por facilidad de lectura.
'       Pero puede optimizarse mucho.
FUNC Hamming(x0, y0, xf, yf)
  IF x0 <> xf THEN
    IF y0 <> yf THEN
      Hamming = 2
    ELSE
      Hamming = 1 
    ENDIF
  ELSE
    IF y0 <> yf THEN
      Hamming = 1
    ELSE
      Hamming = 0
    ENDIF
  ENDIF
END FUNC
