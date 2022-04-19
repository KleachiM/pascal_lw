PROGRAM XPrint(INPUT, OUTPUT);
USES
  Print;
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      PrintLetterSet(Letter2Set(Ch));
      WRITELN
    END
END.
