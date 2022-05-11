REM SmallBASIC
REM created: 28/03/2022
REM Encontrar los puntos que forman el cerco convexo
REM formando líneas entre dos puntos, y comprobando si los demás quedan
REM por encima o por debajo de la línea. Si es así, los puntos no forman
REM parte del cerco convexo; caso contrario sí.
REM (c) 2022, Wannabes de Geometría Computacional
'RANDOMIZE 123456
CLS
'Entrada
n = 20
DIM p(n)
FOR i = 1 TO n
  p(i).x = 3*XMAX/4 * RND + XMAX/8
  p(i).y = 3*YMAX/4 * RND + YMAX/8
  p(i).cc = False
NEXT
'Escogemos el primer punto de la línea
FOR i = 1 TO n
  'Escogemos el segundo punto de la línea
  FOR j = 1 TO n
    'Si ambos puntos son diferentes
    IF i <> j THEN
      desplegarNube p
      DELAY 500
      CLS
      porEncima = 0
      porDebajo = 0
      'Recorremos todos los puntos de la nube
      FOR k = 1 TO n
        'Si el punto de la nube no es ninguno de los dos de la línea
        IF k <> i AND k <> j THEN
          IF encima(p(i),p(j),p(k)) THEN
            porEncima++
          ELSE
            porDebajo++
          ENDIF
        ENDIF
      NEXT
      IF porEncima = 0 OR porDebajo = 0 THEN
        p(i).cc = True
        p(j).cc = True
      ENDIF
    ENDIF
  NEXT
NEXT
CLS
desplegarNube p
END

'La función determina si el punto p está por encima
'de la línea formada por p0 y pf
FUNC encima( p0, pf, p )
  LOCAL m, b
  
  LINE p0.x, p0.y, pf.x, pf.y
  m = (pf.y-p0.y)/(pf.x-p0.x)
  b = pf.y - m * pf.x 
  y = m * p.x + b
  IF y > p.y THEN
    encima = True
  ELSE
    encima= False
  ENDIF
END FUNC

SUB DesplegarNube( p )
  LOCAL i, c

  FOR i = 1 TO n
    LOCATE 27*p(i).y/YMAX, 90*p(i).x/XMAX: PRINT i
    IF p(i).cc = True THEN
      c = 15
    ELSE
      c = 5
    ENDIF
    CIRCLE p(i).x, p(i).y, 5 COLOR c FILLED
  NEXT
END SUB