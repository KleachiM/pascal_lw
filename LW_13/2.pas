PROGRAM RunLexico(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Result: CHAR;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 ���� ������������������ ������� F1 =, <, > ��� F2       
��������������. ����������� ���������, ��������������� F1 � F2,
������ ���� ����������}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 ��� F1 ������ F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 ��� F2 ������ F1}
          Result := '2'
    END {WHILE}
    
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
    END    
END; {Lexico}

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;

BEGIN {RunLexico}
  REWRITE(F1);
  CopyFile(INPUT, F1);
  
  READLN(INPUT);

  REWRITE(F2);
  CopyFile(INPUT, F2);
  
  Lexico(F1, F2, Result);
  WRITELN(OUTPUT, Result)
END. {RunLexico}

