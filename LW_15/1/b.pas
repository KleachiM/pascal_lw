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
          WHILE NOT EOLN
          DO
            BEGIN
              READ(Ch3);
              {сравнение, Bump}
              IF ((Ch2 > Ch1) AND (Ch2 > Ch3)) OR ((Ch2 < Ch1) AND (Ch2 < Ch3))
              THEN
                Bump;
              {движение окна}
              Ch1 := Ch2;
              Ch2 := Ch3 
            END
        END
    END;
  Value(X100, X10, X1);
  WRITELN(" оличество: ", X100, X10, X1) 
END.
