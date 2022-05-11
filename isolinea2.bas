REM SmallBASIC
REM created: 21/02/2022
REM T.A.D. Isolinea
REM Graficar isolineas de valores
REM (c) 2022, wannabes de Geometría Computacional
CLS
'Entrada
iso = isovaloresNew(15)
'Procesamiento
isovaloresGraficar iso, 7
'Salida
isovaloresGraficarIsolinea iso

END

FUNC isovaloresNew( n )
  LOCAL temp, i
  
  temp.n = n
  DIM temp.p( n )
  FOR i = 1 TO n
    temp.p(i).x = XMAX * RND
    temp.p(i).y = YMAX * RND
  NEXT
  isovaloresNew = temp
END FUNC

SUB isovaloresGraficar( iso, c )
  LOCAL i
  
  FOR i = 1 TO iso.n
    CIRCLE iso.p(i).x, iso.p(i).y, 3 COLOR c FILLED
  NEXT
END SUB 

SUB isovaloresGraficarIsolinea( iso )
  LOCAL i
  
  isovaloresOrdenarPorProximidad iso
  FOR i = 1 TO iso.n-1
    LINE iso.p(i).x, iso.p(i).y, iso.p(i+1).x, iso.p(i+1).y COLOR 7
  NEXT
  LINE iso.p(iso.n).x, iso.p(iso.n).y, iso.p(1).x, iso.p(1).y
END SUB

SUB isovaloresOrdenarPorProximidad( BYREF iso )
  LOCAL i, j, pos, amin, dmin, a, d, temp
  
  FOR i = 1 to iso.n-1
    pos = i+1
    amin = angulo( iso.p(i), iso.p(i+1) )
    dmin = distancia( iso.p(i), iso.p(i+1) )
    FOR j = i+1 TO iso.n-1
      a = angulo( iso.p(i), iso.p(j) )
      d = distancia( iso.p(i), iso.p(j) )
      IF a < amin THEN
        '¿Qué pasa cuando dos ángulos son iguales, pero no así sus distancias?'
        pos = j
        amin = a
        dmin = d
      ENDIF
    NEXT
    temp = iso.p(i+1)
    iso.p(i+1) = iso.p(pos)
    iso.p(pos) = temp
  NEXT
END SUB

FUNC distancia( p0, pf )
  'Distancia euclidiana
  distancia = SQR( (pf.x-p0.x)^2 + (Pf.y-p0.y)^2)
END FUNC

FUNC angulo( p0, pf )
  'Angulo entre dos puntos en un espacio euclidiano
  angulo = atan( (pf.y-p0.y) / (pf.x-p0.x) )
END FUNC