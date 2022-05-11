REM SmallBASIC
REM created: 04/04/2022


FOR x in [-1, 1]
  FOR y in [-1, 1]
    ang1 = 360/(2*PI)*ATAN(y/x)
    ang2 = 360/(2*PI)*ATAN2(x,y)
    IF ang2 > 90 AND ang2 < 225 THEN ang2 = 180+ang2
    IF ang2 <  0 THEN ang2 = 90-ang2
    PRINT USING "x= +# y= +# , atan= ####.## atan2= ####.##"; x; y; ang1; ang2
  NEXT
NEXT