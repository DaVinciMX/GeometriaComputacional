REM Convex Hull - Cerco Convexo
REM (c) 2021, Wannabes de Geometrÿa Computacional
REM SmallBASIC
REM created: 22/02/2021

' NOTA: Todo el programa usa arreglos al estilo C, empezando en 0

CONST NPOINTS = 30000

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



FUNC ConvexHull1( p )
  LOCAL i, n
  DIM h( 2 * NPOINTS)

' IMPLEMENTAR EL CERCO CONVEXO, A PARTIR DE LAS IDEAS QUE VIMOS EN EL VIDEO  
  n  = 4
  FOR i = 0 to n-1
    h(2*i) = ROUND(XMAX * rnd)
    h(2*i+1) = ROUND(YMAX * rnd)
  NEXT

  REDIM h(2*n-1)
  ConvexHull1 = h
END FUNC

FUNC ConvexHull2( p )
END FUNC

FUNC ConvexHull3( p )
END FUNC

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
