USE [master]
GO
/****** Object:  Database [DbHomeworkSocial]    Script Date: 4.06.2022 11:14:41 ******/
CREATE DATABASE [DbHomeworkSocial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbHomeworkSocial', FILENAME = N'E:\MsSql\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbHomeworkSocial.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbHomeworkSocial_log', FILENAME = N'E:\MsSql\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbHomeworkSocial_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbHomeworkSocial] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbHomeworkSocial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbHomeworkSocial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbHomeworkSocial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbHomeworkSocial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DbHomeworkSocial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbHomeworkSocial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET RECOVERY FULL 
GO
ALTER DATABASE [DbHomeworkSocial] SET  MULTI_USER 
GO
ALTER DATABASE [DbHomeworkSocial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbHomeworkSocial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbHomeworkSocial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbHomeworkSocial] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbHomeworkSocial] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbHomeworkSocial] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbHomeworkSocial', N'ON'
GO
ALTER DATABASE [DbHomeworkSocial] SET QUERY_STORE = OFF
GO
USE [DbHomeworkSocial]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contents](
	[CommentID] [tinyint] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](10) NULL,
	[Post] [tinyint] NULL,
	[Content] [nvarchar](500) NULL,
	[SendDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[FriendshipID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](10) NOT NULL,
	[Receiver] [nvarchar](10) NOT NULL,
	[Confirmation] [bit] NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[FriendshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendshipConfirmations]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendshipConfirmations](
	[ConfirmationID] [tinyint] IDENTITY(1,1) NOT NULL,
	[FriendshipSender] [nvarchar](10) NULL,
	[FriendshipReceiver] [nvarchar](10) NULL,
	[Confirmation] [bit] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_FriendshipConfirmation] PRIMARY KEY CLUSTERED 
