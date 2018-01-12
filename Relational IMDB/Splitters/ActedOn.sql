-- ActedOn split
SELECT TOP 100 nconst,
-- Remove TOP 1000
TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) AS [Titles]
FROM
(
SELECT nb.nconst,
CAST('<XMLRoot><RowData>' + REPLACE(knownForTitles,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
FROM   name_basics nb	
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
GO