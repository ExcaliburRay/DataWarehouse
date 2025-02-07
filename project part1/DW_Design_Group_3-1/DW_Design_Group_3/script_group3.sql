USE [Group_3_DB]
GO
/****** Object:  Table [dbo].[DateDim]    Script Date: 7/25/2019 8:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateDim](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[DateYear] [int] NOT NULL,
	[DateDay] [int] NOT NULL,
	[DateMonth] [int] NOT NULL,
 CONSTRAINT [PK_DateDim] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExporterDim]    Script Date: 7/25/2019 8:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExporterDim](
	[ExporterKey] [int] NOT NULL,
	[ExporterNumber] [int] NOT NULL,
	[ExporterAbbreviation] [varchar](50) NOT NULL,
	[ExporterName] [varchar](50) NOT NULL,
	[ExporterActiveFlag] [smallint] NOT NULL,
 CONSTRAINT [PK_ExporterDim] PRIMARY KEY CLUSTERED 
(
	[ExporterKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactTable]    Script Date: 7/25/2019 8:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactTable](
	[DateKey] [int] NOT NULL,
	[SpecieKey] [int] NOT NULL,
	[MarketingKey] [int] NOT NULL,
	[TermKey] [int] NOT NULL,
	[ImporterKey] [int] NOT NULL,
	[ExporterKey] [int] NOT NULL,
	[TransactionKey] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
 CONSTRAINT [PK_FactTable] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC,
	[SpecieKey] ASC,
	[MarketingKey] ASC,
	[TermKey] ASC,
	[ImporterKey] ASC,
	[ExporterKey] ASC,
	[TransactionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImporterDim]    Script Date: 7/25/2019 8:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImporterDim](
	[ImporterKey] [int] NOT NULL,
	[ImporterNumber] [int] NOT NULL,
	[ImporterAbbreviation] [varchar](50) NOT NULL,
	[ImporterName] [varchar](50) NOT NULL,
	[ImporterActiveFlag] [smallint] NOT NULL,
 CONSTRAINT [PK_ImporterDim] PRIMARY KEY CLUSTERED 
(
	[ImporterKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarketingDim]    Script Date: 7/25/2019 8:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarketingDim](
	[MarketingKey] [int] NOT NULL,
	[Purpose] [varchar](50) NULL,
	[PurposeDescription] [varchar](50) NULL,
	[SourceName] [varchar](50) NULL,
	[SourceDescription] [varchar](50) NULL,
	[MarketingActiveFlag] [smallint] NOT NULL,
 CONSTRAINT [PK_MarketingDim] PRIMARY KEY CLUSTERED 
(
	[MarketingKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecieDim]    Script Date: 7/25/2019 8:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecieDim](
	[SpecieKey] [int] NOT NULL,
	[AppClass] [varchar](50) NOT NULL,
	[Taxon] [varchar](50) NULL,
	[Class] [varchar](50) NULL,
	[OrderName] [varchar](50) NULL,
	[Family] [varchar](50) NULL,
	[Genus] [varchar](50) NULL,
	[Origin] [varchar](50) NULL,
 CONSTRAINT [PK_SpecieDim] PRIMARY KEY CLUSTERED 
(
	[SpecieKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TermDim]    Script Date: 7/25/2019 8:55:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TermDim](
	[TermKey] [int] NOT NULL,
	[Term] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TermDim] PRIMARY KEY CLUSTERED 
(
	[TermKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_FactTable_DateDim] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DateDim] ([DateKey])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_FactTable_DateDim]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_FactTable_ExporterDim] FOREIGN KEY([ExporterKey])
REFERENCES [dbo].[ExporterDim] ([ExporterKey])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_FactTable_ExporterDim]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_FactTable_ImporterDim] FOREIGN KEY([ImporterKey])
REFERENCES [dbo].[ImporterDim] ([ImporterKey])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_FactTable_ImporterDim]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_FactTable_MarketingDim] FOREIGN KEY([MarketingKey])
REFERENCES [dbo].[MarketingDim] ([MarketingKey])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_FactTable_MarketingDim]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_FactTable_SpecieDim] FOREIGN KEY([SpecieKey])
REFERENCES [dbo].[SpecieDim] ([SpecieKey])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_FactTable_SpecieDim]
GO
ALTER TABLE [dbo].[FactTable]  WITH CHECK ADD  CONSTRAINT [FK_FactTable_TermDim] FOREIGN KEY([TermKey])
REFERENCES [dbo].[TermDim] ([TermKey])
GO
ALTER TABLE [dbo].[FactTable] CHECK CONSTRAINT [FK_FactTable_TermDim]
GO
