PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
TYPE
  Sieve = SET OF 2 .. Max;
VAR
  Number, Mult: INTEGER;
  S: Sieve;
BEGIN
  Number := 2;
  S := [2 .. Max];
  WHILE S <> []
  DO
    BEGIN
      IF Number IN S
      THEN
        BEGIN
          WRITE(Number, ' ');
          Mult := Number;
          WHILE Mult <= Max
          DO
            BEGIN
              S := S - [Mult];
              Mult := Mult + Number
            END
        END;
      Number := Number + 1
    END
END.
