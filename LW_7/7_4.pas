PROGRAM Copy(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  F1: TEXT;
BEGIN
  REWRITE(F1);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          READ(INPUT, Ch);
          WRITE(F1, Ch)
        END;
      WRITELN(F1);
      READLN(INPUT)
    END;
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      READLN(F1);
      WRITELN(OUTPUT)
    END;
  WRITELN(OUTPUT)
END.
