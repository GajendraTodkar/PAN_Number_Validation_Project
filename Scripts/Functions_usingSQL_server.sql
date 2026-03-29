-- Function to Check Adjacent Character
CREATE OR ALTER FUNCTION adj_char (@p_string VARCHAR(MAX))
RETURNS BIT     --- Return 1 = True / 0 = False
AS
	BEGIN
		DECLARE @i INT = 1,
				@j INT = len(@p_string);

		WHILE @i < @j
		BEGIN
			IF SUBSTRING(@p_string, @i, 1) = SUBSTRING(@p_string, @i+1, 1)
			RETURN 1	--- Adjacent Characters are same.

		SET @i = @i + 1
		END;

		RETURN 0;		--- Adjacent Characters are not same.
	END;

-- Function to Check Sequence of Character
CREATE OR ALTER FUNCTION seq_char(@p_string VARCHAR(MAX))
RETURNS BIT		--- Return 1 = True / 0 = False
AS
	BEGIN
		DECLARE @i INT = 1,
				@j INT = LEN(@p_string);

		WHILE @i < @j
		BEGIN
			IF ASCII(SUBSTRING(@p_string, @i+1, 1)) - ASCII(SUBSTRING(@p_string, @i, 1)) = 1
			/* ASCII function gives value like 65, we substract next character's ASCII value from
			   previous charcter's ASCI value. */ 
			RETURN 1	--- Characters are in Sequence.

		SET @i = @i +1
		END;

		RETURN 0;		--- Characters are not in Sequence.
	END;

	Select dbo.seq_char ('acbef')	