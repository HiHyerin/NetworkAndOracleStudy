-- p.235 view

CREATE VIEW emp_view
as
    select empno, ename,job,hiredate,sal,deptno from emp;

-- ����� ������ ������ ���� ���� ����. => system �������� ������ �ο��ؾ� �Ѵ�.
-- ����Ŭ�� ����
-- user_tables(������ ���̺� �� �� ����)user_views(������ �� ���), users_constraints
select * from tab;
select * from user_views;  -- ������ ������ �ƴ� sql���常 �����ϰ� �ִ�.
select * from user_tables;
select * from user_constraints;
select * from user_tables where table_name='EMP'; --> �빮�ڷ� , ����� ���� �������� Ȯ��(���� �����Ͱ� ����)
select * from user_views where view_name='EMP_VIEW'; --> �빮�ڷ� , ����� ���� �������� Ȯ��(���� SQL���常 ����)
SELECT * FROM emp_view;

--����
drop view emp_view;

--------------------
-- �ܼ��� ���� : �� �Ӹ� �ƴ϶� ���̺� �����Ͱ� ���� ����ȴ�.
--             �信 ����Ǵ� ���� �ƴ϶� ������ ���̺� ������ �Ѵ�
-- ���̺� ����
create table myDept
as
    select * from dept;

-- �� ����
create view dept_view
as
    select * from myDept;
    
-- dml
INSERT INTO dept_view VALUES(50,'������','����');

-- �߰� �� �� Ȯ��
SELECT * FROM dept_view;

-- �߰� �� ���̺� Ȯ�� (���̺��� ������ ����)
select * from myDept;
----------------------------------------------------
----------------------------------------------------
drop view dept_view;

-- view���۽� �ɼ� �߰�
create view dept_view
as
    select * from myDept with read only;

-- dml
INSERT INTO dept_view VALUES(50,'���ߺ�','����'); --> read only �ɼ��� �߰��߱� ������ ������ �������� �ȵ�

-- �ܼ���� ������ ������ drop�� �Ŀ� �ٽ� �並 �����ؾ� �Ѵ�.
drop view dept_view;

-- ������ ���ÿ� ���� -> ���󵵰� ���� ����.
create or replace view dept_view
as
    select empno, ename, job, hiredate,sal from emp;
    
-- ��� ���̺�� ���Ͻ� �ȴ� => �Լ�, ������ ����� ���� => ���� ���Ǵ�  sql ������ �ִ� ��� => view ����
-- �ܼ��� ���ٴ� ���պ並 �� ���� ���
-- ���պ� : ���̺� �������� �����ؼ� ����ϴ� ��
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--<���պ�> - ���̺� �������� ����
create or replace view empDeptGrade_view
as
    select e1.empno,e1.ename,e2.ename "manager",e1.job,e1.hiredate,e1.sal,e1.comm,dname,loc,grade
    from emp e1, dept, salgrade, emp e2
    where e1.deptno=dept.deptno
    and e1.sal between losal and hisal
    and e1.mgr=e2.empno;
    
select * from empDeptGrade_view;

create or replace view empDeptGrade_1
as
    select e1.empno,e1.ename,e2.ename "manager",e1.job,e1.hiredate,e1.sal,e1.comm,dname,loc,grade
    from emp e1 join dept
    ON e1.deptno=dept.deptno
    join salgrade
    on e1.sal between losal and hisal
    left outer join emp e2
    on e1.mgr=e2.empno;
    
create or replace view empDeptGrade_2
as
    select empno, ename,hiredate,sal,comm,
        (select ename from emp e2 where e1.mgr=e2.empno) manager,
        (select dname from dept where deptno=e1.deptno) dname,
        (select loc from dept where deptno=e1.deptno) loc,
        (select grade from salgrade where e1.sal between losal and hisal) grade
    from emp e1;
    
----------------------------------------------------------
select * from empDeptGrade_2;                               => �� �ν��� ���� ������� ���µ� �並 �����ϸ� �Ʒ���ó�� ������ ��� ���°ͺ��� �����ϰ� ���� �� �� �ִ�.
----------------------------------------------------------
select empno, ename,hiredate,sal,comm,
        (select ename from emp e2 where e1.mgr=e2.empno) manager, --  ��Ī �ʼ�
        (select dname from dept where deptno=e1.deptno) dname,
        (select loc from dept where deptno=e1.deptno) loc,
        (select grade from salgrade where e1.sal between losal and hisal) grade
    from emp e1;
    
----------------------------------------------------------
 desc empDeptGrade_2;
    
-- JOIN, SubQuery => view�� ���� �����ϸ� �������α׷����� ���ϰ� ��� ����

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--<�ζ��κ�>
-- �並 �����ϴ� ���� �ƴ϶� select�� �̿��ϴ� ���, ���̺��� ��� �߶� ���(������ ������ ���)
-- ����) Top-N
-- ����)
-- 221214 11�ú���~~

-- �����߻�(�÷����� ���� �����͸� ���ؼ�)
select empno,ename,job,hiredate,sal,comm
from (select empno,ename,job,hiredate,sal from emp);

-- �������
select empno,ename,job
from (select empno,ename,job,hiredate,sal from emp);

-- join / subquery
select empno, ename, job, dname, loc
from (select empno, ename, job, dname, loc from emp, dept
        where emp.deptno=dept.deptno);
        
select empno, ename, dname,loc
from (select empno, ename,job,
        (select dname from dept where deptno=emp.deptno) as dname, 
        (select loc from dept where deptno=emp.deptno) as loc
        from emp);

/*
    �ζ��� => �ڹٽ�ũ��Ʈ, css
    <style>
        button(background-color:yellow)
    </style>
    <button style="background-color:yellow">
    <button onclick="javascript:history.back()">
*/

-- �ʿ��� ������ŭ row�� �ڸ���
select empno,ename,sal,rownum
from (select empno,ename,sal from emp)
where rownum<=5;

select empno,ename,job,hiredate,sal,rownum
from emp;

-- rownum��ȣ ����
select empno,ename,job,hiredate,sal,rownum
from (select empno,ename,job,hiredate,sal from emp order by sal desc);

-- rownum�� ���� : Top-N (�߰��� �ڸ� �� ����) ������ 1�����ͳ� �� �ں���
--                �������� ���� �� ����.

-- rownum ����
-- �޿��� ���� �޴� ����� �̸�,����,�޿� => ���� 5��
-- �̷��� �ڸ��� �ϴ� 1~5��° ��� �ڸ��� �� �Ŀ� order by
select ename, job, sal, rownum --- 3
from emp --1
where rownum<=5 --2
order by sal desc;--4

-- �ζ��κ並 �̿��� ���� �ذ�
select ename, job, sal, rownum --3
from (select ename,job,sal from emp order by sal desc) --1
where rownum<=5; --2

-- �߰����� �ڸ���(����¡) : �ζ��κ信�� �ڸ��°� �ƴϰ� ���̺��� ���� �ű⼭ �ڸ�
select ename,job,sal,num
from (select ename,job,sal,rownum as num 
    from(select ename,job,sal 
        from emp order by sal desc))
where num between 4 and 8;

select count(*) from food_location;
/*
    * �� ����ϴ� ���
    sql������ ��ų� ����(join,subquery), ���� �ʿ��� ��� : �Ϲ� ��
    ������������ �ڸ���, ������ ������ : �ζ��� ��
    ���� sql ���� ���� ���(������ ���� �� ����)
*/












