USE [IMDB]
GO
/****** Object:  Schema [Cast]    Script Date: 1/6/2018 11:14:44 PM ******/
CREATE SCHEMA [Cast]
GO
/****** Object:  Schema [Title]    Script Date: 1/6/2018 11:14:44 PM ******/
CREATE SCHEMA [Title]
GO
/****** Object:  Table [Cast].[Cast]    Script Date: 1/6/2018 11:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cast].[Cast](
	[CastID] [int] IDENTITY(1,1) NOT NULL,
	[nconst] [nvarchar](10) NOT NULL,
	[primaryName] [nvarchar](100) NOT NULL,
	[birthYear] [nvarchar](4) NULL,
	[deathYear] [nvarchar](4) NULL,
 CONSTRAINT [Indexed_CastPrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Original_CastKey] UNIQUE NONCLUSTERED 
(
	[nconst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cast].[CastProfession]    Script Date: 1/6/2018 11:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cast].[CastProfession](
	[CastProfessionID] [int] IDENTITY(1,1) NOT NULL,
	[CastID] [nvarchar](10) NULL,
	[ProfessionID] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CastProfessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cast].[Profession]    Script Date: 1/6/2018 11:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cast].[Profession](
	[ProfessionID] [int] IDENTITY(1,1) NOT NULL,
	[Profession] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Profession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[ActedOn]    Script Date: 1/6/2018 11:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[ActedOn](
	[ActID] [int] IDENTITY(1,1) NOT NULL,
	[TitleID] [nvarchar](10) NULL,
	[CastID] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[Crew]    Script Date: 1/6/2018 11:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[Crew](
	[CrewID] [int] IDENTITY(1,1) NOT NULL,
	[tconst] [nvarchar](10) NOT NULL,
	[director] [nvarchar](10) NULL,
	[writer] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CrewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[Episode]    Script Date: 1/6/2018 11:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[Episode](
	[EpisodeID] [int] IDENTITY(1,1) NOT NULL,
	[tconst] [nvarchar](10) NOT NULL,
	[parentTconst] [nvarchar](10) NULL,
	[seasonNumber] [nvarchar](3) NULL,
	[episodeNumber] [nvarchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[EpisodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[Genre]    Script Date: 1/6/2018 11:14:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[Genre](
	[GenreID] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[PrincipalCast]    Script Date: 1/6/2018 11:14:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[PrincipalCast](
	[PrincipleCastID] [int] IDENTITY(1,1) NOT NULL,
	[tconst] [nvarchar](10) NOT NULL,
	[nconst] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrincipleCastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[Rating]    Script Date: 1/6/2018 11:14:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[Rating](
	[titleRatingID] [int] IDENTITY(1,1) NOT NULL,
	[tconst] [nvarchar](10) NOT NULL,
	[averageRating] [float] NOT NULL,
	[numVotes] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[titleRatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[Title]    Script Date: 1/6/2018 11:14:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[Title](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[tconst] [nvarchar](10) NOT NULL,
	[TypeID] [nvarchar](30) NOT NULL,
	[primaryTitle] [nvarchar](150) NOT NULL,
	[originalTitle] [nvarchar](150) NULL,
	[IsAdult] [bit] NULL,
	[startYear] [nvarchar](4) NULL,
	[endYear] [nvarchar](4) NULL,
	[runTimeMinutes] [nvarchar](3) NULL,
 CONSTRAINT [Indexed_TitlePrimaryKey] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Original_TitleKey] UNIQUE NONCLUSTERED 
(
	[tconst] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[TitleGenre]    Script Date: 1/6/2018 11:14:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[TitleGenre](
	[TitleGenreID] [int] IDENTITY(1,1) NOT NULL,
	[TitleID] [nvarchar](10) NOT NULL,
	[GenreID] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[TitleGenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Title].[Type]    Script Date: 1/6/2018 11:14:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Title].[Type](
	[TypeID] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Cast].[Cast] ADD  DEFAULT ('\N') FOR [birthYear]
GO
ALTER TABLE [Cast].[Cast] ADD  DEFAULT ('\N') FOR [deathYear]
GO
ALTER TABLE [Cast].[CastProfession] ADD  DEFAULT ('\N') FOR [CastID]
GO
ALTER TABLE [Cast].[CastProfession] ADD  DEFAULT ('\N') FOR [ProfessionID]
GO
ALTER TABLE [Title].[ActedOn] ADD  DEFAULT ('\N') FOR [CastID]
GO
ALTER TABLE [Title].[Crew] ADD  DEFAULT ('\N') FOR [director]
GO
ALTER TABLE [Title].[Crew] ADD  DEFAULT ('\N') FOR [writer]
GO
ALTER TABLE [Title].[Episode] ADD  DEFAULT ('\N') FOR [seasonNumber]
GO
ALTER TABLE [Title].[Episode] ADD  DEFAULT ('\N') FOR [episodeNumber]
GO
ALTER TABLE [Title].[PrincipalCast] ADD  DEFAULT ('\N') FOR [nconst]
GO
ALTER TABLE [Title].[Title] ADD  DEFAULT ('\N') FOR [originalTitle]
GO
ALTER TABLE [Title].[Title] ADD  DEFAULT ((0)) FOR [IsAdult]
GO
ALTER TABLE [Title].[Title] ADD  DEFAULT ('\N') FOR [startYear]
GO
ALTER TABLE [Title].[Title] ADD  DEFAULT ('\N') FOR [endYear]
GO
ALTER TABLE [Title].[Title] ADD  DEFAULT ('\N') FOR [runTimeMinutes]
GO
ALTER TABLE [Title].[TitleGenre] ADD  DEFAULT ('\N') FOR [GenreID]
GO
ALTER TABLE [Cast].[CastProfession]  WITH CHECK ADD FOREIGN KEY([ProfessionID])
REFERENCES [Cast].[Profession] ([Profession])
GO
ALTER TABLE [Cast].[CastProfession]  WITH CHECK ADD  CONSTRAINT [FK_Original_CastProfession_Key] FOREIGN KEY([CastID])
REFERENCES [Cast].[Cast] ([nconst])
GO
ALTER TABLE [Cast].[CastProfession] CHECK CONSTRAINT [FK_Original_CastProfession_Key]
GO
ALTER TABLE [Title].[ActedOn]  WITH CHECK ADD  CONSTRAINT [FK_Original_CastAct] FOREIGN KEY([CastID])
REFERENCES [Cast].[Cast] ([nconst])
GO
ALTER TABLE [Title].[ActedOn] CHECK CONSTRAINT [FK_Original_CastAct]
GO
ALTER TABLE [Title].[ActedOn]  WITH CHECK ADD  CONSTRAINT [FK_Original_TitleAct] FOREIGN KEY([TitleID])
REFERENCES [Title].[Title] ([tconst])
GO
ALTER TABLE [Title].[ActedOn] CHECK CONSTRAINT [FK_Original_TitleAct]
GO
ALTER TABLE [Title].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Original_CastDirector] FOREIGN KEY([director])
REFERENCES [Cast].[Cast] ([nconst])
GO
ALTER TABLE [Title].[Crew] CHECK CONSTRAINT [FK_Original_CastDirector]
GO
ALTER TABLE [Title].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Original_CastWriter] FOREIGN KEY([writer])
REFERENCES [Cast].[Cast] ([nconst])
GO
ALTER TABLE [Title].[Crew] CHECK CONSTRAINT [FK_Original_CastWriter]
GO
ALTER TABLE [Title].[Crew]  WITH CHECK ADD  CONSTRAINT [FK_Original_TitleCrew] FOREIGN KEY([tconst])
REFERENCES [Title].[Title] ([tconst])
GO
ALTER TABLE [Title].[Crew] CHECK CONSTRAINT [FK_Original_TitleCrew]
GO
ALTER TABLE [Title].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Original_TitleSeries] FOREIGN KEY([parentTconst])
REFERENCES [Title].[Title] ([tconst])
GO
ALTER TABLE [Title].[Episode] CHECK CONSTRAINT [FK_Original_TitleSeries]
GO
ALTER TABLE [Title].[PrincipalCast]  WITH CHECK ADD  CONSTRAINT [FK_Origina_CastPrincipal] FOREIGN KEY([nconst])
REFERENCES [Cast].[Cast] ([nconst])
GO
ALTER TABLE [Title].[PrincipalCast] CHECK CONSTRAINT [FK_Origina_CastPrincipal]
GO
ALTER TABLE [Title].[PrincipalCast]  WITH CHECK ADD  CONSTRAINT [FK_Original_TitlePrincipal] FOREIGN KEY([tconst])
REFERENCES [Title].[Title] ([tconst])
GO
ALTER TABLE [Title].[PrincipalCast] CHECK CONSTRAINT [FK_Original_TitlePrincipal]
GO
ALTER TABLE [Title].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Original_TitleRating] FOREIGN KEY([tconst])
REFERENCES [Title].[Title] ([tconst])
GO
ALTER TABLE [Title].[Rating] CHECK CONSTRAINT [FK_Original_TitleRating]
GO
ALTER TABLE [Title].[Title]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [Title].[Type] ([TypeID])
GO
ALTER TABLE [Title].[TitleGenre]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [Title].[Genre] ([GenreID])
GO
ALTER TABLE [Title].[TitleGenre]  WITH CHECK ADD  CONSTRAINT [FK_Original_TitleGenre] FOREIGN KEY([TitleID])
REFERENCES [Title].[Title] ([tconst])
GO
ALTER TABLE [Title].[TitleGenre] CHECK CONSTRAINT [FK_Original_TitleGenre]
GO
