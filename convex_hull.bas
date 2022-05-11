REM Convex Hull - Cerco Convexo
REM (c) 2021, Wannabes de Geometrÿa Computacional
REM SmallBASIC
REM created: 22/02/2021

' NOTA: Todo el programa usa arreglos al estilo C, empezando en 0

CONST NPOINTS = 30

RANDOMIZE 1357924680

DIM points(NPOINTS,1)
hull = 0

'Entrada de datos
CLS
CreatePoints points

'Procesamiento de información: Cálculo del cerco convexo
t0 = TIMER
hull1 = ConvexHull1(points)
t1 = TIMER
hull2 = ConvexHull2(points)
t2 = TIMER
hull3 = ConvexHull3(points)
t3 = TIMER
hull4 = ConvexHull4(points)
t4 = TIMER


'Salida de resultados
DisplayHull hull1

END

SUB CreatePoints( BYREF p )
  LOCAL i, x, y
  FOR i = 0 TO NPOINTS
    x = XMAX * RND
    y = YMAX * RND
    points(i,0) = x
    points(i,1) = y
    CIRCLE points(i,0),points(i,1),5 COLOR 7 FILLED
  NEXT
END SUB


REM *******************************************************************************
REM ConvexHull1
REM Implementaci�n del cerco convexo mediante tri�ngulos (n^4)
REM *******************************************************************************
FUNC ConvexHull1( p )
  LOCAL i,j,k,l,n
  DIM h(NPOINTS)
  DIM inside(NPOINTS)

  ' Indica si el punto l est� en el tri�ngulo i-j-k
  FUNC InsideTriangle( p, i, j, k, l)
    LOCAL a1, a2, a3, a4
    
    ' Calcula el �rea del tri�ngulo cuyos v�rtices son a,b,c
    FUNC Area( p, a, b, c )
      'LA PROGRAMAN USTEDES
    END FUNC
    
    a1 = Area( p, i, j, k ) 'Tri�ngulo completo
    a2 = Area( p, i, j, l )
    a3 = Area( p, j, k, l )
    a4 = Area( p, i, k, l )
    
    IF a2 + a3 + a4 = a1 THEN
      InsideTriangle = TRUE
    ELSE
      InsideTriangle = FALSE
    ENDIF    
  END FUNC
  
  ' Devuelve un arreglo con todos los puntos de p que no est�n en inside
  FUNC SavePoints( p, inside )
    'USTEDES TIENEN QUE ELABORARLO
  END FUNC

  'Elige el primer v�rtice del tri�ngulo
  FOR i = 0 TO NPOINTS
    'Elige el segundo v�rtice del tri�ngulo
    FOR j = 0 TO NPOINTS
      'Elige el tercer v�rtice del tri�ngulo
      FOR k = 0 TO NPOINTS
        'Los 3 v�rtices deben ser diferentes
        IF i <> j AND i <> k AND j <> k THEN
          'Comprobamos todos los dem�s puntos, para ver si est�n adentro del tri�ngulo
          FOR l = 0 TO NPOINTS
            'Si no es ninguno de los v�rtices del tri�ngulo
            IF l <> i AND l <> j AND i <> k THEN
              'Si el punto l est� adentro del tri�ngulo
              IF InsideTriangle(p, i, j, k, l) THEN
                ' qu�tenlo de la lista del cerco convexo
                inside(l) = TRUE
              ELSE
                inside(l) = FALSE
              ENDIF
            ENDIF
          NEXT
        ENDIF
      NEXT
    NEXT
  NEXT
  'Guardar en h s�lo los puntos que no est�n en inside
  h = SavePoints( p, inside )
  ConvexHull1 = h
END FUNC

REM *******************************************************************************
REM ConvexHull2
REM Implementaci�n del cerco convexo mediante aristas y semiplanos
REM *******************************************************************************
FUNC ConvexHull2( p )
END FUNC

REM *******************************************************************************
REM ConvexHull3
REM Implementaci�n del cerco convexo mediante la Marcha de Jarvis
REM *******************************************************************************
FUNC ConvexHull3( p )
  
  'Seleccionamos un punto que ya est� en el cerco convexo (i.e. el de menor y)
  i = StartPoint( p )
  REPEAT
    'Agregamos ese punto al arreglo del cerco h
    appendPoint i, h
    'Recorremos todos los puntos
    FOR j = 0 TO NPOINTS
      'Si el punto destino es distinto del origen
      IF i <> j THEN
        'Calculamos el �ngulo a cada punto
        alfa(j) = Angle(p, i, j)
      ENDIF
    NEXT
    'Encontramos la l�nea con el menor �ngulo
    m = minorAngle( alfa )
    'Agregamos el nuevo v�rtice al cerco
    appendPoint p, m, h
    i = m
  UNTIL i = StartPoint( p )
  ConvexHull3 = h
END FUNC

REM *******************************************************************************
REM ConvexHull1
REM Implementaci�n del cerco convexo mediante Scan de Graham
REM *******************************************************************************
FUNC ConvexHull4( p )
END FUNC

SUB DisplayHull( h ) 
  DRAWPOLY h FILLED
  PRINT h
  PRINT "Tiempo para algoritmo 1= "; t1-t0
  PRINT "Tiempo para algoritmo 2= "; t2-t1
  PRINT "Tiempo para algoritmo 3= "; t3-t2
  PRINT "Tiempo para algoritmo 4= "; t4-t3
END SUB
