REM SmallBASIC
REM created: 10/05/2021
REM Desarrollar el TDA Lista de puntos 2D

REM TDA = Algoritmos + E.D.

UNIT PointList

EXPORT create
EXPORT createFromFile
EXPORT get
EXPORT set
'EXPORT delete
EXPORT sortByX
EXPORT sortByY
EXPORT shiftX
EXPORT shiftY
EXPORT display
EXPORT length
EXPORT isEmpty
EXPORT displayAsList
EXPORT displayAsRaster


FUNC create( size )

  DIM pl(size-1)
  
  Create = p

END FUNC

FUNC createFromFile( fn )
  LOCAL pl, n, i
  
  OPEN fn FOR INPUT AS #1
  INPUT #1, n
  DIM pl(n-1)
  
  FOR i = 0 TO n-1
    INPUT #1, pl(i).x
    INPUT #1, pl(i).y
  NEXT
  CLOSE #1
  
  createFromFile = pl
END FUNC

FUNC get( pl, i )

  Get = pl(i)

END FUNC

SUB set( BYREF pl, i, x, y )

  pl(i).x = x
  pl(i).y = y

END SUB

SUB sortByX( BYREF pl )
  LOCAL i, j

  ' Usamos el Algoritmo de la Burbuja (Bubble Sort)
  ' para ordenar los datos
  FOR j = 0 TO LEN(pl) - 2
    FOR i = j TO LEN(pl) - 1
      IF pl(i).x < pl(j).x THEN
        swap pl(i),pl(j)
      ENDIF
    NEXT
  NEXT
END SUB

SUB sortByY( BYREF pl )
  LOCAL i,j
  
  FOR j = 0 TO LEN(pl) - 2
    FOR i = j TO LEN(pl) -1
      IF pl(i).y < pl(j).y THEN
        swap pl(i),pl(j)
      ENDIF
    NEXT
  NEXT
END SUB

SUB shiftX( BYREF pl, s )
  LOCAL i, l
  
  l = LEN(pl)
  
  FOR i = 0 TO l-1
    pl(i).x = pl(i).x + s
  NEXT
END SUB

SUB shiftY( BYREF pl, s )
  LOCAL i, l
  
  l = LEN(pl)
  
  FOR i = 0 TO l-1
    pl(i).y = pl(i).y + s
  NEXT
END SUB

SUB display( pl )
  LOCAL i
  
  FOR i = 0 to LEN(pl)-1
    PRINT "("; pl(i).x; ","; pl(i).y; ")"
  NEXT
END SUB

FUNC length( pl )
  length = LEN( pl ) - 1
END FUNC

END

FUNC isEmpty( pl )
  IF LEN(pl) = 0 THEN
    isEmpty = True
  ELSE
    isEmpty = False
  ENDIF
END FUNC

SUB displayAsList( pl )
  LOCAL n, i
  
  n = LEN(pl)
  
  FOR i = 0 TO n-1
    PRINT "("; pl(i); ")"
  NEXT

END SUB


SUB displayAsRaster( pl )
  LOCAL n, i, p0, pf
  
  n = LEN(pl)
  
  p0 = pl(0)
  FOR i = 1 TO n-1
    pf = pl(i)
    LINE p0.x, p0.y, pf.x, pf.y COLOR 7
    p0 = pf
  NEXT
END SUB

END
