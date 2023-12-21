CREATE USER user1 IDENTIFIED  BY userpass;

CREATE TABLESPACE tbs_03
 DATAFILE 'E:\oraclecsdl\oradata\ORCL\ORCLPDB4\tbs_f03_1.dbf' SIZE 20M;
 
 alter tablespace tbs_03 add datafile
  'E:\oraclecsdl\oradata\ORCL\ORCLPDB4\tbs_f03_2.dbf' SIZE 1M;
  
CREATE USER user2 identified by password
default tablespace tbs_03
QUOTA unlimited on tbs_03;

