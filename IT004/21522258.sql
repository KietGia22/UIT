create DATABASE QLBH_main
use QLBH_main

--I.1
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

--Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
--Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)

SET DATEFORMAT dmy
-------------------------------
-- KHACHHANG
insert into KHACHHANG values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into KHACHHANG values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into KHACHHANG values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into KHACHHANG values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into KHACHHANG values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into KHACHHANG values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into KHACHHANG values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into KHACHHANG values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into KHACHHANG values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into KHACHHANG values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into NHANVIEN values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into NHANVIEN values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into NHANVIEN values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into NHANVIEN values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into NHANVIEN values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into SANPHAM values('BC01','But chi','cay','Singapore',3000)
insert into SANPHAM values('BC02','But chi','cay','Singapore',5000)
insert into SANPHAM values('BC03','But chi','cay','Viet Nam',3500)
insert into SANPHAM values('BC04','But chi','hop','Viet Nam',30000)
insert into SANPHAM values('BB01','But bi','cay','Viet Nam',5000)
insert into SANPHAM values('BB02','But bi','cay','Trung Quoc',7000)
insert into SANPHAM values('BB03','But bi','hop','Thai Lan',100000)
insert into SANPHAM values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into SANPHAM values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into SANPHAM values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into SANPHAM values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into SANPHAM values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into SANPHAM values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into SANPHAM values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into SANPHAM values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into SANPHAM values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into SANPHAM values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into SANPHAM values('ST04','So tay','quyen','Thai Lan',55000)
insert into SANPHAM values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into SANPHAM values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into SANPHAM values('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM values('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into HOADON values(1001,'23/07/2006','KH01','NV01',320000)
insert into HOADON values(1002,'12/08/2006','KH01','NV02',840000)
insert into HOADON values(1003,'23/08/2006','KH02','NV01',100000)
insert into HOADON values(1004,'01/09/2006','KH02','NV01',180000)
insert into HOADON values(1005,'20/10/2006','KH01','NV02',3800000)
insert into HOADON values(1006,'16/10/2006','KH01','NV03',2430000)
insert into HOADON values(1007,'28/10/2006','KH03','NV03',510000)
insert into HOADON values(1008,'28/10/2006','KH01','NV03',440000)
insert into HOADON values(1009,'28/10/2006','KH03','NV04',200000)
insert into HOADON values(1010,'01/11/2006','KH01','NV01',5200000)
insert into HOADON values(1011,'04/11/2006','KH04','NV03',250000)
insert into HOADON values(1012,'30/11/2006','KH05','NV03',21000)
insert into HOADON values(1013,'12/12/2006','KH06','NV01',5000)
insert into HOADON values(1014,'31/12/2006','KH03','NV02',3150000)
insert into HOADON values(1015,'01/01/2007','KH06','NV01',910000)
insert into HOADON values(1016,'01/01/2007','KH07','NV02',12500)
insert into HOADON values(1017,'02/01/2007','KH08','NV03',35000)
insert into HOADON values(1018,'13/01/2007','KH08','NV03',330000)
insert into HOADON values(1019,'13/01/2007','KH01','NV03',30000)
insert into HOADON values(1020,'14/01/2007','KH09','NV04',70000)
insert into HOADON values(1021,'16/01/2007','KH10','NV03',67500)
insert into HOADON values(1022,'16/01/2007',Null,'NV03',7000)
insert into HOADON values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into CTHD values(1001,'TV02',10)
insert into CTHD values(1001,'ST01',5)
insert into CTHD values(1001,'BC01',5)
insert into CTHD values(1001,'BC02',10)
insert into CTHD values(1001,'ST08',10)
insert into CTHD values(1002,'BC04',20)
insert into CTHD values(1002,'BB01',20)
insert into CTHD values(1002,'BB02',20)
insert into CTHD values(1003,'BB03',10)
insert into CTHD values(1004,'TV01',20)
insert into CTHD values(1004,'TV02',10)
insert into CTHD values(1004,'TV03',10)
insert into CTHD values(1004,'TV04',10)
insert into CTHD values(1005,'TV05',50)
insert into CTHD values(1005,'TV06',50)
insert into CTHD values(1006,'TV07',20)
insert into CTHD values(1006,'ST01',30)
insert into CTHD values(1006,'ST02',10)
insert into CTHD values(1007,'ST03',10)
insert into CTHD values(1008,'ST04',8)
insert into CTHD values(1009,'ST05',10)
insert into CTHD values(1010,'TV07',50)
insert into CTHD values(1010,'ST07',50)
insert into CTHD values(1010,'ST08',100)
insert into CTHD values(1010,'ST04',50)
insert into CTHD values(1010,'TV03',100)
insert into CTHD values(1011,'ST06',50)
insert into CTHD values(1012,'ST07',3)
insert into CTHD values(1013,'ST08',5)
insert into CTHD values(1014,'BC02',80)
insert into CTHD values(1014,'BB02',100)
insert into CTHD values(1014,'BC04',60)
insert into CTHD values(1014,'BB01',50)
insert into CTHD values(1015,'BB02',30)
insert into CTHD values(1015,'BB03',7)
insert into CTHD values(1016,'TV01',5)
insert into CTHD values(1017,'TV02',1)
insert into CTHD values(1017,'TV03',1)
insert into CTHD values(1017,'TV04',5)
insert into CTHD values(1018,'ST04',6)
insert into CTHD values(1019,'ST05',1)
insert into CTHD values(1019,'ST06',2)
insert into CTHD values(1020,'ST07',10)
insert into CTHD values(1021,'ST08',5)
insert into CTHD values(1021,'TV01',7)
insert into CTHD values(1021,'TV02',10)
insert into CTHD values(1022,'ST07',1)
insert into CTHD values(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------
SELECT * FROM KHACHHANG
SELECT * FROM NHANVIEN
SELECT * FROM SANPHAM
SELECT * FROM HOADON
SELECT * FROM CTHD

--Data Defintion Language
--I.2
--Them thuoc tinh GHICHU co kieu du lieu varchar(20) cho quan he SANPHAM
ALTER TABLE SANPHAM
ADD GHICHU varchar(20);

--I.3
--Them thuoc tinh LOAIKH co kieu du lieu tinyint cho quan he KHACHHANG
ALTER TABLE KHACHHANG
ADD LOAIKH tinyint;

--I.4
--Sua kieu du lieu cua thuoc tinh GHICHU trong quan he SANPHAM thanh varchar(100)
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU varchar(100);

--I.5
--Xoa thuoc tinh GHICHU trong quan he SANPHAM
ALTER TABLE SANPHAM 
DROP COLUMN GHICHU;

--I.6
--Lam the nao de thuoc tinh LOAIKH trong quan he KHACHHANG co the luu lai cac gia tri la: "Vang lai", "Thuong xuyen", "Vip",..
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH varchar(20);

--I.7
--Don vi tinh cua san pham chi co the la("cay", "hop", "cai", "quyen", "chuc")
ALTER TABLE SANPHAM
ADD CONSTRAINT Check_DVT
CHECK(DVT in ('cay', 'hop', 'cai', 'quyen', 'chuc'));

--I.8
--Gia ban cua san pham tu 500 dong tro len
ALTER TABLE SANPHAM
ADD CONSTRAINT Check_Gia 
CHECK(Gia >= 500);

--I.9
--Moi lan mua hang, khach hang phai mua it nhat 1 san pham
ALTER TABLE CTHD
ADD CONSTRAINT Check_SL
CHECK(SL >= 1);

--I.10
--Ngay khach hang dang ki la khach hang thanh vien phai lon hon ngay sinh cua nguoi do
ALTER TABLE KHACHHANG
ADD CONSTRAINT Check_NGDK_NGSINH
CHECK(NGDK > NGSINH);

--I.11
--Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày
--khách hàng đó đăng ký thành viên (NGDK).\

--kiem tra cau 11 trigger 1
UPDATE KHACHHANG
set NGDK = '2021-11-16' --bang tam insert
where MAKH = 'KH01'

--trigger 1
--C1: 
create TRIGGER NGDK_NGHD_UPDATE
ON KHACHHANG FOR UPDATE
AS 
BEGIN
--xac dinh bien
   DECLARE @NGHD SMALLDATETIME
   DECLARE @NGDK SMALLDATETIME
   --gan gia tri cho bien
   SELECT @NGDK=NGDK FROM inserted
   --kiem tra rang buoc
   IF (@NGDK > ANY (SELECT HOADON.NGHD
                    FROM HOADON,
					inserted
					WHERE HOADON.MAKH = inserted.MAKH))
	BEGIN 
	   PRINT N'NGAY DANG KY PHAI NHO HON NGAY MUA HANG'
	   ROLLBACK TRANSACTION
	END
END

--C2:
create TRIGGER UPDATE_NGDK_NGHD
ON KHACHHANG FOR UPDATE
AS
BEGIN 
     DECLARE @NGHD SMALLDATETIME
	 DECLARE @NGDK SMALLDATETIME
	 SELECT @NGDK = NGDK FROM inserted
	 SELECT @NGHD = MIN(NGHD) FROM HOADON, inserted WHERE HOADON.MAKH = inserted.MAKH
	 IF(@NGDK > @NGHD)
	 BEGIN 
	      PRINT N'NGAY DANG KY PHAI NHO HON NGAY MUA HANG'
		  ROLLBACK TRANSACTION
     END
END

--Kiem tra trigger 2:
INSERT INTO HOADON
VALUES (1024, '2001-01-01', 'KH01', 'NV01', 0) --Bang tam Insert

UPDATE HOADON
SET NGHD = '2001-01-01'
WHERE SOHD = 1001

--trigger 2:
create TRIGGER NGHD_NGDK_INSERT
ON HOADON FOR INSERT, UPDATE
AS 
  BEGIN 
       DECLARE @NGDK SMALLDATETIME
	   DECLARE @NGHD SMALLDATETIME
	   SELECT @NGHD = NGHD FROM inserted
	   SELECT @NGDK = NGDK FROM inserted, KHACHHANG
	   WHERE KHACHHANG.MAKH = inserted.MAKH
	   IF (@NGDK > @NGHD)
	      BEGIN 
		       PRINT N'NGAY LAP HOA DON PHAI LON HON NGAY DANG KY CUA KHACH HANG'
			   ROLLBACK TRANSACTION
		  END
		  ELSE
		      PRINT N'CAP NHAP/THEM THANH CONG'
		END

--I.12
--Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó
--vào làm
CREATE TRIGGER Trg_KiemtraNGVL_NV -- Kiểm tra ngày vào làm tại bảng NHANVIEN
ON NHANVIEN FOR UPDATE
AS
BEGIN
	DECLARE @NGVL SMALLDATETIME
	DECLARE @NGHD SMALLDATETIME
	SELECT @NGVL=NGVL FROM inserted
	IF (@NGVL>ANY (SELECT HOADON.NGHD FROM HOADON, inserted WHERE HOADON.MANV=inserted.MANV))
	BEGIN
		PRINT N'NGÀY VÀO LÀM CỦA NHÂN VIÊN PHẢI NHỎ HƠN NGÀY LẬP HÓA ĐƠN'
	END
	ELSE PRINT N' CẬP NHẬT THÀNH CÔNG'
END
GO
CREATE TRIGGER TRG_KiemTraNHD_HD 
ON HOADON FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @NGVL SMALLDATETIME
	DECLARE @NGHD SMALLDATETIME
	SELECT @NGVL=NGVL, @NGHD=NGHD FROM inserted, NHANVIEN WHERE inserted.MANV=NHANVIEN.MANV
	IF (@NGVL>@NGHD)
	BEGIN
		PRINT N' Ngày vào làm phải nhỏ hơn ngày lập hóa đơn'
	END
	ELSE PRINT N' UPDATE/THÊM THÀNH CÔNG'
END

insert into hoadon values(1026,'2005-07-21','KH01','NV01',320000)

SELECT *FROM NHANVIEN

--I.14
--Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa
--đơn đó.
-- Trigger Gán Trị giá = 0 khi Thêm 1 Hóa đơn mới--
CREATE TRIGGER TRG_INSERT_HD
ON HOADON FOR INSERT 
AS
BEGIN
		UPDATE HOADON 
		SET TRIGIA=0 
		WHERE SOHD = (SELECT SOHD FROM inserted)
		PRINT N'Đã tạo Trị giá mặc định bằng 0 khi thêm hóa đơn mới'
END
SELECT *
FROM HOADON

INSERT INTO HOADON VALUES(1030,'2006-07-30','KH01','NV01',320000) 
INSERT INTO HOADON VALUES(1031,'2006-07-30','KH01','NV01','')
INSERT INTO HOADON VALUES(1033,'2006-07-30','KH01','NV01',320000)

--- Trigger khi thêm Hóa đơn mới thì ---
CREATE TRIGGER HOA_DON_UPDATE
ON HOADON FOR INSERT 
AS
  BEGIN 
      UPDATE HOADON
	  SET TRIGIA = (SELECT TRIGIA FROM deleted)
	  WHERE SOHD = (SELECT SOHD FROM inserted)
	  PRINT N'Da cap nhap 1 hoa don voi tri gia khong thay doi'
  END

--- Trigger tính thành tiền bằng Số lượng * Đơn giá ---



--II.2
--Tao quan he SANPHAM1 chua toan bo du lieu cua quan he SANPHAM. Tao quan he KHACH1 chua toan bo du lieu cua quan he KHACHHANG
SELECT *INTO SANPHAM1 FROM SANPHAM
SELECT *INTO KHACHHANG1 FROM KHACHHANG

--II.3
--Cap nhap gia tang 5% doi voi nhung san pham do "Thai Lan" san xuat (cho quan he SANPHAM1)
UPDATE SANPHAM1
SET Gia = Gia * 1.05
WHERE NuocSX = 'Thai Lan'

--II.4
--Cap nhap gia giam 5% doi voi nhung san pham do "Trung Quoc" san xuat co gia tu 10000 tro xuong (cho quan he SANPHAM1)
UPDATE SANPHAM1
SET Gia = Gia * 0.95
WHERE NuocSX = 'Trung Quoc' AND Gia <= 10000

--II.5
--Cap nhap gia tri LOAIKH la "Vip"
UPDATE KHACHHANG1
SET LOAIKH = 'Vip'
WHERE ((NGDK < '1/1/2007') AND (DOANHSO >= 10000000)) 
OR ((NGDK > '1/1/2007') AND (DOANHSO >= 2000000))
select * from KHACHHANG1

--III.Ngon ngu truy van du lieu

--Ngay 30/11--

--III.36
--Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, SUM(SL) AS SOLUONG
FROM CTHD CT, HOADON HD
WHERE CT.SOHD = HD.SOHD
AND YEAR(NGHD) = 2006
AND MONTH(NGHD) = 10
GROUP BY MASP

--III.37
--Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGiA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)

--III.38
--Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4

--III.39
--Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT SOHD
FROM CTHD CT, SANPHAM SP
WHERE CT.MASP = SP.MASP
AND NUOCSX = 'Viet Nam'
GROUP BY SOHD
HAVING COUNT(DISTINCT CT.MASP) = 3

--III.40
--Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT KH.MAKH, HOTEN, COUNT(SOHD) AS SOLANMUAMAX
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH
AND KH.MAKH = (SELECT TOP 1 WITH TIES MAKH
              FROM HOADON
			  GROUP BY MAKH
			  ORDER BY COUNT(SOHD) DESC)
GROUP BY KH.MAKH, HOTEN

--III.41
--Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT MONTH(NGHD) AS THANGMAX, SUM(TRIGIA) AS DOANHTHU
FROM HOADON 
WHERE YEAR(NGHD)= 2006
GROUP BY MONTH(NGHD)
HAVING SUM(TRIGIA) >= ALL (SELECT SUM(TRIGIA)
                           FROM HOADON 
                           WHERE YEAR(NGHD)= 2006
                           GROUP BY MONTH(NGHD))

--III.42
--Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
--C1:
SELECT SP.MASP, TENSP
FROM SANPHAM SP
WHERE MASP = ( SELECT TOP 1 MASP
               FROM CTHD CT, HOADON HD
			   WHERE CT.SOHD = HD.SOHD
			   AND YEAR(NGHD) = 2006
			   GROUP BY(MASP)
			   ORDER BY SUM(SL))
--C2:
SELECT TOP 1 WITH TIES SP.MASP, TENSP, SUM(SL) AS SLBANRA
FROM SANPHAM SP, CTHD CT, HOADON HD
WHERE SP.MASP = CT.MASP
AND CT.SOHD = HD.SOHD
AND YEAR(NGHD) = 2006
GROUP BY SP.MASP, TENSP
ORDER BY SUM(SL)

--III.43
--Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
--C1:
SELECT NUOCSX, MASP, TENSP
FROM SANPHAM SP
GROUP BY NUOCSX, MASP, TENSP
HAVING MAX(GIA) >= (SELECT TOP 1 GIA
                    FROM SANPHAM SP1
					WHERE SP.NUOCSX = SP1.NUOCSX
					ORDER BY GIA DESC)

--C2:
SELECT NUOCSX, MASP, TENSP
FROM SANPHAM SP
WHERE GIA IN (SELECT MAX(GIA)
              FROM SANPHAM SP1
			  WHERE SP.NUOCSX = SP1.NUOCSX)

--III.44
--Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3

--III.45
--*Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều
--nhất.
--C1:
SELECT TOP 1 KH.MAKH, HOTEN, COUNT(DISTINCT SOHD) AS SOLANMUAHANG
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH
AND KH.MAKH IN (SELECT TOP 10 MAKH
                FROM KHACHHANG
				ORDER BY DOANHSO DESC)
GROUP BY KH.MAKH, HOTEN
ORDER BY COUNT(DISTINCT SOHD) DESC

--C2:
SELECT TOP 1 A.MAKH, HOTEN, COUNT(DISTINCT SOHD) AS SOLANMUAHANG
FROM (SELECT TOP 10 MAKH, HOTEN
      FROM KHACHHANG
	  ORDER BY DOANHSO DESC) AS A, HOADON HD
WHERE A.MAKH = HD.MAKH
GROUP BY A.MAKH, HOTEN
ORDER BY COUNT(DISTINCT SOHD) DESC