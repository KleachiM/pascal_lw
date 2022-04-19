PROGRAM RunBubbleSort(INPUT, OUTPUT);

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;
  WRITELN(OutFile)
END;

PROCEDURE CopySwap(VAR F1, F2: TEXT; VAR Sorted: CHAR);
{Выводим min(Ch1,Ch2) в F2, записывая отсортированные символы}
VAR
  Ch1, Ch2: CHAR;
BEGIN
  Sorted := 'Y';
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch2);
          IF Ch1 <= Ch2
          THEN
            BEGIN
              WRITE(F2, Ch1);
              Ch1 := Ch2
            END
          ELSE
            BEGIN
              WRITE(F2, Ch2);
              Sorted := 'N'
            END
        END;
      WRITE(F2, Ch1)
    END
END;

PROCEDURE BubbleSort(VAR InFile, OutFile: TEXT);
VAR
  F1, F2: TEXT;
  Sorted: CHAR;
BEGIN
  REWRITE(F1);
  RESET(InFile);
  CopyFile(InFile, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN  
      { Копируем F1 в F2,проверяя отсортированность
       и переставляя первые соседние символы по порядку}
      RESET(F1);
      REWRITE(F2);
      CopySwap(F1, F2, Sorted);
      { Копируем F2 в F1 }
      RESET(F2);
      REWRITE(F1);
      CopyFile(F2, F1)
    END;
  RESET(F1);
  REWRITE(OutFile);
  CopyFile(F1, OutFile)
END;

BEGIN { RunBubbleSort }
  BubbleSort(INPUT, OUTPUT)
END.{ RunBubbleSort }
  
