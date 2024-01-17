create database khachsan;
use khachsan;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 04, 2024 lúc 08:54 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_khachsan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `MaHD` varchar(10) NOT NULL,
  `TenHD` varchar(250) NOT NULL,
  `MaKH` varchar(10) NOT NULL,
  `TongTien` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`MaHD`, `TenHD`, `MaKH`, `TongTien`) VALUES
('HD01', 'Hoá đơn', 'KH01', 200000),
('HD02', 'Hoá đơn 02', 'KH02', 170000),
('HD03', 'Hoá đơn 3', 'KH02', 900000),
('HD04', 'Hoá đơn 4', 'KH01', 170000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` varchar(10) NOT NULL,
  `TenKH` varchar(250) NOT NULL,
  `sdt` int(9) NOT NULL,
  `cccn` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `TenKH`, `sdt`, `cccn`) VALUES
('KH01', 'Nguyễn Sơn Hà', 2147483647, 'addwad213123'),
('KH02', 'Duy Thái', 2147483647, '13231e2eawede');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong`
--

CREATE TABLE `phong` (
  `MaPhong` varchar(10) NOT NULL,
  `TenPhong` varchar(250) NOT NULL,
  `TinhTrang` varchar(250) NOT NULL,
  `LoaiPhong` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phong`
--

INSERT INTO `phong` (`MaPhong`, `TenPhong`, `TinhTrang`, `LoaiPhong`) VALUES
('P1_01', 'Phòng đơn', 'Đã thuê', 'Phòng đơn'),
('P1_02', 'Phòng đôi', 'Chưa thuê', 'Phòng đôi'),
('P1_03', 'Phòng đơn', 'Đã thuê', 'Phòng đơn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thue`
--

CREATE TABLE `thue` (
  `MaHD` varchar(10) NOT NULL,
  `MaPhong` varchar(10) NOT NULL,
  `NgayThue` date DEFAULT NULL,
  `NgayTra` date DEFAULT NULL,
  `GiaThue` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thue`
--

INSERT INTO `thue` (`MaHD`, `MaPhong`, `NgayThue`, `NgayTra`, `GiaThue`) VALUES
('HD02', 'P1_02', NULL, NULL, NULL),
('HD02', 'P1_03', NULL, NULL, NULL),
('HD03', 'P1_01', NULL, NULL, NULL),
('HD03', 'P1_02', NULL, NULL, NULL),
('HD04', 'P1_02', NULL, NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

insert into khachhang values 
('KH11', 'Tran Dinh Khanh', '0123456789', '1234567890'),
('KH12', 'Le Trung Hieu', '0123456789', '1234567890'),
('KH03', 'Phan Dinh The Trung', '0123456789', '1234567890'),
('KH04', 'Nguyen van phong', '0123456789', '1234567890'),
('KH05', 'Ho Nhat Huy', '0123456789', '1234567890'),
('KH06', 'Phan Thanh Duong', '0123456789', '1234567890'),
('KH07', 'Nguyen Viet Sang', '0123456789', '1234567890'),
('KH08', 'Luong Quoc Toan', '0123456789', '1234567890'),
('KH09', 'Nguyen Huy Hoang', '0123456789', '1234567890'),
('KH10', 'Ha Dinh Kien', '0123456789', '1234567890');

insert into phong values 
('P01', 'Phong 1', 'Trong', 'Phong don'),
('P02', 'Phong 2', 'Trong', 'Phong don'),
('P03', 'Phong 3', 'Trong', 'Phong don'),
('P04', 'Phong 4', 'Trong', 'Phong don'),
('P05', 'Phong 5', 'Trong', 'Phong doi'),
('P06', 'Phong 6', 'Trong', 'Phong doi'),
('P07', 'Phong 7', 'thue', 'Phong doi'),
('P08', 'Phong 8', 'thue', 'Phong doi'),
('P09', 'Phong 9', 'thue', 'Phong doi'),
('P10', 'Phong 10', 'thue', 'Phong doi');

insert into hoadon values 
('HD111', 'Hoa don 1', 'KH11', 100000),
('HD112', 'Hoa don 2', 'KH12', 200000),
('HD113', 'Hoa don 3', 'KH03', 300000),
('HD104', 'Hoa don 4', 'KH04', 400000),
('HD05', 'Hoa don 5', 'KH05', 500000),
('HD06', 'Hoa don 6', 'KH11', 600000),
('HD07', 'Hoa don 7', 'KH11', 700000),
('HD08', 'Hoa don 8', 'KH06', 800000),
('HD09', 'Hoa don 9', 'KH07', 900000),
('HD10', 'Hoa don 10', 'KH08', 1000000),
('HD11', 'Hoa don 11', 'KH09', 1100000),
('HD12', 'Hoa don 12', 'KH10', 1200000),
('HD13', 'Hoa don 13', 'KH05', 1300000),
('HD14', 'Hoa don 14', 'KH08', 1400000),
('HD15', 'Hoa don 15', 'KH12', 1500000);


insert into thue values 
('HD111', 'P01', '2020-01-01', '2020-01-10', 100000),
('HD112', 'P02', '2020-01-01', '2020-01-10', 200000),
('HD113', 'P03', '2020-01-01', '2020-01-10', 300000),
('HD104', 'P04', '2020-01-01', '2020-01-10', 400000),
('HD05', 'P05', '2020-01-01', '2020-01-10', 500000),
('HD06', 'P06', '2020-01-01', '2020-01-10', 600000),
('HD07', 'P07', '2020-01-01', '2020-01-10', 700000),
('HD08', 'P08', '2020-01-01', '2020-01-10', 800000),
('HD09', 'P09', '2020-01-01', '2020-01-10', 900000),
('HD10', 'P10', '2020-01-01', '2020-01-10', 1000000),
('HD11', 'P01', '2020-01-01', '2020-01-10', 1100000),
('HD12', 'P02', '2020-01-01', '2020-01-10', 1200000),
('HD13', 'P03', '2020-01-01', '2020-01-10', 1300000),
('HD14', 'P04', '2020-01-01', '2020-01-10', 1400000),
('HD15', 'P05', '2020-01-01', '2020-01-10', 1500000);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`MaHD`),
  ADD KEY `fk_hd_kh` (`MaKH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`);

--
-- Chỉ mục cho bảng `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`MaPhong`);

--
-- Chỉ mục cho bảng `thue`
--
ALTER TABLE `thue`
  ADD PRIMARY KEY (`MaHD`,`MaPhong`),
  ADD KEY `fk_t_p` (`MaPhong`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `fk_hd_kh` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Các ràng buộc cho bảng `thue`
--
ALTER TABLE `thue`
  ADD CONSTRAINT `fk_t_hd` FOREIGN KEY (`MaHD`) REFERENCES `hoadon` (`MaHD`),
  ADD CONSTRAINT `fk_t_p` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;