REM Encontrar el cerco convexo
REM mediante el Scan de Graham
REM (c) 2022, wannabes de Geometría Computacional

IMPORT Stack

CLS
'Entrada
n = 20
DIM p(n)
FOR i = 1 TO n
  p(i).x = 3 * RND * XMAX/4 + XMAX/8
  p(i).y = 3 * RND * YMAX/4 + YMAX/8
  p(i).cc = False
NEXT

'Procesamiento
desplegarNube p
'delay 1000
INPUT enter
CLS
ini = posPuntoInicial(p)
ordenarNubeDesdePunto ini, p
cercarGraham p

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

'Utilizar el algoritmo de la burbuja para ordenar
'angularmente los puntos de la nube "p" con respecto
'al punto "i"
SUB ordenarNubeDesdePunto( BYREF ini, BYREF p )
  LOCAL i, j, temp

  'Colocamos el punto inicial al principio del arreglo
  temp = p(1)
  p(1) = p(ini)
  p(ini) = temp
  ini = 1

  'Agregamos a cada punto el ángulo al que se encuentra
  'con respecto al punto "ini"
  FOR i = 2 TO n
    p(i).ang = anguloVector( p(ini), p(i) )
  NEXT

  'Ordenamos mediante burbuja
  FOR i = 2 TO n-1
    FOR j = i+1 TO n
      IF p(j).ang < p(i).ang THEN
        temp = p(j)
        p(j) = p(i)
        p(i) = temp
      ENDIF
    NEXT
  NEXT
END SUB

SUB desplegarNube(p)
  LOCAL i

  FOR i = 1 TO n
    IF p(i).cc THEN
      c = 15
    ELSE
      c = 5
    ENDIF
    LOCATE 25*p(i).y/YMAX, 95*p(i).x/XMAX : PRINT i
    CIRCLE p(i).x, p(i).y, 5 COLOR c FILLED
    'NOTA: lineas temporales, sólo para ver si se ordena bien angularmente.
    LINE p(1).x, p(1).y, p(i).x, p(i).y
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

SUB cercarGraham( BYREF p )
  LOCAL i, p0, p1, p2, s, r

  s = Stack.new( 100 )
  Stack.push(s, p(1))
  Stack.push(s, p(2))
  WHILE i<n
    p1 = Stack.pop(s)
    p0 = Stack.pop(s)
    p2 = p(i)
    IF cross(p1.x-p0.x, p1.y-p0.y, p2.x-p0.x, p2.y-p0.y) < 0 THEN
      r = Stack.pop(s)
    ELSE
      Stack.push s, p(i)
      i++
    ENDIF
    desplegarNube p
  WEND
END FUNC

FUNC cross(x1, y1, x2, y2)
    cross= x1*y2 - x2*y1
END FUNC
