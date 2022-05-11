
REM created: 02/05/2022

UNIT Stack

EXPORT New
EXPORT Push
EXPORT Pop
EXPORT Prnt

FUNC New( n )
  LOCAL s, temp
  
  DIM temp(n)
  s.data = temp
  s.top = 0
  
  New = s
END FUNC

SUB Push( BYREF s, d )
  'TODO: validar stack overflows
  s.data(s.top) = d
  s.top++
END SUB

FUNC Pop( BYREF s )
  s.top--
  Pop = s.data(s.top)
END FUNC

SUB Prnt( s )
  LOCAL i

  PRINT "[";
  FOR i = 0 TO s.top-2
    PRINT s.data(i); ",";
  NEXT
  PRINT s.data(i); "]"
END SUB

END
