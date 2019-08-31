DECLARE @StartYear int = 1874
DECLARE @EndDate int = YEAR(getdate())
DECLARE @LoopDate int
SET @LoopDate = @StartYear
WHILE @LoopDate <= @EndDate
BEGIN
	INSERT INTO DimDate
	VALUES(CAST(@LoopDate as nvarchar(4)))

	SET @LoopDate += 1
END