(
	[ConfirmationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](15) NOT NULL,
	[Member] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryMessages]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryMessages](
	[HistoryMessageID] [tinyint] IDENTITY(1,1) NOT NULL,
	[MessageID] [tinyint] NULL,
	[Sender] [nvarchar](10) NULL,
	[Subject] [nvarchar](20) NULL,
	[MessageContent] [nvarchar](500) NULL,
	[recipient] [nvarchar](10) NULL,
	[additional] [nvarchar](999) NULL,
	[SendDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[MessageType] [nvarchar](5) NULL,
 CONSTRAINT [PK_HistoryMessage] PRIMARY KEY CLUSTERED 
(
	[HistoryMessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryPosts]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryPosts](
	[HistoryPostID] [tinyint] IDENTITY(1,1) NOT NULL,
	[PostID] [tinyint] NULL,
	[User] [nvarchar](10) NULL,
	[PostContent] [nvarchar](500) NULL,
	[Additional] [nvarchar](999) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[HistoryPostType] [nvarchar](5) NULL,
 CONSTRAINT [PK_HistoryPosts] PRIMARY KEY CLUSTERED 
(
	[HistoryPostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](10) NOT NULL,
	[Subject] [nvarchar](20) NOT NULL,
	[MessageContent] [nvarchar](500) NULL,
	[Recipient] [nvarchar](10) NULL,
	[Additional] [nvarchar](999) NULL,
	[SendDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[MessageType] [nvarchar](5) NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [tinyint] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](10) NOT NULL,
	[PostContent] [nvarchar](500) NULL,
	[Additional] [nvarchar](999) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[PostType] [nvarchar](5) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Nickname] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Nickname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Friends] ON 

INSERT [dbo].[Friends] ([FriendshipID], [Sender], [Receiver], [Confirmation]) VALUES (1, N'Karabela', N'Aynasız', 1)
INSERT [dbo].[Friends] ([FriendshipID], [Sender], [Receiver], [Confirmation]) VALUES (2, N'Karabela', N'ABC2', 1)
INSERT [dbo].[Friends] ([FriendshipID], [Sender], [Receiver], [Confirmation]) VALUES (3, N'ABC1', N'ABC3', 0)
INSERT [dbo].[Friends] ([FriendshipID], [Sender], [Receiver], [Confirmation]) VALUES (5, N'Aynasız ', N'ABC2', 1)
SET IDENTITY_INSERT [dbo].[Friends] OFF
GO
SET IDENTITY_INSERT [dbo].[FriendshipConfirmations] ON 

INSERT [dbo].[FriendshipConfirmations] ([ConfirmationID], [FriendshipSender], [FriendshipReceiver], [Confirmation], [Date]) VALUES (2, N'Aynasız ', N'ABC2', 1, CAST(N'2022-06-02T22:23:54.013' AS DateTime))
SET IDENTITY_INSERT [dbo].[FriendshipConfirmations] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([ID], [GroupName], [Member]) VALUES (1, N'1', N'Karabela')
INSERT [dbo].[Groups] ([ID], [GroupName], [Member]) VALUES (3, N'1', N'ABC1')
INSERT [dbo].[Groups] ([ID], [GroupName], [Member]) VALUES (4, N'Yıldızlar', N'ABC2')
INSERT [dbo].[Groups] ([ID], [GroupName], [Member]) VALUES (5, N'Yıldızlar', N'Aynasız')
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryMessages] ON 

INSERT [dbo].[HistoryMessages] ([HistoryMessageID], [MessageID], [Sender], [Subject], [MessageContent], [recipient], [additional], [SendDate], [UpdateDate], [MessageType]) VALUES (24, 6, N'ABC1', N'ASDS', N'ASDASD', N'Yıldızlar', N'https://www.gazeteilksayfa.com/d/gallery/331_1.jpg', CAST(N'2022-11-08T00:00:00.000' AS DateTime), CAST(N'2022-06-03T11:58:34.677' AS DateTime), N'Video')
INSERT [dbo].[HistoryMessages] ([HistoryMessageID], [MessageID], [Sender], [Subject], [MessageContent], [recipient], [additional], [SendDate], [UpdateDate], [MessageType]) VALUES (25, 6, N'ABC1', N'ASDS', N'aaa', N'Yıldızlar', N'https://www.gazeteilksayfa.com/d/gallery/331_1.jpg', CAST(N'2022-11-08T00:00:00.000' AS DateTime), CAST(N'2022-06-03T11:58:49.390' AS DateTime), N'Video')
SET IDENTITY_INSERT [dbo].[HistoryMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryPosts] ON 

INSERT [dbo].[HistoryPosts] ([HistoryPostID], [PostID], [User], [PostContent], [Additional], [CreatedDate], [UpdateDate], [HistoryPostType]) VALUES (14, 1, N'Karabela', N'guncelleme1', NULL, CAST(N'2022-06-02T21:35:14.500' AS DateTime), CAST(N'2022-06-03T12:20:51.930' AS DateTime), N'Video')
INSERT [dbo].[HistoryPosts] ([HistoryPostID], [PostID], [User], [PostContent], [Additional], [CreatedDate], [UpdateDate], [HistoryPostType]) VALUES (16, 1, N'Karabela', N'guncelleme2', N'www.abc.com/Video', CAST(N'2022-06-02T21:35:14.500' AS DateTime), CAST(N'2022-06-03T12:21:26.510' AS DateTime), N'Video')
INSERT [dbo].[HistoryPosts] ([HistoryPostID], [PostID], [User], [PostContent], [Additional], [CreatedDate], [UpdateDate], [HistoryPostType]) VALUES (17, 5, N'Aynasız', N'yeni', NULL, CAST(N'2022-06-02T21:35:14.500' AS DateTime), CAST(N'2022-06-03T12:21:42.800' AS DateTime), N'Text')
SET IDENTITY_INSERT [dbo].[HistoryPosts] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageID], [Sender], [Subject], [MessageContent], [Recipient], [Additional], [SendDate], [UpdateDate], [MessageType]) VALUES (1, N'Karabela', N'futbol', N'selamlarR', N'Aynasız', N'https://www.gazeteilksayfa.com/d/gallery/331_1.jpg', CAST(N'1998-12-12T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Video')
INSERT [dbo].[Messages] ([MessageID], [Sender], [Subject], [MessageContent], [Recipient], [Additional], [SendDate], [UpdateDate], [MessageType]) VALUES (3, N'ABC1', N'Spor', N'asdasdasda', N'1', NULL, CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Text')
INSERT [dbo].[Messages] ([MessageID], [Sender], [Subject], [MessageContent], [Recipient], [Additional], [SendDate], [UpdateDate], [MessageType]) VALUES (4, N'ABC2', N'Bilim', NULL, N'1', N'https://www.gazeteilksayfa.com/d/gallery/331_1.jpg', CAST(N'2022-11-02T00:00:00.000' AS DateTime), CAST(N'2022-11-02T00:00:00.000' AS DateTime), N'Image')
INSERT [dbo].[Messages] ([MessageID], [Sender], [Subject], [MessageContent], [Recipient], [Additional], [SendDate], [UpdateDate], [MessageType]) VALUES (5, N'Karabela', N'Haberler', N'SDFSDFSF', N'ABC1', NULL, CAST(N'2022-11-12T00:00:00.000' AS DateTime), CAST(N'2022-11-12T00:00:00.000' AS DateTime), N'Text')
INSERT [dbo].[Messages] ([MessageID], [Sender], [Subject], [MessageContent], [Recipient], [Additional], [SendDate], [UpdateDate], [MessageType]) VALUES (6, N'ABC1', N'ASDS', N'aaaa', N'Yıldızlar', N'https://www.gazeteilksayfa.com/d/gallery/331_1.jpg', CAST(N'2022-11-08T00:00:00.000' AS DateTime), CAST(N'2022-11-08T00:00:00.000' AS DateTime), N'Video')
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostID], [User], [PostContent], [Additional], [CreatedDate], [UpdateDate], [PostType]) VALUES (1, N'Karabela', N'guncelleme3', N'www.abc.com/Video', CAST(N'2022-06-02T21:35:14.500' AS DateTime), CAST(N'2022-06-02T21:35:14.500' AS DateTime), N'Video')
INSERT [dbo].[Posts] ([PostID], [User], [PostContent], [Additional], [CreatedDate], [UpdateDate], [PostType]) VALUES (5, N'Aynasız', N'yeni1', NULL, CAST(N'2022-06-02T21:35:14.500' AS DateTime), CAST(N'2022-06-02T21:35:14.500' AS DateTime), N'Text')
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
INSERT [dbo].[Users] ([Nickname]) VALUES (N'ABC1')
INSERT [dbo].[Users] ([Nickname]) VALUES (N'ABC2')
INSERT [dbo].[Users] ([Nickname]) VALUES (N'ABC3')
INSERT [dbo].[Users] ([Nickname]) VALUES (N'Aynasız')
INSERT [dbo].[Users] ([Nickname]) VALUES (N'Karabela')
INSERT [dbo].[Users] ([Nickname]) VALUES (N'Ninja1')
GO
ALTER TABLE [dbo].[Contents]  WITH CHECK ADD  CONSTRAINT [FK_Contents_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Contents] CHECK CONSTRAINT [FK_Contents_Users]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Users1] FOREIGN KEY([Receiver])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Users1]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Users2] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Users2]
GO
ALTER TABLE [dbo].[FriendshipConfirmations]  WITH CHECK ADD  CONSTRAINT [FK_FriendshipConfirmation_Users] FOREIGN KEY([FriendshipReceiver])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[FriendshipConfirmations] CHECK CONSTRAINT [FK_FriendshipConfirmation_Users]
GO
ALTER TABLE [dbo].[FriendshipConfirmations]  WITH CHECK ADD  CONSTRAINT [FK_FriendshipConfirmation_Users1] FOREIGN KEY([FriendshipSender])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[FriendshipConfirmations] CHECK CONSTRAINT [FK_FriendshipConfirmation_Users1]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Users] FOREIGN KEY([Member])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_Users]
GO
ALTER TABLE [dbo].[HistoryPosts]  WITH CHECK ADD  CONSTRAINT [FK_HistoryPosts_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[HistoryPosts] CHECK CONSTRAINT [FK_HistoryPosts_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users1] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users1]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([User])
REFERENCES [dbo].[Users] ([Nickname])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
/****** Object:  StoredProcedure [dbo].[MostMessage]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[MostMessage]
as
Select Sender , COUNT(*) ToplamMesaj from Messages Group By Sender Order By ToplamMesaj DESC
GO
/****** Object:  Trigger [dbo].[triggerFriendConfirmation]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger  [dbo].[triggerFriendConfirmation]
on [dbo].[Friends]
after insert
as 
Declare @Sender nvarchar(10), @Receiver nvarchar(10)
Select @Sender = Sender , @Receiver = Receiver from inserted
insert FriendshipConfirmation Values (@Sender , @Receiver , 0, GETDATE()) 
GO
ALTER TABLE [dbo].[Friends] ENABLE TRIGGER [triggerFriendConfirmation]
GO
/****** Object:  Trigger [dbo].[triggerFriendConfirmationContext]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Trigger  [dbo].[triggerFriendConfirmationContext]
on [dbo].[FriendshipConfirmations]
after update
as 
Declare @Confirmation bit, @Sender nvarchar(10), @Receiver nvarchar(10) 
Select @Confirmation = Confirmation , @Sender = FriendshipSender , @Receiver = FriendshipReceiver from inserted

update Friends Set Confirmation = @Confirmation Where Sender = @Sender and Receiver = @Receiver
GO
ALTER TABLE [dbo].[FriendshipConfirmations] ENABLE TRIGGER [triggerFriendConfirmationContext]
GO
/****** Object:  Trigger [dbo].[triggerMessages]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Trigger  [dbo].[triggerMessages]
on [dbo].[Messages]
after update
as 
Declare @MessageID tinyint, @Sender nvarchar(10), @Subject nvarchar(20), @MessageContent nvarchar(500), @recipient nvarchar(10), @additional nvarchar(999), @SendDate datetime , @UpdateDate  datetime, @MessageType nvarchar(5)
Select @MessageID = MessageID ,@Sender = deleted.Sender , @Subject = deleted.[Subject] , @MessageContent = MessageContent, @recipient = recipient, @additional = additional,  @SendDate = SendDate, @UpdateDate = GETDATE(), @MessageType = MessageType   from deleted
insert HistoryMessages  Values (@MessageID, @Sender , @Subject , @MessageContent, @recipient,@additional, @SendDate,  @UpdateDate , @MessageType)
GO
ALTER TABLE [dbo].[Messages] ENABLE TRIGGER [triggerMessages]
GO
/****** Object:  Trigger [dbo].[triggerPosts]    Script Date: 4.06.2022 11:14:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger  [dbo].[triggerPosts]
on [dbo].[Posts]
after update
as 
Declare @PostID tinyint, @User nvarchar(10), @PostContent nvarchar(500), @Additional nvarchar(999), @CreatedDate Datetime, @UpdateDate datetime, @HistoryPostType nvarchar(5)
Select @PostID = PostID , @User = deleted.[User] , @PostContent = PostContent , @Additional = Additional, @CreatedDate = CreatedDate, @UpdateDate = GETDATE(), @HistoryPostType = PostType from deleted
insert HistoryPosts  Values (@PostID ,@User , @PostContent, @Additional ,@CreatedDate, @UpdateDate, @HistoryPostType)
GO
ALTER TABLE [dbo].[Posts] ENABLE TRIGGER [triggerPosts]
GO
USE [master]
GO
ALTER DATABASE [DbHomeworkSocial] SET  READ_WRITE 
GO
