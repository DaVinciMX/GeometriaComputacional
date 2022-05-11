REM SmallBASIC
REM created: 10/05/2021

IMPORT PointList

INPUT "Tamaño"; n

p = PointList.Create( n )

FOR i = 0 TO n-1

  PRINT "Punto #"; i
  INPUT "x"; x
  INPUT "y"; y
  
  PointList.Set(p, i, x, y)

NEXT

PointList.SortByX(p)

PointList.Display(p)

PRINT "El tamaño de la lista es "; PointList.Length(p)

END
