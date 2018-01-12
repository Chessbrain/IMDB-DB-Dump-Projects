-- TitleCrew split
-- WARNING!! This query runs for a very long time (2hours on my slightly older PC)
-- This query will output around 13.6 million rows
SELECT TOP 10 tconst,
-- Remove TOP 10
TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) AS [Director],
TRIM('"' FROM LTRIM(RTRIM(y.x.value('.[1]','varchar(8000)')))) AS [Writer]
FROM
(
SELECT tc.tconst,
CAST('<XMLRoot><RowData>' + REPLACE(tc.directors,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x,
CAST('<XMLRoot><RowData>' + REPLACE(tc.writers,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS y
FROM   title_crew tc	
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
CROSS APPLY x.nodes('/XMLRoot/RowData')y(x)
WHERE TRIM('"' FROM LTRIM(RTRIM(y.x.value('.[1]','varchar(8000)')))) NOT LIKE '\N' AND 
TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) NOT LIKE '\N'
GO
