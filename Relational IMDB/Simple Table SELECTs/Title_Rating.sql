-- SELECT for Title_Ratings Table
SELECT TOP 100
-- Remove TOP 100
	R.tconst, 
	R.averageRating, 
	R.numVotes 
FROM title_rating AS R