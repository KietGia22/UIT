create database QuanlySach
use QuanlySach

create table TACGIA
(
  MaTG char(5) not null,
  HoTen varchar(20),
  DiaChi varchar(50),
  NgSinh smalldatetime,
  SoDT varchar(15),
  constraint pk_tg primary key(MaTG)
)

create table SACH
(
  MaSach char(5) not null,
  TenSach varchar(25),
  TheLoai varchar(25),
  constraint pk_s primary key(MaSach)
)

create table TACGIA_SACH
(
  MaTG char(5),
  MaSach char(5),
  constraint pk_ts primary key(MaTG, MaSach)
)

create table PHATHANH
(
  MaPH char(5) not null,
  MaSach char(5),
  NgayPH smalldatetime,
  SoLuong int,
  NhaXuatBan varchar(20),
  constraint pk_ph primary key(MaPH)
)

alter table TACGIA_SACH add constraint fk_ts foreign key(MaTG) references TACGIA(MaTG)
alter table TACGIA_SACH add constraint fk_ts1 foreign key(MaSach) references SACH(MaSach)

alter table PHATHANH add constraint fk_pk foreign key(MaSach) references SACH(MaSach)

set dateformat dmy

--insert into TACGIA values
INSERT INTO TACGIA VALUES ('TG001', 'Nguyen Nhat Anh', '731 TRAN HUNG DAO,Q5,TPHCM','7/5/1955','0882345142')
INSERT INTO TACGIA VALUES ('TG002', 'Le Van Truong', '23/5 NGUYEN TRAI,Q5,TPHCM','22/09/1988','0908256478')
INSERT INTO TACGIA  VALUES ('TG003', 'Nguyen Ngoc Thach', '45 NGUYEN CANH CHAN,Q1,TPHCM','02/01/1987','0938776266')
INSERT INTO TACGIA VALUES ('TG004', 'Do Nhat Nam', '50/34LE DAI HANH,Q10,TPHCM','01/05/2001','0917325476')
INSERT INTO TACGIA  VALUES ('TG005', 'Nguyen Minh Nhat', '34 TRUONG DINH,Q3,TPHCM','03/03/1987','0824610875')
INSERT INTO TACGIA  VALUES ('TG006', 'Cao Bich Thuy', '227 NGUYEN VAN CU,Q5,TPHCM','14/03/1988','0863173842')
INSERT INTO TACGIA VALUES ('TG007', 'Quach Le Anh Khang', '32/3 TRAN BINH TRONG,Q5,TPHCM','11/08/1987','0916783565')
INSERT INTO TACGIA VALUES ('TG008', 'Le Thi Hong Phuong', '45/2 AN DUONG VUONG','21/04/1992','0938435756')
INSERT INTO TACGIA  VALUES ('TG009', 'Vu Phuong Thanh', '85/6 MAI CHI THO,Q2,TPHCM','08/07/1988','0917437792')
INSERT INTO TACGIA VALUES ('TG010', 'Nhieu tac gia', NULL, NULL, NULL)

INSERT INTO SACH VALUES ('S001','Mat biec', 'Truyen dai')
INSERT INTO SACH VALUES ('S002','La nam trong la', 'Truyen dai')
INSERT INTO SACH VALUES ('S003','Vien ngoc', 'Truyen ngan')
INSERT INTO SACH VALUES ('S004','Buoi chieu Windows', 'Truyen dai')
INSERT INTO SACH VALUES ('S005','Mot giot dan ba', 'Truyen ngan')
INSERT INTO SACH VALUES ('S006','Khoc giua Sai gon', 'Tieu Thuyet')
INSERT INTO SACH VALUES ('S007','Am thanh cua im lang', 'Tieu Thuyet')
INSERT INTO SACH VALUES ('S008','Cu phat den', 'Truyen ngan')
INSERT INTO SACH VALUES ('S009','Ngay troi ve phia cu', 'Tan van')
INSERT INTO SACH VALUES ('S010','Mim cuoi cho qua', 'Tan van')
INSERT INTO SACH VALUES ('S011','Tieng Viet Lop 1 - Tap 1', 'Giao Khoa')
INSERT INTO SACH VALUES ('S012','Tieng Viet Lop 1 - Tap 2', 'Giao Khoa')
INSERT INTO SACH VALUES ('S013','Tieng Anh Lop 10', 'Giao Khoa')
INSERT INTO SACH VALUES ('S014','Tieng Anh Lop 11', 'Giao Khoa')
INSERT INTO SACH VALUES ('S015','Tieng Anh Lop 12', 'Giao Khoa') 


INSERT INTO TACGIA_SACH VALUES ('TG001','S001')
INSERT INTO TACGIA_SACH VALUES ('TG001','S002')
INSERT INTO TACGIA_SACH VALUES ('TG001','S003')
INSERT INTO TACGIA_SACH VALUES ('TG001','S004')
INSERT INTO TACGIA_SACH VALUES ('TG003','S005')
INSERT INTO TACGIA_SACH VALUES ('TG003','S006')
INSERT INTO TACGIA_SACH VALUES ('TG001','S008')
INSERT INTO TACGIA_SACH VALUES ('TG006','S009')
INSERT INTO TACGIA_SACH VALUES ('TG006','S010')
INSERT INTO TACGIA_SACH VALUES ('TG010','S011')
INSERT INTO TACGIA_SACH VALUES ('TG010','S012')
INSERT INTO TACGIA_SACH VALUES ('TG010','S013')
INSERT INTO TACGIA_SACH VALUES ('TG010','S014')
INSERT INTO TACGIA_SACH VALUES ('TG010','S015')

