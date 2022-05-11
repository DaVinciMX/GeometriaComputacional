REM SmallBASIC
REM created: 10/05/2021
REM T.A.D. Fraccion

UNIT Fraccion

EXPORT create
EXPORT 	asString
EXPORT asDecimal
EXPORT add
EXPORT subtract
EXPORT multiply
EXPORT divide 
EXPORT power

'En P.O.O. se le denomina el método "constructor"
FUNC create( n, d )
  LOCAL f
  
  f.num = n
  f.den = d
  simplify f
  
  Create = f
  
END FUNC

FUNC asString( f )
  
  IF f.den > 0 THEN
    asString = STR(f.num) + "/" + STR(f.den)
  ELSE
    asString = STR(-f.num) + "/" + STR(-f.den)
  ENDIF
  
END FUNC

FUNC asDecimal( f )
  asDecimal = f.num / f.den
END FUNC

FUNC add( f1, f2 )
  LOCAL temp
  
  temp.den = f1.den * f2.den
  temp.num = f1.num * f2.den + f1.den * f2.num
  simplify temp
  
  add = temp 
END FUNC

FUNC subtract( f1, f2 )
  LOCAL temp
  
  temp.den = f1.den * f2.den
  temp.num = f1.num * f2.den - f1.den * f2.num
  simplify temp
  
  subtract = temp
END FUNC

FUNC multiply( f1, f2 )
  LOCAL temp
  
  temp.num = f1.num * f2.num
  temp.den = f1.den * f2.den
  simplify temp

  multiply = temp
END FUNC

FUNC divide( f1, f2 )
  LOCAL temp
  
  temp.num = f1.num * f2.den
  temp.den = f1.den * f2.num
  simplify temp
  
  divide = temp
END FUNC

FUNC power( f, n )
  LOCAL temp
  
  temp.num = f.num^n
  temp.den = f.den^n
  simplify temp
  
  power = temp
END FUNC

SUB simplify( BYREF f )
  LOCAL m
  
  m = mcd( f.num, f.den )
  
  f.num = f.num \ m
  f.den = f.den \ m
END SUB

'Algoritmo de Euclides
FUNC mcd( a, b )
  LOCAL r
  
  r = a mod b
  IF r = 0 THEN
    mcd = b
  ELSE
    mcd = mcd( b, r )
  ENDIF
  
END FUNC

END
