--1.Write a procedure to calculate factorial of a number
--and return the value to parameter of procedure:
-- - Factorial (in val, out result)
-- - Factorial (inout val)

SET SERVEROUTPUT ON

-- - Factorial (in val, out result)
CREATE OR REPLACE PROCEDURE CALFACT(x IN INT, result OUT NUMBER)
AS
   kq NUMBER:=1;
BEGIN 
    FOR i IN 1..x LOOP
        kq:=kq*i;
    END LOOP;
    result := kq;
END;

DECLARE 
      kq NUMBER;
BEGIN 
    CALFACT(10, kq);
    DBMS_OUTPUT.PUT_LINE('KET QUA: '|| KQ);
END;

-- - Factorial (inout val)
CREATE OR REPLACE PROCEDURE CALFACT2(x IN OUT INT)
AS
   FACT NUMBER:=1;
BEGIN 
   FOR i IN 1..x LOOP
      FACT := FACT * i;
    END LOOP;
    x := FACT;
END;

DECLARE 
      kq NUMBER:=10;
BEGIN 
    CALFACT2(kq);
    DBMS_OUTPUT.PUT_LINE('KET QUA: '|| kq);
END;

--2.Write a procedure to find name, address of a student
--and output these values to the parameters of the
--procedure. Write a pl/sql block to call this
--procedure with parameter is 114 and print out these
--values on the screen.

CREATE OR REPLACE PROCEDURE FINDSTUDENT_WEEK2(sid STUDENT.STUDENT_ID%TYPE,
                                              sname OUT VARCHAR2, sadd OUT STUDENT.street_address%TYPE)
AS
BEGIN
    SELECT first_name||last_name, street_address INTO sname, sadd
    FROM STUDENT
    WHERE STUDENT_ID = sid;
    EXCEPTION
         WHEN NO_DATA_FOUND THEN
             DBMS_OUTPUT.PUT_LINE('KHONG TIM THAY SINH VIEN');
END;

DECLARE
     sn VARCHAR2(100);
     st STUDENT.STREET_ADDRESS%TYPE;
BEGIN
    FINDSTUDENT_WEEK2(114, sn, st);
    DBMS_OUTPUT.PUT_LINE('name: ' || sn);
    DBMS_OUTPUT.PUT_LINE('address: ' || st);
END;

--Write a procedure to print out name, address of a
--student and how many courses this student is
--enrolled. Use procedure above (question 2) to get
--information about name and address of this student.
--Write a pl/sql block to call this procedure with
--parameter is 106.

CREATE OR REPLACE PROCEDURE PRINT_STUDENT_INFO(sid STUDENT.STUDENT_ID%TYPE)
AS
  sn VARCHAR2(100);
  st STUDENT.STREET_ADDRESS%TYPE;
  numberOFcourse INT;
BEGIN
  FINDSTUDENT_WEEK2(sid, sn, st);
  DBMS_OUTPUT.PUT_LINE('name: ' || sn);
  DBMS_OUTPUT.PUT_LINE('address: ' || st);
  SELECT COUNT(COURSE_NO) INTO numberOFcourse
  FROM ENROLLMENT E JOIN SECTION S ON E.section_id = S.section_id
  WHERE STUDENT_ID = sid;
  DBMS_OUTPUT.PUT_LINE('NUMBER OF COURSE ENROLLED: ' || numberOFcourse);
  EXCEPTION 
       WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('KHONG TIM THAY SINH VIEN');
END;

BEGIN 
   PRINT_STUDENT_INFO(104);
END;

--5. Create a package that contains functions for
--a. Adding three integers
--b. Subtracting two integers
--c. Multiplying three integers

CREATE OR REPLACE PACKAGE CALCULATE_MATH AS
    FUNCTION addINT(x INT, y INT, z INT) RETURN INT;
    FUNCTION subtractINT(x INT, y INT) RETURN INT;
    FUNCTION multiplyINT(x INT, y INT, z INT) RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY CALCULATE_MATH AS
   FUNCTION addINT(x INT, y INT, z INT) RETURN INT
   AS 
   BEGIN 
     RETURN x + y + z;
   END;
   
   FUNCTION subtractINT(x INT, y INT)RETURN INT
   AS 
   BEGIN
       RETURN x - y;
   END;
   
   FUNCTION multiplyINT(x INT, y INT, z INT) RETURN NUMBER
   AS 
   BEGIN
       RETURN x * y * z;
    END;
END;

BEGIN 
    DBMS_OUTPUT.PUT_LINE(CALCULATE_MATH.addINT(10, 9, 8));
    DBMS_OUTPUT.PUT_LINE(CALCULATE_MATH.subtractINT(10,9));
    DBMS_OUTPUT.PUT_LINE(CALCULATE_MATH.multiplyint(10, 9, 8));
END;

