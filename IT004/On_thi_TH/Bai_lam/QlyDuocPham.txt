create database QlyDUOCPHAM
use QlyDUOCPHAM

create table NHACUNGCAP
(
  MANCC char(5) not null,
  TENNCC varchar(30),
  QUOCGIA varchar(25),
  LOAINCC varchar(25),
  constraint pk_ncc primary key(MANCC)
)

create table DUOCPHAM
(
  MADP char(5) not null,
  TENDP varchar(30),
  LOAIDP varchar(25),
  GIA money,
  constraint pk_dp primary key(MADP)
)

create table PHIEUNHAP
(
  SOPN int not null,
  NGNHAP smalldatetime,
  MANCC char(5),
  LOAINHAP varchar(25),
  constraint pk_pn primary key(SOPN)
)

create table CTPN
(
  SOPN int,
  MADP char(5),
  SOLUONG int,
  constraint pk_ct primary key(SOPN, MADP)
)

alter table PHIEUNHAP add constraint fk_pn foreign key(MANCC) references NHACUNGCAP(MANCC)

alter table CTPN add constraint fk_ct1 foreign key(SOPN) references PHIEUNHAP(SOPN)
alter table CTPN add constraint fk_ct2 foreign key(MADP) references DUOCPHAM(MADP)

set dateformat dmy

insert into NHACUNGCAP values('NCC1', 'Phuc Hung', 'Viet Nam', 'Thuong xuyen')
insert into NHACUNGCAP values('NCC2', 'J. B. Pharmaceuticals', 'India', 'Vang lai')
insert into NHACUNGCAP values('NCC3', 'Sapharco', 'Singapore', 'Vang lai')

insert into DUOCPHAM values('DP01', 'Thuoc ho PH', 'Siro', 120000)
insert into DUOCPHAM values('DP02', 'Zecuf Herbal CouchRemedy', 'Vien nen', 200000)
insert into DUOCPHAM values('DP03', 'Cotrim', 'Vien sui', 80000)

insert into PHIEUNHAP values('00001', '22/11/2017', 'NCC1', 'Noi dia')
insert into PHIEUNHAP values('00002', '04/12/2017', 'NCC3', 'Nhap khau')
insert into PHIEUNHAP values('00003', '10/12/2017', 'NCC2', 'Nhap khau')

insert into CTPN values('00001', 'DP01', 100)
insert into CTPN values('00001', 'DP02', 200)
insert into CTPN values('00003', 'DP03', 543)

--cau 3
create trigger trigger_dp
on DUOCPHAM for insert, update
as
begin
     declare @LDP varchar(25)
	 declare @GIA money
	 select @LDP = LOAIDP, @GIA = GIA from inserted
	 if(@LDP = 'Siro' and @GIA <= 100000)
	 begin  
	     print N'Tất cả các dược phẩm có loại là Siro đều có giá lớn hơn 100.000d'
		 rollback transaction
	 end
	 else
	 begin
	     print N'Them/Cap nhap thanh cong'
	 end
end

--kiem tra trigger
insert into DUOCPHAM values('DP04', 'A', 'Siro', 50000)

update DUOCPHAM
set GIA = 120000
where MADP = 'DP01'

--cau 4
create trigger trigger_ncc
on NHACUNGCAP for update
as 
begin 
    declare @qg varchar(25)
	declare @ln varchar(25)
	declare @Mcc char(5)
	select @qg = QUOCGIA, @Mcc = MANCC from inserted

	select @ln = LOAINHAP from PHIEUNHAP
	where @Mcc = MANCC

	if(@qg <> 'Viet Nam' and @ln <> 'Nhap khau')
	begin
	     print N'Phiếu nhập của những nhà cung cấp ở những quốc gia khác Việt Nam đều có loại nhập là Nhập khẩu'
         rollback transaction
	end
	else 
	begin 
	     print N'Cap nhap thanh cong'
	end
end

--kiem tra trigger
update NHACUNGCAP
set QUOCGIA = 'India' --error
where MANCC = 'NCC1'

update NHACUNGCAP
set QUOCGIA = 'India' --success
where MANCC = 'NCC2'

drop trigger trigger_ncc

--trigger 2
create trigger trigger_pn
on PHIEUNHAP for insert, update
as 
begin
     declare @qg varchar(25)
	 declare @ln varchar(25)
	 declare @Mcc char(5)
	 select @ln = LOAINHAP, @Mcc = MANCC from inserted

	 select @qg = QUOCGIA from NHACUNGCAP
	 where @Mcc = MANCC

	 if(@qg <>'Viet Nam' and @ln <> 'Nhap khau')
	 begin 
	      print N'Phiếu nhập của những nhà cung cấp ở những quốc gia khác Việt Nam đều có loại nhập là Nhập khẩu'
		  rollback transaction
	 end
	 else
	 begin 
	      print N'Them/Cap nhap thanh cong'
	 end
end

--kiem tra trigger
insert into PHIEUNHAP values('00005', '1/1/2017', 'NCC2', 'Noi dia')

delete from PHIEUNHAP
where SOPN = '00005'

update PHIEUNHAP
set LOAINHAP = 'Noi dia'
where MANCC = 'NCC3'

drop trigger trigger_pn

--cau 5
select *
from PHIEUNHAP
where YEAR(NGNHAP) = 2017
and MONTH(NGNHAP) = 12
order by NGNHAP asc

--cau 6
select top 1 with ties dp.MADP, TENDP, SOLUONG as 'Soluongduocnhap'
from DUOCPHAM dp, CTPN ct, PHIEUNHAP pn
where dp.MADP = ct.MADP
and ct.SOPN = pn.SOPN
and YEAR(NGNHAP) = 2017
order by SOLUONG desc

--cau 7
select dp.MADP, TENDP
from DUOCPHAM dp, CTPN ct, PHIEUNHAP pn, NHACUNGCAP ncc
where dp.MADP = ct.MADP
and ct.SOPN = pn.SOPN
and pn.MANCC = ncc.MANCC
and LOAINCC = 'Thuong xuyen'
and not exists (select *
                from DUOCPHAM dp1, CTPN ct, PHIEUNHAP pn, NHACUNGCAP ncc
                where dp1.MADP = ct.MADP
                and ct.SOPN = pn.SOPN
                and pn.MANCC = ncc.MANCC 
				and LOAINCC = 'Vang lai'
				and dp1.MADP = dp.MADP)

--cau 8
select *
from NHACUNGCAP ncc
where not exists (select *
                  from DUOCPHAM dp
				  where GIA > 100000
				  and not exists (select *
				                  from (select MADP, MANCC 
								        from PHIEUNHAP pn, CTPN ct
								        where pn.SOPN = ct.SOPN) as A
								  where A.MADP = dp.MADP
								  and A.MANCC = ncc.MANCC))