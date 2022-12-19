-- FUNCTION ����
-- ������ ��������, join���� �ٸ� ���̺� ������ �б⿡�� function ���ֻ��
-- �ݺ��Ǵ� ���, ������ �ʿ��� �� ����
-- ���� : �����Ͱ�(���ϰ�)�� �Ѱ��� ������ �� �ִ�.(���ν����� �������� ������ �� �ִ�) => ��¥, �̸�, �μ���... , �ִ밪, ��հ� .. ��
   --   ��> �׷��� ���� ������ ����
  

-- join
SELECT empno,ename,job,hiredate, sal, comm,dname,loc,grade
from emp,dept,salgrade
where emp.deptno=dept.deptno
and sal between losal and hisal;

-- subQuery
SELECT empno, ename,job,hiredate,sal,comm,
    (select dname from dept where deptno=emp.deptno) dname,
    (select loc from dept where deptno=emp.deptno) loc,
    (select grade from salgrade where emp.sal between losal and hisal) grade
from emp;

-- �Լ������
create or replace function getDname(
    vDeptno emp.deptno%type -- �Ű�����
) return VARCHAR2 -- ���ڿ��� �����ϰڴ�(return ��������)
IS
    vDname dept.dname%type;
begin
    select dname into vDname from dept where deptno=vDeptno;
    return vDname;
end;
/
---------------------------------------------------------------
create or replace function getLoc(
    vDeptno emp.deptno%type -- �Ű�����
) return VARCHAR2 -- ���ڿ��� �����ϰڴ�(return ��������)
IS
    vLoc dept.loc%type;
begin
    select loc into vLoc from dept where deptno=vDeptno;
    return vLoc;
end;
/

-- ���
select empno,ename,job,hiredate,sal,getDname(deptno) dname, getLoc(deptno) loc
from emp;

---------------------------------------------------------------

create or replace function getGrade(
    vSal emp.sal%type
) return number
is
    vGrade salgrade.grade%type;
begin
    select grade into vGrade
    from salGrade
    where vSal between losal and hisal;
    return vGrade;
end;
/

-- ���
select empno,ename,job,hiredate,sal,getDname(deptno) dname, getLoc(sal) grade
from emp;

---------------------------------------------------------------
select empno,ename,job,hiredate,sal
from emp
where sal>(select round(avg(sal)) from emp);

create or replace function getAvg
return number
is
    vAvg number; -- ��������
begin
    select round(avg(sal)) into vAvg
    from emp;
    return vAvg;
end;
/
select empno,ename,job,hiredate,sal
from emp
where sal>getAvg();

---------------------------------------------

create or replace function getMax
return number
is
    vMax NUMBER;
begin
    SELECT MAX(empno)+1 into vMAX
    from emp;
    
    return vMax;
end;
/

select getMax() from dual;

-- ����
drop function getAvg;
drop function getDname;
drop function getGrade;
drop function getLoc;
drop function getMax;







