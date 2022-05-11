REM SmallBASIC
REM created: 09/05/2022
REM Calculadora de expresiones matemáticas en
REM notación polaca inversa (RPN, Reverse Polish Notation)
REM (c) 2022, wannabes de Geometría Computacional

IMPORT Stack

'Entrada
CLS
INPUT "Expresión RPN"; rpn

'Proceso
r = evaluarExpresion( rpn )

'Salida
PRINT r

END

FUNC evaluarExpresion( rpn )
   LOCAL i, s, op1, op2, c

   s = Stack.new( 100 )

   FOR i = 1 TO LEN( rpn )
     c = MID(rpn, i, 1)
     IF c >= "0" AND c <= "9" THEN
       Stack.push(s, VAL(c) )
     ELIF c = "+" THEN
       op2 = Stack.pop( s )
       op1 = Stack.pop( s )
       Stack.push(s, op1 + op2 )
     ELIF c = "-" THEN
       op2 = Stack.pop( s )
       op1 = Stack.pop( s )
       Stack.push(s, op1 - op2 )
     ELIF c = "*" THEN
       op2 = Stack.pop( s )
       op1 = Stack.pop( s )
       Stack.push(s, op1 * op2 )
     ELIF c = "/" THEN
       op2 = Stack.pop( s )
       op1 = Stack.pop( s )
       Stack.push(s, op1 / op2 )
     ELIF c = "s" THEN		'Raÿz cuadrada (Square root)
       op1 = Stack.pop( s )
       Stack.push(s, SQR( op1 ))
     ELIF c = "p" THEN		'Potencia (Power)
       op2 = Stack.pop( s )  'Exponente
       op1 = Stack.pop( s )  ' Base
       Stack.push(s, op1 ^ op2 )
     ENDIF
   NEXT
   evaluarExpresion = Stack.pop( s )
END FUNC