REM SmallBASIC
REM created: 17/01/2022
REM (c) 2022, wannabes de Geometría Computacional
' Esto es un comentario

SEP = "|"
FOR i = 1 TO 1000
  x0 = XMAX * RND
  y0 = YMAX * RND
  '  r = YMAX * RND
  xf = XMAX * RND
  yf = YMAX * RND
  c = 16 * RND
  MyPlot x0, y0, xf, yf, c
  DELAY 100
NEXT

END

SUB MyPlot( x0, y0, xf, yf, c)
 Rem  CIRCLE x, y, r COLOR c FILLED
  Rem LINE x0, y0, xf, yf COLOR c
  RECT x0, y0, xf, yf COLOR c FILLED
  Rem PRINT x0; SEP; y0; SEP; xf; SEP; yf; SEP; c 
END SUB

