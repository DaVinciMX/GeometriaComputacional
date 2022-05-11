' Welcome to SmallBASIC
'
' Press F1 or F2 for keyword help.
' Press and hold Ctrl then press 'h' for editor help.
' Press and hold Ctrl then press 'r' to RUN this program.
' Click the right mouse button for menu options.
' Esto es un comentario
' Esto es un comentario



CLS  'Clear Screen
FOR c = 0 TO 15
  CIRCLE XMAX/2,YMAX/2,YMAX/c COLOR c FILLED
  DELAY 1500
NEXT c

END
