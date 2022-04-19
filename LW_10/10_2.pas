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
      THEN {—читываемый символ не €вл€етс€ пробелом или возможен пробел в качестве разделител€}
        IF CarriageReturn = 'Y' 
        THEN {ѕеренос строки если выполн€ютс€ услови€ переноса строки, установка CarriageReturn := 'N'
        сброс флага оператора IsOperator := 'N'}
          BEGIN
            CarriageReturn := 'N';
            IsOperator := 'N';
            WRITELN
          END;
        IF (IsOperator = 'N') AND ((Ch <> 'B') OR (Ch <> 'E'))
        THEN {ѕечать двух пробелов, если не считываетс€ оператор и не считываетс€ начало 'END.' (Ch = 'E') 
        и не считываетс€ начало оператора BEGIN (Ch = 'B')}
          WRITE('  ');
        {WRITE(Ch);} {ѕечать текущего символа}
        IF Ch = 'B'
        THEN {Ќачало оператора BEGIN, IsOperator := 'Y'; IsBegin := 'Y'; ReadSpace := 'Y'}
          BEGIN
            IsOperator := 'Y';
            IsBegin := 'Y';
            ReadSpace := 'Y'
          END;
        IF (Ch = 'R') OR (Ch = 'W') OR (Ch = ';')
        THEN {Ќачало оператора, установка флага IsOperator := 'Y', установка ожидани€ пробела ReadSpace := 'Y'}
          BEGIN
            IsOperator := 'Y';
            ReadSpace := 'Y'
          END;
        IF IsOperator = 'Y'
        THEN {ѕоиск конца оператора}
          BEGIN
            IF Ch = ' '
            THEN {—читываем оператор и нашли пробел, значит оператор закончилс€, возможен перенос строки}
              BEGIN
                IF IsBegin = 'Y'
                THEN {≈сли нашли пробел после оператора BEGIN, то возможен перенос строки}
                  CarriageReturn := 'Y';
                ReadSpace := 'N'
              END;
            IF Ch = ';'
            THEN {—читываем оператор и нашли ';', возможен перенос сроки}
              CarriageReturn := 'Y'
            
          END;
      WRITE(Ch);
      READ(Ch)
    END;
    WRITE(Ch)
END.
