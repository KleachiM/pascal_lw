PROGRAM ReverseCount(INPUT, OUTPUT);
USES
  Count3;
VAR
  Ch, Ch1, Ch2, Ch3: CHAR;
  X100, X10, X1: CHAR;
BEGIN
  Start;
  Ch1 := ' ';
  Ch2 := ' ';
  Ch3 := ' ';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Ch1 := Ch2;
      Ch2 := Ch3;
      Ch3 := Ch;
      Bump
    END;
  Value(X100, X10, X1);
  WRITELN("Количество: ", X100, X10, X1) 
END.
