DROP TABLE accounts;
CREATE TABLE accounts (accid NUMBER(6) primary key,
balance NUMBER (10,2),
check (balance>=0));
INSERT INTO accounts VALUES(7715, 7000);
INSERT INTO accounts VALUES (7720, 5100);
COMMIT;

------------------------------------------------
select * from accounts;

update accounts 
set balance=balance-2000
where accid=7715;


Commit;
select * from accounts;


---------------------------------------------
select * from accounts
where balance>100;
INSERT INTO accounts VALUES (7740, 3000);
Commit;

------------------------------------------------
COMMIT;
select * from accounts;
update accounts set balance=8000
where accid=7720;

COMMIT;



select * from accounts



---------------------------------------------------------
select * from accounts;
INSERT INTO accounts VALUES (7750, 3000);


COMMIT;
select * from accounts;












