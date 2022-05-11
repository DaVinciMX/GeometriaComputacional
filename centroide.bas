REM SmallBASIC
REM created: 08/03/2022
REM Traza un polígono irregular, a partir de un conjunto de vértices no ordenados.
REM Para ello los ordena de acuerdo a su coordenada polar (ángulo)
REM con respecto a su centroide
REM FUENTE:
REM https://stackoverflow.com/questions/10846431/ordering-shuffled-points-that-can-be-joined-to-form-a-polygon-in-python
REM (c) 2022, wannabes de Geometría Computacional

CLS
'Sistema coordenado en el mismo sentido que el matemático
WINDOW 0,YMAX,XMAX,0
n = 20
DIM p(n)

'Entrada
FOR i = 1 TO n
  p(i).x = 3*XMAX/4 * RND + XMAX/8
  p(i).y = 3*YMAX/4 * RND + YMAX/8
NEXT

'Procesamiento

'Calculamos el centroide de los puntos
c = Centroide(p)
'Ordenamos los puntos de acuerdo a su
'posición polar respecto al centroide
OrdenarPolar p, c

'Salida

'Recorremos todos los puntos
FOR i = 1 TO n-1
  'Imprimimos la etiqueta del punto
  'NOTA: los valores 38 y 140 son totalmente empíricos, y sólo
  '      funcionan bien para mi ventana (1366x768) maximizada
  LOCATE 38*p(i).y/YMAX,140*p(i).x/XMAX: PRINT i
  'Dibujamos cada uno de los vértices
  CIRCLE p(i).x,p(i).y,5 COLOR 7 FILLED
  'Unimos cada vértice con el siguiente mediante una línea
  LINE p(i).x,p(i).y,p(i+1).x,p(i+1).y
NEXT
'Trazamos el último vértice
CIRCLE p(i).x,p(i).y,5 COLOR 7 FILLED
'Unimos el último vértice con el primero
LINE p(i).x,p(i).y,p(1).x,p(1).y
'Dibujamos el centroide con un color diferente
CIRCLE c.x,c.y,5 COLOR 5 FILLED

END

'El Centroide o Centro Geométrico de una figura plana es la
'posición aritmética media de todos los puntos en la figura,
'es decir, la media aritmética tanto de X como de Y
FUNC Centroide( p )
  LOCAL i, res, xsum, ysum

  xsum = 0
  ysum = 0
  FOR i = 1 TO n
    xsum = xsum + p(i).x
    ysum = ysum + p(i).y
  NEXT
  res.x = xsum/n
  res.y = ysum/n
  Centroide = res
END FUNC

'Ordena los puntos de acuerdo a su coordenada polar
'(ángulo) con respecto a un punto central "c" (el centroide)
SUB OrdenarPolar( BYREF p, c )
  LOCAL i, j, temp

  'Calculamos los ángulos respecto al centroide
  FOR i = 1 TO n
    'NOTA: Es importante usar ATAN2 en vez de ATAN
    '      https://es.wikipedia.org/wiki/Arcotangente_de_dos_parámetros
    p(i).ang = ATAN2( (p(i).x - c.x) , (p(i).y - c.y) )
  NEXT
  'Ordenamos los puntos de acuerdo al ángulo
  FOR i = 1 TO n-1
    FOR j = i+1 TO n
      IF p(i).ang > p(j).ang THEN
        temp = p(i)
        p(i) = p(j)
        p(j) = temp
      ENDIF
    NEXT
  NEXT
END SUB
