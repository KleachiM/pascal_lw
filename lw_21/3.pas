PROGRAM Decryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  Range = 1 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;
  ArrLength: Range;
  Space: CHAR;

PROCEDURE Initialize(VAR Code: Chiper; VAR Space: CHAR);
VAR
  Ch, Symbol: CHAR;
  F: TEXT;
{Присвоить Code шифр замены}
BEGIN {Initialize}
  ASSIGN(F, 'Symbols.txt');
  RESET(F);
  FOR Ch := 'A' TO 'Z'
  DO
    BEGIN
      READ(F, Symbol);
      READ(F, Symbol);
      Code[Ch] := Symbol;
      READLN(F)
    END;
  READ(F, Symbol);
  READ(F, Symbol);
  Space := Symbol    
END;  {Initialize}

PROCEDURE Decode(S: Str; Length: Range; Space: CHAR);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: Range;
BEGIN {Decode}
  FOR Index := 1 TO Length
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      {WRITE(S[Index]);}
      IF S[Index] = Space
      THEN
        WRITE(' ');
  WRITELN
END;  {Decode}

BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code, Space);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      ArrLength := I;
      Decode(Msg, ArrLength, Space)
    END
END.  {Encryption}

