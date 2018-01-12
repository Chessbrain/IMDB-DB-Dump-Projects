-- CastProfession split
SELECT TOP 100 nconst,
TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) AS [Profession]
FROM
(
SELECT nb.nconst,
CAST('<XMLRoot><RowData>' + REPLACE(primaryProfession,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
FROM   name_basics nb	
WHERE primaryProfession NOT LIKE ''
-- For some reason this is the only column in the entire database that uses blank string → '' ← for nulls.
-- ↓ try it out
-- WHERE primaryProfession LIKE ''
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
GO