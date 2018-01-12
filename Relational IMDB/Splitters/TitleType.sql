-- TitleType Split
SELECT
TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) AS [Type]
FROM
(
SELECT TOP 100
CAST('<XMLRoot><RowData>' + REPLACE(tb.titleType,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
FROM   title_basics tb	
GROUP BY tb.titleType
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)