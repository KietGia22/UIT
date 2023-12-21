SELECT * FROM TEST;

INSERT INTO TEST VALUES (1, 'GOODBYE', NULL);
--See what session is blocking other session?
--See what’s happening in session B
SELECT * FROM TEST;
----------------------------------------------------------------------------
INSERT INTO TEST VALUES (2, 'HELLO SESSION B',  NULL);
--See what session is blocking other session?
--See what’s happening in session B
COMMIT;
SELECT * FROM TEST;

---------------------------------------
	

UPDATE TEST SET NOTE='UPDATED BY SESSION B' WHERE ID=3;
--See what session is blocking other session?
--See what’s happening in session B
COMMIT;
SELECT * FROM TEST;

-----------------------------------------------------
	
SELECT * FROM TEST;

DELETE FROM TEST WHERE ID=4;
--See what session is blocking other session?
--See what’s happening in session B
COMMIT;
SELECT * FROM TEST;

------------------------------------------------
	
SELECT * FROM TEST;

UPDATE TEST SET NAME='LAZADA' WHERE ID=5;
--See what session is blocking other session?
--See what’s happening in session B
COMMIT;
SELECT * FROM TEST;

---------------------------------------------
SELECT * FROM TEST;

SELECT * FROM TEST WHERE ID=6 FOR UPDATE;
--See what’s happening in session B.

--See what’s happening in session B.

COMMIT;




