create database QlyBangDia
use QlyBangDia

create table KHACHHANG
(
  MaKH char(5) not null,
  HoTen varchar(30),
  DiaChi varchar(30),
  SoDT varchar(15),
  LoaiKH varchar(10),
  constraint pk_kh primary key(MaKH)
)

create table BANGDIA
(
  MaBD char(5) not null,
  TenBD varchar(25),
  TheLoai varchar(25),
  constraint pk_bd primary key(MaBD)
)

create table PHIEUTHUE
(
  MaPT char(5) not null,
  MaKH char(5),
  NgayThue smalldatetime,
  NgayTra smalldatetime,
  SoluongThue int,
  constraint pk_pt primary key(MaPT)
)

create table CHITIET_PM 
(
  MaPT char(5),
  MaBD char(5),
  constraint pk_pm primary key(MaPT, MaBD)
)

alter table PHIEUTHUE add constraint fk_pt foreign key(MaKH) references KHACHHANG(MaKH)
alter table CHITIET_PM add constraint fk_pm1 foreign key(MaPT) references PHIEUTHUE(MaPT)
alter table CHITIET_PM add constraint fk_pm2 foreign key(MaBD) references BANGDIA(MaBD)

INSERT INTO BANGDIA VALUES('BD001','Bang dia A', 'Phim hanh dong')
INSERT INTO BANGDIA VALUES('BD002','Bang dia B', 'Phim tinh cam')
INSERT INTO BANGDIA VALUES('BD003','Bang dia C', 'Ca nhac')
INSERT INTO BANGDIA VALUES('BD004','Bang dia D', 'Phim hoat hinh')
INSERT INTO BANGDIA VALUES('BD005','Bang dia E', 'Ca nhac')
INSERT INTO BANGDIA VALUES('BD006','Bang dia F', 'Phim hanh dong')
INSERT INTO BANGDIA VALUES('BD007','Bang dia G', 'Ca nhac')
INSERT INTO BANGDIA VALUES('BD008','Bang dia H', 'Ca nhac')
INSERT INTO BANGDIA VALUES('BD009','Bang dia I', 'Phim tinh cam')
INSERT INTO BANGDIA VALUES('BD010','Bang dia J', 'Phim tinh cam')

INSERT INTO KHACHHANG VALUES('KH001', 'Khach hang A','Dia chi cua A', '0912345678','VIP')
INSERT INTO KHACHHANG VALUES('KH002', 'Khach hang B','Dia chi cua B', '0912345678','Member')
INSERT INTO KHACHHANG VALUES('KH003', 'Khach hang C','Dia chi cua C', '0912345678','VIP')
INSERT INTO KHACHHANG VALUES('KH004', 'Khach hang D','Dia chi cua D', '0912345678','Member')
INSERT INTO KHACHHANG VALUES('KH005', 'Khach hang E','Dia chi cua E', '0912345678','Member')
INSERT INTO KHACHHANG VALUES('KH006', 'Khach hang F','Dia chi cua F', '0912345678','Member')
INSERT INTO KHACHHANG VALUES('KH007', 'Khach hang G','Dia chi cua G', '0912345678','VIP')
INSERT INTO KHACHHANG VALUES('KH008', 'Khach hang H','Dia chi cua H', '0912345678','Member')
INSERT INTO KHACHHANG VALUES('KH009', 'Khach hang I','Dia chi cua I', '0912345678','VIP')
INSERT INTO KHACHHANG VALUES('KH010', 'Khach hang J','Dia chi cua J', '0912345678','VIP')

INSERT INTO PHIEUTHUE VALUES('PT001','KH001','1/5/2016','2/7/2016',6)
INSERT INTO PHIEUTHUE VALUES('PT002','KH002','1/5/2016','2/7/2016',2)
INSERT INTO PHIEUTHUE VALUES('PT003','KH003','1/5/2016','2/7/2016',12)
INSERT INTO PHIEUTHUE VALUES('PT004','KH004','1/5/2016','2/7/2016',3)
INSERT INTO PHIEUTHUE VALUES('PT005','KH005','1/5/2016','2/7/2016',4)
INSERT INTO PHIEUTHUE VALUES('PT006','KH005','1/5/2016','2/7/2016',4)
INSERT INTO PHIEUTHUE VALUES('PT007','KH005','1/5/2016','2/7/2016',2)
INSERT INTO PHIEUTHUE VALUES('PT008','KH005','1/5/2016','2/7/2016',4)
INSERT INTO PHIEUTHUE VALUES('PT009','KH009','1/5/2016','2/7/2016',15)
INSERT INTO PHIEUTHUE VALUES('PT010','KH010','1/5/2016','2/7/2016',20)

