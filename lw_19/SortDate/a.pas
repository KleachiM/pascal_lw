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
  {RESET(DateFile);}
  {REWRITE(TFile);}
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
          {копируем D в TFile}
          {WRITE(TFile, D);}
          WRITE(DateFile, D);
          {копируем остаток DateFile в TFile}        
          {копируем TFile в DateFile}
        END
    END;
  { опируем DateFile в OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END.{SortDate}

