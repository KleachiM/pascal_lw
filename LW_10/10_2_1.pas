PROGRAM FormatString(INPUT, OUTPUT);
VAR
  Ch, IsOperator, WriteOut: CHAR;
  ReadSpace, WriteSpace: CHAR;
  IsBegin, CarriageReturn: CHAR;
BEGIN
  ReadSpace := 'N';
  WriteSpace := 'N';
  IsOperator := 'N';
  WriteOut := 'N';
  CarriageReturn := 'N';
  READ(Ch);
  WHILE NOT EOLN
  DO
    BEGIN
      IF (Ch <> ' ') OR (ReadSpace = 'Y')
      THEN
        WRITE(Ch);
        READ(Ch)
    END;
  WRITE(Ch)
END.
