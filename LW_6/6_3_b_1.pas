PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  {�������� INPUT � F1}
  REWRITE(F1);
  WRITE(OUTPUT, 'INPUT DATA: ');
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      {WRITE(OUTPUT, Ch);}
      READ(INPUT, Ch)
    END;
  {WRITELN(OUTPUT);}
  WRITELN(F1, '#');
  {����������� F1 � OUTPUT, ��������� ��������� SelectSort}
  {�������� ����������� ������ �� F1}
  RESET(F1);
  {REWRITE(F2);}
  READ(F1, Ch);
  Min := Ch;
  WHILE Ch <> '#'
  DO {�������� ����������� �� (Ch, Min)
      �������� ��� � OUTPUT}
    BEGIN
      {WRITE(OUTPUT, Ch);}
      IF Ch < Min
      THEN {Ch � ����������� �� (Ch, Min)}
        BEGIN
          {WRITE(F2, Min);}
          Min := Ch
        END
      ELSE {Min � ����������� �� (Ch, Min)}
        {WRITE(F2, Ch);}
      READ(F1, Ch)
    END;
  WRITELN(OUTPUT, Min)

END. {SelectSort}

