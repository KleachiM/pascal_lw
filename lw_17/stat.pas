PROGRAM Stat(INPUT, OUTPUT);
VAR
  J, Count, Sum, Min, Max, AverInt, AverFloat: INTEGER;
  Reading: BOOLEAN;
  Ch: CHAR;

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

BEGIN {Stat}
  WRITELN(MAXINT);
  Count := 0;
  Sum := 0;
  Min := MAXINT;
  Max := 0;
  Reading := NOT EOLN(INPUT);
  WHILE Reading
  DO
    BEGIN
      ReadNumber(INPUT, J);
      IF J >= 0
      THEN
        BEGIN         
          IF (MAXINT - J) >= Sum
          THEN
            BEGIN
              Count := Count + 1;
              IF J < Min
              THEN
                Min := J;
              IF J > Max
              THEN
                Max := J;
              Sum := Sum + J
            END
          ELSE
            BEGIN
              Sum := -1;
              Reading := False
            END
        END
      ELSE
        Reading := False
    END;  
  IF Sum >= 0
  THEN
    IF Count > 0
    THEN
      BEGIN
        WRITELN('Count is: ', Count);
        WRITELN('Sum is: ', Sum);
        WRITELN('Max is: ', Max);
        WRITELN('Min is: ', Min);
        AverInt := Sum DIV Count;
        AverFloat := (Sum MOD Count) * 100 DIV Count;
        IF AverFloat > 0
        THEN
          IF (AverInt = 0) AND (Count > 10)
          THEN
            WRITELN('Average: ', AverInt, '.0', AverFloat)
          ELSE
            WRITELN('Average: ', AverInt, '.', AverFloat)
        ELSE
          WRITELN('Average: ', AverInt, '.00')
      END
    ELSE
      WRITELN('No digits')
  ELSE
    WRITELN('Overflow')
END. {Stat}
