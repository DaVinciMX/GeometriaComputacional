REM Encontrar el cerco convexo
REM mediante la Marcha de Jarvis
REM o Algoritmo del envoltorio de regalos
REM (c) 2022, wannabes de GeometrÃ­a Computacional

CLS
'Entrada
n = 100
DIM p(n)
FOR i = 1 TO n
  p(i).x = 3 * RND * XMAX/4 + XMAX/8
  p(i).y = 3 * RND * YMAX/4 + YMAX/8
  p(i).cc = False
NEXT

'Procesamiento
ini = posPuntoInicial(p)
i = ini
REPEAT
  desplegarNube p
  j = posAnguloMasChico(i, p)
  LINE p(i).x,p(i).y, p(j).x, p(j).y
  p(j).cc = True
  i = j
UNTIL j = ini

'Salida
desplegarNube p

END

'Encuentra el punto más "al sur" (más bajo) en la nube
FUNC posPuntoInicial(p)
  LOCAL i, mini, valor

  mini = 1
  valor = p(mini).y
  FOR i = 2 TO n
    IF p(i).y < valor THEN
      mini = i
      valor = p(mini).y
    ENDIF
  NEXT
  posPuntoInicial = mini
END FUNC

FUNC posAnguloMasChico( i, BYREF p )
  LOCAL j, ang, mini, pos

  mini = 360
  pos = 0
  ant = 0
  FOR j = 1 TO n
    IF j <> i THEN
      p(j).ang = anguloVector( p(i), p(j) )
      'Al hacer que p(j).ang > p(i).ang garantizamos la convexidad
      IF p(j).ang < mini and p(j).ang > p(i).ang THEN
       mini = p(j).ang
       pos  = j
     ENDIF
   ENDIF
 NEXT
 posAnguloMasChico = pos
END FUNC

SUB desplegarNube(p)
  LOCAL i

  FOR i = 1 TO n
    IF p(i).cc THEN
      c = 15
    ELSE
      c = 5
    ENDIF
    LOCATE 25*p(i).y/YMAX, 93*p(i).x/XMAX : PRINT i
    CIRCLE p(i).x, p(i).y, 5 COLOR c FILLED
  NEXT
  DELAY 500
END SUB

' Esta función recibe 2 vectores:
' un punto de origen "o" y un vector "v"
' y nos indica el ángulo absoluto (partiendo de 0°)
' que tiene el vector
FUNC anguloVector(o, v)
      LOCAL x, y, ang
      'Calculamos catetos opuesto y adyacente del vector "v"
      'con respecto al origen "o"
      y = v.y - o.y
      x = v.x - o.x
      'Calculamos el arco tangente sin signo (0°..90°)
      ang = 360/(2*PI)*ATAN( abs(y) / abs(x))
      'Complementamos el ángulo del vector para convertirlo en absoluto (0°..360°)
      'Cuadrante 2
      IF x < 0 AND y > 0 THEN
        ang = 180 - ang
      'Cuadrante 3
      ELIF x < 0 AND y < 0 THEN
        ang = 180 + ang
      'Cuadrante 4
      ELIF x > 0 AND y < 0 THEN
        ang = 360 - ang
      ENDIF
      anguloVector = ang
END FUNC
