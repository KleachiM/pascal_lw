PROGRAM Trim(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  WaitSpace, WaitSymbol: CHAR;
BEGIN
  WaitSpace := 'N';
  WaitSymbol := 'N';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch <> ' '
      THEN
        BEGIN
          IF WaitSymbol = 'Y'
          THEN
            BEGIN
              WRITE(' ');
              WaitSymbol := 'N'
            END;
          WaitSpace := 'Y';
          WRITE(Ch)
        END
      ELSE
        IF WaitSpace = 'Y'
        THEN
          BEGIN
            WaitSpace := 'N';
            WaitSymbol := 'Y'
          END
    END;
  WRITELN('#')
END.
