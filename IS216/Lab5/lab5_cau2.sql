CREATE TABLE BACSI
(
    MABS  char(4) not null PRIMARY KEY,
    TENBS varchar(20)
);
CREATE TABLE BENHNHAN
(
	MABN char(4) not null PRIMARY KEY,
	TENBN varchar(20),
	NGSINH date,
	DCHI varchar(50),
	DTHOAI varchar(10),
	GIOITINH number(1)
);
CREATE TABLE KHAMBENH
(
	MAKB char(6) not null PRIMARY KEY,
	MABN char(4),
	MABS char(4),
    NGAYKHAM date,
    YEUCAUKHAM varchar(50),
	KETLUAN varchar(100),
	THANHTOAN number(1)
);
CREATE TABLE DICHVU
(
	MADV char(6) not null PRIMARY KEY,
	TENDV varchar(30),
	DONGIA decimal 
);
CREATE TABLE THUPHI
(
	MAKB char(6) not null,
	MADV char(6) not null,
	SOLUONG int,
	THANHTIEN number(19),
    PRIMARY KEY (MAKB, MADV)
);

alter table KHAMBENH add foreign key (MABN) references BENHNHAN(MABN);
alter table KHAMBENH add foreign key (MABS) references BACSI(MABS);
alter table THUPHI add foreign key (MAKB) references KHAMBENH(MAKB);
alter table THUPHI add foreign key (MADV) references DICHVU(MADV);

insert into BACSI(MABS, TENBS) values (1, N'A');
insert into BACSI(MABS, TENBS) values (2, N'B');
insert into BACSI(MABS, TENBS) values (3, N'C');

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS';
insert into BENHNHAN(MABN, TENBN, NGSINH, DCHI, DTHOAI, GIOITINH) values (1, N'AB', '11-01-1999', '1 Ly Bi', '1111112222', 1);
insert into BENHNHAN(MABN, TENBN, NGSINH, DCHI, DTHOAI, GIOITINH) values (2, N'ABC', '11-01-1999', '1 Ly Bi', '1111112222', 0);
insert into BENHNHAN(MABN, TENBN, NGSINH, DCHI, DTHOAI, GIOITINH) values (3, N'ABCD', '11-01-1999', '1 Ly Bi', '1111112222', 0);
insert into BENHNHAN(MABN, TENBN, NGSINH, DCHI, DTHOAI, GIOITINH) values (4, N'CEF', '11-01-1999', '1 Ly Bi', '1111112222', 1);
insert into BENHNHAN(MABN, TENBN, NGSINH, DCHI, DTHOAI, GIOITINH) values (5, N'DEB', '11-01-1999', '1 Ly Bi', '1111112222', 1);
insert into BENHNHAN(MABN, TENBN, NGSINH, DCHI, DTHOAI, GIOITINH) values (6, N'XEN', '11-01-1999', '1 Ly Bi', '1111112222', 0);



insert into DICHVU(MADV, TENDV, DONGIA) values (1, N'Dịch vụ a', 150000);
insert into DICHVU(MADV, TENDV, DONGIA) values (2, N'Dịch vụ b', 250000);
insert into DICHVU(MADV, TENDV, DONGIA) values (3, N'Dịch vụ c', 350000);
insert into DICHVU(MADV, TENDV, DONGIA) values (4, N'Dịch vụ d', 450000);

insert into KHAMBENH(MAKB, MABS, MABN, NGAYKHAM, YEUCAUKHAM, KETLUAN, THANHTOAN) VALUES (6, 1, 1,  '13-06-2023', N'TỔNG QUÁT', N'CHƯA CÓ', 0); 
insert into KHAMBENH(MAKB, MABS, MABN, NGAYKHAM, YEUCAUKHAM, KETLUAN, THANHTOAN) VALUES (7, 3, 3,  '13-06-2023', N'TỔNG QUÁT', N'CHƯA CÓ', 0); 
insert into KHAMBENH(MAKB, MABS, MABN, NGAYKHAM, YEUCAUKHAM, KETLUAN, THANHTOAN) VALUES (8, 2, 2,  '13-06-2023', N'TỔNG QUÁT', N'CHƯA CÓ', 0); 
insert into KHAMBENH(MAKB, MABS, MABN, NGAYKHAM, YEUCAUKHAM, KETLUAN, THANHTOAN) VALUES (1, 1, 4,  '13-06-2023', N'CỘT SỐNG', N'CHƯA CÓ', 0); 
insert into KHAMBENH(MAKB, MABS, MABN, NGAYKHAM, YEUCAUKHAM, KETLUAN, THANHTOAN) VALUES (2, 2, 6,  '13-06-2023', N'DÂY CHẰNG', N'CHƯA CÓ', 0); 
insert into KHAMBENH(MAKB, MABS, MABN, NGAYKHAM, YEUCAUKHAM, KETLUAN, THANHTOAN) VALUES (3, 3, 5,  '13-06-2023', N'TỔNG QUÁT', N'CHƯA CÓ', 0); 


create or replace procedure GETTCDV(out_cur OUT SYS_REFCURSOR)
AS
BEGIN 
        OPEN out_cur FOR
        SELECT * from DICHVU
        ORDER BY MADV;
        COMMIT;
END;
/
create or replace procedure GETTCBS(out_cur OUT SYS_REFCURSOR)
AS
BEGIN 
        OPEN out_cur FOR
        SELECT * from BACSI
        ORDER BY MABS;
        COMMIT;
END;
/
create or replace procedure GETTCBN(mbs KHAMBENH.MABS%TYPE, nkb KHAMBENH.NGAYKHAM%TYPE, out_cur OUT SYS_REFCURSOR)
AS
BEGIN 
        OPEN out_cur FOR
        SELECT * FROM KHAMBENH KB, BENHNHAN BN
        WHERE KB.MABN = BN.MABN
        AND MABS = mbs
        AND NGAYKHAM = nkb;
        COMMIT;
END;
/
create or replace procedure GETTCBN(mbs KHAMBENH.MABS%TYPE, nkb KHAMBENH.NGAYKHAM%TYPE, out_cur OUT SYS_REFCURSOR)
AS
BEGIN 
        OPEN out_cur FOR
        SELECT * FROM KHAMBENH KB, BENHNHAN BN
        WHERE KB.MABN = BN.MABN
        AND MABS = mbs
        AND NGAYKHAM = nkb;
        COMMIT;
END;
/
create or replace procedure GETTCBN_FIX(out_cur OUT SYS_REFCURSOR)
AS
BEGIN 
        OPEN out_cur FOR
        SELECT * FROM KHAMBENH KB, BENHNHAN BN
        WHERE KB.MABN = BN.MABN;
        COMMIT;
END;
/
create or replace procedure GETBNYCKHAM(mbs KHAMBENH.MABS%TYPE, mbn KHAMBENH.MABN%TYPE,  nkb KHAMBENH.NGAYKHAM%TYPE,  out_cur OUT SYS_REFCURSOR)
AS
BEGIN 
        OPEN out_cur FOR
        SELECT * FROM KHAMBENH KB, BENHNHAN BN
        WHERE KB.MABN = BN.MABN
        AND MABS = mbs
        AND NGAYKHAM = nkb
        AND KB.MABN = mbn;
        COMMIT;
END;
/
COMMIT;







