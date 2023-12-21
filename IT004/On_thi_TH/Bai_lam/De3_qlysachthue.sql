create database QlyThueSach
use QlyThueSach

create table DOCGIA
(
  MaDG char(5) not null,
  HoTen varchar(30),
  NgaySinh smalldatetime,
  DiaChi varchar(30),
  SoDT varchar(15),
  constraint pk_dg primary key(MaDG)
)

create table SACH
(
  MaSach char(5) not null,
  TenSach varchar(25),
  TheLoai varchar(25),
  NhaXuatBan varchar(30),
  constraint pk_s primary key(MaSach)
)

create table PHIEUTHUE 
(
  MaPT char(5) not null,
  MaDG char(5),
  NgayThue smalldatetime,
  NgayTra smalldatetime,
  SoSachThue int,
  constraint pk_pt primary key(MaPT)
)

create table CHITIET_PT
(
  MaPT char(5),
  MaSach char(5),
  constraint pk_ct primary key(MaPT, MaSach)
)

alter table PHIEUTHUE add constraint fk_pt foreign key(MaDG) references DOCGIA(MaDG)
alter table CHITIET_PT add constraint fk_ct1 foreign key(MaPT) references PHIEUTHUE(MaPT)
alter table CHITIET_PT add constraint fk_ct2 foreign key(MaSach) references SACH(MaSach)

INSERT INTO DOCGIA VALUES('DG001','Doc gia A', '1/12/1986','Dia chi A','0912345678')
INSERT INTO DOCGIA VALUES('DG002','Doc gia B', '2/12/1986','Dia chi B','0912345678')
INSERT INTO DOCGIA VALUES('DG003','Doc gia C', '3/12/1986','Dia chi C','0912345678')
INSERT INTO DOCGIA VALUES('DG004','Doc gia D', '4/12/1986','Dia chi D','0912345678')
INSERT INTO DOCGIA VALUES('DG005','Doc gia E', '5/12/1986','Dia chi E','0912345678')
INSERT INTO DOCGIA VALUES('DG006','Doc gia F', '6/12/1986','Dia chi F','0912345678')
INSERT INTO DOCGIA VALUES('DG007','Doc gia G', '7/12/1986','Dia chi G','0912345678')
INSERT INTO DOCGIA VALUES('DG008','Doc gia H', '8/12/1986','Dia chi H','0912345678')
INSERT INTO DOCGIA VALUES('DG009','Doc gia I', '9/12/1986','Dia chi I','0912345678')
INSERT INTO DOCGIA VALUES('DG010','Doc gia J', '10/12/1986','Dia chi J','0912345678')

INSERT INTO SACH VALUES('S0001','Sach A','Tin hoc','Tre')
INSERT INTO SACH VALUES('S0002','Sach B','Tin hoc','Giao duc')
INSERT INTO SACH VALUES('S0003','Sach C','Tin hoc','Tre')
INSERT INTO SACH VALUES('S0004','Sach D','Tin hoc','Giao duc')
INSERT INTO SACH VALUES('S0005','Sach E','Tin hoc','Tre')
INSERT INTO SACH VALUES('S0006','Sach F','Van hoc','Giao duc')
INSERT INTO SACH VALUES('S0007','Sach G','Van hoc','Giao duc')
INSERT INTO SACH VALUES('S0008','Sach H','Van hoc','Tre')
INSERT INTO SACH VALUES('S0009','Sach I','Toan hoc','Giao duc')
INSERT INTO SACH VALUES('S0010','Sach J','Toan hoc','Tre')

