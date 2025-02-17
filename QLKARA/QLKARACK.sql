USE [master]
GO
/****** Object:  Database [QLKARA]    Script Date: 1/11/2021 3:25:36 AM ******/
CREATE DATABASE [QLKARA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKARA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLKARA.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLKARA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLKARA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLKARA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLKARA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLKARA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLKARA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLKARA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLKARA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLKARA] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLKARA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLKARA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLKARA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLKARA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLKARA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLKARA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLKARA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLKARA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLKARA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLKARA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLKARA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLKARA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLKARA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLKARA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLKARA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLKARA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLKARA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLKARA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLKARA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLKARA] SET  MULTI_USER 
GO
ALTER DATABASE [QLKARA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLKARA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLKARA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLKARA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLKARA]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[taikhoan] [nvarchar](50) NULL,
	[matkhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[danh_muc]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_muc](
	[danhmuc] [int] IDENTITY(1,1) NOT NULL,
	[tendanhmuc] [nvarchar](100) NULL,
 CONSTRAINT [PK_danh_muc] PRIMARY KEY CLUSTERED 
(
	[danhmuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[datphong]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datphong](
	[MaDatPhong] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[sdt] [nchar](10) NULL,
	[thoigianvao] [datetime] NULL,
	[thoigianra] [datetime] NULL,
	[MaPhong] [int] NULL,
	[TrangThai] [bit] NULL CONSTRAINT [DF_datphong_TrangThai]  DEFAULT ((0)),
 CONSTRAINT [PK_datphong] PRIMARY KEY CLUSTERED 
(
	[MaDatPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dichvu]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dichvu](
	[MaDichVu] [int] IDENTITY(1,1) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[Gia] [float] NULL,
	[danhmuc] [int] NULL,
	[MoTa] [nvarchar](100) NULL,
 CONSTRAINT [PK_dichvu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[IDHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaDatPhong] [int] NULL,
	[NgayGioTao] [datetime] NULL,
	[soGio] [int] NULL,
	[giaTien] [float] NULL,
	[giaDichVu] [float] NULL,
	[TongTien] [float] NULL,
	[TrangThai] [bit] NULL CONSTRAINT [DF_bills_bill_status]  DEFAULT ((0)),
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[loaiphong]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaiphong](
	[MaLoaiPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiPhong] [nvarchar](100) NULL,
 CONSTRAINT [PK_loaiphong1] PRIMARY KEY CLUSTERED 
(
	[MaLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[phong]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phong](
	[MaPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL DEFAULT ((0)),
	[MaLoaiPhong] [int] NULL,
 CONSTRAINT [PK_phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sudungdv]    Script Date: 1/11/2021 3:25:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sudungdv](
	[madatdv] [int] IDENTITY(1,1) NOT NULL,
	[MaDatPhong] [int] NULL,
	[MaDichVu] [int] NULL,
	[SoLuong] [int] NULL,
	[Gia] [float] NULL,
	[IDHoaDon] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_sudungdv] PRIMARY KEY CLUSTERED 
(
	[madatdv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([admin_id], [taikhoan], [matkhau]) VALUES (1, N'admin', N'145632')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[danh_muc] ON 

INSERT [dbo].[danh_muc] ([danhmuc], [tendanhmuc]) VALUES (1, N'Nước uống')
INSERT [dbo].[danh_muc] ([danhmuc], [tendanhmuc]) VALUES (2, N'Bánh')
INSERT [dbo].[danh_muc] ([danhmuc], [tendanhmuc]) VALUES (3, N'Bia')
SET IDENTITY_INSERT [dbo].[danh_muc] OFF
SET IDENTITY_INSERT [dbo].[datphong] ON 

INSERT [dbo].[datphong] ([MaDatPhong], [HoTen], [sdt], [thoigianvao], [thoigianra], [MaPhong], [TrangThai]) VALUES (1, N'Bảo Trần', N'0975853528', CAST(N'2021-01-10 12:57:00.000' AS DateTime), CAST(N'2021-01-10 13:57:00.000' AS DateTime), 1, 1)
INSERT [dbo].[datphong] ([MaDatPhong], [HoTen], [sdt], [thoigianvao], [thoigianra], [MaPhong], [TrangThai]) VALUES (2, N'Trần Quốc Bảo1', N'0827990766', CAST(N'2021-01-11 03:23:00.000' AS DateTime), CAST(N'2021-01-11 05:25:00.000' AS DateTime), 1, 1)
INSERT [dbo].[datphong] ([MaDatPhong], [HoTen], [sdt], [thoigianvao], [thoigianra], [MaPhong], [TrangThai]) VALUES (3, N'Nguyễn Thanh Phúc', N'0914276259', CAST(N'2021-01-11 03:58:00.000' AS DateTime), CAST(N'2021-01-11 08:58:00.000' AS DateTime), 1, 1)
INSERT [dbo].[datphong] ([MaDatPhong], [HoTen], [sdt], [thoigianvao], [thoigianra], [MaPhong], [TrangThai]) VALUES (4, N'Bảo Trần', N'0975853528', CAST(N'2021-01-11 04:05:00.000' AS DateTime), CAST(N'2021-01-11 05:05:00.000' AS DateTime), 4, 1)
INSERT [dbo].[datphong] ([MaDatPhong], [HoTen], [sdt], [thoigianvao], [thoigianra], [MaPhong], [TrangThai]) VALUES (5, N'Bảo Trần', N'0975853528', CAST(N'2021-01-11 05:21:00.000' AS DateTime), CAST(N'2021-01-11 06:21:00.000' AS DateTime), 5, 0)
SET IDENTITY_INSERT [dbo].[datphong] OFF
SET IDENTITY_INSERT [dbo].[dichvu] ON 

INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (1, N'Sting', 15000, 1, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (2, N'Pepsi', 15000, 1, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (3, N'Nước suối', 15000, 1, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (4, N'Bò húc', 20000, 1, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (5, N'Oshi', 7000, 2, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (6, N'Socola', 20000, 2, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (7, N'Tiger', 17000, 3, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (8, N'Heineken', 20000, 3, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (9, N'Saigon', 18000, 3, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (10, N'333', 15000, 3, N'')
INSERT [dbo].[dichvu] ([MaDichVu], [TenDichVu], [Gia], [danhmuc], [MoTa]) VALUES (11, N'Quy Nhơn', 10000, 3, N'')
SET IDENTITY_INSERT [dbo].[dichvu] OFF
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([IDHoaDon], [MaDatPhong], [NgayGioTao], [soGio], [giaTien], [giaDichVu], [TongTien], [TrangThai]) VALUES (1, 1, CAST(N'2021-01-10 23:57:47.000' AS DateTime), 60, 90000, 0, 90000, 1)
INSERT [dbo].[hoadon] ([IDHoaDon], [MaDatPhong], [NgayGioTao], [soGio], [giaTien], [giaDichVu], [TongTien], [TrangThai]) VALUES (2, 2, CAST(N'2021-01-11 02:22:43.000' AS DateTime), 122, 183000, 75000, 258000, 1)
INSERT [dbo].[hoadon] ([IDHoaDon], [MaDatPhong], [NgayGioTao], [soGio], [giaTien], [giaDichVu], [TongTien], [TrangThai]) VALUES (3, 3, CAST(N'2021-01-11 02:58:58.000' AS DateTime), 300, 450000, 300000, 750000, 1)
INSERT [dbo].[hoadon] ([IDHoaDon], [MaDatPhong], [NgayGioTao], [soGio], [giaTien], [giaDichVu], [TongTien], [TrangThai]) VALUES (4, 4, CAST(N'2021-01-11 03:05:09.000' AS DateTime), 60, 90000, 30640000, 30730000, 1)
INSERT [dbo].[hoadon] ([IDHoaDon], [MaDatPhong], [NgayGioTao], [soGio], [giaTien], [giaDichVu], [TongTien], [TrangThai]) VALUES (5, 5, CAST(N'2021-01-11 03:21:20.000' AS DateTime), 60, 90000, 250000, 340000, 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
SET IDENTITY_INSERT [dbo].[loaiphong] ON 

INSERT [dbo].[loaiphong] ([MaLoaiPhong], [TenLoaiPhong]) VALUES (1, N'Thường')
INSERT [dbo].[loaiphong] ([MaLoaiPhong], [TenLoaiPhong]) VALUES (2, N'VIP')
SET IDENTITY_INSERT [dbo].[loaiphong] OFF
SET IDENTITY_INSERT [dbo].[phong] ON 

INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (1, N'Phòng 101', 0, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (2, N'Phòng 102', 0, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (3, N'Phòng 103', 0, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (4, N'Phòng VIP 1', 0, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (5, N'Phòng 201', 1, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (6, N'Phòng 202', 0, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (7, N'Phòng 203', 0, 1)
INSERT [dbo].[phong] ([MaPhong], [TenPhong], [TrangThai], [MaLoaiPhong]) VALUES (8, N'Phòng VIP 2', 0, 1)
SET IDENTITY_INSERT [dbo].[phong] OFF
SET IDENTITY_INSERT [dbo].[sudungdv] ON 

INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (1, 2, 1, 5, 75000, 2, 0)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (3, 3, 3, 10, 150000, 3, 1)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (4, 3, 2, 10, 150000, 3, 1)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (8, 4, 4, 5, 100000, 4, 0)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (11, 4, 1, 2000, 30000000, 4, 0)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (14, 4, 1, 10, 150000, 4, 0)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (15, 4, 5, 10, 70000, 4, 0)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (16, 4, 10, 10, 150000, 4, 0)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (17, 4, 7, 10, 170000, 4, 0)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (18, 5, 2, 10, 150000, 5, 1)
INSERT [dbo].[sudungdv] ([madatdv], [MaDatPhong], [MaDichVu], [SoLuong], [Gia], [IDHoaDon], [TrangThai]) VALUES (19, 5, 11, 10, 100000, 5, 1)
SET IDENTITY_INSERT [dbo].[sudungdv] OFF
ALTER TABLE [dbo].[datphong]  WITH CHECK ADD  CONSTRAINT [FK_datphong_phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[phong] ([MaPhong])
GO
ALTER TABLE [dbo].[datphong] CHECK CONSTRAINT [FK_datphong_phong]
GO
ALTER TABLE [dbo].[dichvu]  WITH CHECK ADD  CONSTRAINT [FK_dichvu_danh_muc] FOREIGN KEY([danhmuc])
REFERENCES [dbo].[danh_muc] ([danhmuc])
GO
ALTER TABLE [dbo].[dichvu] CHECK CONSTRAINT [FK_dichvu_danh_muc]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_datphong] FOREIGN KEY([MaDatPhong])
REFERENCES [dbo].[datphong] ([MaDatPhong])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_datphong]
GO
ALTER TABLE [dbo].[phong]  WITH CHECK ADD  CONSTRAINT [FK_phong_loaiphong] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[loaiphong] ([MaLoaiPhong])
GO
ALTER TABLE [dbo].[phong] CHECK CONSTRAINT [FK_phong_loaiphong]
GO
ALTER TABLE [dbo].[sudungdv]  WITH CHECK ADD  CONSTRAINT [FK_sudungdv_datphong] FOREIGN KEY([MaDatPhong])
REFERENCES [dbo].[datphong] ([MaDatPhong])
GO
ALTER TABLE [dbo].[sudungdv] CHECK CONSTRAINT [FK_sudungdv_datphong]
GO
ALTER TABLE [dbo].[sudungdv]  WITH CHECK ADD  CONSTRAINT [FK_sudungdv_dichvu] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[dichvu] ([MaDichVu])
GO
ALTER TABLE [dbo].[sudungdv] CHECK CONSTRAINT [FK_sudungdv_dichvu]
GO
ALTER TABLE [dbo].[sudungdv]  WITH CHECK ADD  CONSTRAINT [FK_sudungdv_hoadon] FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[hoadon] ([IDHoaDon])
GO
ALTER TABLE [dbo].[sudungdv] CHECK CONSTRAINT [FK_sudungdv_hoadon]
GO
USE [master]
GO
ALTER DATABASE [QLKARA] SET  READ_WRITE 
GO
