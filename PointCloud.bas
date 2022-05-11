REM T.A.D. PointCloud

UNIT PointCloud

EXPORT createFromArray
EXPORT createFromFile
EXPORT convexHull
EXPORT voronoi
EXPORT delaunai
EXPORT displayAsList
EXPORT displayAsRaster

IMPORT PointList
IMPORT PointGraph

FUNC createFromArray( A )
  LOCAL pc

  pc = A
  createFromArray = pc
END FUNC

FUNC createFromFile( fn )
  LOCAL pc, n, i

  OPEN fn FOR INPUT AS #1
  INPUT #1, n
  DIM pc(n)

  FOR i = 0 TO n-1
    INPUT #1, pc(i).x
    INPUT #1, pc(i).y
  NEXT
  CLOSE #1

  createFromFile = pc
END FUNC

FUNC convexHull( pc )
    LOCAL pl

    pl = PointList.create

    convexHull = pl
END FUNC

FUNC voronoi( pc )
    LOCAL pg

    pg = PointGraph.create


    voronoi = pg
END FUNC

FUNC delaunai( pc )
    LOCAL pg

    pg = PointGraph.create


    delaunai = pg
END FUNC

SUB displayAsList( pc )
    LOCAL n, i

    n = LEN( pc )
    FOR i = 0 TO n-1
      PRINT "("; pc(i).x; ","; pc(i).y; ")"
    NEXT
END SUB

SUB displayAsRaster( pc )
  LOCAL n, i
  
  n = LEN( pc )
  FOR i = 0 TO n-1
    'NOTA: Sería posible almacenar en el TAD el diámetro (3) y el color (7) de los círculos
    CIRCLE pc(i).x, pc(i).y, 3 COLOR 7 FILLED
  NEXT
END SUB

END
