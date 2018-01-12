-- PrincipalCast split
SELECT TOP 100 tconst,
-- Remove TOP 1000
TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) AS Certs
FROM
(
SELECT tp.tconst,
CAST('<XMLRoot><RowData>' + REPLACE(tp.principalCast,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
FROM   title_principals tp	
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
GO