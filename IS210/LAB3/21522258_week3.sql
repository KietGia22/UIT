/*create table Project(id number primary key, pname varchar2(50), cost number);

insert into project values (1, 'jupiter', 2000);
insert into project values (2, 'saturn', 1000);
insert into project values (3, 'mercury', 15000);*/
commit;
SET TRANSACTION NAME 'cost_update';
SELECT XID, name, STATUS 
FROM V$TRANSACTION;

UPDATE project
    SET cost = 8000 
    WHERE id = 1;

SELECT XID, name, STATUS FROM V$TRANSACTION;

SELECT * FROM project;

ROLLBACK;

SELECT * FROM project;

SELECT XID, name, STATUS FROM V$TRANSACTION;


----------------------------------------------------
COMMIT;
SELECT XID, name, STATUS FROM V$TRANSACTION;
UPDATE project
    SET cost = 6000 
    WHERE id = 2;
    
SELECT XID, name, STATUS FROM V$TRANSACTION;
Insert into project values (4, 'neptune', 19000);

SELECT XID, name, STATUS FROM V$TRANSACTION;
COMMIT;
SELECT * FROM project;
SELECT XID, name, STATUS FROM V$TRANSACTION;



----------------------------------------------------------
COMMIT;
Select * from project;
Update project set cost=400000
where pname='jupiter';
SAVEPOINT after_jupiter_cost;
Update project set cost=130
where pname='jupiter';
SAVEPOINT after_mercury_cost;
ROLLBACK TO SAVEPOINT after_jupiter_cost;
Select * from project;
Update project set cost=170
where pname='mercury';
ROLLBACK;
Select * from project;



-------------------------------------------------------------
COMMIT;
Select * from project;
SET TRANSACTION NAME 'cost_update2';
Update project set cost=12300
where pname='jupiter';
Select * from project;
--DDL statement xem nhu phia trc no co commit
Create table test (id number);
Insert into test values (26);
Rollback;
Select * from project;
Select * from test;


----------------------------------------------------------
CREATE TABLE accounts (account_id NUMBER(6), balance NUMBER (10,2),
			check (balance>=0));
INSERT INTO accounts VALUES (7715, 6350.00); 
INSERT INTO accounts VALUES (7720, 5100.50); 
COMMIT;

------------------------------------------------------------
SELECT * FROM accounts;
DECLARE
  transfer NUMBER(8,2) := 250;
BEGIN
  UPDATE accounts SET balance = balance - transfer WHERE account_id = 7715;
  UPDATE accounts SET balance = balance + transfer WHERE account_id = 7720;
END;
COMMIT;
SELECT * FROM accounts;

-----------------------------------------------------
SELECT * FROM accounts;
DECLARE
  transfer NUMBER(8,2) := 9000;
BEGIN
  UPDATE accounts SET balance = balance - transfer WHERE account_id = 7715;
  UPDATE accounts SET balance = balance + transfer WHERE account_id = 7720;
END;
  COMMIT;
SELECT * FROM accounts;

-----------------------------------------------------
SELECT * FROM accounts;
DECLARE
  transfer NUMBER(8,2) := 9000;
BEGIN
    UPDATE accounts SET balance = balance + transfer WHERE account_id = 7720;
    UPDATE accounts SET balance = balance - transfer WHERE account_id = 7715;
END;
  COMMIT;
SELECT * FROM accounts;
-----------------------------------------------------
SELECT * FROM accounts;
DECLARE
  transfer NUMBER(8,2) := 9000;
BEGIN
    UPDATE accounts SET balance = balance + transfer WHERE account_id = 7720;
    COMMIT;
    UPDATE accounts SET balance = balance - transfer WHERE account_id = 7715;
  COMMIT;
END;
SELECT * FROM accounts;
-----------------------------------------------------
SELECT * FROM accounts;
SET SERVEROUTPUT ON
DECLARE
  transfer NUMBER(8,2) := 9000;
BEGIN
    UPDATE accounts SET balance = balance + transfer WHERE account_id = 7720;
    UPDATE accounts SET balance = balance - transfer WHERE account_id = 7715;
    EXCEPTION WHEN OTHERS THEN
        Dbms_output.put_line ('error!!!!!!!!! ');
END;
  COMMIT;
SELECT * FROM accounts;

------------------------------------------------------
SELECT * FROM accounts;
SET SERVEROUTPUT ON
DECLARE
  transfer NUMBER(8,2) := 9000;
BEGIN
    UPDATE accounts SET balance = balance + transfer WHERE account_id = 7720;
    UPDATE accounts SET balance = balance - transfer WHERE account_id = 7715;
    EXCEPTION WHEN OTHERS THEN
        RAISE;        
END;
  COMMIT;
SELECT * FROM accounts;

------------------------------------------------------
SELECT * FROM accounts;
SET SERVEROUTPUT ON
DECLARE
  transfer NUMBER(8,2) := 9000;
BEGIN
    UPDATE accounts SET balance = balance + transfer WHERE account_id = 7720;
COMMIT;
    UPDATE accounts SET balance = balance - transfer WHERE account_id = 7715;
  
    EXCEPTION WHEN OTHERS THEN
        RAISE;        
END;
SELECT * FROM accounts;









