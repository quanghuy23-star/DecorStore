USE [master]
GO

/****** Object:  Database [DecorStore]    Script Date: 3/1/2024 11:26:59 PM ******/
CREATE DATABASE [DecorStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DecorStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DecorStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DecorStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DecorStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DecorStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DecorStore] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DecorStore] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DecorStore] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DecorStore] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DecorStore] SET ARITHABORT OFF 
GO

ALTER DATABASE [DecorStore] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DecorStore] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DecorStore] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DecorStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DecorStore] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DecorStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DecorStore] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DecorStore] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DecorStore] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DecorStore] SET  ENABLE_BROKER 
GO

ALTER DATABASE [DecorStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DecorStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DecorStore] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DecorStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DecorStore] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DecorStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DecorStore] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DecorStore] SET RECOVERY FULL 
GO

ALTER DATABASE [DecorStore] SET  MULTI_USER 
GO

ALTER DATABASE [DecorStore] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DecorStore] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DecorStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DecorStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [DecorStore] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [DecorStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [DecorStore] SET QUERY_STORE = OFF
GO

ALTER DATABASE [DecorStore] SET  READ_WRITE 
GO
/*-----------------*/
USE [DecorStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2023 10:38:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
	[image] [text] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [date] NULL,
	[total] [float] NULL,
	[notes] [nvarchar](200) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[price] [float] NULL,
	[stock] [int] NULL,
	[category_id] [int] NULL,
	[img] [ntext] NULL,
	[description] [nvarchar](1000) NULL,
	[create_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/6/2023 10:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[gender] [bit] NULL,
	[phone] [nchar](11) NULL,
	[role_id] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/*Insert du lieu */
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (1, N'Table Decorations', N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/01/do-decor-dep.png')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (2, N'Wall Painting', N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/01/do-decor-treo-tuong.png')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (3, N'Clock Watcher', N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/01/dong-ho-treo-tuong.png')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (4, N'Decorative Flowerpot', N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/01/binh-hoa-decor-150x150-1.png')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (5, N'Feng Shui Items', N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/01/vat-pham-phong-thuy-icon.png')
INSERT [dbo].[Category] ([category_id], [category_name], [image]) VALUES (6, N'Derco Items', N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/01/qua-tang-sep-150x150-1.png')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (1, 9, CAST(N'2023-08-15' AS Date), 134, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (2, 9, CAST(N'2023-10-23' AS Date), 54, N'please carefully')
INSERT [dbo].[Order] ([order_id], [user_id], [order_date], [total], [notes]) VALUES (3, 2, CAST(N'2023-11-05' AS Date), 60, N'')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (1, 1, 2, 80, 1)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (2, 1, 5, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (3, 2, 3, 18, 3)
INSERT [dbo].[OrderDetail] ([detail_id], [order_id], [product_id], [price], [quantity]) VALUES (4, 3, 6, 20, 3)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
DELETE FROM Product WHERE product_id = 2;

SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (1, N'Tranh khảm trai hoa sen xanh', 100, 80, 2, N'https://congdecor.com/wp-content/uploads/2023/12/tranh-kham-trai-hoa-sen-xanh-4.jpg', N'Tranh khảm trai hoa sen xanh Kích thướcD90cm x C90cm', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (2, N'Tranh khảm trai hình cây và hoa', 80, 99, 2, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/12/tranh-kham-tra-hoa-va-la-3.jpg', N'Tranh khảm trai hình cây và hoa Kích thước: D80cm x C120cm', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (3, N'Tượng voi khóa ngọc', 18, 86, 1, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/11/tuong-voi-khoa-ngoc-1-768x768.jpg', N'Tượng voi khóa ngọc Kích thước: D23cm * R10cm * C26cm Chất liệu: Kim loại + ngọc bích <FREESHIP + Lắp đặt nội thành Hà Nội>', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (4, N'Mô hình con công nghệ thuật để bàn', 67, 50, 1, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/10/mo-hinh-con-cong-nghe-thuat-3-768x768.jpg', N'Mô hình con công nghệ thuật để bàn. Kích thước: D20cm x R9cm x C66cm. Chất liệu: hợp kim', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (5, N'Đồng hồ treo tường sáng tạo CD1809', 18, 77, 3, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/03/dong-ho-treo-tuong-sang-tao-1-768x768.jpg', N'Đồng hồ treo tường sáng tạo CD1809. Kích thước: D110cm * C50cm - Vật liệu: kim loại-Phong cách: hiện đại - Mẫu mã: Loại thường không đèn led và loại kết hợp đèn led + điều khiển', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (6, N'Đồng hồ treo tường núi đồi hùng vỹ', 20, 67, 3, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2022/03/dong-ho-treo-tuong-trang-tri-dep-768x768.jpg', N'Đồng hồ treo tường đồi núi hùng vỹ-Chất liệu: hợp kim-Kích thước: 108cm x 55cm-Trọng lượng: 3kg', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (7, N'Bình hoa thủy tinh sang trọng', 29, 90, 4, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2024/01/binh-hoa-thuy-tinh-sang-trong-1-768x768.jpg', N'Bình hoa thủy tinh sang trọng', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (8, N'Bình hoa thủy tinh chim vẹt', 79, 90, 4, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2022/12/binh-hoa-thuy-tinh-chim-vet-1-768x768.jpg', N'Bình hoa thủy tinh chim vẹt', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (9, N'Tượng Quan Thế Âm bồ Tát', 30, 80, 5, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2024/01/tuong-quan-the-am-bo-tat-2.jpg', N'Tượng Quan Thế Âm bồ Tát', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (10, N'Thác khói trầm hương mặt Phật', 20, 100, 5, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2023/04/thac-khoi-tram-huong-mat-phat-1-768x768.jpg', N'Thác khói trầm hương mặt Phật', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (11, N'Tượng ngựa điêu khắc nghệ thuật', 19, 200, 6, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2024/03/tuong-ngua-dieu-khac-nghe-thuat-2-768x768.jpg', N'Tượng ngựa điêu khắc nghệ thuật', CAST(N'2023-03-08' AS Date))
INSERT [dbo].[Product] ([product_id], [product_name], [price], [stock], [category_id], [img], [description], [create_date]) VALUES (12, N'Mô hình điêu khắc decor sảnh', 20, 200, 6, N'https://d3l1uyhhd4oess.cloudfront.net/wp-content/uploads/2024/02/mo-hinh-dieu-khac-decor-sanh-5.jpg', N'Mô hình điêu khắc decor sảnh', CAST(N'2023-03-08' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (1, N'abc', N'abc@gmail.com', N'123', N'Ho Chi Minh', 1, N'0987654321 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (2, N'admin', N'admin@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'AD')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (5, N'student1', N'123@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (6, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (7, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (8, N'student1', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [address], [gender], [phone], [role_id]) VALUES (9, N'caa', N'abc@gmail.com', N'123', N'Ha Noi', 1, N'0123456789 ', N'US')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO


