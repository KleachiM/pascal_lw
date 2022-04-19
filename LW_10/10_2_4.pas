PROGRAM FormatString(INPUT, OUTPUT);
VAR
  Ch, IsOperator, WaitNextOperator: CHAR;
  ReadSpace, IsDelimited: CHAR;
  IsBegin, CarriageReturn, Semicolon: CHAR;
BEGIN
  IsBegin := 'N';
  WaitNextOperator := 'N';
  ReadSpace := 'N';
  IsDelimited := 'N';
  IsOperator := 'N';
  Semicolon := 'N';
  CarriageReturn := 'N';
  READ(Ch);
  WHILE NOT EOLN
  DO
    BEGIN
      IF (Ch <> ' ') OR (ReadSpace = 'Y')
      THEN {Считываемый символ не является пробелом 
      или возможен пробел в качестве разделителя}
        IF WaitNextOperator = 'Y'
        THEN
          BEGIN
            IF (Ch = 'R') OR (Ch = 'W') OR (Ch = 'E')
            THEN
              CarriageReturn := 'Y';
            IF Ch = ';'
            THEN
              Semicolon := 'Y'
          END;

        IF (CarriageReturn = 'Y') OR ((IsBegin = 'Y') AND (Ch = ';')) OR ((Semicolon = 'Y') AND (Ch <> ';'))
        THEN
          BEGIN
            CarriageReturn := 'N';
            IsDelimited := 'N';
            IsOperator := 'N';
            Semicolon := 'N';
            IsBegin := 'N';
            WaitNextOperator := 'N';
            WRITELN
          END;
        
        IF (IsOperator = 'N') AND (Ch <> 'B') AND (Ch <> 'E') AND (Semicolon = 'N') AND (Ch <> ' ')
        THEN
          WRITE('  ');

        IF (IsOperator = 'N') AND ((Ch = 'B') OR (Ch = 'E') OR (Ch = 'R') OR (Ch = 'W'))
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
              IsOperator := 'N';
              WaitNextOperator := 'Y'
              {IsDelimited := 'Y'}
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
