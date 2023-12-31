﻿CREATE DATABASE QuanLyDuocPham

USE QlyDUOCPHAM
SET DATEFORMAT DMY

--CÂU 1 --------------------------------------------------------
--TẠO BẢNG NHÀ CUNG CẤP

CREATE TABLE NHACUNGCAP
(
	MANCC CHAR(5) NOT NULL CONSTRAINT PK_NCC PRIMARY KEY,
	TENNCC CHAR(50),
	QUOCGIA CHAR(40), 
	LOAINCC CHAR(20)
)

--TẠO BẢNG DƯỢC PHẤM

CREATE TABLE DUOCPHAM 
(
	MADP CHAR(4) NOT NULL CONSTRAINT PK_DP PRIMARY KEY,
	TENDP CHAR(50),
	LOAIDP CHAR(20),
	GIA MONEY
)

--TẠO BẢNG PHIẾU NHẬP

CREATE TABLE PHIEUNHAP
(
	SOPN INT NOT NULL CONSTRAINT PK_PN PRIMARY KEY,
	NGNHAP SMALLDATETIME,
	MANCC CHAR(5) CONSTRAINT FK_PN_NCC FOREIGN KEY REFERENCES NHACUNGCAP(MANCC),
	LOAINHAP CHAR(20) 
)

--TẠO BẢNG CHI TIẾT PHIẾU NHẬP

CREATE TABLE CTPN
(
	SOPN INT NOT NULL CONSTRAINT FK_CTPN_PN FOREIGN KEY REFERENCES PHIEUNHAP(SOPN),
	MADP CHAR(4) NOT NULL CONSTRAINT FK_CTPN_DP FOREIGN KEY REFERENCES DUOCPHAM(MADP),
	SOLUONG INT,
	CONSTRAINT PK_CTPN PRIMARY KEY (SOPN,MADP)
)

--CÂU 2 --------------------------------------------------------
--NHẬP DATA CHO TABLE NHÀ CUNG CẤP

INSERT INTO NHACUNGCAP VALUES('NCC01','Phuc Hung','Viet Nam','Thuong xuyen')
INSERT INTO NHACUNGCAP VALUES('NCC02','J. B. Pharmaceuticals','India','Vang lai')
INSERT INTO NHACUNGCAP VALUES('NCC03','Sapharco','Singapore','Vang lai')
--NHẬP DATA CHO TABLE DƯỢC PHẨM

INSERT INTO DUOCPHAM VALUES('DP01','Thuoc','ho PH Siro','120000')
INSERT INTO DUOCPHAM VALUES('DP02','Zecuf Herbal CouchRemedy','Vien nen','200000')
INSERT INTO DUOCPHAM VALUES('DP03','Cotrim','Vien sui','80000')
--NHẬP DATA CHO TABLE PHIẾU NHẬP

INSERT INTO PHIEUNHAP VALUES('00001','22/11/2017','NCC01','Noi dia')
INSERT INTO PHIEUNHAP VALUES('00002','04/12/2017','NCC03','Nhap khau')
INSERT INTO PHIEUNHAP VALUES('00003','10/12/2017','NCC02','Nhap khau')
----NHẬP DATA CHO TABLE CHI TIẾT PHIẾU NHẬP

INSERT INTO CTPN VALUES('00001','DP01','100')
INSERT INTO CTPN VALUES('00002','DP02','200')
INSERT INTO CTPN VALUES('00003','DP03','543')

