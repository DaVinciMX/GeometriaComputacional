REM SmallBASIC
REM created: 21/02/2022
REM T.A.D. Isovalores
REM (c) 2022, wannabes de Geometría Computacional
CLS
'Entrada
iso = isovaloresNuevo( 10, 7 )
'Procesamiento
isovaloresGraficar iso
isovaloresGraficarIsolinea iso
'Salida

END

FUNC isovaloresNuevo( n, c )
  LOCAL iso, i
  
  iso.c = c
  iso.n = n
  DIM iso.p( n )
  FOR i = 1 TO n
    iso.p(i).x = XMAX * RND
    iso.p(i).y = YMAX * RND
  NEXT
  isovaloresNuevo = iso
END FUNC

SUB isovaloresGraficar( iso )
  LOCAL i
  
  FOR i = 1 TO iso.n
    CIRCLE iso.p(i).x, iso.p(i).y, 3 COLOR iso.c FILLED
  NEXT
END SUB

SUB isovaloresGraficarIsolinea( iso )
  LOCAL i
  
  isovaloresOrdenar iso
  FOR i = 1 TO iso.n-1
    LINE iso.p(i).x, iso.p(i).y, iso.p(i+1).x, iso.p(i+1).y
  NEXT
  LINE iso.p(iso.n).x, iso.p(iso.n).y, iso.p(1).x, iso.p(1).y
END SUB

SUB isovaloresOrdenar( BYREF iso )
  LOCAL i, j
  
  FOR i = 1 TO iso.n-2
    amin = angulo( iso.p(i), iso.p(i+1) )
    pos = i+1
    FOR j = i+2 TO iso.n
      a = angulo( iso.p(i), iso.p(j) )
      IF a < amin THEN
        amin = a
        pos  = j
      ENDIF 
    NEXT
    'Intercambiamos el elemento en i+1 por aquél con el ángulo mínimo
    temp = iso.p(i+1)
    iso.p(i+1) = iso.p(pos)
    iso.p(pos) = temp
  NEXT
END SUB

FUNC angulo( p1, p2 )
  angulo = ATAN( (p2.y-p1.y) / (p2.x-p1.x) )
END FUNC