INSERT INTO CHITIET_PM VALUES('PT001','BD001')
INSERT INTO CHITIET_PM VALUES('PT002','BD002')
INSERT INTO CHITIET_PM VALUES('PT003','BD003')
INSERT INTO CHITIET_PM VALUES('PT004','BD004')
INSERT INTO CHITIET_PM VALUES('PT005','BD005')
INSERT INTO CHITIET_PM VALUES('PT006','BD006')
INSERT INTO CHITIET_PM VALUES('PT007','BD007')
INSERT INTO CHITIET_PM VALUES('PT008','BD008')
INSERT INTO CHITIET_PM VALUES('PT009','BD009')
INSERT INTO CHITIET_PM VALUES('PT010','BD010')

--cau 2.1
--rang buoc
alter table BANGDIA
add constraint check_tl
check (TheLoai in ('Ca nhac', 'Phim hanh dong', 'Phim tinh cam', 'Phim hoat hinh'))

--kiem tra
INSERT INTO BANGDIA VALUES('BD011','Bang dia A', 'Phim kinh di') --Error

--cau 2.2
create trigger trigger_kh
on KHACHHANG for update
as
begin
     declare @LoaiKH varchar(10)
	 declare @MaKH varchar(5)
	 declare @SL int
	 select @MaKH = inserted.MaKH, @LoaiKH = LoaiKH, @SL = Soluongthue from inserted, PHIEUTHUE
	 where inserted.MaKH = PHIEUTHUE.MaKH
	 if(@SL > 5 and @LoaiKH <> 'VIP')
	 begin 
	      print N'Chỉ những khách hàng thuộc loại VIP mới được thuê với số lượng băng đĩa trên 5'
		  rollback transaction
	 end
end

drop trigger trigger_kh
--kiem tra trigger
UPDATE KHACHHANG 
SET LoaiKH = 'Member' 
WHERE MaKH = 'KH001'

--trigger 2
create trigger trigger_pt
on PHIEUTHUE for update, insert
as 
begin 
     declare @LoaiKH varchar(10)
	 declare @MaKH varchar(5)
	 declare @SL int
	 select @MaKH = inserted.MaKH, @LoaiKH = LoaiKH, @SL = Soluongthue from inserted, KHACHHANG
	 where inserted.MaKH = KHACHHANG.MaKH
	 if(@SL > 5 and @LoaiKH <> 'VIP')
	 begin 
	      print N'Chỉ những khách hàng thuộc loại VIP mới được thuê với số lượng băng đĩa trên 5'
		  rollback transaction
	 end
	 else 
	 begin 
	      print N'Them/cap nhap thanh cong'
	 end
end

--kiem tra trigger
INSERT INTO PHIEUTHUE VALUES('PT144','KH002','1/5/2016','2/7/2016',6) --Error
UPDATE PHIEUTHUE
SET Soluongthue = 6 --Error
WHERE MaKH = 'KH002'
--cau 3.1
select kh.MaKH, HoTen
from KHACHHANG kh, PHIEUTHUE pt, BANGDIA bd, CHITIET_PM pm
where kh.MaKH = pt.MaKH
and pt.MaPT = pm.MaPT
and pm.MaBD = bd.MaBD
and TheLoai = 'Phim tinh cam'
and SoluongThue > 3

--cau 3.2
select top 1 with ties kh.MaKH, HoTen
from KHACHHANG kh, PHIEUTHUE pt
where kh.MaKH = pt.MaKH
and LoaiKH = 'VIP'
group by kh.MaKH, HoTen
order by SUM(Soluongthue) desc

--cau 3.3
select bd.TheLoai, HoTen
from KHACHHANG kh, PHIEUTHUE pt, BANGDIA bd, CHITIET_PM pm
where kh.MaKH = pt.MaKH
and pt.MaPT = pm.MaPT
and pm.MaBD = bd.MaBD
group by HoTen, TheLoai
having sum(SoluongThue) >= ALL(select sum(SoluongThue)
                               from KHACHHANG kh, PHIEUTHUE pt, BANGDIA bd1, CHITIET_PM pm
                               where kh.MaKH = pt.MaKH
                               and pt.MaPT = pm.MaPT
                               and pm.MaBD = bd1.MaBD    
							   group by bd1.TheLoai, HoTen
							   having bd1.TheLoai = bd.TheLoai)