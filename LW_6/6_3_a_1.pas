PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  {Копировать INPUT в F1}
  REWRITE(F1);
  WRITE(OUTPUT, 'INPUT DATA: ');
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(F1, Ch);
      {WRITE(OUTPUT, Ch);}
      READ(INPUT, Ch)
    END;
  {WRITELN(OUTPUT);}
  WRITELN(F1, '#');

  {Сортировать F1 в OUTPUT, используя стратегию SelectSort

  {Копируем F1 в OUTPUT}
  RESET(F1);
  {REWRITE(F2);}
  READ(F1, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(OUTPUT, Ch);
      READ(F1, Ch)
    END;
  WRITELN(OUTPUT, '#')

END. {SelectSort}
