REM Voronoi mediante Fortune
REM (c) 2021, Wannabes de IDeIO

IMPORT PointList

INPUT "n"; n
'Generamos una lista con todos los eventos que se conocen en el instante inicial.
el = PointList.create(n)

'En este caso todos los puntos p_i.
FOR i = 0 TO n-1
	INPUT x
	INPUT y
	p.x = x
	p.y = y
	PointList.set(el, i, p)
NEXT

'Se ordenan según la ordenada y.
PointList.sortByY e

'Se genera una estructura para guardar la “beach line”.
'En este caso generaremos una matriz, aunque la estructura más eficiente es un árbol de búsqueda binario.
bl = Foo.create

i = 0
REPEAT
	'Se elige el primer evento de la lista.
	e = Foo.get( bl, i )
	'Se elimina de la lista
	Foo.delete bl, 0
	'y se procesa
	'????????
	i = i + 1
'Repetimos el paso anterior hasta que no queden eventos.
UNTIL Foo.empty(bl)

END
