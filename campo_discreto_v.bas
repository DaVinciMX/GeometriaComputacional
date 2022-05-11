REM SmallBASIC
REM created: 31/01/2022
REM Campo de proximidad
REM (c) 2022, Wannabes de Geometr�a Computacional

CLS
REM Entrada
'INPUT "# de part�culas"; n
'n = 15 * RND
n = 15
DIM p(n,2)  '"n" renglones, columna 1 es "x", columna 2 es "y"
FOR i = 1 TO n
'  PRINT "Part�cula #"; i
'  INPUT "x"; P(i,1)
   P(i,1) = XMAX * RND
'  INPUT "y"; P(i,2)
   P(i,2) = YMAX * RND
NEXT
REM Procesamiento
REM Algoritmo "exhaustivo" o por "fuerza bruta"
FOR y = 0 TO YMAX
  FOR x = 0 TO XMAX
    'Calculamos la distancia a la part�cula 1, que por ahora es la m�nima
    dmin = Hamming(x,y, P(1,1), P(1,2))
    'Hacemos que el color coincida con su posici�n en el arreglo
    c = 1
    'Recorremos el resto de las part�culas
    FOR i = 2 TO n
      'Calculamos la distancia a cada una de las part�culas
      d = Hamming(x,y, P(i,1), P(i,2))
      'Si la distancia a la part�cula actual es menor que la m�nima...
      IF d < dmin THEN
        '...se convierte en la m�nima distancia
        dmin = d
        '...y cambia el color
        c = i
      ENDIF
    NEXT
    'Salida
    PSET x,y,c
  NEXT
NEXT
'Dibujamos, mediante c�rculos, las part�culas
FOR i = 1 TO n
  CIRCLE P(i,1),P(i,2),5 COLOR 0 FILLED
NEXT
END

FUNC Euclidiana(x0, y0, xf, yf)
  Euclidiana = SQR( (xf-x0)^2 + (yf-y0)^2 )
END FUNC

FUNC Manhattan(x0, y0, xf, yf)
  Manhattan = ABS(xf-x0) + ABS(yf-y0)
END FUNC

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
