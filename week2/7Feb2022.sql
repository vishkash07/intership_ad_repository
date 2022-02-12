[4:38 PM] Dhanashree Jawle
    --########################################################################
-- Display the employee details (empno,ename,dname,job,sal,location).
-- emp (empno,ename,job,sal)
-- dept(dname)
-- branch(location)
--########################################################################
SELECT
e.empno,e.ename,e.job,e.sal,d.dname,b.location
FROM
emp e join dept d
on
e.deptno=d.deptno
join branch b
on b.branchno=d.branchno
Order by d.deptno;


--########################################################################
-- View
--########################################################################
CREATE VIEW vw_empdetails
AS
SELECT
e.empno,e.ename,e.job,e.sal,d.dname,b.location
FROM
emp e join dept d
on
e.deptno=d.deptno
join branch b
on b.branchno=d.branchno
Order by d.deptno;

SELECT * FROM VW_EMPDETAILS


SELECT
DEPTNO,EMPNO,ENAME,JOB,SAL,COMM
FROM
EMP
ORDER BY DEPTNO,EMPNO; 

create view vw_dept_wise_emp_details(DEPTNO  ,EMPNO, ENAME, JOB, SAL, COMM) as
SELECT
DEPTNO,EMPNO,ENAME,JOB,SAL,COMM
FROM
EMP
ORDER BY DEPTNO,EMPNO; 


SELECT * FROM vw_dept_wise_emp_details



SELECT
    deptno, empno,ename,sal,comm,sal+comm,sal+nvl(comm,0)
FROM
    emp
ORDER BY comm;
-- if comm 0 or comm is null -> 100 -> case when expression then action end 
-- if com >0   comm
create view Newtask2(deptno, empno, ename, sal, comm, totalsalary) as
SELECT
    deptno,empno,ename,sal,
    case
        when comm is null 
                then 0
        when comm >0
                then comm
    end as UPDATED_COMMISSION ,
    SAL+case
        when comm is null 
                then 0
        when comm >0
                then comm
    end as Total_salary
    
FROM 
    emp

select * from Newtask2



-- get employees in first 5 rows
-- 1 getting empdetails(deptno,empno,ename,job,sal) sorted on deptno,sal
SELECT
deptno,empno,ename,job,sal
FROM
emp
ORDER BY deptno,sal;
-- 2. create an inline view to show first 5 records
-- getting top 5 records based on sal in desceding order
SELECT
*
FROM
( SELECT
deptno,empno,ename,job,sal
FROM
emp
ORDER BY sal desc
)
WHERE
ROWNUM <= 5;