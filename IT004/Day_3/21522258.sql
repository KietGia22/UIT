﻿create DATABASE QLBH_main
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



--NGAY 16/11
--III.19
--Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
SELECT SOHD
FROM HOADON HD
WHERE YEAR(NGHD) = 2006
AND NOT EXISTS 
(
   SELECT *
   FROM SANPHAM SP
   WHERE NUOCSX = 'Singapore' 
   AND NOT EXISTS 
   ( 
      SELECT *
	  FROM CTHD CT
	  WHERE CT.SOHD = HD.SOHD
	  AND CT.MASP = SP.MASP
	)
)

--III.20
--Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(SOHD) AS KHONGPHAITV
FROM HOADON
WHERE MAKH IS NULL

--III.21
--Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP) AS SPBANRA
FROM HOADON HD, CTHD CT
WHERE CT.SOHD = HD.SOHD
AND YEAR(NGHD) = 2006

--III.22
--Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS MAX_TG, MIN(TRIGIA) AS MIN_TG
FROM HOADON

--III.23
--Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS TRUNGBINHTG
FROM HOADON
WHERE YEAR(NGHD) = 2006

--III.24
--Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006

--III.25
--Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
--C1:
SELECT TOP 1 WITH TIES SOHD
FROM HOADON
WHERE YEAR(NGHD) = 2006
ORDER BY TRIGIA DESC

--C2:
SELECT SOHD
FROM HOADON
WHERE TRIGIA = ( SELECT MAX(TRIGIA)
                 FROM HOADON
				 WHERE YEAR(NGHD) = 2006)
AND YEAR(NGHD) = 2006

--III.26
--Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH
AND TRIGIA = ( SELECT MAX(TRIGIA)
               FROM HOADON
			   WHERE YEAR(NGHD) = 2006)
AND YEAR(NGHD) = 2006  

--III.27
--In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm
--dần.
SELECT TOP 3 WITH TIES MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC

--III.28
--In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao
--nhất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN ( SELECT DISTINCT TOP 3 WITH TIES GIA
              FROM SANPHAM
			  ORDER BY GIA DESC)

--III.29
--In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN ( SELECT DISTINCT TOP 3 WITH TIES GIA
              FROM SANPHAM
			  ORDER BY GIA DESC)
AND NUOCSX = 'Thai Lan'

--III.30
--In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN ( SELECT DISTINCT TOP 3 WITH TIES GIA
              FROM SANPHAM
			  WHERE NUOCSX = 'Trung Quoc'
			  ORDER BY GIA DESC)
AND NUOCSX = 'Trung Quoc'