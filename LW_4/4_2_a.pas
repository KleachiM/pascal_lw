PROGRAM SarahRevere (INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  BEGIN {���樠������ W1,W2,W3,W4,Looking}
    W1 := ' ';
    W2 := ' ';
    W3 := ' ';
    W4 := ' ';
    Looking := 'Y';
  END;
  WHILE Looking = 'Y'
  DO
    BEGIN
      BEGIN {������� ����, �஢����� ����� ������}
        W1 := W2;
        W2 := W3;
        W3 := W4;
        READ(W4);
        WRITELN(W1, W2, W3, W4);
        IF W4 = '#'
        THEN {����� ������}
          Looking := 'N'
      END;
      {�஢�ઠ ���� ���  'land'}
      {�஢�ઠ ���� ��� 'sea'}
    END;
  {ᮧ���� ᮮ�饭�� Sarah}
END.
