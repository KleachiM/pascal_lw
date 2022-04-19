PROGRAM Reverse(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  F1, F2: TEXT;
BEGIN
  ASSIGN(F1, '/Users/mihailkalinin/учеба/Институт ПС/pascal/lw_11/F1.txt');
  ASSIGN(F2, '/Users/mihailkalinin/учеба/Институт ПС/pascal/lw_11/F2.txt');
  REWRITE(F1);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      READ(INPUT, Ch);
      IF NOT EOLN(INPUT)
      THEN
        WRITE(F1, Ch)
      ELSE
        WRITE(OUTPUT, Ch)
    END;
  WRITELN(F1);

  RESET(F1);
  REWRITE(F2);

  WHILE NOT EOLN(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          IF NOT EOLN(F1)
          THEN
            WRITE(F2, Ch)
          ELSE
            WRITE(OUTPUT, Ch)
        END;
      WRITELN(F2);

      REWRITE(F1);
      RESET(F2);
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch)
        END;
      WRITELN(F1);
      RESET(F1);
      REWRITE(F2)
    END;

  WRITELN(OUTPUT)
END.