INSERT INTO PHIEUTHUE VALUES('PT001','DG001','1/4/2019','1/5/2019',5)
INSERT INTO PHIEUTHUE VALUES('PT002','DG002','1/4/2010','1/5/2010',5)
INSERT INTO PHIEUTHUE VALUES('PT003','DG003','1/4/2007','1/5/2007',15)
INSERT INTO PHIEUTHUE VALUES('PT004','DG004','1/4/2019','1/5/2019',5)
INSERT INTO PHIEUTHUE VALUES('PT005','DG005','1/4/2019','1/5/2019',4)
INSERT INTO PHIEUTHUE VALUES('PT006','DG006','1/4/2007','1/5/2007',5)
INSERT INTO PHIEUTHUE VALUES('PT007','DG007','1/4/2019','1/5/2019',3)
INSERT INTO PHIEUTHUE VALUES('PT008','DG008','1/4/2007','1/5/2007',1)
INSERT INTO PHIEUTHUE VALUES('PT009','DG009','1/4/2007','1/5/2007',10)
INSERT INTO PHIEUTHUE VALUES('PT010','DG010','1/4/2007','1/5/2007',5)

INSERT INTO CHITIET_PT VALUES('PT001', 'S0001')
INSERT INTO CHITIET_PT VALUES('PT002', 'S0002')
INSERT INTO CHITIET_PT VALUES('PT003', 'S0003')
INSERT INTO CHITIET_PT VALUES('PT004', 'S0004')
INSERT INTO CHITIET_PT VALUES('PT005', 'S0005')
INSERT INTO CHITIET_PT VALUES('PT006', 'S0006')
INSERT INTO CHITIET_PT VALUES('PT007', 'S0007')
INSERT INTO CHITIET_PT VALUES('PT008', 'S0008')
INSERT INTO CHITIET_PT VALUES('PT009', 'S0009')
INSERT INTO CHITIET_PT VALUES('PT010', 'S0010')
INSERT INTO CHITIET_PT VALUES('PT010', 'S0001')
INSERT INTO CHITIET_PT VALUES('PT010', 'S0002')
INSERT INTO CHITIET_PT VALUES('PT009', 'S0010')
INSERT INTO CHITIET_PT VALUES('PT008', 'S0010')
INSERT INTO CHITIET_PT VALUES('PT007', 'S0010')
INSERT INTO CHITIET_PT VALUES('PT007', 'S0006')

--cau 2.1
create trigger trigger_dg
on PHIEUTHUE for update, insert
as
begin
     declare @ngtr smalldatetime
	 declare @ngth smalldatetime
	 select @ngth = NgayThue, @ngtr = NgayTra from inserted
	 if(DATEDIFF(day, @ngth, @ngtr) > 10)
	 begin
	      print N' Mỗi lần thuê sách, độc giả không được thuê quá 10 ngày'
		  rollback transaction
	 end
end

drop trigger trigger_dg

alter table PHIEUTHUE
add constraint check_dg
check (DATEDIFF(day, NgayThue, NgayTra) < 10)
--kiem tra trigger
SET DATEFORMAT DMY

INSERT INTO PHIEUTHUE VALUES ('PT145','DG001','1/10/2020','9/10/2020',2) --Error

delete from PHIEUTHUE
where MaPT = 'PT145'

UPDATE PHIEUTHUE
SET NgayTra = '21/10/2020'--Error
WHERE MaPT = 'PT002'

--cau 3.1
select dg.MaDG, HoTen
from DOCGIA dg, SACH s, PHIEUTHUE pt, CHITIET_PT ct
where dg.MaDG = pt.MaDG
and s.MaSach = ct.MaSach
and ct.MaPT = pt.MaPT
and TheLoai = 'Tin hoc'
and YEAR(NgayThue) = 2007

--cau 3.2
select top 1 with ties dg.MaDG, HoTen
from DOCGIA dg, SACH s, PHIEUTHUE pt, CHITIET_PT ct
where dg.MaDG = pt.MaDG
and s.MaSach = ct.MaSach
and ct.MaPT = pt.MaPT
group by dg.MaDG, HoTen
order by COUNT(distinct TheLoai) desc

--cau 3.3
select TheLoai, TenSach, count(MaPT) as 'SoTheLoaiSach'
from SACH s, CHITIET_PT ct
where s.MaSach = ct.MaSach
group by TheLoai, TenSach, s.MaSach
having COUNT(MaPT) >= ALL(select COUNT(MaPT)
                             from SACH s1, CHITIET_PT ct
                             where s1.MaSach = ct.MaSach
							 group by TheLoai, TenSach, s1.MaSach
							 having s.TheLoai = s1.TheLoai)