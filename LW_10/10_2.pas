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
      THEN {����������� ������ �� �������� �������� ��� �������� ������ � �������� �����������}
        IF CarriageReturn = 'Y' 
        THEN {������� ������ ���� ����������� ������� �������� ������, ��������� CarriageReturn := 'N'
        ����� ����� ��������� IsOperator := 'N'}
          BEGIN
            CarriageReturn := 'N';
            IsOperator := 'N';
            WRITELN
          END;
        IF (IsOperator = 'N') AND ((Ch <> 'B') OR (Ch <> 'E'))
        THEN {������ ���� ��������, ���� �� ����������� �������� � �� ����������� ������ 'END.' (Ch = 'E') 
        � �� ����������� ������ ��������� BEGIN (Ch = 'B')}
          WRITE('  ');
        {WRITE(Ch);} {������ �������� �������}
        IF Ch = 'B'
        THEN {������ ��������� BEGIN, IsOperator := 'Y'; IsBegin := 'Y'; ReadSpace := 'Y'}
          BEGIN
            IsOperator := 'Y';
            IsBegin := 'Y';
            ReadSpace := 'Y'
          END;
        IF (Ch = 'R') OR (Ch = 'W') OR (Ch = ';')
        THEN {������ ���������, ��������� ����� IsOperator := 'Y', ��������� �������� ������� ReadSpace := 'Y'}
          BEGIN
            IsOperator := 'Y';
            ReadSpace := 'Y'
          END;
        IF IsOperator = 'Y'
        THEN {����� ����� ���������}
          BEGIN
            IF Ch = ' '
            THEN {��������� �������� � ����� ������, ������ �������� ����������, �������� ������� ������}
              BEGIN
                IF IsBegin = 'Y'
                THEN {���� ����� ������ ����� ��������� BEGIN, �� �������� ������� ������}
                  CarriageReturn := 'Y';
                ReadSpace := 'N'
              END;
            IF Ch = ';'
            THEN {��������� �������� � ����� ';', �������� ������� �����}
              CarriageReturn := 'Y'
            
          END;
      WRITE(Ch);
      READ(Ch)
    END;
    WRITE(Ch)
END.
