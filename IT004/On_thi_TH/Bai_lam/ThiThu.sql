﻿--1. Viết các câu lệnh
CREATE DATABASE QLLX
USE DEMAU
--1.1. Tạo bảng, tạo các ràng buộc khóa chính (thuộc tính gạch dưới), khóa ngoại tương ứng. ( 1.25 đ)
CREATE TABLE XEPLOAI
(
	MAXEPLOAI char(4),
	TENXEPLOAI varchar(20),
	CONSTRAINT PK_XEPLOAI PRIMARY KEY (MAXEPLOAI)
)

CREATE TABLE HOCVIEN
(
	MAHV char(4),
	HOTEN varchar(30),
	NGSINH smalldatetime,
	DIACHI varchar(30),
	EMAIL varchar(30),
	SDT varchar(15),
	MAXEPLOAI char(4),
	CONSTRAINT PK_HOCVIEN PRIMARY KEY (MAHV)
)

CREATE TABLE GIAOVIEN
(
	MAGV char(4),
	HOTEN varchar(30),
	NGSINH smalldatetime,
	NGVL smalldatetime,
	CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MAGV)
)

CREATE TABLE XE
(
	MAXE char(4),
	BIENSO varchar(10),
	TENLOAIXE varchar(20),
	CONSTRAINT PK_XE PRIMARY KEY (MAXE)
)

CREATE TABLE BAIHOC
(
	MABAIHOC char(4),
	NGAYHOC smalldatetime,
	SOGIO int,
	GIA money,
	MAHV char(4),
	MAGV char(4),
	MAXE char(4),
	CONSTRAINT PK_BAIHOC PRIMARY KEY (MABAIHOC)
)

ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_MAXEPLOAI FOREIGN KEY (MAXEPLOAI) REFERENCES XEPLOAI(MAXEPLOAI)

ALTER TABLE BAIHOC
ADD CONSTRAINT FK_MAHV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)

ALTER TABLE BAIHOC
ADD CONSTRAINT FK_MAGV FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)

ALTER TABLE BAIHOC
ADD CONSTRAINT FK_MAXE FOREIGN KEY (MAXE) REFERENCES XE(MAXE)

--1.2. Thêm dữ liệu vào bảng HOCVIEN, GIAOVIEN, XE, BAIHOC. Mỗi bảng một dòng dữ liệu (Lưu ý: không để null bất kỳ trường dữ liệu nào). (0.5đ)
SELECT * FROM XEPLOAI
INSERT INTO XEPLOAI
VALUES ('XL01', 'Gioi')

SELECT * FROM HOCVIEN
INSERT INTO HOCVIEN
VALUES ('HV01', 'Nguyen Van A', '1/1/2000', 'TpHCM', '1234@gm.com', '01234567', 'XL01')

SELECT * FROM GIAOVIEN
INSERT INTO GIAOVIEN
VALUES ('GV01', 'Nguyen Van B', '1/1/1975', '1/1/2010')

SELECT * FROM XE
INSERT INTO XE
VALUES ('XE01', '62K123', 'Wave')

SELECT * FROM BAIHOC
INSERT INTO BAIHOC
VALUES ('BH01', '1/1/2011', 5, 100000, 'HV01', 'GV01', 'XE01')

--1.3. Cập nhật lại một dòng dữ liệu vừa mới thêm vào bảng HOCVIEN. (0.25đ)
UPDATE HOCVIEN
SET EMAIL = '3456@gm.com'
WHERE MAHV = 'HV01'

--2. Hiện thực các ràng buộc toàn vẹn sau: (2đ)
--2.1. Tên xếp loại chỉ có thể là gioi, kha, trung binh, kem. (0.5đ)
ALTER TABLE XEPLOAI
ADD CONSTRAINT CHK_TENXEPLOAI CHECK (TENXEPLOAI IN ('gioi', 'kha', 'trung binh', 'kem'))
--2.2. Giá của bài học phải lớn hơn 0. (0.5đ)
ALTER TABLE BAIHOC
ADD CONSTRAINT CHK_GIA CHECK (GIA > 0)
--2.3. Ngày sinh của một học viên phải nhỏ hơn ngày học viên này học (NGAYHOC). Viết trigger cho thao tác thêm dữ liệu vào bảng BAIHOC. (1đ)
CREATE TRIGGER TRG_CHK_NGAYHOC
ON BAIHOC
FOR INSERT
AS
BEGIN
	DECLARE @NGAYHOC smalldatetime = (SELECT NGAYHOC FROM inserted)
	IF (@NGAYHOC < ANY (SELECT NGSINH FROM HOCVIEN, inserted WHERE HOCVIEN.MAHV = inserted.MAHV))
	BEGIN
		ROLLBACK TRANSACTION
		PRINT N'TRG_CHK_NGAYHOC ALO ALO'
	END
