﻿create database THUCHANH
use THUCHANH

--CAU 1: TAO DATABASE VA 4 BANG
CREATE TABLE NHACUNGCAP
(
  MANCC char(6) not null,
  TENNCC varchar(20),
  QUOCGIA varchar(15),
  LOAINCC varchar(25),
  CONSTRAINT pk_ncc PRIMARY KEY(MANCC)
)

CREATE TABLE DUOCPHAM
(
  MADP char(5) not null,
  TENDP varchar(30),
  LOAIDP varchar(10),
  GIA money,
  CONSTRAINT pk_dp PRIMARY KEY(MADP)
)

CREATE TABLE PHIEUNHAP
(
  SOPN char(5) not null,
  NGNHAP smalldatetime,
  MANCC char(6),
  LOAINHAP varchar(15),
  CONSTRAINT pk_pn PRIMARY KEY(SOPN)
)

CREATE TABLE CTPN
(
  SOPN char(5),
  MADP char(5),
  SOLUONG int,
  CONSTRAINT pk_ct PRIMARY KEY(SOPN, MADP)
)

ALTER TABLE PHIEUNHAP ADD CONSTRAINT fk_pn FOREIGN KEY(MANCC) REFERENCES NHACUNGCAP(MANCC)

ALTER TABLE CTPN ADD CONSTRAINT fk_ct1 FOREIGN KEY(SOPN) REFERENCES PHIEUNHAP(SOPN)
ALTER TABLE CTPN ADD CONSTRAINT fk_ct2 FOREIGN KEY(MADP) REFERENCES DUOCPHAM(MADP) 

--CAU 2: NHAP DU LIEU

SET DATEFORMAT DMY

INSERT INTO NHACUNGCAP VALUES('NCC01', 'Phuc Hung', 'Viet Nam', 'Thuong xuyen')
INSERT INTO NHACUNGCAP VALUES('NCC02', 'Pharmaceuticals', 'India', 'Vang lai')
INSERT INTO NHACUNGCAP VALUES('NCC03', 'Sapharco', 'Singapore', 'Vang lai')

INSERT INTO DUOCPHAM VALUES('DP01', 'Thuoc ho PH', 'Siro', 105000)
INSERT INTO DUOCPHAM VALUES('DP02', 'CouchRemedy', 'Nen', 250000)
INSERT INTO DUOCPHAM VALUES('DP03', 'Cotrim', 'Sui', 60000)

INSERT INTO PHIEUNHAP VALUES('0001', '22/11/2022', 'NCC01', 'Noi dia')
INSERT INTO PHIEUNHAP VALUES('0002', '04/12/2022', 'NCC03', 'Nhap khau')
INSERT INTO PHIEUNHAP VALUES('0003', '10/12/2022', 'NCC02', 'Nhap khau')

INSERT INTO CTPN VALUES('0001', 'DP01', 95)
INSERT INTO CTPN VALUES('0001', 'DP02', 150)
INSERT INTO CTPN VALUES('0003', 'DP03', 75)

--CAU 3
ALTER TABLE DUOCPHAM
add constraint check_en
CHECK (GIA > 150000 OR LOAIDP <> 'Nen')

INSERT INTO DUOCPHAM VALUES('DP04', 'CouchRemedy', 'Nen', 10000)
delete from DUOCPHAM
where MADP = 'DP04'

--CAU 4:
--trigger 1:
CREATE TRIGGER TRIGGER_NCC
ON NHACUNGCAP FOR UPDATE
AS 
BEGIN
    DECLARE @qg varchar(15)
	DECLARE @ln varchar(15)
	DECLARE @Mcc char(6)
	SELECT @qg = QUOCGIA, @Mcc = MANCC from inserted

	SELECT @ln = LOAINHAP FROM PHIEUNHAP
	WHERE @Mcc = MANCC

	IF(@qg <> 'Viet Nam' and @ln <> 'Nhap khau')
	BEGIN
	     PRINT N'Phiếu nhập của những nhà cung cấp ở những quốc gia khác Việt Nam đều có loại nhập là Nhập khẩu'
         ROLLBACK TRANSACTION
	END
END

--trigger 2
CREATE TRIGGER trigger_pn
ON PHIEUNHAP FOR INSERT, UPDATE
AS
BEGIN
     DECLARE @qg varchar(15)
	 DECLARE @ln varchar(15)
	 DECLARE @Mcc char(6)
	 
	 SELECT @ln = LOAINHAP, @Mcc = MANCC FROM inserted

	 SELECT @qg = QUOCGIA FROM NHACUNGCAP
	 WHERE @Mcc = MANCC

	 IF(@qg <> 'Viet Nam' AND @ln <> 'Nhap khau')
	 BEGIN 
	      PRINT N'Phiếu nhập của những nhà cung cấp ở những quốc gia khác Việt Nam đều có loại nhập là Nhập khẩu'
          ROLLBACK TRANSACTION
	 END
	 ELSE
	 BEGIN
	      PRINT N'THEM/CAP NHAP THANH CONG'
	 END
END


--CAU 5
SELECT SOPN, NGNHAP
FROM PHIEUNHAP PN
WHERE NOT EXISTS(SELECT *
                 FROM DUOCPHAM DP
				 WHERE LOAIDP = 'Sui'
				 AND NOT EXISTS(SELECT *
				                FROM CTPN
								WHERE CTPN.MADP = DP.MADP
								AND CTPN.SOPN = PN.SOPN))

--CAU 6
SET DATEFORMAT DMY

SELECT NCC.MANCC, TENNCC
FROM NHACUNGCAP NCC, PHIEUNHAP PN
WHERE NCC.MANCC = PN.MANCC
AND NGNHAP = '22/11/2022'

--CAU 7
SELECT MANCC
FROM PHIEUNHAP PN
WHERE NOT EXISTS(SELECT *
                 FROM DUOCPHAM DP
				 WHERE GIA >= 200000
				 AND NOT EXISTS(SELECT *
				                FROM CTPN
								WHERE CTPN.MADP = DP.MADP
								AND CTPN.SOPN = PN.SOPN))

--CAU 8
SELECT TOP 1 WITH TIES DP.MADP, TENDP
FROM DUOCPHAM DP, CTPN CT, PHIEUNHAP PN
WHERE DP.MADP = CT.MADP
AND CT.SOPN = PN.SOPN
AND YEAR(NGNHAP) = 2022
ORDER BY SOLUONG DESC

