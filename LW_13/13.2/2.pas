PROGRAM RunLexico(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
  Result: CHAR;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico1}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1)) AND (NOT EOLN(F2))
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF Result = '0'
      THEN
        IF (Ch1 < Ch2)
        THEN
          Result := '1'
        ELSE
          IF (Ch1 > Ch2)
          THEN
            Result := '2'
    END;
  IF (Result = '0')
  THEN
    IF (NOT EOLN(F1))
    THEN {F1 длиннее F2}
      Result := '2'
    ELSE
      IF (NOT EOLN(F2))
      THEN {F1 короче F2}
        Result := '1'
END; {Lexico1}

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
  
  WRITELN('Lexico: ');
  Lexico(F1, F2, Result);
  WRITELN(OUTPUT, Result)

END. {RunLexico}

