--Q1 >> Display all the information of the EMP table?
select * from emp;

--Q2 >> Display unique Jobs from EMP table?
select distinct job from emp;

--Q3 >> List the emps in the asc order of their Salaries??
select empno, ename, sal from emp order by sal asc;

--Q4 >> List the details of the emps in asc order of the Dptnos and desc of Jobs?
select * from emp order by deptno asc,job desc;

--Q5 >> Display all the unique job groups in the descending order
SELECT DISTINCT job FROM emp ORDER BY job DESC;

--Q6 >> Display all the details of all ‘Mgrs’
SELECT * FROM emp WHERE job ='MANAGER';

--Q7 >> List the emps who joined before 1981
SELECT * FROM emp WHERE HIREDATE<'01-JAN-1981';

--Q8 >>  List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
SELECT empno, ename, sal, round(sal/30,2) FROM emp order by sal;

--Q9 >> Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
SELECT empno, ename, job, hiredate,round((sysdate-hiredate)/365,2) FROM emp WHERE job='MANAGER';

--Q10 >> List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
SELECT empno, ename, sal,round((sysdate-hiredate)/365,2) FROM emp WHERE empno=7698;

--Q11 >> Display all the details of the emps whose Comm Is more than their Sal
SELECT * FROM EMP WHERE COMM > SAL;

--Q12 >> List the emps along with their Exp and Daily Sal is more than Rs 100
SELECT  empno, ename, round((sysdate-hiredate)/365,2) FROM emp where sal/30 > 100;

--Q13 >> List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order
SELECT empno, ename, deptno,job FROM emp WHERE job='CLERK' or job='ANALYST' order by job;

--Q14 >> List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
SELECT empno, ename, sal, deptno, hiredate FROM emp WHERE hiredate = '01-MAY-1981'or hiredate = '03-DEC-1981' or hiredate = '17-DEC-1981' or hiredate = '19-JAN-1980' ORDER BY round((sysdate-hiredate)/365,2);

--Q15 >> List the emp who are working for the Deptno 10 or 20
SELECT empno, ename FROM emp WHERE deptno IN (10,20);

--Q16 >> List the emps who are joined in the year 81
SELECT empno, ename FROM emp WHERE hiredate BETWEEN '01-JAN-1981' AND '31-DEC-1981';

--Q17 >> List the emps Who Annual sal ranging from 22000 and 45000
SELECT empno, ename, sal, sal*12 FROM emp WHERE sal*12 BETWEEN 22000 AND 45000;

--Q18 >> List the Enames those are having five characters in their Names
SELECT ename FROM emp WHERE ename LIKE '_____';

--Q19 >> List the Enames those are starting with ‘S’ and with five characters
SELECT ename FROM emp WHERE ename LIKE 'S____'; 

--Q20 >> List the emps those are having four chars and third character must be ‘r’
SELECT ename FROM emp WHERE ename LIKE '__R_';

--Q21>> List the Five character names starting with ‘S’ and ending with ‘H’
SELECT ename FROM emp WHERE ename LIKE 'S___H';
 
--Q22 >>  List the emps who joined in January
SELECT empno,ename FROM emp WHERE hiredate LIKE '__-JAN-__';

--Q23 >> List the emps whose names having a character set ‘ll’ together
SELECT empno,ename FROM emp WHERE ename LIKE '%LL%'; 

--Q24 >>  List the emps who does not belong to Deptno 20
SELECT empno,ename,deptno FROM emp WHERE deptno!=20;

--Q25 >> List all the emps except ‘PRESIDENT’ & ‘MANAGER” in asc order of Salaries
SELECT ename, empno, sal, job FROM emp WHERE job NOT IN('PRESIDENT', 'MANAGER') order by sal;

--Q26 >> List the emps whose Empno not starting with digit78
SELECT empno,ename FROM emp WHERE empno NOT LIKE '78%';

--Q27 >> List the emps who are working under ‘MGR’
SELECT ename, empno, sal, job FROM emp WHERE job  IN( 'MANAGER') order by sal;


--Q28 >> List the emps who joined in any year but not belongs to the month of March
SELECT empno,ename,hiredate FROM emp WHERE hiredate NOT LIKE '__-MAR-__';

--Q29 >> List all the Clerks of Deptno 20
SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno FROM emp WHERE job='CLERK' AND deptno=20;
    
--Q30 >> List the emps of Deptno 30 or 10 joined in the year 1981
SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno FROM emp WHERE 
    deptno IN(10,30) AND hiredate>'01-01-1981'AND hiredate<'31-12-1981';

--Q31 >> Display the details of SMITH
select * from emp where ename='SMITH';

--Q32 >>Display the location of SMITH
SELECT location from branch WHERE branchno = (select branchno from emp where ename='SMITH');

