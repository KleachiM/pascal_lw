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
  {��������� ����� ���� � DateFile � ��������������� �����}
  DO
    BEGIN
      ReadDate(FInput, D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {�������� �������� �������,��� D �� DateFile � TFile}
          {�������� D � TFile}
          {WRITE(TFile, D);}
          WRITE(DateFile, D);
          {�������� ������� DateFile � TFile}        
          {�������� TFile � DateFile}
        END
    END;
  {�������� DateFile � OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile)
END.{SortDate}

