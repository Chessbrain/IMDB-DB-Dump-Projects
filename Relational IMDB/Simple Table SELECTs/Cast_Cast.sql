-- SEELCT for Cast.Cast table
SELECT TOP 100
-- Remove TOP 100	
	N.nconst, 
	N.primaryName, 
	N.birthYear, 
	N.deathYear 
FROM name_basics AS N