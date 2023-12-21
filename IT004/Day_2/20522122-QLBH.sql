create database QLBH_Main
use QLBH_Main

create table KHACHHANG
(
	MAKH			char(4)			primary key,
	HOTEN			varchar(40),
	DCHI			varchar(50),
	SODT			varchar(20),
	NGSINH			smalldatetime,
	DOANHSO			money,
	NGDK			smalldatetime,
)

create table NHANVIEN
(
	MANV			char(4)			primary key,
	HOTEN			varchar(40),
	SODT			varchar(20),
	NGVL			smalldatetime,
)

create table SANPHAM
(
	MASP			char(4)			primary key,
	TENSP			varchar(40),
	DVT				varchar(20),
	NUOCSX			varchar(40),
	GIA				money,
)

create table HOADON	
(
	SOHD			int,				
	NGHD			smalldatetime,
	MAKH			char(4)			foreign key references KHACHHANG(MAKH),
	MANV			char(4)			foreign key references NHANVIEN(MANV),
	TRIGIA			money,
	constraint	PK_HD	primary key (SOHD)
)

create table CTHD
(
	SOHD			int				foreign key references HOADON(SOHD),
	MASP			char(4)			foreign key references SANPHAM(MASP),
	SL				int,
	constraint	PK_CTHD	primary key	(SOHD,MASP)
)

--1.2
alter table SANPHAM 
add GHICHU	varchar(20);

--1.3
alter table KHACHHANG
add LOAIKH	tinyint;

--1.4
alter table SANPHAM
alter column GHICHU	varchar(100);

--1.5
alter table SANPHAM
drop column GHICHU;

--1.6
--Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG 
--có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, …
alter table KHACHHANG
alter column LOAIKH varchar(20);

--1.7
alter table SANPHAM
add constraint	CHECK_DVT
check	(DVT in ('cay', 'hop', 'cai', 'quyen', 'chuc'));

--1.8
alter table SANPHAM
add constraint CHECK_GIA
check	(GIA>=500);

--1.9
alter table CTHD
add constraint CHECK_SL
check	(SL>=1);

--1.10
alter table KHACHHANG
add constraint CHECK_NGDK
check	(NGDK>NGSINH);

--1.11
--alter table KHACHHANG,HOADON
--add constraint CHECK_NGHD
--check	(NGHD)

--2.1
--NV01 Nguyen Nhu Nhut 0927345678 13/4/2006
--NV02 Le Thi Phi Yen 0987567390 21/4/2006
--NV03 Nguyen Van B 0997047382 27/4/2006
--NV04 Ngo Thanh Tuan 0913758498 24/6/2006
--NV05 Nguyen Thi Truc Thanh 0918590387 20/7/2006

--Nhập dữ liệu cho NHANVIEN
insert into NHANVIEN
values 
			('NV01', 'Nguyen Nhu Nhat', '0927345678', '2006-04-13')
select * from NHANVIEN

insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV02','Le Thi Phi Yen',			'0987567390','2006-04-21')
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV03','Nguyen Van B',			'0997047382','2006-04-27')
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV04','Ngo Thanh Tuan',			'0913758498','2006-06-24')
insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV05','Nguyen Thi Truc Thanh',	'0918590387','2006-07-20')

select * from NHANVIEN

insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','1960-10-22','13060000','2006-07-22')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','1974-04-03','280000','2006-07-30')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','1980-06-12','3860000','2006-08-05')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','1965-03-09','250000','2006-10-02')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','1950-03-10','21000','2006-10-28')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','1981-12-31','915000','2006-11-24')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','1971-04-06','12500','2006-12-01')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756','1971-01-10','365000','2006-12-13')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763','1979-09-03','70000','2007-01-14')
insert into KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','1983-05-02','67500','2007-01-16')


