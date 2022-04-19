PROGRAM WithoutLast(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  IF EOLN
  THEN
    WRITELN
  ELSE
    BEGIN
      READ(Ch);
      WHILE NOT EOLN
      DO
        BEGIN
          WRITE(Ch);
          READ(Ch)
        END;
      WRITELN
    END
END.
