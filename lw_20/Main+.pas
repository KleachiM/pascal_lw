PROGRAM XPrint_M(INPUT, OUTPUT);
USES
  Print;
VAR
  I: INTEGER;
  Arr: CharsArray;
BEGIN
  {������ INPUT � ������ � ������}
  I := 0;
  WHILE NOT EOLN AND (I < MaxInpSize)
  DO
    BEGIN
      I := I + 1;
      READ(Arr[I])
    END;

  {���������� �������}
  FOR I := I + 1 TO MaxInpSize
  DO
    Arr[I] := SymbolOfNothing;

  {����� � OUTPUT}
  PrintLetterSetString(Arr)
END.
