REM SmallBASIC
REM created: 24/01/2022
REM Ejemplo del uso de True Color en SmallBasic
REM (c) 2022, Wannabes de Geometría Computacional
CLS
FOR c = 0 TO 255
  FOR y = 0 TO 100
    PSET c+256,y, RGB(c,255,0)          'Totalmente rojo (r,0,0)
    PSET c+000,y, RGB(0,c,0)      'Totalmente verde(0,g,0)
    PSET c+512,y, RGB(255,255,c)      'Totalmente azul (0,0,b)
'    PSET c,300+y, RGB(c,c,c)      'Totalmente gris (r,g,b)
    '    PRINT RGB(c,c,c)
'    DELAY 1000
  NEXT
NEXT
END
