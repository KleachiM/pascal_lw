PROGRAM Max3(INPUT, OUTPUT);
VAR
  Ch, CntUnit, CntDec, CntHundr: CHAR;
BEGIN
  READ(Ch);
  CntUnit := '0';
  CntDec := '0';
  CntHundr := '0';
  WHILE Ch <> '#'
  DO
    BEGIN
      READ(Ch);
      IF ORD(Ch) = 13
      THEN
        BEGIN
          CntHundr := 'A';
          CntDec := 'A';
          CntUnit := 'A'
        END;
      IF CntUnit < '2'
      THEN
	BEGIN
          IF CntUnit = '0'
          THEN
            BEGIN
              CntUnit := '1';
              WRITELN('0 to 1')
            END
          ELSE
            IF CntUnit = '1'
            THEN
              BEGIN
                CntUnit := '2';
                WRITELN('1 to 2')
              END
	END
      ELSE
        WRITELN('Less');
    END;
  WRITELN('ENDED', CntUnit)
END.

