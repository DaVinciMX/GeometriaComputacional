REM SmallBASIC
REM created: 07/03/2022
REM Encontrar los puntos que forman el cerco convexo
REM eliminando todos aquellos que quedan inscritos en un triángulo
REM (c) 2022, Wannabes de Geometría Computacional
RANDOMIZE 123456
CLS
'Entrada
n = 10
DIM p(n)
FOR i = 1 TO n
  p(i).x = 3*XMAX/4 * RND + XMAX/8
  p(i).y = 3*YMAX/4 * RND + YMAX/8
  p(i).cc = True
NEXT
'Procesamiento
FOR i = 1 TO n
  FOR j = 1 TO n
    FOR k = 1 TO n
      IF i <> j AND i <> k AND j <> k THEN
        FOR l = 1 TO n
          IF p(l).cc THEN
            IF Inscrito(p(i),p(j),p(k),p(l)) THEN
              p(l).cc = False
              LOCATE 1,1: PRINT l; " eliminado"
            ENDIF
          ENDIF
        NEXT
        DesplegarNube p
'        LOCATE 1,1: INPUT enter
        DELAY 100
        CLS
      ENDIF
    NEXT
  NEXT
NEXT
DesplegarNube p
END

'FUENTE: 
'https://es.quora.com/Cómo-puedes-determinar-si-un-punto-dado-está-en-un-triángulo-dado
'Si la distancia a cada uno de los vértices es menor que 
'cada una de las longitudes de los lados del triangulo 
'entonces el punto es interior -o está en el borde- del triángulo; 
'en caso contrario el punto no está dentro del triángulo
'o de su perímetro.
FUNC Inscrito( v1, v2, v3, p )
  LOCAL a1, a2, a3, d1, d2, d3
  
  a1 = SQR( (v1.x-v2.x)^2 + (v1.y-v2.y)^2 )
  a2 = SQR( (v1.x-v3.x)^2 + (v1.y-v3.y)^2 )
  a3 = SQR( (v2.x-v3.x)^2 + (v2.y-v3.y)^2 )
  d1 = SQR( (p.x-v1.x)^2 + (p.y-v1.y)^2 )
  d2 = SQR( (p.x-v2.x)^2 + (p.y-v2.y)^2 )
  d3 = SQR( (p.x-v3.x)^2 + (p.y-v3.y)^2 )

  LINE v1.x, v1.y, v2.x, v2.y
  LINE v1.x, v1.y, v3.x, v3.y
  LINE v2.x, v2.y, v3.x, v3.y
  IF d1 < a1 AND d1 < a2 AND d1 < a3 AND d2 < a1 AND d2 < a2 AND d2 < a3 AND d3 < a1 AND d3 < a2 AND d3 < a3 THEN
     Inscrito = True
  ELSE
     Inscrito = False
  ENDIF
END FUNC

SUB DesplegarNube( p )
  LOCAL i, c

  FOR i = 1 TO n
    LOCATE 27*p(i).y/YMAX, 103*p(i).x/XMAX: PRINT i
    IF p(i).cc = True THEN
      c = 15
    ELSE
      c = 5
    ENDIF
    CIRCLE p(i).x, p(i).y, 5 COLOR c FILLED
  NEXT
END SUB