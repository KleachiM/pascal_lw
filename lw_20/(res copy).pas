/////UNIT Print;

INTERFACE
  CONST 
    Size = 5;
    Symbol = '*';
    MaxInpSize = 10;
    SymbolOfNothing = '#';
  TYPE
    SquareSet = SET OF 1 .. Size * Size;
    CharsArray = ARRAY[1 .. MaxInpSize] OF CHAR;

  PROCEDURE PrintLetterSet(PositionsSet: SquareSet);
  PROCEDURE PrintLetterSetString(InpArray: CharsArray);
  FUNCTION Letter2Set(Ch: CHAR): SquareSet;  

IMPLEMENTATION
CONST
  ASet: SquareSet = [3, 7, 9, 11, 15, 16, 17, 18, 19, 20, 21, 25];
  CSet: SquareSet = [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];
  DSet: SquareSet = [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
  XSet: SquareSet = [1, 5, 7, 9, 13, 17, 19, 21, 25];
  YSet: SquareSet = [1, 5, 7, 9, 13, 17, 21];
  NoLetter: SquareSet = [1 .. 25];

FUNCTION Letter2Set(Ch: CHAR): SquareSet;
BEGIN
  CASE Ch OF
    'A': Letter2Set := ASet;
    'C': Letter2Set := CSet;
    'D': Letter2Set := DSet;
    'X': Letter2Set := XSet;
    'Y': Letter2Set := YSet
    ELSE
      Letter2Set := NoLetter
  END
END;

PROCEDURE PrintLetterSet(PositionsSet: SquareSet);
VAR
  I: INTEGER;
BEGIN
  FOR I := 1 TO Size * Size
  DO
    BEGIN
      IF I IN PositionsSet
      THEN
        WRITE(Symbol)
      ELSE
        WRITE(' ');
      IF I MOD Size = 0
      THEN
        WRITELN
    END
END;

PROCEDURE PrintLetterSetString(InpArray: CharsArray);
TYPE
  CharsArr = ARRAY[1 .. Size * Size * MaxInpSize] OF CHAR;
VAR
  I, J, Offset, Index: INTEGER;
  MainArr: CharsArr;
  S: SquareSet;
BEGIN
  {Заполнение большого массива}
  Index := 0;
  FOR I := 1 TO MaxInpSize
  DO
    BEGIN
      Offset := 0;
      S := Letter2Set(InpArray[I]);
      FOR J := 1 TO Size * Size
      DO
        BEGIN
          Index := J + (Offset * 45 + Size * (I - 1));
          IF J IN S
          THEN
            MainArr[Index] := Symbol
          ELSE
            MainArr[Index] := ' ';
          IF J MOD Size = 0
          THEN
            Offset := Offset + 1     
        END    
    END;
    {Печать большого массива}
    FOR I := 1 TO Size * Size * MaxInpSize
    DO
      BEGIN
        WRITE(MainArr[I]);
        IF I MOD (Size * MaxInpSize) = 0
        THEN
          WRITELN
        ELSE
          IF I MOD Size = 0
          THEN
            WRITE(' ')
      END   
END;

BEGIN
END.
