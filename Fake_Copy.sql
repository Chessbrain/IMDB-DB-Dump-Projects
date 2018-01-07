CREATE TABLE [Cast].[Cast] (
CastID int CONSTRAINT Indexed_CastPrimaryKey PRIMARY KEY IDENTITY(1,1) NOT NULL,
nconst nvarchar(10) CONSTRAINT Original_CastKey UNIQUE NOT NULL,
primaryName nvarchar(100) NOT NULL,
birthYear nvarchar(4) NULL DEFAULT '\N',
deathYear nvarchar(4) NULL DEFAULT '\N'
)
GO

CREATE TABLE [Cast].Profession (
ProfessionID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
Profession nvarchar(30)
)
GO
DROP TABLE Cast.SolutionProfession
DROP TABLE Cast.CastProfession
DROP TABLE Cast.Profession

CREATE TABLE [Cast].SolutionProfession(
CastID int FOREIGN KEY REFERENCES [Cast].[Cast] (CastID),
ProfessionID int FOREIGN KEY REFERENCES [Cast].Profession (ProfessionID),
CastProfessionID int FOREIGN KEY REFERENCES [Cast].CastProfession (CastProfessionID)
)
GO

CREATE TABLE [Cast].CastProfession (
CastProfessionID int PRIMARY KEY IDENTITY (1,1),
CastID nvarchar(10),
ProfessionID nvarchar(30)
)
GO

CREATE TABLE Title.[Type](
TypeID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
[Type] nvarchar (30)
)
GO

CREATE TABLE Title.Title(
TitleID int CONSTRAINT Indexed_TitlePrimaryKey PRIMARY KEY IDENTITY (1,1) NOT NULL,
tconst nvarchar(15),
TypeID nvarchar(50) ,
primaryTitle nvarchar(max) ,
originalTitle nvarchar(max),
IsAdult bit,
startYear nvarchar(10) ,
endYear nvarchar(10),
runTimeMinutes nvarchar(10)
)
GO

CREATE TABLE Title.Genre(
GenreID INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
Genre nvarchar(30)
)
GO

CREATE TABLE Title.TitleGenre (
TitleGenreID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
TitleID nvarchar(10),
GenreID nvarchar(30)
)
GO

CREATE TABLE Title.Rating(
titleRatingID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
tconst nvarchar(10) CONSTRAINT FK_Original_TitleRating FOREIGN KEY REFERENCES Title.Title(tconst) NOT NULL,
averageRating float NOT NULL,
numVotes int NOT NULL
)
GO

CREATE TABLE Title.SolutionActedOn (
TitleID int FOREIGN KEY REFERENCES Title.Title (TitleID),
CastID int FOREIGN KEY REFERENCES Cast.Cast (CastID),
ActedOnID int FOREIGN KEY REFERENCES Title.ActedOn(ActedOnID)
)

CREATE TABLE Title.ActedOn(
ActedOnID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
TitleID nvarchar(10),
CastID nvarchar(10)
)
GO

CREATE TABLE Title.Episode(
EpisodeID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
tconst nvarchar(10) NOT NULL,
parentTconst nvarchar(10) CONSTRAINT FK_Original_TitleSeries FOREIGN KEY REFERENCES Title.Title (tconst),
seasonNumber nvarchar(3) NULL DEFAULT '\N',
episodeNumber nvarchar(3) NULL DEFAULT '\N'
)
GO

CREATE TABLE Title.PrincipalCast(
PrincipleCastID int PRIMARY KEY IDENTITY (1,1) NOT NULL,
tconst nvarchar (10),
nconst nvarchar(10)
)
GO

CREATE TABLE Title.SolutionPrincipal(
TitleID int FOREIGN KEY REFERENCES Title.Title(TitleID),
CastID int FOREIGN KEY REFERENCES [Cast].[Cast] (CastID),
PrincipalID int FOREIGN KEY REFERENCES Title.PrincipalCast(PrincipleCastID)
)
GO


CREATE TABLE Title.Crew (
CrewID int PRIMARY KEY IDENTITY(1,1) NOT NULL,
tconst nvarchar (10),
director nvarchar (10),
writer nvarchar (10)
)
GO
CREATE TABLE Title.SolutionCrew (
	TitleID int FOREIGN KEY REFERENCES Title.Title(TitleID),
	CastID int FOREIGN KEY REFERENCES [Cast].[Cast] (CastID),
	CrewID int FOREIGN KEY REFERENCES Title.Crew (CrewID)
)