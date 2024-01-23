create database QlyXe
use QLyXe

DROP DATABASE QlyXe

create table NHANVIEN
(
  MaNV char(5) not null,
  HoTen varchar(20),
  NgayVL smalldatetime,
  HSLuong numeric(4,2),
  MaPhong char(5),
  constraint pk_nv primary key(MaNV)
)

create table PHONGBAN
(
  MaPhong char(5) not null,
  TenPhong varchar(20),
  TruongPhong char(5),
  constraint pk_pb primary key(MaPhong)
)

create table XE
(
  MaXe char(5) not null,
  LoaiXe varchar(20),
  SoChoNgoi int,
  NamSX int,
  constraint pk_xe primary key(MaXe)
)

create table PHANCONG 
(
  MaPC char(5) not null,
  MaNV char(5),
  MaXe char(5),
  NgayDi smalldatetime,
  NgayVe smalldatetime,
  NoiDen varchar(25),
  constraint pk_pc primary key(MaPC)
)

alter table NHANVIEN add constraint fk_nv foreign key(MaPhong) references PHONGBAN(MaPhong)
alter table PHONGBAN add constraint fk_pb foreign key(TruongPhong) references NHANVIEN(MaNV)
alter table PHANCONG add constraint fk_pc1 foreign key(MaNV) references NHANVIEN(MaNV)
alter table PHANCONG add constraint fk_pc2 foreign key(MaXe) references XE(MaXe)

set dateformat dmy

INSERT INTO XE VALUES('XE001', 'Toyota', 10, 2007)
INSERT INTO XE VALUES('XE002', 'Toyota', 20, 2008)
INSERT INTO XE VALUES('XE003', 'Toyota', 30, 2008)
INSERT INTO XE VALUES('XE004', 'Toyota', 40, 2009)
INSERT INTO XE VALUES('XE005', 'Toyota', 4, 2009)
INSERT INTO XE VALUES('XE006', 'Toyota', 8, 2012)
INSERT INTO XE VALUES('XE007', 'Toyota', 4, 2015)
INSERT INTO XE VALUES('XE008', 'Loai xe 1', 80, 2019)
INSERT INTO XE VALUES('XE009', 'Loai xe 2', 10, 2014)
INSERT INTO XE VALUES('XE010', 'Loai xe 3', 40, 2010)

INSERT INTO NHANVIEN VALUES('NV001', 'Nhan vien A', '1/12/2015', 1, 'PB001')
INSERT INTO NHANVIEN VALUES('NV002', 'Nhan vien B', '2/12/2015', 1, 'PB002')
INSERT INTO NHANVIEN VALUES('NV003', 'Nhan vien C', '3/12/2015', 1, 'PB001')
INSERT INTO NHANVIEN VALUES('NV004', 'Nhan vien D', '4/12/2015', 1, 'PB002')
INSERT INTO NHANVIEN VALUES('NV005', 'Nhan vien E', '5/12/2015', 1, 'PB003')
INSERT INTO NHANVIEN VALUES('NV006', 'Nhan vien F', '6/12/2015', 1, 'PB001')
INSERT INTO NHANVIEN VALUES('NV007', 'Nhan vien G', '7/12/2015', 1, 'PB002')
INSERT INTO NHANVIEN VALUES('NV008', 'Nhan vien H', '8/12/2015', 1, 'PB003')
INSERT INTO NHANVIEN VALUES('NV009', 'Nhan vien I', '9/12/2015', 1, 'PB004')
INSERT INTO NHANVIEN VALUES('NV010', 'Nhan vien J', '10/12/2015', 1, 'PB003')

INSERT INTO PHONGBAN VALUES('PB001', 'Noi thanh', 'NV001')
INSERT INTO PHONGBAN VALUES('PB002', 'Ngoai thanh', 'NV002')
INSERT INTO PHONGBAN VALUES('PB003', 'Noi thanh', 'NV005')
INSERT INTO PHONGBAN VALUES('PB004', 'Ngoai thanh', 'NV009')

