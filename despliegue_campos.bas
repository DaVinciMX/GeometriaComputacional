REM SmallBASIC
REM created: 08/03/2021

CONST k = 1  'Si fuera gravedad: 6.67x10-11 N.m2/kg2
             'Si fuera electricidad: 6.23x10-3

'Entrada
'Leer coordenadas de una "partícula" (gravitacional, eléctrica, magnética, etc.)
CLS
INPUT "N° de puntos"; N
DIM P(N, 3)
FOR i = 1 TO N
  INPUT "x"; P(i,1)
  INPUT "y"; P(i,2)
  INPUT "Intensidad"; P(i,3)
NEXT

'Procesamiento

F = 0
FOR x = 0 TO XMAX
  FOR y = 0 TO YMAX
    FOR i = 0 TO N
      d2 = (x - P(i,1))^2 + (y - P(i,2))^2
      ' F = k . m1.m2/d2
      IF d2 <> 0 THEN
        F = F + k * P(i,3) / d2
      ENDIF
      'SaliDA
    NEXT
    PSET X,Y COLOR -F
  NEXT
NEXT

END