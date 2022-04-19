UNIT Print;

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

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9
    END
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Reading: BOOLEAN;
  Digit, Val: INTEGER;
  
BEGIN {ReadNumber}
  Val := -1;
  N := 0;
  Reading := NOT EOLN(F);
  WHILE Reading
  DO
    BEGIN
      ReadDigit(F, Digit);
      IF Digit >= 0
      THEN
        BEGIN
          Val := 1;
          IF N <= (MAXINT - Digit) DIV 10
          THEN
            N := N * 10 + Digit
          ELSE
            Val := -2
        END
      ELSE
        Reading := False
    END;
  IF (Val = -1) OR (Val = -2)
  THEN
    N := Val
END; {ReadNumber}

FUNCTION Letter2Set(Ch: CHAR): SquareSet;
VAR
  Searching: BOOLEAN;
  F: TEXT;
  Symbol: CHAR;
  Digit: INTEGER;
  S: SquareSet;
BEGIN
  ASSIGN(F, 'Symbols.txt');
  RESET(F);
  Searching := True;
  S := [];
  WHILE NOT EOF(F)
  DO
    BEGIN
      READ(F, Symbol);
      IF Symbol = Ch
      THEN
        BEGIN
          Searching := False;
          WHILE NOT EOLN(F)
          DO
            BEGIN
              ReadNumber(F, Digit);
              IF Digit >= 0
              THEN
                S := S + [Digit] 
            END
        END
      ELSE
        READLN(F)
    END;
  IF Searching
  THEN
    Letter2Set := [1 .. 25]
  ELSE
    Letter2Set := S
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
