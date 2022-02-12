--###########################################################################
-- Exception 
------------------------------------------------------------------------------------------------------------------
-- Scenario
	-- you entered old pin - Incorrect PIN
	-- Withdow amount 1400 - Please enter amount multple of 500
	-- Transaction - Server Error 
------------------------------------------------------------------------------------------------------------------
-- exceptions -> runtime errors which stop the execution of program 
-- exception stops the execution but as programmer we must provide meaning ful message to the program user
-- Exception handling is responsible for communicating the runtime error as well as terminating the execution
--###########################################################################
--Exception name in PL SQL :  NO_DATA_FOUND
-- accept values from user at runtime : &customer_id
--###########################################################################

SELECT EMPNO FROM EMP;
--###########################################################################
--Exception name in PL SQL :  NO_DATA_FOUND
-- accept values from user at runtime : &customer_id
-- DISPLAY ENAME OF EMPLOYEE WHERE USE ENTERS EMPNO
-- &empno=> you are expecting value from the user
--###########################################################################
SET SERVEROUTPUT ON;
DECLARE 
    v_ename emp.ename%type;
    v_empno emp.empno%type:=&empno;
BEGIN
    SELECT
        ename into v_ename
    FROM 
        emp
    WHERE 
        empno=v_empno;
    DBMS_OUTPUT.PUT_LINE('FOR EMPNO'||v_empno);    
    DBMS_OUTPUT.PUT_LINE('ename is '||v_ename);
END;
--###########################################################################
-- DISPLAY ENAME OF EMPLOYEE WHERE USE ENTERS EMPNO
-- IF NO RECORD FOUND HANDLE THE EXCEPTION AND GIVE MESSAGE
-- EMPNO :  No record found
--###########################################################################
DECLARE 
    v_ename emp.ename%type;
    v_empno emp.empno%type:=&empno;
BEGIN
    SELECT
        ename into v_ename
    FROM 
        emp
    WHERE 
        empno=v_empno;
    DBMS_OUTPUT.PUT_LINE('FOR EMPNO'||v_empno);    
    DBMS_OUTPUT.PUT_LINE('ename is '||v_ename);
    EXCEPTION
        WHEN NO_DATA_FOUND 
                THEN    
                     DBMS_OUTPUT.PUT_LINE('EMPNO'||v_empno||' NO RECORDS FOUND');    
END;


--###########################################################################
-- Creae User Defined excepton, Raise Exception, handle exception
--###########################################################################
-- INCREASE THE SALARY OF EMPLOYEE IF <MAX(SAL)
-- GET EMPNO GET THE NEW SALARY
-- if newSal>Max(sal) Raise salary_to_high
--###########################################################################
-- Create custom exception without exception handling
--###########################################################################
DECLARE 
    v_salary_to_high Exception;
    PRAGMA exception_init(v_salary_to_high,-20101);
    v_maxsal emp.sal%type;
    v_newsal emp.sal%type:=&new_sal;
    v_empno emp.empno%type:=&empno;
BEGIN
     SELECT MAX(SAL) INTO v_maxsal FROM EMP;
     IF v_newsal > v_maxsal 
        THEN RAISE v_salary_to_high;
     ELSE
        UPDATE EMP SET SAL=v_newsal WHERE empno=v_empno;
     END IF;
END;
--###########################################################################
-- Create custom exception with exception handling and custom message
--###########################################################################

DECLARE 
    v_salary_to_high Exception;
    PRAGMA exception_init(v_salary_to_high,-20101);
    v_maxsal emp.sal%type;
    v_newsal emp.sal%type:=&new_sal;
    v_empno emp.empno%type:=&empno;
BEGIN
     SELECT MAX(SAL) INTO v_maxsal FROM EMP;
     IF v_newsal > v_maxsal 
        THEN RAISE v_salary_to_high;
     ELSE
        UPDATE EMP SET SAL=v_newsal WHERE empno=v_empno;
     END IF;
     EXCEPTION
        WHEN v_salary_to_high THEN DBMS_OUTPUT.PUT_LINE(v_newsal||' is to high than max(sal) hence update not allowed');
END;

--###########################################################################
-- Create custom exception without exception handling
--raise_application_error(-20101,'new sal > max(sal) hence salary not updated');
--###########################################################################
DECLARE 
    v_salary_to_high Exception;
    PRAGMA exception_init(v_salary_to_high,-20101);
    v_maxsal emp.sal%type;
    v_newsal emp.sal%type:=&new_sal;
    v_empno emp.empno%type:=&empno;
BEGIN
     SELECT MAX(SAL) INTO v_maxsal FROM EMP;
     IF v_newsal > v_maxsal 
        THEN raise_application_error(-20101,'new sal > max(sal) hence salary not updated');
     ELSE
        UPDATE EMP SET SAL=v_newsal WHERE empno=v_empno;
     END IF;
END;


DECLARE 
        CURSOR c_emp IS SELECT * FROM EMP WHERE DEPTNO=10; -- WILL WORK ON EMP TABLES RECORD
        rec_emp emp%ROWTYPE;   -- EVERY RECORD WILL BE STORED IN THIS VARIABLE
BEGIN
        OPEN c_emp;
        
        LOOP
            FETCH c_emp INTO rec_emp;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' original sal=' ||rec_emp.sal);
            rec_emp.sal:=rec_emp.sal+2000;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' update sal=' ||rec_emp.sal);                
            EXIT WHEN c_emp%NOTFOUND;
          END LOOP;
          
END;

--###########################################################################
-- USING CURSOR FETCH RECORDS OF DEPTNO 10 
-- PRINT ORGINAL SAL AND UPDATE SAL(SAL=SAL+3000) FOR EVERY EMPNO
--###########################################################################
DECLARE 
        CURSOR c_emp IS SELECT * FROM EMP WHERE DEPTNO=10; -- WILL WORK ON EMP TABLES RECORD
        rec_emp emp%ROWTYPE;   -- EVERY RECORD WILL BE STORED IN THIS VARIABLE
BEGIN
        OPEN c_emp;
        
        LOOP
            FETCH c_emp INTO rec_emp;
            EXIT WHEN c_emp%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' original sal=' ||rec_emp.sal);
            rec_emp.sal:=rec_emp.sal+2000;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' update sal=' ||rec_emp.sal);                            
          END LOOP;         
          close c_emp;
END;




DECLARE 
        CURSOR c_emp IS SELECT * FROM EMP WHERE comm is NULL; -- WILL WORK ON EMP TABLES RECORD
        rec_emp emp%ROWTYPE;   -- EVERY RECORD WILL BE STORED IN THIS VARIABLE
BEGIN
        OPEN c_emp;
        
        LOOP
            FETCH c_emp INTO rec_emp;
            EXIT WHEN c_emp%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' original comm=' ||rec_emp.comm);
            UPDATE EMP SET COMM=0 WHERE EMPNO=rec_emp.empno;
            DBMS_OUTPUT.PUT_LINE(rec_emp.empno||' updated comm=' ||rec_emp.comm);                            
          END LOOP;     
          close c_emp;
END;

select * from emp