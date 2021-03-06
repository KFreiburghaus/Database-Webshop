USE [Webshop]
GO
/****** Object:  Table [dbo].[Artikel]    Script Date: 18.01.2020 22:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artikel](
	[ArtikelID] [bigint] IDENTITY(1,1) NOT NULL,
	[ArtikelBeschreibung] [nvarchar](50) NULL,
	[ArtikelBild] [ntext] NULL,
	[UnterkategorieID] [bigint] NULL,
	[Einkaufspreis] [float] NULL,
	[Verkaufspreis] [float] NULL,
 CONSTRAINT [PK_Artikel] PRIMARY KEY CLUSTERED 
(
	[ArtikelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bestellstatus]    Script Date: 18.01.2020 22:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestellstatus](
	[BestellstatusID] [bigint] IDENTITY(1,1) NOT NULL,
	[Bestellstatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bestellstatus] PRIMARY KEY CLUSTERED 
(
	[BestellstatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bestellungen]    Script Date: 18.01.2020 22:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestellungen](
	[BestellID] [bigint] IDENTITY(1,1) NOT NULL,
	[Auftragsnummer] [bigint] NULL,
	[ArtikelID] [bigint] NULL,
	[KundenID] [bigint] NULL,
	[BestellstatusID] [bigint] NULL,
	[BestellZeitpunkt] [datetime2](7) NULL,
	[Bewertung] [int] NULL,
 CONSTRAINT [PK_Bestellungen] PRIMARY KEY CLUSTERED 
(
	[BestellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunde]    Script Date: 18.01.2020 22:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde](
	[KundenID] [bigint] IDENTITY(1,1) NOT NULL,
	[Anrede] [nvarchar](50) NULL,
	[Vorname] [nvarchar](50) NULL,
	[Nachname] [nvarchar](50) NULL,
	[Adresse] [nvarchar](50) NULL,
	[PLZ] [bigint] NULL,
	[Wohnort] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Geburtsdatum] [date] NULL,
	[PreisgruppenID] [bigint] NULL,
 CONSTRAINT [PK_Kunde] PRIMARY KEY CLUSTERED 
(
	[KundenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oberkategorie]    Script Date: 18.01.2020 22:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oberkategorie](
	[OberkategorieID] [bigint] IDENTITY(1,1) NOT NULL,
	[OberkategorieBeschreibung] [nvarchar](50) NULL,
 CONSTRAINT [PK_Oberkategorie] PRIMARY KEY CLUSTERED 
(
	[OberkategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preisgruppen]    Script Date: 18.01.2020 22:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preisgruppen](
	[PreisgruppenID] [bigint] IDENTITY(1,1) NOT NULL,
	[PreisgruppenName] [nvarchar](50) NULL,
	[PreisReduktion] [float] NULL,
 CONSTRAINT [PK_Preisgruppen] PRIMARY KEY CLUSTERED 
(
	[PreisgruppenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unterkategorie]    Script Date: 18.01.2020 22:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unterkategorie](
	[UnterkategorieID] [bigint] IDENTITY(1,1) NOT NULL,
	[UnterkategorieBeschreibung] [nvarchar](50) NULL,
	[OberkategorieID] [bigint] NULL,
 CONSTRAINT [PK_Unterkategorie] PRIMARY KEY CLUSTERED 
(
	[UnterkategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Artikel] ON 

INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (1, N'iPhone7 Plus Hülle', N'/home/artikel/iPhone/iphone7_p_hülle.jpg', 1, 2.3, 6.95)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (2, N'iPhone7 Plus', N'/home/artikel/iphone/iphone7_p.jpg', 1, 699, 750)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (3, N'Samsung Galaxy A40', N'/home/artikel/samsung/galaxy_a40.jpg', 2, 210, 229.95)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (4, N'Samsung Galaxy A40 Hülle', N'/home/artikel/samsung/galaxy_a40_hülle.jpg', 2, 12.1, 15.95)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (5, N'Samsung Galaxy A40 Panzerglas', N'/home/artikel/samsung/galaxy_a40_panzerglas.jpg', 2, 11.75, 19.95)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (6, N'Longarm Shirt XL Men', N'/home/artikel/longarm_shirt_xl_men.jpg', 3, 9.95, 14.95)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (7, N'Tank Top XL Men', N'/home/artikel/tanktop_xl_men.jpg', 3, 7.25, 12)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (8, N'Top XS Women', N'/home/artikel/top_xs_women.jpg', 4, 7.25, 12.95)
INSERT [dbo].[Artikel] ([ArtikelID], [ArtikelBeschreibung], [ArtikelBild], [UnterkategorieID], [Einkaufspreis], [Verkaufspreis]) VALUES (9, N'Bluse S Women', N'/home/artikel/bluse_s_women.jpg', 4, 19.95, 34.95)
SET IDENTITY_INSERT [dbo].[Artikel] OFF
SET IDENTITY_INSERT [dbo].[Bestellstatus] ON 

INSERT [dbo].[Bestellstatus] ([BestellstatusID], [Bestellstatus]) VALUES (1, N'im Warenkorb')
INSERT [dbo].[Bestellstatus] ([BestellstatusID], [Bestellstatus]) VALUES (2, N'bestellt')
INSERT [dbo].[Bestellstatus] ([BestellstatusID], [Bestellstatus]) VALUES (3, N'geliefert')
SET IDENTITY_INSERT [dbo].[Bestellstatus] OFF
SET IDENTITY_INSERT [dbo].[Bestellungen] ON 

INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (1, 1000, 4, 1, 3, CAST(N'2020-01-13T15:36:57.0000000' AS DateTime2), 7)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (2, 1000, 3, 1, 3, CAST(N'2020-01-13T15:36:57.0000000' AS DateTime2), 8)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (3, 1001, 7, 2, 2, CAST(N'2020-01-13T15:37:56.0000000' AS DateTime2), 4)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (4, 1001, 9, 2, 2, CAST(N'2020-01-13T15:37:56.0000000' AS DateTime2), 4)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (5, 1001, 8, 2, 2, CAST(N'2020-01-13T15:37:56.0000000' AS DateTime2), 7)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (6, 1002, 7, 4, 2, CAST(N'2020-01-13T15:45:24.0000000' AS DateTime2), 1)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (7, 1002, 9, 4, 2, CAST(N'2020-01-13T15:45:24.0000000' AS DateTime2), NULL)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (8, 1002, 2, 4, 2, CAST(N'2020-01-13T15:45:24.0000000' AS DateTime2), NULL)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (9, 1003, 1, 3, 2, CAST(N'2020-01-13T15:47:33.0000000' AS DateTime2), 7)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (10, 1003, 2, 3, 2, CAST(N'2020-01-13T15:47:33.0000000' AS DateTime2), NULL)
INSERT [dbo].[Bestellungen] ([BestellID], [Auftragsnummer], [ArtikelID], [KundenID], [BestellstatusID], [BestellZeitpunkt], [Bewertung]) VALUES (11, 1004, 7, 4, 1, CAST(N'2020-01-14T09:19:27.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Bestellungen] OFF
SET IDENTITY_INSERT [dbo].[Kunde] ON 

INSERT [dbo].[Kunde] ([KundenID], [Anrede], [Vorname], [Nachname], [Adresse], [PLZ], [Wohnort], [Telefon], [Email], [Geburtsdatum], [PreisgruppenID]) VALUES (1, N'Herr', N'David', N'Freiburghaus', N'Spittelhausweg 10', 3065, N'Bolligen', N'796754452', N'19david98@gmx.ch', CAST(N'1998-05-17' AS Date), 1)
INSERT [dbo].[Kunde] ([KundenID], [Anrede], [Vorname], [Nachname], [Adresse], [PLZ], [Wohnort], [Telefon], [Email], [Geburtsdatum], [PreisgruppenID]) VALUES (2, N'Frau', N'Susanne', N'Häberli', N'Postfach 12', 1234, N'Bern', N'791234567', N'susanne@sunrise.ch', CAST(N'1979-11-18' AS Date), 1)
INSERT [dbo].[Kunde] ([KundenID], [Anrede], [Vorname], [Nachname], [Adresse], [PLZ], [Wohnort], [Telefon], [Email], [Geburtsdatum], [PreisgruppenID]) VALUES (3, N'Frau', N'Alex', N'Alex', N'Alexweg 12', 1111, N'Israel', N'778889900', N'alex.alex@alex.com', CAST(N'2020-01-01' AS Date), 2)
INSERT [dbo].[Kunde] ([KundenID], [Anrede], [Vorname], [Nachname], [Adresse], [PLZ], [Wohnort], [Telefon], [Email], [Geburtsdatum], [PreisgruppenID]) VALUES (4, N'Herr', N'Kaspar', N'Freiburhaus', N'Spittelhausweg 10', 3065, N'Bolligen', N'799180300', N'kaspar.freiburghaus@protonmail.ch', CAST(N'1996-01-23' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Kunde] OFF
SET IDENTITY_INSERT [dbo].[Oberkategorie] ON 

INSERT [dbo].[Oberkategorie] ([OberkategorieID], [OberkategorieBeschreibung]) VALUES (1, N'Elektronik')
INSERT [dbo].[Oberkategorie] ([OberkategorieID], [OberkategorieBeschreibung]) VALUES (2, N'Kleider')
SET IDENTITY_INSERT [dbo].[Oberkategorie] OFF
SET IDENTITY_INSERT [dbo].[Preisgruppen] ON 

INSERT [dbo].[Preisgruppen] ([PreisgruppenID], [PreisgruppenName], [PreisReduktion]) VALUES (1, N'Schüler', 0.8)
INSERT [dbo].[Preisgruppen] ([PreisgruppenID], [PreisgruppenName], [PreisReduktion]) VALUES (2, N'Endkunde', 1)
INSERT [dbo].[Preisgruppen] ([PreisgruppenID], [PreisgruppenName], [PreisReduktion]) VALUES (3, N'Händler', 0.85)
SET IDENTITY_INSERT [dbo].[Preisgruppen] OFF
SET IDENTITY_INSERT [dbo].[Unterkategorie] ON 

INSERT [dbo].[Unterkategorie] ([UnterkategorieID], [UnterkategorieBeschreibung], [OberkategorieID]) VALUES (1, N'Apple Geräte & Zubehör', 1)
INSERT [dbo].[Unterkategorie] ([UnterkategorieID], [UnterkategorieBeschreibung], [OberkategorieID]) VALUES (2, N'Samsung Geräte & Zubehör', 1)
INSERT [dbo].[Unterkategorie] ([UnterkategorieID], [UnterkategorieBeschreibung], [OberkategorieID]) VALUES (3, N'Kleider Männer', 2)
INSERT [dbo].[Unterkategorie] ([UnterkategorieID], [UnterkategorieBeschreibung], [OberkategorieID]) VALUES (4, N'Kleider Frauen', 2)
SET IDENTITY_INSERT [dbo].[Unterkategorie] OFF
ALTER TABLE [dbo].[Artikel]  WITH CHECK ADD  CONSTRAINT [FK_Artikel_Unterkategorie] FOREIGN KEY([UnterkategorieID])
REFERENCES [dbo].[Unterkategorie] ([UnterkategorieID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Artikel] CHECK CONSTRAINT [FK_Artikel_Unterkategorie]
GO
ALTER TABLE [dbo].[Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_Bestellungen_Artikel] FOREIGN KEY([ArtikelID])
REFERENCES [dbo].[Artikel] ([ArtikelID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bestellungen] CHECK CONSTRAINT [FK_Bestellungen_Artikel]
GO
ALTER TABLE [dbo].[Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_Bestellungen_Bestellstatus] FOREIGN KEY([BestellstatusID])
REFERENCES [dbo].[Bestellstatus] ([BestellstatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bestellungen] CHECK CONSTRAINT [FK_Bestellungen_Bestellstatus]
GO
ALTER TABLE [dbo].[Bestellungen]  WITH CHECK ADD  CONSTRAINT [FK_Bestellungen_Kunde] FOREIGN KEY([KundenID])
REFERENCES [dbo].[Kunde] ([KundenID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bestellungen] CHECK CONSTRAINT [FK_Bestellungen_Kunde]
GO
ALTER TABLE [dbo].[Kunde]  WITH CHECK ADD  CONSTRAINT [FK_Kunde_Preisgruppen] FOREIGN KEY([PreisgruppenID])
REFERENCES [dbo].[Preisgruppen] ([PreisgruppenID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Kunde] CHECK CONSTRAINT [FK_Kunde_Preisgruppen]
GO
ALTER TABLE [dbo].[Unterkategorie]  WITH CHECK ADD  CONSTRAINT [FK_Unterkategorie_Oberkategorie] FOREIGN KEY([OberkategorieID])
REFERENCES [dbo].[Oberkategorie] ([OberkategorieID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Unterkategorie] CHECK CONSTRAINT [FK_Unterkategorie_Oberkategorie]
GO
