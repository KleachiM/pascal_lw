PROGRAM FormatString(INPUT, OUTPUT);
VAR
  Ch, IsOperator, WriteOut: CHAR;
  ReadSpace, WriteSpace, IsDelimited: CHAR;
  IsBegin, CarriageReturn, Semicolon: CHAR;
BEGIN
  IsBegin := 'N';
  ReadSpace := 'N';
  WriteSpace := 'N';
  IsDelimited := 'N';
  IsOperator := 'N';
  WriteOut := 'N';
  Semicolon := 'N';
  CarriageReturn := 'N';
  READ(Ch);
  WHILE NOT EOLN
  DO
    BEGIN
      IF (Ch <> ' ') OR (ReadSpace = 'Y')
      THEN {Считываемый символ не является пробелом 
      или возможен пробел в качестве разделителя}
        IF (CarriageReturn = 'Y') OR ((IsBegin = 'Y') AND (Ch = ';')) OR ((Semicolon = 'Y') AND (Ch <> ';'))
        THEN
          BEGIN
            CarriageReturn := 'N';
            IsDelimited := 'N';
            IsOperator := 'N';
            Semicolon := 'N';
            IsBegin := 'N';
            WRITELN
          END;
        
        IF (IsOperator = 'N') AND (Ch <> 'B') AND (Ch <> 'E') AND (Semicolon = 'N') AND (Ch <> ' ')
        THEN
          WRITE('  ');

        IF (IsOperator = 'N') AND ((Ch = 'B') OR (Ch = 'E'))
        THEN
          BEGIN
            IsOperator := 'Y';
            ReadSpace := 'Y';
            IF Ch = 'B'
            THEN
              IsBegin := 'Y'
          END;

        IF Ch = ';'
        THEN
          BEGIN
            IsOperator := 'N';
            ReadSpace := 'Y';
            Semicolon := 'Y'
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

        IF Ch <> ' '
        THEN
          WRITE(Ch);

        READ(Ch)
    END;
  WRITE(Ch)
END.