--7. Write a pl/sql block to prints out instructor_id,
--salutation, first_name, last_name of all the
--instructors. (using cursor)

BEGIN 
   FOR instr IN (SELECT * FROM INSTRUCTOR)
   LOOP
       DBMS_OUTPUT.PUT_LINE('ID: ' || instr.instructor_id);
       DBMS_OUTPUT.PUT_LINE('SALUTATION: ' || instr.salutation);
       DBMS_OUTPUT.PUT_LINE('NAME: ' || instr.first_name || instr.last_name);
  END LOOP;
END;

--EXPLICIT CURSOR FOR LOOP
DECLARE 
     CURSOR c_instructor IS SELECT * FROM INSTRUCTOR;
BEGIN
     FOR instr IN c_instructor LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || instr.instructor_id);
        DBMS_OUTPUT.PUT_LINE('SALUTATION: ' || instr.salutation);
        DBMS_OUTPUT.PUT_LINE('NAME: ' || instr.first_name || instr.last_name);
    END LOOP;
END;

-- 10. Write a PL/SQL block with two cursor for loops. The
-- parent cursor will call the student_id, first_name,
-- and last_name from the student table for students
-- with a student_id less than 110 and output one line
-- with this information. For each student, the child
-- cursor will loop through all the courses that the
-- student is enrolled in, outputting the course_no and
-- the description.

BEGIN 
   FOR stu IN (SELECT * FROM STUDENT WHERE STUDENT_ID < 110) LOOP
     DBMS_OUTPUT.PUT_LINE('ID: '|| stu.student_id || 'NAME: ' || stu.first_name || stu.last_name);
     FOR cours IN (SELECT c.* FROM COURSE c, SECTION s, ENROLLMENT e
                   WHERE c.course_no = s.course_no and s.section_id = e.section_id and e.student_id = stu.student_id)
     LOOP
         DBMS_OUTPUT.PUT_LINE('courNO: ' || cours.course_no || 'DES: ' || cours.description);
     END LOOP;
    END LOOP;
END;
/
DECLARE 
   CURSOR c_student IS SELECT * FROM STUDENT WHERE STUDENT_ID < 110;
   CURSOR c_course (sid STUDENT.STUDENT_ID%TYPE) IS 
                    SELECT c.* FROM COURSE c, SECTION s, ENROLLMENT e
                    WHERE c.course_no = s.course_no and s.section_id = e.section_id and e.student_id = sid;
                
BEGIN 
   FOR stu IN  c_student LOOP
      DBMS_OUTPUT.PUT_LINE('ID: '|| stu.student_id || 'NAME: ' || stu.first_name || stu.last_name);
    FOR cours IN c_course(stu.student_id) LOOP
      DBMS_OUTPUT.PUT_LINE('courNO: ' || cours.course_no || 'DES: ' || cours.description);
    END LOOP;
   END LOOP;
END;

--13. Write a trigger:
--When inserting data into employee table,
--created_date is the sysdate.
--When updating data of employee table, modified_date
--is the sysdate.

CREATE OR REPLACE TRIGGER TRG_EMP
BEFORE INSERT OR UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN 
    IF(INSERTING) THEN 
    :NEW.CREATED_DATE := SYSDATE;
    ELSIF(UPDATING) THEN
    :NEW.MODIFIED_DATE := SYSDATE;
    END IF;
END;

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SALARY, TITLE) VALUES(5, 'HAHA', 3000, 'CLEARK');
UPDATE EMPLOYEE SET SALARY = 4500 WHERE EMPLOYEE_ID = 5;
SELECT * FROM EMPLOYEE;

--14. Write a trigger: when updating name, salary, title
--of an employee in employee table, old data of this
--employee will be inserted into employee_change
--table.

CREATE OR REPLACE TRIGGER TRG_EMP2
BEFORE UPDATE OF NAME, SALARY, TITLE ON EMPLOYEE
FOR EACH ROW
BEGIN 
   INSERT INTO EMPLOYEE_CHANGE VALUES (:OLD.EMPLOYEE_ID, :OLD.NAME, :OLD.SALARY, :OLD.TITLE);
END;

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SALARY, TITLE) VALUES (10, 'JUNNIE', 99999, 'CLERK');

UPDATE EMPLOYEE SET SALARY = 88888 WHERE EMPLOYEE_ID = 10;
SELECT * FROM EMPLOYEE_CHANGE;

--15. Write a trigger to guarantee that: Salary of a new
--employee cannot below 100.
CREATE OR REPLACE TRIGGER TRG_EMP3
AFTER INSERT ON EMPLOYEE
FOR EACH ROW 
BEGIN 
    IF(:NEW.SALARY < 100) THEN
      RAISE_APPLICATION_ERROR(-20986, 'SALARY IS TOO LOW');
    END IF;
END;

INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, SALARY, TITLE) VALUES (12, 'SMITH', 50, 'CLERK');