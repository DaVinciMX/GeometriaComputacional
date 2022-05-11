'Convex Hull Demo (SVG) for Graham's Scan.
'Firstly use this code to generate SVG frames.
'Then transform to bitmaps and convert to GIF.

IMPORT Stack

' range size
N = 300
margin = 50

' test 30 points temporarily
n = 30
pts = generatePoints(n)
graham(n, pts)

END

FUNC norm(x, y)
    norm = SQR(x*x + y*y)
END FUNC

FUNC dotProductNormed(x1, y1, x2, y2)
    dotProductNormed = (x1*x2+y1*y2)/norm(x1, y1)/norm(x2, y2)
END FUNC

FUNC cross(x1, y1, x2, y2)
    cross = x1*y2 - x2*y1
END FUNC

def graham(n, points)
     LOCAL s
          
     IF n >= 3 THEN
       s = Stack.new( 100 )
       nframe = 0
       i = posPuntoInicial( points )
       ordenarNubeDesdePunto( i, points )
       points = [first] + rest
       Stack.push(s, points(0) )
       Stack.push(s, points(1) )
       desplegarNube points
       nframe++
       i=2
       WHILE i<n
         p0 = Stack.pop(s)  'x0, y0 = Stack[-2][0], stack[-2][1]
         p1 = Stack.pop(s)  'x1, y1 = stack[-1][0], stack[-1][1]
         p2 = Stack.pop(s)  'x2, y2 = points[i][0], points[i][1]
         IF cross(p1.x-p0.x, p1.y-p0.y, p2.x-p0.x, p2.y-p0.y)<0 THEN
           Stack.pop( s )
         ELSE
           Stack.push( points(i) )
           i+=1
         ENDIF
         IF i<n THEN
           desplegarNube points
         ELSE
           desplegarNube points
         ENDIF
         nframe += 1
         graham = stack
    ENDIF
END FUNC

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
