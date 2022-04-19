PROGRAM SelectSort(INPUT, OUTPUT);
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  {Копируем INPUT в F1}
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
  {Сортировать F1 в OUTPUT, используя стратегию SelectSort}
  {Выбираем минимальный символ из F1}
  RESET(F1);
  {REWRITE(F2);}
  READ(F1, Ch);
  Min := Ch;
  WHILE Ch <> '#'
  DO {Выбираем минимальный из (Ch, Min)
      копируем его в OUTPUT}
    BEGIN
      {WRITE(OUTPUT, Ch);}
      IF Ch < Min
      THEN {Ch – минимальный из (Ch, Min)}
        BEGIN
          {WRITE(F2, Min);}
          Min := Ch
        END
      ELSE {Min – минимальный из (Ch, Min)}
        {WRITE(F2, Ch);}
      READ(F1, Ch)
    END;
  WRITELN(OUTPUT, Min)

END. {SelectSort}

