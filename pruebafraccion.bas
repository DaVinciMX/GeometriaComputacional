REM SmallBASIC
REM created: 10/05/2021

IMPORT Fraccion

INPUT "n1"; n
INPUT "n2"; d

f1 = Fraccion.create(n, d)

INPUT "n2"; n
INPUT "d2"; d

f2 = Fraccion.create(n, d)

f3 = Fraccion.add( f1, f2 )
f4 = Fraccion.subtract( f1, f2 )
f5 = Fraccion.multiply( f1, f2 )
f6 = Fraccion.divide( f1, f2 )

PRINT "La suma da "; Fraccion.asString( f3 ); " o lo que es igual: "; Fraccion.asDecimal( f3 )
PRINT "La resta da "; Fraccion.asString( f4 ); " o lo que es igual: "; Fraccion.asDecimal( f4 )
PRINT "El producto da "; Fraccion.asString( f5 ); " o lo que es igual: "; Fraccion.asDecimal( f5 )
PRINT "La división da "; Fraccion.asString( f6 ); " o lo que es igual: "; Fraccion.asDecimal( f6 )

END
