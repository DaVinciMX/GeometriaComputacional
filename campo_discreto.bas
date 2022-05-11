REM SmallBASIC
REM created: 31/01/2022
REM Divisi�n de un plano euclidiano en zonas discretas
REM (c) 2022, wannabes de Geometr�a Computacional

CLS
REM Entrada
'INPUT "# de part�culas"; n
'n = 15 * RND()
n = 16
DIM p(n,2)  '"n" part�culas, su posici�n "x" y "y"
FOR i = 1 to n
'  PRINT "Part�cula #"; i
'  INPUT "x"; P(i,1)
'  INPUT "y"; P(i,2)
  p(i,1) = XMAX * RND()
  p(i,2) = YMAX * RND()
NEXT

REM Procesamiento
FOR y = 0 TO YMAX
  FOR x = 0 TO XMAX
    'Calculamos la distancia hasta la primera part�cula
    dmin = Hamming(x,y, P(1,1), P(1,2))
    'Y determinamos que dicho punto es el "punto de influencia"
    pinf = 1
    'Ahora calculamos la distancia para cada uno de los otros
    FOR i = 2 TO n
      'Calculamos la distancia a la part�cula i-�sima
      d = Hamming(x,y, P(i,1),P(i,2))
      'Si la nueva distancia es menor que la m�nima actual...
      IF d < dmin THEN
        '... la convertimos en la m�nima actual
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
'Por �ltimo, dibujamos las part�culas
FOR i = 1 TO n
  CIRCLE P(i,1),P(i,2),5 COLOR 0 FILLED
NEXT

END

' C�lculo de la distancia Euclidiana
FUNC Euclideana(x0, y0, xf, yf)
  Euclideana = SQR( (xf-x0)^2 + (yf-y0)^2 )
END FUNC

' C�lculo de la distancia Manhattan
FUNC Manhattan(x0, y0, xf, yf)
  Manhattan = ABS(xf - x0) + ABS(yf - y0)
END FUNC

' C�lculo de la distancia Hamming
' NOTA: Este c�digo est� escrito as� por facilidad de lectura.
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
