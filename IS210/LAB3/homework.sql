CREATE TABLE tbl_accounts (accid NUMBER(6), balance NUMBER (10,2),
			check (balance>=0));
INSERT INTO tbl_accounts VALUES (1169, 7350.00); 
INSERT INTO tbl_accounts VALUES (1170, 8900.46); 
COMMIT;


-----------------------------------------------------------------------------

Drop table tbl_accounts;
CREATE TABLE tbl_accounts (accid NUMBER(6), balance NUMBER (10,2),
			check (balance>=0));
INSERT INTO tbl_accounts VALUES (1169, 7350.00); 
INSERT INTO tbl_accounts VALUES (1170, 8900.46); 
INSERT INTO tbl_accounts VALUES (1175, 679.50); 
INSERT INTO tbl_accounts VALUES (1177, 400000); 
COMMIT;
/
Create or replace procedure decAccount
As
Begin
	For acc in (select * from tbl_accounts order by accid asc )
	Loop
		Update tbl_accounts set balance=balance-1000 where accid=acc.accid;
	End loop;
End;

select * from tbl_accounts;
begin
    decAccount;
end;

select * from tbl_accounts;
-------------------------------------------------------------------------------
Drop table tbl_accounts;
CREATE TABLE tbl_accounts (accid NUMBER(6), balance NUMBER (10,2),
			check (balance>=0));
INSERT INTO tbl_accounts VALUES (1169, 7350.00); 
INSERT INTO tbl_accounts VALUES (1170, 8900.46); 
INSERT INTO tbl_accounts VALUES (1175, 679.50); 
INSERT INTO tbl_accounts VALUES (1177, 400000); 
COMMIT;

Create or replace procedure decAccount
As
Begin
	For acc in (select * from tbl_accounts order by accid asc)
	Loop
		Update tbl_accounts set balance=balance-1000 where accid=acc.accid;
	Commit;
	End loop;
End;

select * from tbl_accounts;
begin
    decAccount;
end;

select * from tbl_accounts;






