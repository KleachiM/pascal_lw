PROGRAM Counter(INPUT, OUTPUT);
VAR
  Ch, CntUnit, CntDec, CntHundr: CHAR;
BEGIN {Counter}
  READ(Ch);
  CntUnit := '0';
  CntDec := '0';
  CntHundr := '0';
  WHILE Ch <> '#'
  DO
    BEGIN {WHILE}
      READ(Ch);
      IF ORD(Ch) = 13
      THEN
        BEGIN
          CntHundr := 'A';
          CntDec := 'A';
          CntUnit := 'A'
        END;
      IF CntUnit < '9'
      THEN
        BEGIN
          IF CntUnit = '0'
          THEN
            CntUnit := '1'
          ELSE
            IF CntUnit = '1'
            THEN
              CntUnit := '2'
            ELSE
              IF CntUnit = '2'
              THEN
                CntUnit := '3'
              ELSE
                IF CntUnit = '3'
                THEN
                  CntUnit := '4'
                ELSE
                  IF CntUnit = '4'
                  THEN
                    CntUnit := '5'
                  ELSE
                    IF CntUnit = '5'
                    THEN
                      CntUnit := '6'
                    ELSE
                      IF CntUnit = '6'
                      THEN
                        CntUnit := '7'
                      ELSE
                        IF CntUnit = '7'
                        THEN
                          CntUnit := '8'
                        ELSE
                          IF CntUnit = '8'
                          THEN
                            CntUnit := '9'
        END
      ELSE
        BEGIN {CntUnit >= 9}
          CntUnit := '0';
          IF CntDec < '9'
          THEN
            BEGIN
              IF CntDec = '0'
              THEN
                CntDec := '1'
              ELSE
                IF CntDec = '1'
                THEN
                  CntDec := '2'
                ELSE
                  IF CntDec = '2'
                  THEN
                    CntDec := '3'
                  ELSE
                    IF CntDec = '3'
                    THEN
                      CntDec := '4'
                    ELSE
                      IF CntDec = '4'
                      THEN
                        CntDec := '5'
                      ELSE
                        IF CntDec = '5'
                        THEN
                          CntDec := '6'
                        ELSE
                          IF CntDec = '6'
                          THEN
                            CntDec := '7'
                          ELSE
                            IF CntDec = '7'
                            THEN
                              CntDec := '8'
                            ELSE
                              IF CntDec = '8'
                              THEN
                                CntDec := '9'
            END
          ELSE
            BEGIN {CntDec >= 9}
              CntDec := '0';
              IF CntHundr <= '9'
              THEN
                BEGIN
                  IF CntHundr = '0'
                  THEN
                    CntHundr := '1'
                  ELSE
                    IF CntHundr = '1'
                    THEN
                      CntHundr := '2'
                    ELSE
                      IF CntHundr = '2'
                      THEN
                        CntHundr := '3'
                      ELSE
                        IF CntHundr = '3'
                        THEN
                          CntHundr := '4'
                        ELSE
                          IF CntHundr = '4'
                          THEN
                            CntHundr := '5'
                          ELSE
                            IF CntHundr = '5'
                            THEN
                              CntHundr := '6'
                            ELSE
                              IF CntHundr = '6'
                              THEN
                                CntHundr := '7'
                              ELSE
                                IF CntHundr = '7'
                                THEN
                                  CntHundr := '8'
                                ELSE
                                  IF CntHundr = '8'
                                  THEN
                                    CntHundr := '9'
                                  ELSE
                                    IF CntHundr = '9'
                                    THEN
                                      CntHundr := 'A'
                END;
              ELSE
                Ch := '#'
            END {CntDec >= 9}
        END {CntUnit >= 9}
    END; {WHILE}
  IF CntHundr = 'A'
  THEN
    WRITELN('Overflow')
  ELSE
    WRITELN('Count is: ', CntHundr, CntDec, CntUnit)
END. {Counter}