REM SmallBASIC
REM created: 21/02/2022
REM
REM
CLS
'Entrada
iso = isovaloresNew( 4 )

'Procesamiento
isovaloresDesplegar iso 
isovaloresDesplegarIsolinea iso
'Salida

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

SUB isovaloresDesplegar( iso )
  LOCAL i
  
  FOR i = 1 TO iso.n
    CIRCLE iso.p(i).x, iso.p(i).y, 3 COLOR 7 FILLED
  NEXT
END SUB

SUB isovaloresDesplegarIsolinea( iso )
  LOCAL i
  
  isovaloresOrdenarIsolinea iso
  FOR i = 1 TO iso.n-1
    LINE iso.p(i).x, iso.p(i).y, iso.p(i+1).x, iso.p(i+1).y
  NEXT
  LINE iso.p(iso.n).x, iso.p(iso.n).y, iso.p(1).x, iso.p(1).y
END SUB

SUB isovaloresOrdenarIsolinea( BYREF iso )
  LOCAL i, j, pos, amin, a, temp
  
  'Nos posicionamos en cada uno de los isovalores
  FOR i = 1 TO n-1
    'Calculamos el �ngulo al isovalor siguiente
    amin = angulo( iso.p(i), iso.p(i+1) )
    'Marcamos el isovalor siguiente como el m�nimo
    pos = i+1
    'Recorremos todos los isovalores siguientes
    FOR j = i+2 TO n
      'Calculamos el �ngulo a cada isovalor siguiente
      a = angulo( iso.p(i), iso.p(j) )
      'Si el �ngulo es menor que el actual
      IF a < amin THEN
        'convertimos ese �ngulo en el m�nimo
        amin = a
        'y guardamos su posici�n
        pos  = j
      ENDIF
    NEXT
    'Intercambiamos el isovalor siguiente con el que tiene el �ngulo m�nimo
    temp = iso.p(i+1)
    iso.p(i+1) = iso.p(pos)
    iso.p(pos) = temp
  NEXT
END SUB

FUNC angulo( p1, p2 )
  angulo = ATAN( (p2.y - p1.y) / (p2.x - p1.x ) )
END FUNC
