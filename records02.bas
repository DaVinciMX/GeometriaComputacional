REM SmallBASIC
REM created: 10/05/2021
REM T.A.D. Bolsa (bag)


INPUT n
DIM b(n-1)

FOR i = 0 TO n-1
  INPUT "Almacenar texto, número, arreglo o punto (T/N/A/P)"; r
  IF r = "T" THEN
    INPUT "Texto"; t$
    b(i) = t$
  ELIF r = "N" THEN
    INPUT "Número"; num
    b(i) = num
  ELIF r = "A" THEN
    INPUT "Tamaño"; n2
    DIM a(n2)
    FOR j = 0 TO n2- 1
      INPUT a(j)
    NEXT
    b(i) = a
  ELIF r = "P" THEN
    INPUT "x"; x
    INPUT "y"; y
    p.x = x
    p.y = y
    b(i) = p
  ENDIF
NEXT

PRINT b

END
