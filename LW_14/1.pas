PROGRAM RunReverse(INPUT, OUTPUT);

PROCEDURE Reverse(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN {Reverse}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      Reverse(F);
      WRITE(OUTPUT, Ch)
    END
END; {Reverse}

BEGIN {RunReverse}
  Reverse(INPUT);
  WRITELN(OUTPUT)
END. {RunReverse}
