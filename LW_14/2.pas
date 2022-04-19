PROGRAM RunRCopy(INPUT, OUTPUT);

PROCEDURE RCopy(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN {Reverse}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      WRITE(OUTPUT, Ch);
      RCopy(F)
    END
END; {Reverse}

BEGIN {RunReverse}
  RCopy(INPUT);
  WRITELN(OUTPUT)
END. {RunReverse}
