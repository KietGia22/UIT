--1.Write a pl/sql block to assign value to a variable and print
--out the value.

set serveroutput on
DECLARE 
      x VARCHAR(20);
      y NUMBER := 4;
BEGIN
     x := 'hello';
     DBMS_OUTPUT.PUT_LINE (x);
     DBMS_OUTPUT.PUT_LINE (y);
END;

--2. Write a pl/sql block to check number is Odd or Even.
DECLARE 
     x INT;
BEGIN
    x := 45;
    IF(MOD(x,2)=0) THEN
       DBMS_OUTPUT.PUT_LINE (x || ' LA SO CHAN');
    ELSE
       DBMS_OUTPUT.PUT_LINE (x || ' LA SO LE');
    END IF;
END;

--3. Write a pl/sql block to check a number is greater or lower
--than 0.
DECLARE 
       x NUMBER;
BEGIN 
       x :=-45;
       IF(x > 0) THEN
          DBMS_OUTPUT.PUT_LINE(X || ' lon hon 0');
        ELSIF (x < 0) THEN
          DBMS_OUTPUT.PUT_LINE(X || ' nho hon 0');
        else 
          DBMS_OUTPUT.PUT_LINE(X || ' = 0');
        END IF;
END;

--Using database Student Management, write a PL/SQL block to
--check how many students are enrolled in section id 85. If 15
--or more students are enrolled, section 85 is full. Otherwise,
--section 85 is not full. In both cases, a message should be
--displayed to the user, indicating whether section 85 is full.
DECLARE 
      numfstu INT;
BEGIN 
      SELECT COUNT(*) INTO numfstu
      FROM ENROLLMENT 
      WHERE SECTION_ID = '85';
      DBMS_OUTPUT.PUT_LINE ('SO LUONG SV DANG KY: ' || numfstu);
      IF(numfstu >= 15) THEN
         DBMS_OUTPUT.PUT_LINE('SECTION 85 IS FULL');
      ELSE
         DBMS_OUTPUT.PUT_LINE('SECTION 85 IS NOT FULL');
      END IF;
END;


--Do question 4 again using a procedure with 1 parameter:
--section number. Write a PL/SQL block to call the procedure
--with parameters section 85.

create or replace procedure check_section(secid SECTION.SECTION_ID%TYPE) 
as
    numStud INT;
BEGIN 
    select count(STUDENT_ID) into numStud
    from ENROLLMENT
    WHERE SECTION_ID = secid;
    DBMS_OUTPUT.PUT_LINE ('SO LUONG SV DANG KY: ' || numStud);
      IF(numStud >= 15) THEN
         DBMS_OUTPUT.PUT_LINE('SECTION ' || secid || ' IS FULL');
      ELSE
         DBMS_OUTPUT.PUT_LINE('SECTION ' || secid || ' IS NOT FULL');
      END IF;
END;


BEGIN 
    check_section(85);
END;

--6. Use a numeric FOR loop to calculate a factorial of 10 (10! =
--1*2*3...*10). Write a PL/SQL block.
DECLARE 
       kq number:= 1;
       x int;
BEGIN
     x:=10;
     for i in 1..x loop
         kq := kq * i;
     end loop;
     DBMS_OUTPUT.PUT_LINE (x || '! =' || kq);
end;
     
--7. Write a procedure to calculate the factorial of a number.
--Write a PL/SQL block to call this procedure.
create or replace PROCEDURE callfac(x INT)
as 
   kq NUMBER:=1;
BEGIN 
   for i in 1..x loop
       kq := kq * i;
   end loop;
   DBMS_OUTPUT.PUT_LINE (x || '! = ' || kq);
END;

BEGIN 
     callfac(5);
END;

--8. Write a function to calculate the factorial of a
--number. Write a PL/SQL block to call this function.
create or replace function computeFac (x INT) return NUMBER
AS
  kq NUMBER:=1;
BEGIN 
   for i in 1..x loop
       kq := kq * i;
   end loop;
   return kq;
END;

declare 
    fac NUMBER;
BEGIN
    fac := computeFac(8);
    DBMS_OUTPUT.PUT_LINE (fac);
END;

--9. Write a procedure to calculate and print out the
--result of a division. If the denominator is 0 then
--adding exception. Write a PL/SQL block to call this
--procedure.
create or replace procedure div (tuso INT, mauso INT)
as
  result NUMBER;
BEGIN
   result := tuso/mauso;
   DBMS_OUTPUT.PUT_LINE('ket qua: ' || result);
   EXCEPTION  
       WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Khong the chia cho 0');
END;

