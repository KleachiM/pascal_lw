PROGRAM Split(INPUT, OUTPUT);
VAR
	Ch, Next: CHAR;
	Odds, Evens: TEXT;

BEGIN
	{REWRITE(Odds);
	REWRITE(Evens);}
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
						Next := 'E'
					ELSE
						Next := 'O';
					WRITE(OUTPUT, Next)
				END;
			READLN(INPUT);
			{WRITELN(Odds);
			WRITELN(Evens)}
			WRITELN(OUTPUT)
		END;
	{WRITELN(Odds);
	WRITELN(Evens)}
	WRITELN(OUTPUT)
END.
