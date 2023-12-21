create database QlyBanXe
use QlyBanXe

create table KHACHHANG
(
  MaKH char(5) not null,
  Ho varchar(10),
  Ten varchar(10),
  SDT varchar(10),
  Email varchar(20),
  duong_DiaChi varchar(30),
  Tp varchar(20),
  MaBC char(10),
  bang_DC varchar(30),
  constraint pk_kh primary key(MaKH)
)

create table NHANVIEN 
(
  MaNV char(5) not null,
  Ho varchar(10),
  Ten varchar(10),
  SDT varchar(10),
  Email varchar(20),
  MaCH char(5),
  MaNQL char(5),
  dang_lv varchar(20),
  constraint pk_nv primary key(MaNV)
)

create table CUAHANG
(
  MaCH char(5) not null,
  TenCH varchar(20),
  SDT varchar(10),
  Email varchar(20),
  duong_DiaChi varchar(30),
  Tp varchar(20),
  MaBC char(10),
  bang_DC varchar(30),
  constraint pk_ch primary key(MaCH)
)

create table HOADON
( 
  SoHD int not null,
  MaKH char(5),
  TTHD varchar(15),
  NgHD smalldatetime,
  NgGH_DK smalldatetime,
  NgGH_TT smalldatetime,
  MaCH char(5),
  MaNV char(5),
  constraint pk_hd primary key(SoHD)
)

create table CTHD
(
  SoHD int, 
  MaCX char(5),
  MaSP char(5),
  SoLuong int,
  giaBan money,
  giamGia int,
  constraint pk_cthd primary key(SoHD, MaSP)
)

create table SANPHAM
( 
  MaSP char(5) not null,
  TenSP varchar(20),
  MaNSX char(5),
  MaLSP char(5),
  nam int,
  giaBan money,
  constraint pk_sp primary key(MaSP)
)

create table KHO
(
  MaCH char(5),
  MaSP char(5),
  SoLuong int,
  constraint pk_k primary key(MaCH)
)

create table NHASX
(
  MaNSX char(5) not null,
  TenNSX varchar(20),
  constraint pk_nsx primary key(MaNSX)
)
 
create table LOAISP
( 
  MaLSP char(5) not null,
  TenLSP varchar(20),
  constraint pk_lsp primary key(MaLSP)
)

alter table HOADON add constraint fk1 foreign key(MaKH) references KHACHHANG(MaKH)
alter table HOADON add constraint fk2 foreign key(MaCH) references CUAHANG(MaCH)
alter table HOADON add constraint fk3 foreign key(MaNV) references NHANVIEN(MaNV)

alter table NHANVIEN add constraint fk4 foreign key(MaNQL) references NHANVIEN(MaNV)
alter table NHANVIEN add constraint fk5 foreign key(MaCH) references CUAHANG(MaCH)

alter table SANPHAM add constraint fk6 foreign key(MaNSX) references NHASX(MaNSX)
alter table SANPHAM add constraint fk7 foreign key(MaLSP) references LOAISP(MaLSP)

alter table KHO add constraint fk8 foreign key(MaCH) references CUAHANG(MaCH)
alter table KHO add constraint fk9 foreign key(MaSP) references SANPHAM(MaSP)

alter table CTHD add constraint fk10  foreign key(SoHD) references HOADON(SoHD)
alter table CTHD add constraint fk11 foreign key(MaSP) references SANPHAM(MaSP)

set dateformat dmy

--cau 1
alter table SANPHAM
add constraint check_sp
check (nam >= 2021 and giaBan > 5500)

insert into SANPHAM values('SP01', null, null, null, 2022, 4000) --error

--cau 2


--cau 3
select * 
from HOADON
where NgGH_TT > NgGH_DK

--cau 4
select MaSP, TenSP
from SANPHAM sp, NHASX nsx
where sp.MaNSX = nsx.MaNSX
and TenNSX = 'Strider'
and nam >= 2018

--cau 5
select kh.MaKH, Ho, Ten
from KHACHHANG kh, HOADON hd, CUAHANG ch
where kh.MaKH = hd.MaKH
and ch.MaCH = ch.MaCH
and ch.bang_DC = 'Texas'

--cau 6
select sp.MaSP, TenSP
from SANPHAM sp, HOADON hd, NHANVIEN nv, CTHD ct
where sp.MaSP = ct.MaSP
and ct.SoHD = hd.SoHD
and hd.MaNV = nv.MaNV
and sp.giaBan >= 4000
and nv.Ten = 'Kali'

--cau 7
select kh.MaKH, Ho, Ten
from KHACHHANG kh, HOADON hd, CTHD ct
where kh.MaKH = hd.MaKH
and ct.SoHD = hd.SoHD
except 
select kh.MaKH, Ho, Ten
from KHACHHANG kh, HOADON hd, CTHD ct, NHASX nsx, SANPHAM sp
where kh.MaKH = hd.MaKH
and ct.SoHD = hd.SoHD
and ct.MaSP = sp.MaSP
and sp.MaNSX = nsx.MaNSX
and TenNSX <> 'Haro'

--cau 8
select top 1 with ties nv.MaNV, Ho, Ten
from NHANVIEN nv, HOADON hd, CTHD ct, SANPHAM sp, LOAISP lsp
where nv.MaNV = hd.MaNV
and hd.SoHD = ct.SoHD 
and ct.MaSP = sp.MaSP
and sp.MaLSP = lsp.MaLSP
and TenLSP = 'Cyclocross Bicycles'
group by nv.MaNV, Ho, Ten
order by SUM(ct.SoLuong) asc

--cau 9
select *
from CUAHANG ch
where not exists(select *
                 from (select sp.MaSP from SANPHAM sp, NHASX nsx
				        where sp.MaNSX = nsx.MaNSX) as A
				 where not exists(select * 
				                 from KHO k
								 where k.MaSP = A.MaSP
								 and k.MaCH  = ch.MaCH))