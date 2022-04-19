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
		END
END;

BEGIN
	
	REWRITE(Odds);
	REWRITE(Evens);

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
							WRITE(Odds, Ch);
							Next := 'E'
						END
					ELSE
						BEGIN
							WRITE(Evens, Ch);
							Next := 'O'
						END;
				END;
			WRITELN(Odds);
			WRITELN(Evens);		
			READLN(INPUT)
		END;
	WRITELN(Odds);
	WRITELN(Evens);

	RESET(Odds);
	RESET(Evens);
	
	CopyOut(Odds, Ch);
	CopyOut(Evens, Ch);
	WRITELN(OUTPUT)
END.
