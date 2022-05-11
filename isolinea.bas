REM SmallBASIC
REM created: 21/02/2022
REM T.A.D. Lista de puntos de isovalores
REM Graficar una isolinea
REM (c) 2022, wannabes de Geometría Computacional
CLS
'Entrada
INPUT "# de puntos"; n
i = isovaloresNew( n )
isovaloresGraficar i
isovaloresGraficarIsolinea i 

'Procesamiento

'Salida

END

FUNC isovaloresNew( n )
  LOCAL temp, i
  
  temp.n = n
  DIM temp.p(n)
  FOR i = 1 TO n
    temp.p(i).x = XMAX * RND
    temp.p(i).y = YMAX * RND
  NEXT
  isovaloresNew = temp
END FUNC

SUB isovaloresGraficar( iso )
  LOCAL i
  
  FOR i = 1 TO iso.n
    CIRCLE iso.p(i).x, iso.p(i).y, 3 COLOR 7 FILLED
  NEXT
END SUB

SUB isovaloresGraficarIsolinea( iso )
  LOCAL i
  
  isovaloresOrdenarPorProximidad iso
  FOR i = 2 TO iso.n
    LINE iso.p(i-1).x, iso.p(i-1).y, iso.p(i).x, iso.p(i).y
  NEXT
  'Cerramos la isolinea
  LINE iso.p(iso.n).x, iso.p(iso.n).y, iso.p(1).x, iso.p(1).y
END SUB

SUB isovaloresOrdenarPorProximidad( BYREF iso )
  LOCAL i, j, angmin, dmin, ang, dist, pos,temp
  
  FOR i = 1 TO iso.n
    pos = 2
    angmin = angulo( iso.p(i), iso.p(2) )
    dmin = distancia( iso.p(i), iso.p(2) )
    FOR j = 2 TO n
      ang = angulo( iso.p(i), iso.p(j) )
      dist = distancia( iso.p(i), iso.p(j) )
      IF ang < angmin THEN
        IF d < dmin THEN
          angmin = ang
          dmin = dist
          pos = j
        ENDIF
      ENDIF
    NEXT
    'Intercambio de los valores
    temp = iso.p(i)
    iso.p(i) = iso.p(pos) 
    iso.p(pos) = temp
  NEXT
END SUB
