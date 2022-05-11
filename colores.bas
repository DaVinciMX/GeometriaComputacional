REM SmallBASIC
REM created: 24/01/2022
REM Pruebas con la función de color RGB y RGBF
REM (c), 2022, Wannabes de Geometría Computacional

CLS
FOR c = 0 TO 255
  FOR y = 0 TO 50
    PSET c, y, RGB (c,c,c)
  NEXT
NEXT

INPUT "Presiona Enter para continuar..."; enter
CLS
FOR x  = 0 TO XMAX
  FOR y = 0 TO YMAX
    c = x / XMAX
    PSET x, y, RGBF(c, c, c)
  NEXT
NEXT

END