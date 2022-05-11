REM SmallBASIC
REM created: 10/05/2021
REM Lo que en C se llaman "structs"
REM y en Pascal y lenguajes similares se llaman "records"
REM o sea, tipos de datos estructurados

INPUT n
DIM p(n-1)

FOR i = 0 TO n-1
  INPUT "x"; p(i).x
  INPUT "y"; p(i).y
NEXT

PRINT p

END
