PROGRAM SortDate(INPUT, OUTPUT);
USES
  DateIO;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;

BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.txt');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  {ѕоместить новую дату в DateFile в соответствующее место}
  DO
    BEGIN
      ReadDate(FInput, D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {копируем элементы меньшие,чем D из DateFile в TFile}
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END;
          {копируем D в TFile}
          WRITE(TFile, D);
          {копируем остаток DateFile в TFile}
          IF EOF(DateFile) AND NOT Copying
          THEN
            WRITE(TFile, VarDate);  
          WHILE NOT EOF(DateFile)
          DO
            BEGIN
              WRITE(TFile, VarDate);
              READ(DateFile, VarDate);
              IF EOF(DateFile)
              THEN
                WRITE(TFile, VarDate)
            END;
          {копируем TFile в DateFile}
          RESET(TFile);
          REWRITE(DateFile);
          CopyFile(TFile, DateFile);
          RESET(DateFile)
        END
    END;
  { опируем DateFile в OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END.{SortDate}

