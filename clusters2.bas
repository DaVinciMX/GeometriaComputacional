REM SmallBASIC
REM created: 16/04/2021

'================================================
' Crea un plano plane(100,100)
' Define "nCentroid" centroides, cada uno con:
'	coordenada x
'	coordenada y
'	n° de observaciones n
'
' Recorre cada celda del plano, asignándole el
' valor de su centroide más próximo, mediante
' Voronoi por fuerza bruta.
' 
' Muestrea aleatoriamente "n" observaciones
' por centroide.
' Imprime en STDOUT una tabla x,y,nCentroid
'================================================

DIM plane(100,100)

INPUT nCentroids

dim centroids(nCentroids -1)

for i = 0 to nCentroids -1 
  INPUT centroids(i).x	'Coordenada x del centroide
  INPUT centroids(i).y	'Coordenada y del centroide
  INPUT centroids(i).n	'n° de observaciones para ese centroide
next

'Recorremos todo el plano, guardando en cada celda
'el número del centroide que tiene más próximo
for yy = 0 to 100
  for xx = 0 to 100
    smallestDistance = 100000000
    for i = 0 to nCentroids - 1
      dx = centroids(i).x - xx
      dy = centroids(i).y - yy
      if dx*dx + dy*dy < smallestDistance then 
		smallestDistance = dx*dx + dy*dy
		saveColor = i
	endif
    next
    plane(xx, yy) = saveColor
  next
next

'Dibujamos el plano
'FOR yy = 0 to 100
'	FOR xx = 0 to 100
'		PRINT chr(65+plane(xx,yy));
'	NEXT
'	PRINT
'NEXT

'Recorremos los "nCentroids" centroides,
'generando aleatoriamente "n" observaciones
'para cada uno de ellos
FOR i = 0 TO nCentroids-1
	FOR j = 0 TO centroids(i).n
		REPEAT
			x = ROUND(100*RND)
			y = ROUND(100*RND)
		UNTIL plane(x,y) = i
		PRINT x; ","; y; ","; i
	NEXT
NEXT

END