END

--3. Viết câu lệnh SQL thực hiện các câu truy vấn sau: (6đ)
--3.1. Hiển thị những học viên (MAHV, HOTEN) có kết quả xếp loại ‘gioi’
SELECT MAHV, HOTEN
FROM HOCVIEN, XEPLOAI
WHERE HOCVIEN.MAXEPLOAI = XEPLOAI.MAXEPLOAI AND TENXEPLOAI = 'gioi'
--3.2. Những bài học nào (MABAIHOC, NGAYHOC, SOGIO) có giá cao nhất.
SELECT TOP 1 WITH TIES MABAIHOC, NGAYHOC, SOGIO
FROM BAIHOC
ORDER BY GIA DESC
--3.3. Học viên nào (MAHV, HOTEN) có giờ học trong cả hai ngày ‘5/5/2018’ và ‘6/5/2018’.
SELECT MAHV, HOTEN
FROM HOCVIEN
WHERE MAHV IN (SELECT MAHV FROM BAIHOC WHERE NGAYHOC = '5/5/2018')
  AND MAHV IN (SELECT MAHV FROM BAIHOC WHERE NGAYHOC = '6/5/2018')


(SELECT HOCVIEN.MAHV, HOTEN
FROM HOCVIEN, BAIHOC
WHERE HOCVIEN.MAHV = BAIHOC.MAHV
  AND NGAYHOC = '5/5/2018')
INTERSECT
(SELECT HOCVIEN.MAHV, HOTEN
FROM HOCVIEN, BAIHOC
WHERE HOCVIEN.MAHV = BAIHOC.MAHV
  AND NGAYHOC = '6/5/2018')
--3.4. Xe (MAXE, BIENSO) nào được sử dụng trong bài học ngày ‘1/1/2018’ nhưng không
--được sử dụng trong bài học ngày ‘2/1/2018’

(SELECT XE.MAXE, BIENSO
FROM XE, BAIHOC
WHERE XE.MAXE = BAIHOC.MAXE
  AND NGAYHOC = '1/1/2018')
EXCEPT
(SELECT XE.MAXE, BIENSO
FROM XE, BAIHOC
WHERE XE.MAXE = BAIHOC.MAXE
  AND NGAYHOC = '2/1/2018')
--3.5. Trong tháng 8 năm 2018, Xe (MAXE, BIENSO) nào được sử dụng để học nhiều hơn 100 lần.
SELECT XE.MAXE, BIENSO
FROM XE, BAIHOC
WHERE XE.MAXE = BAIHOC.MAXE
  AND MONTH(NGAYHOC) = 8 AND YEAR(NGAYHOC) = 2018
GROUP BY XE.MAXE, BIENSO
HAVING COUNT(*) > 100
--3.6. Giáo viên (MAGV, HOTEN) nào đã sử dụng tất cả xe Ford (TENLOAIXE = ‘Ford’) trong năm 2017.
SELECT MAGV, HOTEN
FROM GIAOVIEN
WHERE NOT EXISTS (SELECT *
				  FROM XE
				  WHERE TENLOAIXE = 'Ford'
					AND	NOT EXISTS (SELECT *
									FROM BAIHOC
									WHERE GIAOVIEN.MAGV = BAIHOC.MAGV
									  AND XE.MAXE = BAIHOC.MAXE
									  AND YEAR(NGAYHOC) = 2017))
--3.7. Hiển thị thông tin học viên (MAHV, HOTEN) và tổng số giờ học viên này đã học trong năm 2016
SELECT HOCVIEN.MAHV, HOTEN, SUM(SOGIO) TONGSOGIOHOC
FROM HOCVIEN, BAIHOC
WHERE HOCVIEN.MAHV = BAIHOC.MAHV
  AND YEAR(NGAYHOC) = 2016
GROUP BY HOCVIEN.MAHV, HOTEN