--CÂU 3 --------------------------------------------------------
CREATE TRIGGER TRG_INS_DP ON DUOCPHAM
FOR INSERT
AS
BEGIN
	DECLARE @MaDP CHAR(4), @LoaiDP CHAR(20), @Gia MONEY
	SELECT @MaDP = MADP
	FROM INSERTED

	SELECT @LoaiDP = LOAIDP, @Gia = GIA
	FROM DUOCPHAM
	WHERE @MaDP = MADP

	IF (@LoaiDP = 'Siro') 
	BEGIN
		IF (@Gia <= 100000)
		BEGIN
			PRINT'LOI: GIA DUOC PHAM KHONG HOP LE'
			ROLLBACK TRANSACTION
		END
		ELSE
		BEGIN
			PRINT'THEM MOT DUOC PHAM THANH CONG'
		END
	END
	ELSE
	BEGIN
		PRINT'THEM MOT DUOC PHAM THANH CONG'
	END
END

--CÂU 4 --------------------------------------------------------
CREATE TRIGGER TRG_INS_PN ON PHIEUNHAP
FOR INSERT, update
AS
BEGIN
	DECLARE @MaNCC CHAR(5),@QuocGia CHAR(40),@LoaiNhap CHAR(20)
	SELECT @MaNCC = MANCC,  @LoaiNhap = LOAINHAP
	FROM INSERTED

	SELECT @QuocGia = QUOCGIA
	FROM NHACUNGCAP
	WHERE @MaNCC = MANCC

	--select  @LoaiNhap = LOAINHAP
	--from PHIEUNHAP
	--where @MaNCC = MANCC

	IF (@QuocGia <> 'Viet Nam' AND @LoaiNhap <>'Nhap khau')
	BEGIN
		PRINT'LOI: LOAI NHAP KHONG HOP LE'
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT'THEM MOT PHIEU NHAP THANH CONG '
	END
END

drop trigger TRG_INS_PN

insert into PHIEUNHAP values('00005', '1/1/2017', 'NCC2', 'Noi dia')
update PHIEUNHAP
set LOAINHAP = 'Noi dia'
where MANCC = 'NCC3'
--CÂU 5 --------------------------------------------------------
SELECT *
FROM PHIEUNHAP
WHERE MONTH(NGNHAP) = '12' AND YEAR(NGNHAP) = '2017'
ORDER BY NGNHAP ASC

--CÂU 6 --------------------------------------------------------
--SỐ LƯỢNG NHIỀU NHẤT
SELECT MAX(SOLUONG) MAX
FROM CTPN
--SẢN PHẨM ĐƯỢC NHẬP TRONG NĂM 2017
SELECT SOPN
FROM PHIEUNHAP 
WHERE YEAR(NGNHAP) = '2017'
--SẢN PHẨM ĐƯỢC NHẬP NHIỀU NHẤT TRONG NĂM 2017
SELECT MADP, TENDP
FROM DUOCPHAM
WHERE MADP IN (SELECT MADP
				FROM CTPN
				WHERE SOPN IN (SELECT SOPN
								FROM PHIEUNHAP 
								WHERE YEAR(NGNHAP) = '2017')
				GROUP BY MADP
				HAVING MAX(SOLUONG) = (SELECT TOP 1 MAX(SOLUONG)
										FROM CTPN))

--CÂU 7 --------------------------------------------------------
SELECT MADP, TENDP
FROM DUOCPHAM
WHERE MADP IN (SELECT MADP
				FROM CTPN
				WHERE SOPN IN (SELECT SOPN
								FROM PHIEUNHAP
								WHERE MANCC IN (SELECT MANCC
												FROM NHACUNGCAP NCC1
												WHERE NCC1.LOAINCC = 'Thuong xuyen'
													AND MANCC NOT IN (SELECT MANCC
																		FROM NHACUNGCAP NCC2
																		WHERE NCC2.LOAINCC = 'Vang lai'))))

--CÂU 8 --------------------------------------------------------
SELECT MANCC, TENNCC
FROM NHACUNGCAP
WHERE MANCC IN (SELECT MANCC
				FROM PHIEUNHAP
				WHERE YEAR(NGNHAP) = '2017'
					AND SOPN IN (SELECT SOPN
									FROM CTPN
									WHERE MADP IN (SELECT MADP
													FROM DUOCPHAM
													WHERE GIA > 100000)))
