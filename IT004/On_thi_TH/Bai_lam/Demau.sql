CREATE DATABASE DEMAU
USE DEMAU

--cau 1.1
create table XEPLOAI
(
  MAXEPLOAI  char(4) not null,
  TENXEPLOAI varchar(20),
  constraint pk_xl primary key(MAXEPLOAI)
)

create table HOCVIEN
(
  MAHV     char(4) not null,
  HOTEN    varchar(30),
  NGSINH   smalldatetime,
  DIACHI   varchar(30),
  EMAIL    varchar(30),
  SDT      varchar(15),
  MAXEPLOAI char(4),
  constraint pk_hv primary key(MAHV)
)

create table GIAOVIEN
(
  MAGV char(4) not null,
  HOTEN varchar(30),
  NGSINH smalldatetime,
  NGVL  smalldatetime,
  constraint pk_gv primary key(MAGV)
)

create table XE
(
  MAXE char(4) not null,
  BIENSO varchar(10),
  TENLOAIXE varchar(20),
  constraint pk_xe primary key(MAXE)
)

create table BAIHOC
(
  MABAIHOC char(4) not null,
  NGAYHOC  smalldatetime,
  SOGIO    int,
  GIA      money,
  MAHV     char(4),
  MAGV     char(4),
  MAXE     char(4),
  constraint pk_bh primary key(MABAIHOC)
)

alter table HOCVIEN add constraint fk_hv foreign key(MAXEPLOAI) references XEPLOAI(MAXEPLOAI)

alter table BAIHOC add constraint fk1 foreign key(MAHV) references HOCVIEN(MAHV)
alter table BAIHOC add constraint fk2 foreign key(MAGV) references GIAOVIEN(MAGV)
alter table BAIHOC add constraint fk3 foreign key(MAXE) references XE(MAXE)

set dateformat dmy

--cau 1.2
insert into XEPLOAI values('XL1', 'BINHTHUONG')

insert into HOCVIEN values('HV1', 'Nguyen A', '29/09/2003', '4 Le Duan', 'A@gmail.com', '0123456789', 'XL1')
insert into GIAOVIEN values('GV1', 'Tran B', '10/03/1990', '10/03/2010')
insert into XE values('X1', '77H-132', 'Yamaha')
insert into BAIHOC values('BH1', '29/09/2010', '180', '500000', 'HV1', 'GV1', 'X1')

--cau 1.3
update HOCVIEN
set HOTEN = 'Le C'
where HOTEN = 'Nguyen A'

--cau 2.1
alter table XEPLOAI
add constraint tenxl
check (TENXEPLOAI IN ('gioi', 'kha', 'trung binh', 'kem'))

--cau 2.2
alter table BAIHOC
add constraint check_gia
check (GIA > 0)

--cau 2.3
--trigger 1
create trigger update_hv
on HOCVIEN for update
as
begin
     declare @ngsinh smalldatetime
	 declare @nghc smalldatetime
	 select @ngsinh = NGSINH from HOCVIEN
	 select @nghc = min(NGAYHOC) from BAIHOC, inserted where inserted.MAHV = BAIHOC.MAHV
	 if(@ngsinh > @nghc)
	 begin 
	      print N'Ngay sinh cua mot hoc vien phai nho hon ngay hoc vien nay hoc'
		  rollback transaction
	end
end

--kiem tra trigger 1:
update HOCVIEN
set NGSINH = '03/01/2018'
where MAHV = 'HV1'

--trigger 2
create trigger update_bh
on BAIHOC for insert, update
as
begin
    declare @ngsinh smalldatetime
	declare @nghc smalldatetime
	select @nghc = NGAYHOC from inserted
	select @ngsinh = NGSINH from inserted, HOCVIEN where inserted.MAHV = HOCVIEN.MAHV
	if(@nghc < @ngsinh)
	begin 
	    print N'Ngay hoc vien nay hoc phai lon hon ngay sinh cua hoc vien do'
		rollback transaction
	end
	else
	   print N'Cap nhap/Them thanh cong'
