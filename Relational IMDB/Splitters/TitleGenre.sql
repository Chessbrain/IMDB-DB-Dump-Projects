--TitleGenre split
SELECT TOP 10 tconst,
-- Remove TOP 10
TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) AS [Genre]
FROM
(
SELECT tb.tconst,
CAST('<XMLRoot><RowData>' + REPLACE(tb.genres,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
FROM   title_basics tb	
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
WHERE  TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) NOT LIKE '\N'
GO
-- The reason why I am not including '\N' in this database, is because I am planning to use it to do a Data Warehouse
-- DWs don't accept null values 
-- (and '\N' basically stands for NULL in this database, with the exception of one column that uses blank string '')