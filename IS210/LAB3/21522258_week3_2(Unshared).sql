SET TRANSACTION NAME 'HW1';
Update tbl_accounts set balance=balance+79 where accid=1169;
Select * from tbl_accounts;
Commit;
Select * from tbl_accounts;
