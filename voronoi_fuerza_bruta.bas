REM SmallBASIC
REM created: 16/04/2021
WINDOW 0,0,XMAX,YMAX
INPUT nPoints
dim puntos(nPoints -1, 1)
x = 0: y = 1
'puntos(0,x) = 450
'puntos(0,y) = 50
'puntos(1,x) = 300
'puntos(1,y) = 400
'puntos(2,x) = 150
'puntos(2,y) = 225
'puntos(3,x) = 750
'puntos(3,y) = 300
'puntos(4,x) = 900
'puntos(4,y) = 450
'puntos(5,x) = 600
'puntos(5,y) = 500
for i = 0 to nPoints -1 
  'print pun	tos(i,x), puntos(i,y)
  INPUT PUNTOS(I,0)
  INPUT PUNTOS(I,1)
next

for yy = 0 to ymax
  for xx = 0 to xmax
    smallestDistance = 100000000
    for i = 0 to nPoints - 1
      dx = puntos(i,x) - xx
      dy = puntos(i,y) - yy
      if dx*dx + dy*dy < smallestDistance then smallestDistance = dx*dx+dy*dy : saveColor = 7+i
    next
    pset xx, yy, saveColor
  next
next

FOR i = 0 TO nPoints-1
  CIRCLE Puntos(i,x),Puntos(i,y),5 COLOR 0 FILLED
NEXT