--Nhập dữ liệu cho SANPHAM
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('BC01','But chi','cay','Singapore','3000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('BC02','But chi','cay','Singapore','5000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('BC03','But chi','cay','Viet Nam','3500')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('BC04','But chi','hop','Viet Nam','30000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('BB01','But bi','cay','Viet Nam','5000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('BB02','But bi','cay','Trung Quoc','7000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('BB03','But bi','hop','Thai Lan','100000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('TV01','Tap 100 giay mong','quyen','Trung Quoc','2500')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('TV02','Tap 200 giay mong','quyen','Trung Quoc','4500')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('TV03','Tap 100 giay tot','quyen','Viet Nam','3000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('TV04','Tap 200 giay tot','quyen','Viet Nam','5500')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('TV05','Tap 100 trang','chuc','Viet Nam','23000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('TV06','Tap 200 trang','chuc','Viet Nam','53000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('TV07','Tap 100 trang','chuc','Trung Quoc','34000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST01','So tay 500 trang','quyen','Trung Quoc','40000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST02','So tay loai 1','quyen','Viet Nam','55000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST03','So tay loai 2','quyen','Viet Nam','51000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST04','So tay','quyen','Thai Lan','55000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST05','So tay mong','quyen','Thai Lan','20000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST06','Phan viet bang','hop','Viet Nam','5000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST07','Phan khong bui','hop','Viet Nam','7000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST08','Bong bang','cai','Viet Nam','1000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST09','But long','cay','Viet Nam','5000')
insert into SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) values ('ST10','But long','cay','Trung Quoc','7000')

--Nhập dữ liệu cho HOADON
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1001','2006-07-23','KH01','NV01','320000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1002','2006-08-12','KH01','NV02','840000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1003','2006-08-23','KH02','NV01','100000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1004','2006-09-01','KH02','NV01','180000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1005','2006-10-20','KH01','NV02','3800000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1006','2006-10-16','KH01','NV03','2430000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1007','2006-10-28','KH03','NV03','510000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1008','2006-10-28','KH01','NV03','440000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1009','2006-10-28','KH03','NV04','200000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1010','2006-11-01','KH01','NV01','5200000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1011','2006-11-04','KH04','NV03','250000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1012','2006-11-30','KH05','NV03','21000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1013','2006-12-12','KH06','NV01','5000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1014','2006-12-31','KH03','NV02','3150000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1015','2007-01-01','KH06','NV01','910000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1016','2007-01-01','KH07','NV02','12500')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1017','2007-01-02','KH08','NV03','35000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1018','2007-01-13','KH08','NV03','330000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1019','2007-01-13','KH01','NV03','30000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1020','2007-01-14','KH09','NV04','70000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1021','2007-01-16','KH10','NV03','67500')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1022','2007-01-16',null,'NV03','7000')
insert into HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) values ('1023','2007-01-17',null,'NV01','330000')

--Nhập dữ liệu cho CTHD
insert into CTHD(SOHD,MASP,SL) values ('1001','TV02','10')
insert into CTHD(SOHD,MASP,SL) values ('1001','ST01','5')
insert into CTHD(SOHD,MASP,SL) values ('1001','BC01','5')
insert into CTHD(SOHD,MASP,SL) values ('1001','BC02','10')
insert into CTHD(SOHD,MASP,SL) values ('1001','ST08','10')
insert into CTHD(SOHD,MASP,SL) values ('1002','BC04','20')
insert into CTHD(SOHD,MASP,SL) values ('1002','BB01','20')
insert into CTHD(SOHD,MASP,SL) values ('1002','BB02','20')
insert into CTHD(SOHD,MASP,SL) values ('1003','BB03','10')
insert into CTHD(SOHD,MASP,SL) values ('1004','TV01','20')
insert into CTHD(SOHD,MASP,SL) values ('1004','TV02','10')
insert into CTHD(SOHD,MASP,SL) values ('1004','TV03','10')
insert into CTHD(SOHD,MASP,SL) values ('1004','TV04','10')
insert into CTHD(SOHD,MASP,SL) values ('1005','TV05','50')
insert into CTHD(SOHD,MASP,SL) values ('1005','TV06','50')
insert into CTHD(SOHD,MASP,SL) values ('1006','TV07','20')
insert into CTHD(SOHD,MASP,SL) values ('1006','ST01','30')
insert into CTHD(SOHD,MASP,SL) values ('1006','ST02','10')
insert into CTHD(SOHD,MASP,SL) values ('1007','ST03','10')
insert into CTHD(SOHD,MASP,SL) values ('1008','ST04','8')
insert into CTHD(SOHD,MASP,SL) values ('1009','ST05','10')
insert into CTHD(SOHD,MASP,SL) values ('1010','TV07','50')
insert into CTHD(SOHD,MASP,SL) values ('1010','ST07','50')
insert into CTHD(SOHD,MASP,SL) values ('1010','ST08','100')
insert into CTHD(SOHD,MASP,SL) values ('1010','ST04','50')
insert into CTHD(SOHD,MASP,SL) values ('1010','TV03','100')
insert into CTHD(SOHD,MASP,SL) values ('1011','ST06','50')
insert into CTHD(SOHD,MASP,SL) values ('1012','ST07','3')
insert into CTHD(SOHD,MASP,SL) values ('1013','ST08','5')
insert into CTHD(SOHD,MASP,SL) values ('1014','BC02','80')
insert into CTHD(SOHD,MASP,SL) values ('1014','BB02','100')
insert into CTHD(SOHD,MASP,SL) values ('1014','BC04','60')
insert into CTHD(SOHD,MASP,SL) values ('1014','BB01','50')
insert into CTHD(SOHD,MASP,SL) values ('1015','BB02','30')
insert into CTHD(SOHD,MASP,SL) values ('1015','BB03','7')
insert into CTHD(SOHD,MASP,SL) values ('1016','TV01','5')
insert into CTHD(SOHD,MASP,SL) values ('1017','TV02','1')
insert into CTHD(SOHD,MASP,SL) values ('1017','TV03','1')
insert into CTHD(SOHD,MASP,SL) values ('1017','TV04','5')
insert into CTHD(SOHD,MASP,SL) values ('1018','ST04','6')
insert into CTHD(SOHD,MASP,SL) values ('1019','ST05','1')
insert into CTHD(SOHD,MASP,SL) values ('1019','ST06','2')
insert into CTHD(SOHD,MASP,SL) values ('1020','ST07','10')
insert into CTHD(SOHD,MASP,SL) values ('1021','ST08','5')
insert into CTHD(SOHD,MASP,SL) values ('1021','TV01','7')
insert into CTHD(SOHD,MASP,SL) values ('1021','TV02','10')
insert into CTHD(SOHD,MASP,SL) values ('1022','ST07','1')
insert into CTHD(SOHD,MASP,SL) values ('1023','ST04','6')

--2.2
select * into SANPHAM1 from SANPHAM
select * from SANPHAM1
select * into KHACHAHANG1 from KHACHHANG
drop table KHACHAHANG1
select * into KHACHHANG1 from KHACHHANG

--2.3
UPDATE	SANPHAM1
set	GIA = GIA*1.05	where NUOCSX = 'Thai Lan'
select * from SANPHAM1

--2.4
UPDATE SANPHAM1
set GIA = GIA*0.95	where GIA<=10000 and NUOCSX = 'Trung Quoc'

--2.5
UPDATE KHACHHANG1
set	LOAIKH = 'Vip'
where	(NGDK < '2007-01-01' and DOANHSO >=10000000) or (NGDK >= '2007-01-01' and DOANHSO >= 2000000)
select * from KHACHHANG1


--3.1
select MASP, TENSP from SANPHAM
where	NUOCSX = 'Trung Quoc' 

--3.2
select MASP, TENSP from SANPHAM			--Cach1
where	DVT = 'quyen' or DVT = 'cay'	--

select MASP, TENSP from SANPHAM
where	DVT in ('cay', 'quyen')

--3.3
select MASP, TENSP from SANPHAM
where	MASP like 'B%01'

select MASP, TENSP from SANPHAM
where	MASP like 'B_01'

--3.4
select MASP, TENSP from SANPHAM
where	NUOCSX = 'Trung Quoc' and GIA>=30000 and GIA<=40000

select MASP, TENSP from SANPHAM
where	NUOCSX = 'Trung Quoc' and GIA between 30000 and 40000 

--3.5
select MASP, TENSP from SANPHAM
where	(NUOCSX = 'Trung Quoc' or NUOCSX = 'Thai Lan') and GIA between 30000 and 40000 

--3.6
select SOHD, TRIGIA from HOADON
where	NGHD = '2007-01-01' or NGHD = '2007-01-02' 

--3.7
select SOHD, TRIGIA from HOADON
where	MONTH(NGHD) = 1 and YEAR(NGHD) = 2007
order by	NGHD ASC, TRIGIA	DESC

use QLBH_Main
--3.8
--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select	KH.MAKH, HOTEN 
from	KHACHHANG KH, HOADON HD
where	KH.MAKH = HD.MAKH
and		NGHD = '2007-01-01'

--3.9
--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày
--28/10/2006.

select	SOHD, TRIGIA
from	NHANVIEN NV, HOADON HD
where	NV.MANV = HD.MANV
and		HOTEN = 'Nguyen Van B'
and		NGHD  = '2006-10-28'

--3.10
--In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong
--tháng 10/2006.

select	SP.MASP, TENSP
from	SANPHAM SP, KHACHHANG KH, HOADON HD, CTHD
where	CTHD.SOHD = HD.SOHD
and		CTHD.MASP = SP.MASP
and		HD.MAKH	  = KH.MAKH
and		KH.HOTEN  = 'Nguyen Van A' 
and MONTH(NGHD)=10 and YEAR(NGHD)=2006


--3.11
--Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
select distinct	SOHD
from			CTHD HD
where			MASP = 'BB01' or MASP = 'BB02'

--3.12
--Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số
--lượng từ 10 đến 20.
select distinct	SOHD --Cach' 1
from			CTHD HD
where			(MASP = 'BB01' or MASP = 'BB02') and SL>=10 and SL<=20

select	SOHD --Cach' 2
from	CTHD
where	MASP = 'BB01' and (SL between 10 and 20)
union	--Hoi
select	SOHD
from	CTHD
where	MASP = 'BB02' and (SL between 10 and 20)


--3.13
--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với
--số lượng từ 10 đến 20.
select	SOHD --Cach' 1
from	CTHD 
where	MASP = 'BB01' and (SL between 10 and 20) 
and 	SOHD =	(select		SOHD		--and SOHD in (select SOHD
				from		CTHD
				where		MASP = 'BB02' and (SL between 10 and 20))

select	SOHD --Cach' 2
from	CTHD
where	MASP = 'BB01' and (SL between 10 and 20)
intersect --Giao
select	SOHD
from	CTHD
where	MASP = 'BB02' and (SL between 10 and 20)

select	SOHD --Cach' 3
from	CTHD CT1
where	MASP = 'BB01' and (SL between 10 and 20) 
and 	exists	(select		*		
				from		CTHD CT2
				where		MASP = 'BB02' and (SL between 10 and 20)
				and			CT2.SOHD = CT1.SOHD )








--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được
--bán ra trong ngày 1/1/2007.
select	MASP, TENSP --Cach' 1
from	SANPHAM 
where	NUOCSX = 'Trung Quoc'
union
select	SP.MASP, TENSP
from	SANPHAM SP, HOADON HD, CTHD
where	CTHD.SOHD = HD.SOHD
and		CTHD.MASP = SP.MASP
and		NGHD	  = '2007-01-01'

select	distinct	SP.MASP, SP.TENSP --Cach'2
from				SANPHAM SP, HOADON HD, CTHD
where				(NUOCSX = 'Trung Quoc') 
or					(CTHD.SOHD = HD.SOHD
					and		CTHD.MASP = SP.MASP
					and		NGHD	  = '2007-01-01')









--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
select	MASP, TENSP --Cach' 1
from	SANPHAM
where	MASP not in	(select MASP
					from	CTHD)

select	MASP, TENSP	--Cach' 2
from	SANPHAM
except
select	SP.MASP, SP.TENSP
from	SANPHAM SP, CTHD
where	SP.MASP = CTHD.MASP

select	MASP, TENSP --Cach' 3
from	SANPHAM
where	not exists	(select *
					from	CTHD
					where	CTHD.MASP = SANPHAM.MASP)
					









--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.

select	MASP, TENSP	--Cach' 1
from	SANPHAM
except
select	SP.MASP, SP.TENSP
from	SANPHAM SP, CTHD, HOADON HD
where	SP.MASP = CTHD.MASP	and CTHD.SOHD = HD.SOHD and YEAR(NGHD) = 2006



select	MASP, TENSP --Cach'2
from	SANPHAM
where	MASP not in (select MASP
					from	HOADON, CTHD
					where	HOADON.SOHD = CTHD.SOHD	and YEAR(NGHD) = 2006)
		
select	MASP, TENSP --Cach' 3
from	SANPHAM
where	not exists	(select *
					from	CTHD, HOADON HD
					where	CTHD.MASP = SANPHAM.MASP
					and		HD.SOHD   = CTHD.SOHD
					and		YEAR(NGHD) = 2006)







--17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong
--năm 2006.
select	MASP, TENSP	--Cach' 1
from	SANPHAM
where	NUOCSX = 'Trung Quoc'
except
select	SP.MASP, SP.TENSP
from	SANPHAM SP, CTHD, HOADON HD
where	SP.MASP = CTHD.MASP	
and		CTHD.SOHD  = HD.SOHD
and		YEAR(NGHD) = 2006


select	MASP, TENSP --Cach' 2
from	SANPHAM
where	NUOCSX = 'Trung Quoc' and
		MASP not in (	select	MASP
						from	CTHD, HOADON HD
						where	CTHD.SOHD = HD.SOHD
						and		YEAR(NGHD)= 2006)


select	MASP, TENSP --Cach' 3
from	SANPHAM
where	NUOCSX = 'Trung Quoc' and
		not exists	(select *
					from	CTHD, HOADON HD
					where	CTHD.MASP = SANPHAM.MASP
					and		HD.SOHD   = CTHD.SOHD
					and		YEAR(NGHD) = 2006)








--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
use QLBH_Main
select	SOHD
from	HOADON HD
where	not exists (select	*
					from	SANPHAM SP
					where	not exists (select	*
										from	CTHD
										where	CTHD.MASP	=	SP.MASP
										and		CTHD.SOHD	=	HD.SOHD)
					and		NUOCSX	= 'Singapore')








--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
select	SOHD
from	HOADON HD
where	not exists (select	*
					from	SANPHAM SP
					where	not exists (select	*
										from	CTHD
										where	CTHD.MASP	=	SP.MASP
										and		CTHD.SOHD	=	HD.SOHD)
					and		NUOCSX	= 'Singapore')
and		YEAR(NGHD) = 2006

--19* Tìm khách hàng trong một lần mua trong năm 2006 đã mua tất cả các sản phẩm do Singapore sản xuất
select	KH.MAKH, HOTEN
from	HOADON HD,KHACHHANG KH
where	not exists (select	*
					from	SANPHAM SP
					where	not exists (select	*
										from	CTHD
										where	CTHD.MASP	=	SP.MASP
										and		CTHD.SOHD	=	HD.SOHD)
					and		NUOCSX	= 'Singapore')
and		YEAR(NGHD) = 2006
and		HD.MAKH	   = KH.MAKH








--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select	COUNT	(SOHD) SLHD
from			HOADON HD
where			MAKH is null










--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select	COUNT(distinct MASP)
from	CTHD, HOADON HD
where	CTHD.SOHD = HD.SOHD
and		YEAR(NGHD) = 2006







--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select	MAX(TRIGIA) TGMAX, MIN(TRIGIA) TGMIN
from	HOADON HD







--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select	AVG(TRIGIA) TGTB
from	HOADON HD
where	YEAR(NGHD) = 2006









--24. Tính doanh thu bán hàng trong năm 2006.
select	SUM(TRIGIA) as DoanhThu
from	HOADON
where	YEAR(NGHD) = 2006


--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select	SOHD
from	HOADON
where	TRIGIA = (select MAX(TRIGIA)
		from	 HOADON
		where	 YEAR(NGHD) = 2006)

--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select	SOHD
from	HOADON
where	TRIGIA >= ALL	(select TRIGIA
						 from	HOADON
						 where	YEAR(NGHD) = 2006)
and		YEAR(NGHD) = 2006

--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select	KH.HOTEN
from	HOADON HD, KHACHHANG KH
where	HD.MAKH = KH.MAKH
and		TRIGIA >= ALL	(select	TRIGIA
						 from	HOADON
						 where	YEAR(NGHD) = 2006)
and		YEAR(NGHD) = 2006


--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
select top	(3) [MAKH], [HOTEN]
from		KHACHHANG
order by	DOANHSO desc	


--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select	MASP, TENSP
from	SANPHAM
where	GIA in	(select distinct  top (3) [GIA]
				 from		SANPHAM
				 order by	GIA desc)



--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức
--giá cao nhất (của tất cả các sản phẩm).
select	MASP, TENSP
from	SANPHAM
where	NUOCSX = 'Thai Lan'
and		GIA in	(select distinct top (3) GIA
				 from		SANPHAM
				 order by	GIA desc)



--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức
--giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select	MASP, TENSP
from	SANPHAM
where	NUOCSX = 'Trung Quoc'
and		GIA in	(select distinct top (3) GIA
				 from		SANPHAM
				 where		NUOCSX = 'Trung Quoc'
				 order by	GIA desc)



--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
select top 3 *
from		KHACHHANG
order by	DOANHSO desc


--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select	COUNT(MASP) as TongSP
from	SANPHAM
where	NUOCSX = 'Trung Quoc'


--33. Tính tổng số sản phẩm của từng nước sản xuất.
select		NUOCSX, COUNT(MASP) as SLSP
from		SANPHAM
group by	NUOCSX


--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select		NUOCSX, MAX(GIA) as 'Giá cao', MIN(GIA) as 'Giá thấp', AVG(GIA) as 'Trung bình giá'
from		SANPHAM
group by	NUOCSX


--35. Tính doanh thu bán hàng mỗi ngày.
select		NGHD, SUM(TRIGIA) as DoanhThuMoiNgay
from		HOADON
group by	NGHD



--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select		MASP, SUM(SL) as SLBanRa 
from		CTHD, HOADON
where		HOADON.SOHD = CTHD.SOHD and YEAR(NGHD) = 2006 and MONTH(NGHD) = 10
group by	MASP


--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
select		MONTH(NGHD) as Thang, SUM(TRIGIA) as DoanhThuTungThang
from		HOADON
where		YEAR(NGHD) = 2006
group by	MONTH(NGHD)



--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select		SOHD--, COUNT(distinct MASP) as SOSP
from		CTHD
group by	SOHD
having		COUNT(distinct MASP) >= 4



--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select		SOHD--, COUNT(distinct CTHD.MASP)
from		CTHD, SANPHAM
where		CTHD.MASP = SANPHAM.MASP and NUOCSX = 'Viet Nam'
group by	SOHD
having		COUNT(distinct CTHD.MASP) = 3



--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select		MAKH, HOTEN
from		KHACHHANG
where		MAKH =	(select top 1 MAKH
					 from		HOADON
					 group by	MAKH
					 order by	COUNT(SOHD) desc)


--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select distinct		MONTH(NGHD) as Thang
from				HOADON
where				MONTH(NGHD) =	(select top 1 MONTH(NGHD) as Thang--, SUM(TRIGIA) as DoanhThu
									 from		HOADON
									 group by	MONTH(NGHD)
									 order by	SUM(TRIGIA) desc)

--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select distinct		MASP, TENSP
from				SANPHAM
where				MASP =	(select top 1 MASP--, SUM(SL)
							 from		CTHD
							 group by	MASP
							 order by	SUM(SL) asc)


--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
select		NUOCSX, MASP, TENSP
from		SANPHAM
where		GIA in (

select		NUOCSX, MAX(GIA)
from		SANPHAM
group by	NUOCSX
order by	MAX(GIA) desc)


select		NUOCSX, MASP, TENSP, GIA
from		SANPHAM
order by	NUOCSX asc, GIA desc




--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
--45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
