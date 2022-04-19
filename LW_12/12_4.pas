PROGRAM Trim(INPUT, OUTPUT);
VAR
  Ch: CHAR;
  Space: CHAR;
BEGIN
  Space := 'N';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch <> ' '
      THEN
        BEGIN
          WRITE(Ch);
          Space := 'Y'
        END
      ELSE
        IF Space = 'Y'
        THEN
          BEGIN
            IF NOT EOLN
            THEN
              WRITE(' ');
            Space := 'N'
          END
    END;
  WRITELN('#')
END.
