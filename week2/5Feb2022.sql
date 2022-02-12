
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
-- Creating view employee details 
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

---- Get the manager name for each employee 
CREATE VIEW
    vw_mgr_details(ename,mgrname,deptno)
AS 
SELECT 
    E.ENAME ,M.ENAME ,E.DEPTNO
FROM
    EMP E JOIN EMP M
    ON
    E.MGR = M.EMPNO;

select * from vw_mgr_details
where 
    deptno = 30;
    
--##############################################################
-- view is created on single table 
-- WE CAN USE DML OPRATION ON IT SUCH AS INSERT/UPDATE/DELETE
--INCASE OF INSERT MUST HANDLE THE NULL VALUES
--##############################################################
-- iplay empno, ename, job, sal, comm, for an employee 
-- Department wide employee complete details related to job, sal comm along with     
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


select * from vw_dept_wise_emp_details where deptno = 30;

select * from vw_dept_wise_emp_details where deptno = 10;


UPDATE vw_dept_wise_emp_details
SET
    comm = 0
WHERE   
    deptno = 10;

create view 

as 
    select 
        d.dname,e.empno,ename,e.sal,COALESCE(e.comm,0)
    from 
        emp e join dept d
        on 
        e.deptno = d.deptno
    where 
        e.deptno = 30
        AND
        e.sal > (select avg(sal) from emp)
    order by 
        e.sal;
--Because ISNULL is a function, it is evaluated only once. As described above, the input values for the COALESCE expression can be evaluated multiple times.

-- branch(branchname, dept(dname)

select 
    dname,branchname
from 
    dept d, 
    Lateral (select *  from branch b where b.branchno = d.branchno)
order by 
    dname;