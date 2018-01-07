-- This query will be responsible for splitting arrays from the tsv files into separate columns so you can normalize the database
-- You will mostly edit column names and add certain commands for specific scenarios (those commands are included in commented
-- sections with their description as to why and when to use them).
-- I am not a professional, so if you have a better solution by all means share. This is a public project :)

SELECT TOP 100 [Extra_ColumnName_IF_NEEDED],
-- Remove TOP 100 when importing data. Just in case you forget (like I have many times)

TRIM('"' FROM LTRIM(RTRIM(m.n.value('.[1]','varchar(8000)')))) AS [NameOfColumn]
-- TRIM('"' FROM LTRIM(RTRIM(x.y.value('.[1]','varchar(8000)')))) AS [NameOfColumn2]
-- ↑ The selection of the second separated array

FROM
(
SELECT [Extra_ColumnName_IF_NEEDED],
CAST('<XMLRoot><RowData>' + REPLACE([NameOfArrayColumn],',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x

-- CAST('<XMLRoot><RowData>' + REPLACE([NameOfSecondArrayColumn],',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS y
-- ↑ In the table_crew table, there are 2 fields of nconst, one for director the other for writer. This is simply adding a new
-- separator for the second column.

FROM   [TableName]
-- WHERE primaryProfession NOT LIKE ''

-- 	↑ Use this when importing primaryProfession (with DISTINCT at the top SELECT and GROUP BY in this SELECT), 
--    that's becuase there are some data with blanks and you don't want blanks when doing data warehouse, data mining or anything of that sort
)t
CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
-- CROSS APPLY x.nodes('/XMLRoot/RowData')y(x)
-- ↑ This is so you can access the second separated array
GO


-- In general, all you will be doing is editting this exact same query to work for the other tables :)