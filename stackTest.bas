REM SmallBASIC
REM created: 02/05/2022

IMPORT Stack

s = Stack.new(20)

Stack.push s, 1
Stack.push s, 2
Stack.push s, 3
Stack.push s, 4

Stack.prnt s

r = Stack.pop( s )

PRINT r
Stack.prnt(s)

r = Stack.pop ( s )

PRINT r
Stack.prnt s

END