BEGIN 
    div(8,6);
END;

--10. Write a function to calculate the result of a
--division. Write a PL/SQL block to call this function.
create or replace function divTwoNum (tuso INT, mauso INT) return NUMBER
as 
  result NUMBER;
BEGIN
   result := tuso/mauso;
   return result;
   EXCEPTION  
       WHEN ZERO_DIVIDE THEN
        return NULL;
END;

DECLARE 
     div NUMBER;
BEGIN 
     div := divTwoNum(6, 0);
     IF (div IS NULL) THEN
         DBMS_OUTPUT.PUT_LINE ('Khong the chia cho 0');
     ELSE
        DBMS_OUTPUT.PUT_LINE ('Ket qua cua phep chia la: ' || div);
    END IF;
END;


--Using database Student Management, write a procedure
--to display the student’s name, street_address on the
--screen. If no record in the STUDENT table
--corresponds to the value of student_id provided by
--the user, the exception NO_DATA_FOUND is raised.
--Write a PL/SQL block to call this procedure with
--parameter is 25, 105.
create or replace procedure displayStudent (stduid student.student_id%TYPE)
as 
   stuname varchar(100);
   stuAdd STUDENT.STREET_ADDRESS%TYPE;
BEGIN
   SELECT first_name || last_name, street_address
   INTO stuname, stuAdd
   FROM STUDENT
   WHERE STUDENT_ID = stduid;
   DBMS_OUTPUT.PUT_LINE('NAME: ' || stuname || ' address: ' || stuAdd);
   EXCEPTION 
        WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('SV khong ton tai');
END;

BEGIN 
  displayStudent(25);
END;

--Do the question 11 using function to return the
--student’s record (declare a rowtype variable) . Write
--a PL/SQL block to call this function and print out
--student’s name, address, phone.

create or replace function getStudent(stduid student.student_id%TYPE)
                           return STUDENT%ROWTYPE
AS
   stu STUDENT%ROWTYPE;
BEGIN 
     SELECT * INTO stu
     FROM STUDENT
     WHERE STUDENT_ID = stduid;
     RETURN stu;
     EXCEPTION
         WHEN NO_DATA_FOUND THEN
             RETURN NULL;
END;

BEGIN 
    DBMS_OUTPUT.PUT_LINE(getStudent(105).first_name || ' ' || getStudent(105).last_name || getStudent(105).street_address);
END;

/*13. Write a procedure to check if the student is
enrolled. If no record in the ENROLLMENT table
corresponds to the value of v_student_id provided by
the user, the exception NO_DATA_FOUND is raised. And
if more than one record in the ENROLLMENT table then
exception TOO_MANY_ROWS is raised.*/


create or replace procedure checkEnroll (stuid STUDENT.STUDENT_ID%TYPE)
AS
   secid SECTION.SECTION_ID%TYPE;
BEGIN 
   SELECT SECTION_ID INTO secid
   FROM ENROLLMENT
   WHERE STUDENT_ID = stuid;
   DBMS_OUTPUT.PUT_LINE('Sinh vien nay dang ky du nhat mot section ' || secid);
   EXCEPTION 
      WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('Sinh vien nay chua dang ki mot section nao');
      WHEN TOO_MANY_ROWS THEN
         DBMS_OUTPUT.PUT_LINE('Sinh vien nay da dang ky');
END;

BEGIN 
     checkEnroll(102);
END;


/*17.  Write a function to calculate how many courses that
student enrolled. Student_id provided by the user.
Write a procedure to find name of student and how
many courses this user enrolled.
Write a pl/sql block to call procedure above with
different values of student_id: 109, 530*/
create or replace function calCourse (stuid STUDENT.STUDENT_ID%TYPE)
                            return INT
AS
  x INT;
BEGIN 
  SELECT COUNT(course_no) INTO x
  FROM ENROLLMENT e, SECTION s
  WHERE e.section_id = s.section_id
  AND STUDENT_ID = stuid;
  return x;
END;

create or replace procedure findStu (sid STUDENT.STUDENT_ID%TYPE)
as
  sname VARCHAR2(100);
  y INT;
BEGIN
    SELECT first_name || last_name into sname
    FROM STUDENT
    WHERE STUDENT_ID = sid;
    DBMS_OUTPUT.PUT_LINE('Ten sinh vien: ' || sname);
    y := calCourse(sid);
    DBMS_OUTPUT.PUT_LINE('So course sinh vien tham gia: ' || y);
    EXCEPTION
       WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('Khong ton tai sinh vien');
END;

BEGIN 
    findStu(530);
END;