INSERT INTO PHANCONG VALUES('PC001','NV001','XE001', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC002','NV002','XE002', '1/10/2016', '3/10/2016', 'Noi den B')
INSERT INTO PHANCONG VALUES('PC003','NV003','XE003', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC004','NV004','XE004', '1/10/2016', '3/10/2016', 'Noi den C')
INSERT INTO PHANCONG VALUES('PC005','NV005','XE005', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC006','NV006','XE006', '1/10/2016', '3/10/2016', 'Noi den B')
INSERT INTO PHANCONG VALUES('PC007','NV007','XE007', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC008','NV008','XE008', '1/10/2016', '3/10/2016', 'Noi den E')
INSERT INTO PHANCONG VALUES('PC009','NV009','XE009', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC010','NV010','XE010', '1/10/2016', '3/10/2016', 'Noi den C')
INSERT INTO PHANCONG VALUES('PC011','NV009','XE001', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC012','NV009','XE002', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC013','NV009','XE003', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC014','NV009','XE004', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC015','NV009','XE005', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC016','NV009','XE006', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC017','NV009','XE007', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC018','NV009','XE008', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC019','NV009','XE010', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC020','NV001','XE001', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC021','NV004','XE004', '1/10/2016', '3/10/2016', 'Noi den C')
INSERT INTO PHANCONG VALUES('PC022','NV005','XE005', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC023','NV005','XE005', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC024','NV005','XE005', '1/10/2016', '3/10/2016', 'Noi den D')
INSERT INTO PHANCONG VALUES('PC025','NV006','XE006', '1/10/2016', '3/10/2016', 'Noi den B')
INSERT INTO PHANCONG VALUES('PC026','NV006','XE006', '1/10/2016', '3/10/2016', 'Noi den B')
INSERT INTO PHANCONG VALUES('PC027','NV001','XE008', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC028','NV001','XE009', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC029','NV001','XE010', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC030','NV001','XE002', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC031','NV005','XE009', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC032','NV005','XE010', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC033','NV005','XE002', '1/10/2016', '3/10/2016', 'Noi den A')
INSERT INTO PHANCONG VALUES('PC034','NV005','XE008', '1/10/2016', '3/10/2016', 'Noi den A')

--cau 2.1
--trigger
create trigger trigger_xe
on XE for insert, update
as
begin
    declare @LX varchar(20)
	declare @NSX int
	select @LX = LoaiXe from inserted
	select @NSX = NamSX from inserted
	if(@LX = 'Toyota' and @NSX < 2006)
	begin 
	     print N'Năm sản xuất của xe loại Toyota phải từ năm 2006 trở về sau.'
		 rollback transaction 
	end
	else 
	begin 
	    print N'Them/Cap nhap thanh cong'
	end
end

drop trigger trigger_xe
--kiem tra trigger
insert into XE values('XE011', 'Toyota', '16', '2005')

--cau 2.2
--trigger
go 
create trigger trigger_pb
on PHANCONG for insert, update
as 
begin 
     declare @MaNV char(5)
	 declare @MaXe char(5)
	 declare @TenP varchar(25)
	 declare @LoaiX varchar(20)

	 select @MaXe = MaXE, @MaNV = MaNV from inserted

	 select @TenP = TenPhong
	 from NHANVIEN nv, PHONGBAN pb
	 where nv.MaPhong = pb.MaPhong
	 and nv.MaNV = @MaNV
	 
	 select @LoaiX = LOAIXE
	 from XE
	 where MaXe = @MaXe

	 if(@TenP = 'NGoai thanh' and @LoaiX <> 'Toyoto')
	 begin 
	      print N'Nhân viên thuộc phòng lái xe “Ngoại thành” chỉ được phân công lái xe loại Toyota.'
		  rollback transaction
	 end
	 else 
	 begin 
	      print N'Them/Cap nhap thanh cong'
	 end
end

--kiem tra trigger
drop trigger trigger_pb
INSERT INTO PHANCONG VALUES('PC144','NV002','XE008','2016-01-10 00:00:00','2016-03-10 00:00:00','Noi den A') 

--cau 3.1
select distinct nv.MaNV, HoTen
from NHANVIEN nv, PHONGBAN pb, XE x, PHANCONG pc
where nv.MaPhong = pb.MaPhong
and nv.MaNV = pc.MaNV
and pc.MaXe = x.MaXe
and TenPhong = 'Noi Thanh'
and LoaiXe = 'Toyota'
and SoChoNgoi = 4

--cau 3.2
select MaNV, HoTen
from NHANVIEN nv, PHONGBAN pb
where nv.MaNV = pb.TruongPhong
and not exists(select *
               from XE x
			   where not exists(select *
			                    from PHANCONG pc, XE x1
								where pc.MaXe = x1.MaXe 
								and pc.MaNV = pb.TruongPhong
								and x1.LoaiXe = x.LoaiXe))

--cau 3.3
select pb.MaPhong, nv.MaNV, HoTen,COUNT(pc.MaPC) as 'So lan phan cong Toyota'
from NHANVIEN nv, PHONGBAN pb, PHANCONG pc,XE x
where nv.MaPhong = pb.MaPhong
and pc.MaNV = nv.MaNV
and x.MaXe = pc.MaXe
and LoaiXe = 'Toyota'
group by pb.MaPhong, nv.MaNV, HoTen
having count(pc.MaPC) <= ALL(select count(pc.MaPC)
                          from NHANVIEN nv, PHONGBAN pb1, PHANCONG pc, XE x
						  where nv.MaPhong = pb1.MaPhong
                          and pc.MaNV = nv.MaNV
                          and x.MaXe = pc.MaXe
                          and LoaiXe = 'Toyota'
						  group by pb1.MaPhong, nv.MaNV, HoTen
						  having pb1.MaPhong = pb.MaPhong)