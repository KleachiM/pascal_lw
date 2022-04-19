PROGRAM PaulRevere(INPUT, OUTPUT);
VAR
  Lanterns: CHAR;
BEGIN {PaulRevere}
  READ(Lanterns);
  IF Lanterns = 'L'
  THEN
    BEGIN
      READ(Lanterns);
      WRITE('The British are coming by');
      IF Lanterns <> 'L'
      THEN
        WRITELN(' land.')
      ELSE
        WRITELN(' sea.')
    END
  ELSE
    WRITELN('The North Church shows only ''', Lanterns, '''.')
END. {PaulRevere}

      


