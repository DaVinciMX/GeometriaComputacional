REM SmallBASIC
REM created: 17/05/2021
REM T.A.D. PointGraph
REM Un grafo está compuesto de vértices (puntos)
rem y aristas (líneas entre puntos)

UNIT PointGraph

EXPORT create
EXPORT createFromFile
EXPORT displayAsList
EXPORT displayAsRaster

FUNC create
  LOCAL pg
  
  pg.v = 0
  pg.a = 0
  
  create = pg

END FUNC

FUNC createFromFile( fn )
  LOCAL pg, i, nv, na, v, a

  OPEN fn FOR INPUT AS #1
  
  'Leemos el número de vértices del grafo
  INPUT #1, nv
  DIM v(nv-1)
  
  'Leemos cada uno de los vértices x,y
  FOR i = 0 TO nv-1
    INPUT #1, v(i).x
    INPUT #1, v(i).y
  NEXT
  pg.v = v

  'Leemos el número de aristas del grafo
  INPUT #1, na
  DIM a(na-1)
  
  'Leemos cada una de las aristas b-e (begin-end)
  ' que no son otra cosa que el número de vértice
  ' inicial y final de cada arista
  FOR i = 0 TO na-1
    INPUT #1, a(i).b
    INPUT #1, a(i).e
  NEXT
  pg.a = a
  
  'NOTA: pudiéramos guardar otra información sobre cada superficie
  CLOSE #1

  createFromFile = pg
END FUNC

SUB displayAsList( pg )
  LOCAL na, i, p0, pf

  na = LEN(pg.a)
  
  FOR i = 0 TO na-1
    p0 = pg.v( pg.a(i).b )
    pf = pg.v( pg.a(i).e )
    
    PRINT "("; p0.x; ","; p0.y; ") - ("; pf.x; ","; pf.y; ")"
  NEXT
END SUB

SUB displayAsRaster( pg )
  LOCAL na, i, p0, pf

  na = LEN(pg.a)
  
  FOR i = 0 TO na-1
    p0 = pg.v( pg.a(i).b )
    pf = pg.v( pg.a(i).e )
    
    CIRCLE p0.x, p0.y, 3 COLOR 7 FILLED
    CIRCLE pf.x, pf.y, 3 COLOR 7 FILLED
    LINE p0.x, p0.y, pf.x, pf.y COLOR 5
  NEXT
END SUB

END
