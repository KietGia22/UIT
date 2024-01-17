create database QlyBanCay
use QlyBanCay

create table KHACHHANG
(
  MAKH char(5) not null,
  TENKH varchar(30),
  DIACHI varchar(20),
  LOAIKH varchar(20),
  constraint pk_kh primary key(MAKH)
)

create table LOAICAY
(
  MALC char(5) not null,
  TENLC varchar(40),
  XUATXU varchar(20),
  GIA money,
  constraint pk_cay primary key(MALC)
)

create table HOADON
(
  SOHD int not null,
  NGHD smalldatetime,
  MAKH char(5),
  KHUYENMAI int,
  constraint pk_hd primary key(SOHD)
)

create table CTHD
(
  SOHD int,
  MALC char(5),
  SOLUONG int,
  constraint pk_ct primary key(SOHD, MALC)
)

alter table HOADON add constraint fk_hd foreign key(MAKH) references KHACHHANG(MAKH)

alter table CTHD add constraint fk_ct foreign key(MALC) references LOAICAY(MALC)
alter table CTHD add constraint fk_ct1 foreign key(SOHD) references HOADON(SOHD)

set dateformat dmy

insert into KHACHHANG values('KH01', 'Liz Kim Cuong', 'Ha Noi', 'Vang lai')
insert into KHACHHANG values('KH02', 'Ivone Dieu Linh', 'Da Nang', 'Thuong xuyen')
insert into KHACHHANG values('KH03', 'Emma Nhat Khanh', 'TP.HCM', 'Vang lai')

insert into LOAICAY values('LC01', 'Xuong rong tai tho', 'Mexico', 180000)
insert into LOAICAY values('LC02', 'Sen thach ngoc', 'Anh', 300000)
insert into LOAICAY values('LC03', 'Ba mau rau', 'Nam Phi', 270000)

insert into HOADON values('00001', '22/11/2017', 'KH01', 5)
insert into HOADON values('00002', '04/12/2017', 'KH03', 5)
insert into HOADON values('00003', '10/12/2017', 'KH02', 10)

insert into CTHD values('00001', 'LC01', 1)
insert into CTHD values('00001', 'LC02', 2)
insert into CTHD values('00003', 'LC03', 5)

--cau 3
alter table LOAICAY
add constraint check_cay
check(XUATXU = 'Anh' and GIA > 250000)

create trigger trigger_lc
on LOAICAY for insert, update
as
begin 
     declare @gia money
	 declare @xx varchar(20)

	 select @gia = GIA, @xx = XUATXU 
	 from inserted

	 if(@xx = 'Anh' and @gia <= 250000)
	 begin 
	      print N'Tất cả các mặt hàng xuất xứ từ nước Anh đều có giá lớn hơn 250.000đ'
		  rollback transaction
	 end
	 else 
	 begin 
	      print N'Them/Cap nhap thanh cong'
	 end
end

--kiem tra trigger
insert into LOAICAY values('LC04', 'Xuong rong tai tho', 'Anh', 180000)

update LOAICAY
set GIA = 150000
where XUATXU = 'Anh'

drop trigger trigger_lc


--cau 4
create trigger trigger_hd
on HOADON for update
as
begin
     declare @km int
	 declare @sl int
	 declare @hd int

	 select @hd = SOHD, @km = KHUYENMAI from inserted

	 select @sl = sum(SOLUONG) 
	 from CTHD
	 where @hd = SOHD

	 if(@sl >= 5)
	 begin 
	     if(@km <> 10)
		 begin 
		      print N'Hóa đơn mua với số lượng tổng cộng lớn hơn hoặc bằng 5 đều được giảm giá 10 phần trăm'
		      rollback transaction
		 end
		 else 
		 begin 
		     print N'Cap nhap thanh cong'
		 end
	 end
end

--kiem tra trigger
update HOADON 
set KHUYENMAI = 10 --ok
where SOHD = '00001'

update HOADON
set KHUYENMAI = 5 --error
where SOHD = '00003'

drop trigger trigger_hd


select hd.SOHD, sum(SOLUONG) as soluong
from CTHD ct, HOADON hd
where ct.SOHD = hd.SOHD
group by hd.SOHD

--trigger 2
create trigger trigger_cthd
on CTHD for update, insert
as 
begin 
     declare @sl int, @km int, @hd int

	 select @sl = sum(SOLUONG), @hd = SOHD
	 from inserted
	 group by SOHD

	 select @km = KHUYENMAI
	 from HOADON
	 where @hd = SOHD

	 if(@sl >= 5 and @km <> 10)
	 begin 
	      print N'Hóa đơn mua với số lượng tổng cộng lớn hơn hoặc bằng 5 đều được giảm giá 10 phần trăm'
		  rollback transaction
	 end
	 else 
	 begin 
	      print N'Them/Cap nhap thanh cong'
	 end
end

update CTHD
set  SOLUONG = 10
where SOHD = '00001' and MALC = 'LC01' --error

drop trigger trigger_cthd

--cau 5
select *
from HOADON
where Month(NGHD) IN ('10', '11', '12')
and YEAR(NGHD) = 2017
order by KHUYENMAI asc

--cau 6
select top 1 with ties lc.MALC, TENLC, SOLUONG
from LOAICAY lc, CTHD ct, HOADON hd
where lc.MALC = ct.MALC
and ct.SOHD = hd.SOHD
and MONTH(NGHD) = 12
order by SOLUONG asc

------------------------
update CTHD
set SOHD = '00001'
where SOLUONG = 2
--------------------------

--cau 7
select lc.MALC, TENLC
from LOAICAY lc, CTHD ct, HOADON hd, KHACHHANG kh
where lc.MALC = ct.MALC
and ct.SOHD = hd.SOHD
and hd.MAKH = kh.MAKH
and LOAIKH = 'Vang lai'
intersect
select lc.MALC, TENLC
from LOAICAY lc, CTHD ct, HOADON hd, KHACHHANG kh
where lc.MALC = ct.MALC
and ct.SOHD = hd.SOHD
and hd.MAKH = kh.MAKH
and LOAIKH = 'Thuong xuyen'

--cau 8
select *
from KHACHHANG kh
where not exists(select *
                 from LOAICAY c
				 where not exists(select *
				                  from (select MAKH, MALC 
								        from CTHD ct, HOADON hd
										where ct.SOHD = hd.SOHD) as A
								  where A.MAKH = kh.MAKH
								  and A.MALC = c.MALC))

update CTHD
set SOHD = '00003'
where SOLUONG = 5




