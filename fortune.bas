REM SmallBASIC
REM created: 10/05/2021

IMPORT PointList
'IMPORT lineaplaya

'=====================================================
' ENTRADA DE DATOS
'=====================================================
'Generamos una lista con todos los eventos que se conocen en el instante inicial.
'En este caso todos los puntos pi.
INPUT "Número de puntos"; n

pl = PointList.Create( n )

'Se ordenan según la ordenada y.
PointList.sortByY( pl )

'Se genera una estructura para guardar la "beach line".
'En este caso generaremos una matriz, aunque la estructura más eficiente es un árbol de búsqueda binario.

'bl = BeachLine.Create

'=====================================================
' PROCESAMIENTO
'=====================================================
i = 0
REPEAT
  'Se elige el primer evento de la lista.

  el = PointList.Get( pl, i )

  ' Se elimina de la lista 
  ' y se procesa.
  PointList.erase( pl, i )

  i = i + 1
'Repetimos el paso anterior hasta que no queden eventos.
UNTIL PointList.empty( p )

'====================================================
' SALIDA DE RESULTADOS
'====================================================

END
