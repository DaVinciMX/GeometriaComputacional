REM SmallBASIC
REM created: 24/01/2022
REM Representación de un campo matemático (gravitatorio, eléctrico, magnético, etc.)
REM (c) 2022, Wannabes de Geometría Computacional
CONST k = 1E7
CLS
'Entrada
'INPUT "# partículas"; n
n = 25 * RND
DIM p(n, 3)
FOR i = 1 TO n
#  PRINT "Partícula #"; i
#  INPUT "Px"; P(i,1)
   P(i, 1) = XMAX * RND
#  INPUT "Py"; P(i,2)
   P(i, 2) = YMAX * RND
#  INPUT "Pz"; P(i,3)
   P(i, 3) = 4 * RND
NEXT
'Proceso
Fmax = k * p(n,3) / 1
FOR y = 0 TO YMAX
  FOR x = 0 TO XMAX
    F = 0
    FOR i = 1 TO n
      IF p(i,1) <> x OR p(i,2) <> y THEN
        d = SQR( (p(i,1)-x)^2 + (p(i,2)-y)^2 )
        F = F + k * p(i,3) / d^2 'Fuerza con magnitud absoluta
        Fesc = -1.6E7 * F / Fmax  'Fuerza normalizada de 0 a 1
      ENDIF
    NEXT
    'Colorear nuestro campo
    'PSET x, y, F 'Aqui los colores van del 0 al 15
     PSET x, y, -F 'Usando la representacion True Colors
      'PSET x, y, RGB (F mod 255, F mod 255, F 
  NEXT
NEXT
END
'    00000001 00000001 11111111