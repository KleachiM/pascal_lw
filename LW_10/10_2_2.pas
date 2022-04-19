PROGRAM FormatString(INPUT, OUTPUT);
VAR
  Ch, IsOperator, WriteOut: CHAR;
  ReadSpace, WriteSpace, IsDelimited: CHAR;
  IsBegin, CarriageReturn: CHAR;
BEGIN
  ReadSpace := 'N';
  WriteSpace := 'N';
  IsDelimited := 'N';
  IsOperator := 'N';
  WriteOut := 'N';
  CarriageReturn := 'N';
  READ(Ch);
  WHILE NOT EOLN
  DO
    BEGIN
      IF (Ch <> ' ') OR (ReadSpace = 'Y')
      THEN {Считываемый символ не является пробелом 
      или возможен пробел в качестве разделителя}
        IF CarriageReturn = 'Y'
        THEN
          BEGIN
            CarriageReturn := 'N';
            IsDelimited := 'N';
            IsOperator := 'N';
            WRITELN
          END;
        
        IF (Ch = 'B') OR (Ch = 'E')
        THEN
          BEGIN
            IsOperator := 'Y';
            ReadSpace := 'Y'
          END;
        IF IsOperator = 'Y'
        THEN
          IF Ch = ' '
          THEN
            BEGIN
              ReadSpace := 'N';
              IsDelimited := 'Y'
            END;
        IF IsDelimited = 'Y'
        THEN
          IF (Ch <> ';') OR (Ch <> '(')
          THEN
            CarriageReturn := 'Y';

            
        IF (IsOperator = 'N') AND ((Ch <> 'B') AND (Ch <> 'E'))
        THEN
          WRITE('  ');
        WRITE(Ch);
        READ(Ch)
    END;
  WRITE(Ch)
END.
