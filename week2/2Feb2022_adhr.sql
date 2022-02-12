ALTER TABLE emp
DROP COLUMN branchno;
-- ################################################################
-- Display employee details such that ename,deptname and location of work is printed by the query
-- ################################################################
select emp.ename, dept.deptno, branch.location from
emp,dept,branch where emp.deptno = dept.deptno and dept.branchno =branch.branchno;
--same query with joins to avoid errors
select emp.ename, dept.deptno, branch.location from
emp join dept on emp.deptno = dept.deptno join branch on dept.branchno = branch.branchno;


-- ################################################################ 
-- LIST All employees details suhc as  EMPNAME, JOB, MGR, HIGREDATE, SAL,DNAME
-- left join to dept table 
-- All employee details along with dname even if some employee has null value in deptno.
--    EMP [ EMPNAME, JOB, MGR, HIGREDATE, SAL]
--    DEPT[ DNAME]
--   EMP.DEPTNO=DEPT.DEPTNO
-- ################################################################ 
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
EMP LEFT OUTER JOIN DEPT
ON
EMP.DEPTNO=DEPT.DEPTNO;
-- ################################################################ 
-- Display ename,job,mgr,sal,hiredate,dname from emp and dept 
-- such that all deptartment names are displayed in ouput
-- Display ename,job,mgr,sal,hiredate,dname from emp showing right join with dept 
-- ################################################################ 
SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
EMP RIGHT OUTER JOIN DEPT
ON
EMP.DEPTNO=DEPT.DEPTNO;

-- ################################################################ 
-- Display ename,job,mgr,sal,hiredate,dname from emp and dept 
-- EVEN FOR THE NULL VALUES IN BOTH TABLES
 -- ################################################################ 
 SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,DNAME
FROM
    EMP FULL OUTER JOIN DEPT
ON
    EMP.DEPTNO=DEPT.DEPTNO
ORDER BY DNAME ;

--
 SELECT 
    ENAME,JOB,MGR,HIREDATE,SAL,e.deptno,DNAME
FROM
    EMP e JOIN DEPT d
ON
    e.DEPTNO=d.DEPTNO
ORDER BY DNAME ;


SELECT ENAME, E.job, MGR,HIREDATE,SAL,D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO=D.DEPTNO(+);

SELECT ENAME, E.job, MGR,HIREDATE,SAL,D.DNAME
FROM EMP E , DEPT D
WHERE E.DEPTNO(+)=D.DEPTNO;

-- ################################################################ 
-- list ename,job,sal,branchname
-- emp
-- branch
-- ################################################################ 
SELECT 
    ENAME,JOB,SAL,BRANCHNAME
FROM
        EMP e join Dept d
    on 
        e.deptno=d.deptno
    join
        branch b
    on
        d.branchno=b.branchno;
        
-- ################################################################ 
-- LIST ALL DNAME AND EMP COUNT FOR EACH DEPT 
-- ################################################################ 
SELECT
    DNAME,COUNT(EMPNO)
FROM
    DEPT JOIN EMP
ON
    DEPT.DEPTNO=EMP.DEPTNO
GROUP BY 
    DNAME;
    
-- ################################################################ 
-- LIST ALL BRANCHNAME AND EMP COUNT FOR EACH BRANCH
-- ################################################################ 
SELECT 
    BRANCHNAME,COUNT(EMPNO)
FROM
    BRANCH JOIN DEPT
    ON BRANCH.BRANCHNO=DEPT.BRANCHNO
    JOIN EMP
    ON DEPT.DEPTNO=EMP.DEPTNO
GROUP BY
    branchname;
-- ################################################################ 
--LIST BRANCHNAME,DNAME,SUM OF SAL FOR THOSE BRANCH AND DEPT WHERE THE SUM IS >5000
-- ################################################################ 
SELECT 
    BRANCHNAME,Dname,sum(sal)
FROM
    BRANCH JOIN DEPT
    ON BRANCH.BRANCHNO=DEPT.BRANCHNO
    JOIN EMP
    ON DEPT.DEPTNO=EMP.DEPTNO    
GROUP BY
    dname, branchname
having
    SUM(sal) > 5000;

-- ################################################################ 
-- List empno,ename,mgr,manger name 
-- ################################################################ 
SELECT
    e.empno,e.ename,e.mgr,m.ename
FROM 
    emp e  join emp m
    on m.empno=e.mgr;
    
-- ################################################################
-- Text Literal Example ''
-- The text literal '10' has datatype CHAR. 
-- Oracle implicitly converts it to the NUMBER datatype if it appears in a numeric 
-- expression as in the following statement:
-- ################################################################
-- Display employees salary +10
select empno ,ename,sal ,sal+'10' from emp ;
select empno ,ename,sal ,sal+10 from emp ;
select empno ,ename ,sal ,sal+'0' from emp ;

select empno,ename,hiredate from emp where hiredate='03-dec-81';

select empno,ename,hiredate from emp where hiredate=to_date('3-12-1981','dd-mm-yyyy');
-- ################################################################    

-- DATE 
-- DAY OF MONTH  DD
-- MONTH OF YEAR MM/MON/MMM
-- YEAR          YY/YYY/YYYY       
-- HH:MIN:ss:FF
-- ################################################################    
-- In the following statement, Oracle implicitly converts '03-MAR-97' 
-- to a DATE value using the default date format 'DD-MON-YY':
-- Display details of employees join on 3rd Dec'1981
-- ################################################################


CREATE TABLE date_tab (
   ts_col      TIMESTAMP,
   tsltz_col   TIMESTAMP WITH LOCAL TIME ZONE,
   tstz_col    TIMESTAMP WITH TIME ZONE);
-- Default Time zone with Session
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');

INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 -8:00', 
   TIMESTAMP'1999-12-02 10:00:00 -8:00',
   TIMESTAMP'1999-12-02 10:00:00 -8:00');
SELECT * FROM DATE_TAB;

-- Timezone is -8:00
ALTER SESSION SET TIME_ZONE = '-8:00';
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');

INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 -8:00', 
   TIMESTAMP'1999-12-02 10:00:00 -8:00',
   TIMESTAMP'1999-12-02 10:00:00 -8:00');
SELECT * FROM DATE_TAB;   
-- Timezone is +5:30
ALTER SESSION SET TIME_ZONE = '+5:30';
INSERT INTO date_tab VALUES (  
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00',
   TIMESTAMP'1999-12-01 10:00:00');

INSERT INTO date_tab VALUES (
   TIMESTAMP'1999-12-02 10:00:00 -8:00', 
   TIMESTAMP'1999-12-02 10:00:00 -8:00',
   TIMESTAMP'1999-12-02 10:00:00 -8:00');
SELECT * FROM DATE_TAB;



	
