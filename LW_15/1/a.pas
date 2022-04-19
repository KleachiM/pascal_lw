PROGRAM ReverseCount(INPUT, OUTPUT);
USES
  Count3;
VAR
  Ch, Ch1, Ch2, Ch3: CHAR;
  X100, X10, X1: CHAR;
BEGIN
  Start;
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch1);
      IF NOT EOLN
      THEN
        BEGIN
          READ(Ch2);
          IF NOT EOLN
          THEN
            BEGIN
              READ(Ch3);
              WHILE NOT EOLN
              DO
                BEGIN
                  READ(Ch);
                  Bump  
                END
            END
        END
    END;
  Value(X100, X10, X1);
  WRITELN("Количество: ", X100, X10, X1) 
END.
