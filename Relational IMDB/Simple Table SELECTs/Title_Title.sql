-- SELECT for Title_Title Table
SELECT TOP 10 
-- Remove TOP 10
	T.tconst, 
	T.titleType, 
	T.primaryTitle, 
	T.originalTitle, 
	T.isAdult, 
	T.startYear, 
	T.endYear, 
	T.runtimeMinutes 
FROM title_basics AS T