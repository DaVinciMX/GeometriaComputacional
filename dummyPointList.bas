REM SmallBASIC
REM created: 17/05/2021

IMPORT PointList

'El grafo contiene una "lista" de puntos al principio
pl = PointList.createFromFile( "grafo.pg" )

PointList.displayAsList pl
PointList.displayAsRaster pl
PointList.sortByX pl
PRINT "Ordenando..."
PointList.displayAsList pl
PointList.shiftX pl, 100
PointList.displayAsRaster pl

END
