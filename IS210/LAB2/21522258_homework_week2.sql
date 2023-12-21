set serveroutput on

--3.Write a PL/SQL block with two cursor for loops. The
--parent cursor will call the employee_id, name,
--salary from the employee table and output one line
--with this information. For each employee, the child
--cursor will loop through all the employee_change and
--outputting the salary, title of this employee.

BEGIN
   FOR emp IN (SELECT * FROM EMPLOYEE) LOOP
      DBMS_OUTPUT.PUT_LINE('ID: ' || emp.employee_id || ' Name: ' || emp.name || ' Salary: ' || emp.salary);
      FOR emp_chg IN(SELECT * FROM EMPLOYEE_CHANGE EP WHERE emp.employee_id = EP.employee_id) LOOP
         DBMS_OUTPUT.PUT_LINE('Salary: ' || emp_chg.salary || ' Title: ' || emp_chg.title);
      END LOOP;
    END LOOP;
END;

--4.Write a trigger: When inserting or updating data of
--employee_change table, title of employee is always
--converted to lowercase letter.
--Write two statements to insert and update data of
--employee_change table.
CREATE OR REPLACE TRIGGER TRG_HOMEWORK
BEFORE INSERT OR UPDATE ON EMPLOYEE_CHANGE
FOR EACH ROW
BEGIN 
   :NEW.TITLE := LOWER(:NEW.TITLE);
END;

INSERT INTO EMPLOYEE_CHANGE (EMPLOYEE_ID, NAME, SALARY, TITLE) VALUES (18, 'SMILE', 30, 'DEV');
UPDATE EMPLOYEE_CHANGE SET TITLE = 'BA' WHERE EMPLOYEE_ID = 10;

--delete from EMPLOYEE_CHANGE where employee_change.employee_id = 18;
--select * from EMPLOYEE_CHANGE;


      