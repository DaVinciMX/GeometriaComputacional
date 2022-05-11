REM SmallBASIC
REM created: 24/01/2022
REM Representaci�n gr�fica de un campo (el�ctrico, magn�tico, gravitatorio)
REM (c) 2022, wannabes de Geometr�a Computacional
CLS
'Entrada
'INPUT "# de part�culas"; n
n = 100*RND 'Generamos un m�ximo de 25 part�culas al azar
DIM p(n,3)
FOR i = 1 TO n
'  PRINT "Part�cula #"; i
'  INPUT "Xp"; p(i, 1)
   p(i,1) = XMAX * RND
'  INPUT "Yp"; p(i, 2)
   p(i,2) = YMAX * RND
'  INPUT "Vp"; p(i, 3)
   p(i,3) = 2E6 * RND
NEXT
'Procesamiento
FOR y = 0 TO YMAX
  FOR x = 0 TO XMAX
    f = 0
    FOR i = 1 TO n
      IF x <> p(i,1) AND y <> p(i,2) THEN
        d = SQR( (p(i,1)-x)^2 + (p(i,2)-y)^2 )
        f = f + p(i,3)/d^2 
      ENDIF
    NEXT
    c = f mod 255
    PSET x,y, RGB(c, c, c) 
  NEXT
NEXT
'Salida
END
