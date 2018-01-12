-- SELECT for Title_Episode table
SELECT TOP 100 
-- Remove TOP 100
	E.tconst, 
	E.parentTconst, 
	E.seasonNumber, 
	E.episodeNumber 
FROM title_episode AS E