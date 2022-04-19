PROGRAM Split(INPUT, OUTPUT);
VAR
	Odds, Evens: TEXT;
	Ch, Next: CHAR;

PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
	WHILE NOT EOF(F1)
	DO
		BEGIN
			WHILE NOT EOLN(F1)
			DO
				BEGIN
					READ(F1, Ch);
					WRITE(OUTPUT, Ch)
				END;
			READLN(F1)
		END;
	WRITELN(OUTPUT, '#')
END;

BEGIN

	REWRITE(Odds);

	Next := 'O';
	WHILE NOT EOF(INPUT)
	DO
		BEGIN
			WHILE NOT EOLN(INPUT)
			DO
				BEGIN
					READ(INPUT, Ch);
					IF Next = 'O'
					THEN
						BEGIN
							Next := 'E'
						END
					ELSE
						BEGIN
							Next := 'O'
						END;
				  WRITE(Odds, Next)	
				END;		
			READLN(INPUT)
		END;
	WRITELN(Odds);

	RESET(Odds);
	
	CopyOut(Odds, Ch);
	WRITELN(OUTPUT)
END.
