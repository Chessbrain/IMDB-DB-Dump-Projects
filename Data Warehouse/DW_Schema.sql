CREATE TABLE DimGenre(
GenreKey int PRIMARY KEY IDENTITY (1,1) NOT NULL,
GenreAltKey nvarchar(30) NOT NULL
)
GO

CREATE TABLE DimDirector(
DirectorKey int PRIMARY KEY IDENTITY (1,1) NOT NULL,
DirectorAltKey nvarchar(10) NOT NULL,
DirectorName nvarchar(100) NOT NULL
)
GO

CREATE TABLE DimWriter(
WriterKey int PRIMARY KEY IDENTITY (1,1) NOT NULL,
WriterAltKey nvarchar(10) NOT NULL,
DirectorName nvarchar(100) NOT NULL
)
GO

CREATE TABLE DimDate(
DateKey int PRIMARY KEY IDENTITY (1,1) NOT NULL,
[Year] nvarchar(4) NOT NULL
)
GO

CREATE TABLE DimTitleType(
TitleTypeKey int PRIMARY KEY IDENTITY (1,1) NOT NULL,
TitleTypeAltKey nvarchar(30) NOT NULL
)
GO

CREATE TABLE FactRatings(
GenreKey int FOREIGN KEY (GenreKey) REFERENCES DimGenre(GenreKey) NOT NULL,
DirectorKey int FOREIGN KEY (DirectorKey) REFERENCES DimDirector(DirectorKey) NOT NULL,
WriterKey int FOREIGN KEY (WriterKey) REFERENCES DimWriter(WriterKey) NOT NULL,
DateKey int FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey) NOT NULL,
TitleTypeKey int FOREIGN KEY (TitleTypeKey) REFERENCES DimTitleType(TitleTypeKey),
Rating float NOT NULL,
NumVotes bigint NOT NULL
)
GO