INSERT INTO PHATHANH VALUES ('PH001','S009', '23/6/2013', '1000', 'Minh Chau')
INSERT INTO PHATHANH VALUES ('PH002','S010', '20/4/2010', '1500', 'Minh Chau')
INSERT INTO PHATHANH VALUES ('PH003','S005', '7/4/2015', '1200', 'Ha Noi')
INSERT INTO PHATHANH VALUES ('PH004','S001', '3/10/2017', '5000', 'Tre')
INSERT INTO PHATHANH VALUES ('PH006','S002', '30/11/2014', '4000', 'Tre')
INSERT INTO PHATHANH VALUES ('PH005','S003', '25/5/2011', '4500', 'Tre')
INSERT INTO PHATHANH VALUES ('PH007','S007', '9/5/2014', '1000', 'Tre')
INSERT INTO PHATHANH VALUES ('PH008','S011', '5/5/1990', '15000', 'Giao duc')
INSERT INTO PHATHANH VALUES ('PH009','S011', '20/6/1995', '10000', 'Giao duc')
INSERT INTO PHATHANH VALUES ('PH010','S012', '5/6/1990', '10000', 'Giao duc')
INSERT INTO PHATHANH VALUES ('PH011','S013', '5/7/1990', '20000', 'Giao duc')
INSERT INTO PHATHANH VALUES ('PH012','S014', '25/6/1992', '15000', 'Giao duc')
INSERT INTO PHATHANH VALUES ('PH013','S004', '5/9/2012', '500', 'Tre')
INSERT INTO PHATHANH VALUES ('PH014','S004', '28/5/2016', '700', 'Tre')
INSERT INTO PHATHANH VALUES ('PH015','S001', '20/2/2017', '1200', 'Tre')

--cau 2.1
--trigger thu nhat cho phat hanh 
go
CREATE TRIGGER trigger_tg_ph 
on PHATHANH for insert, update 
as 
begin
     declare @ngph smalldatetime
	 declare @ngsinh smalldatetime
	 declare @ms char(5)
	 declare @mtg char(5)

	 select @ngph = NgayPH, @ms = MaSach from inserted

	 select @mtg = MaTG from TACGIA_SACH where MaSach = @ms

	 select @ngsinh = NgSinh from TACGIA where MaTG = @mtg

	 if(@ngph < @ngsinh)
	 begin 
	     print N'NGAY PHAT HANH PHAI LON HON NGAY SINH CUA TACGIA'
		 rollback transaction
	 end
	 else
	 begin
	     print N'CAP NHAP THANH CONG'
     end
end
--kiem tra trigger
INSERT INTO PHATHANH VALUES ('PH016','S001', '20/2/1954', '1200', 'Tre')

update PHATHANH
set NgayPH = '20/2/1954'
where MaPH = 'PH004'

--trigger thu 2 cho tac gia
--create trigger 

--cau 3.1
select tg.MaTG, HoTen, SoDT
from TACGIA tg, TACGIA_SACH ts, SACH s, PHATHANH ph
where tg.MaTG = ts.MaTG
and ts.MaSach = s.MaSach
and s.MaSach = ph.MaSach
and TheLoai = 'Van hoc'
and NhaXuatBan = 'Tre'

--thay the
select distinct tg.MaTG, HoTen, SoDT, Tensach
from TACGIA tg, TACGIA_SACH ts, SACH s, PHATHANH ph
where tg.MaTG = ts.MaTG
and ts.MaSach = s.MaSach
and s.MaSach = ph.MaSach
and TheLoai = 'Truyen dai'
and NhaXuatBan = 'Tre'

--cau 3.2
select top 1 with ties NhaXuatBan, COUNT(distinct THELOAI) as 'So the loai'
from PHATHANH ph, SACH s
where ph.MaSach = s.MaSach
group by NhaXuatBan
order by COUNT(distinct THELOAI) desc

--c2
select NhaXuatBan
from PHATHANH ph, SACH s
where ph.MaSach = s.MaSach
group by NhaXuatBan
having COUNT(distinct THELOAI) >= ALL(select top 1 COUNT(distinct THELOAI)
                                      from SACH s2, PHATHANH ph1
									  where ph1.MaSach = s2.MaSach
									  group by NhaXuatBan
									  order by COUNT(distinct THELOAI) desc)



--cau3.3
select NhaXuatBan, tg.MaTG, HoTen
from PHATHANH ph, TACGIA tg, TACGIA_SACH ts
where tg.MaTG = ts.MaTG
and ph.MaSach = ts.MaSach
group by NhaXuatBan, tg.MaTG, HoTen
order by COUNT(MaPH) desc

delete from TACGIA_SACH;
delete from TACGIA;
delete from SACH;