PROGRAM XPrint_M(INPUT, OUTPUT);
USES
  Print;
VAR
  I: INTEGER;
  Arr: CharsArray;
BEGIN
  {Чтение INPUT и запись в массив}
  I := 0;
  WHILE NOT EOLN AND (I < MaxInpSize)
  DO
    BEGIN
      I := I + 1;
      READ(Arr[I])
    END;

  {Дополнение массива}
  FOR I := I + 1 TO MaxInpSize
  DO
    Arr[I] := SymbolOfNothing;

  {Вывод в OUTPUT}
  PrintLetterSetString(Arr)
END.