end
--kiem tra trigger 2:
insert into BAIHOC values('BH8', '01/01/2003', '180', '500000', 'HV1', 'GV3', 'X3')

update BAIHOC
set NGAYHOC = '29/10/2010'
where MABAIHOC = 'BH4'

update BAIHOC
set NGAYHOC = '29/10/2002'
where MABAIHOC = 'BH4'

select *
from BAIHOC

--cau 3.1
select MAHV, HOTEN
from HOCVIEN hv, XEPLOAI xl
where hv.MAXEPLOAI = xl.MAXEPLOAI
and TENXEPLOAI = 'gioi'

--cau 3.2
insert into BAIHOC values('BH2', '29/09/2010', '180', '100000', 'HV1', 'GV1', 'X1')
insert into BAIHOC values('BH3', '29/09/2010', '180', '1500000', 'HV1', 'GV2', 'X1')
insert into BAIHOC values('BH4', '29/09/2010', '180', '500000', 'HV1', 'GV3', 'X1')

update BAIHOC
set GIA = '500000'
where GIA = '1500000'

--c1
select top 1 with ties MABAIHOC, NGAYHOC, SOGIO
from BAIHOC
order by GIA DESC

--c2:
select MABAIHOC, NGAYHOC, SOGIO
from BAIHOC
where GIA >= ALL(select top 1 GIA
                  from BAIHOC)

--cau 3.3
select hv.MAHV, HOTEN
from HOCVIEN hv, BAIHOC bh
where hv.MAHV = bh.MAHV
and NGAYHOC = '05/05/2018' 
intersect 
select hv.MAHV, HOTEN
from HOCVIEN hv, BAIHOC bh
where hv.MAHV = bh.MAHV
and NGAYHOC = '06/05/2018' 

--cau 3.4
insert into XE values('X2', '77-H', 'Mec')
insert into XE values('X3', '77-L', 'Honda')

insert into BAIHOC values('BH5', '01/01/2018', '180', '100000', 'HV1', 'GV2', 'X2')
insert into BAIHOC values('BH6', '02/01/2018', '180', '100000', 'HV1', 'GV2', 'X2')
insert into BAIHOC values('BH7', '01/01/2018', '180', '500000', 'HV1', 'GV3', 'X3')

select x.MAXE, BIENSO
from XE x, BAIHOC bh
where x.MAXE =  bh.MAXE
and NGAYHOC = '01/01/2018'
and x.MAXE not in (select MAXE
                from BAIHOC bh1
				where NGAYHOC = '02/01/2018'
				and x.MAXE = bh1.MAXE)

--cau 3.5
select x.MAXE, BIENSO
from XE x, BAIHOC bh
where x.MAXE = bh.MAXE
and YEAR(NGAYHOC) = 2018
and MONTH(NGAYHOC) = 8
group by x.MAXE, BIENSO
having COUNT(MABAIHOC) > 100

--cau 3.6
insert into GIAOVIEN values('GV2', 'Tran B', '10/03/1990', '10/03/2010')
insert into GIAOVIEN values('GV3', 'Tran B', '10/03/1990', '10/03/2010')

select MAGV, HOTEN
from GIAOVIEN gv
WHERE NOT EXISTS
(
   select *
   from XE x
   where TENLOAIXE = 'Ford'
   and NOT EXISTS 
   (
     select * 
     from BAIHOC bh
	 where bh.MAGV = gv.MAGV
	 and bh.MAXE = x.MAXE
	 and YEAR(NGAYHOC) = 2017
	)
)

--cau 3.7
select hv.MAHV, HOTEN, SUM(SOGIO) AS 'Gio hoc'
from HOCVIEN hv, BAIHOC bh
where hv.MAHV = bh.MAHV
and YEAR(NGAYHOC) = 2016
group by hv.MAHV, HOTEN