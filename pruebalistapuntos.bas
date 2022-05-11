REM SmallBASIC
REM created: 10/05/2021

IMPORT PointList

INPUT "Tama�o"; n

p = PointList.Create( n )

FOR i = 0 TO n-1

  PRINT "Punto #"; i
  INPUT "x"; x
  INPUT "y"; y
  
  PointList.Set(p, i, x, y)

NEXT

PointList.SortByX(p)

PointList.Display(p)

PRINT "El tama�o de la lista es "; PointList.Length(p)

END
