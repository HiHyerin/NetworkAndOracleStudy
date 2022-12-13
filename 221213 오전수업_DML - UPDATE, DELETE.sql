CREATE TABLE emp_update
AS 
SELECT * FROM emp;

select * from emp_update;

-- ���� ����
update emp_update set
job='CLERK';

-- ���󺹱�(ROLLBACK) COMMIT������ ������ �ȵ�(�ڹٴ� �ڵ� COMMIT�̱� ������ ���� �� ����)
ROLLBACK;

-- �߰�
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'ȫ�浿','CLERK',7788,
        SYSDATE,2000,100,40);
    -- max()�� �� �� �����Ͱ� ���� �� NVL�� ����ؾ��ϰ�, �����Ͱ� ���� �� MAX()+1��� ����
    -- (SELECT NVL(MAX(empno)+1,1) FROM emp_update : ���� ���� ��� �ʱⰪ1
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'��û��','MANAGER',7788,
        SYSDATE,3000,500,40);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'�ڹ���','CLERK',7788,
        SYSDATE,2000,100,40);
commit;
        
SELECT * FROM emp_update;

-- �ڹ��� update
UPDATE emp_update SET
job='SALESMAN', mgr=7698,hiredate='20/02/05',sal=3500,comm=700,deptno=30
-- -- = �� ����
WHERE empno=7937;
--        ---  = �� �񱳿�����
commit;

-- ������ �߰�
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'ȫ�浿1','CLERK',7788,
        SYSDATE,2000,100,50);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'ȫ�浿2','CLERK',7788,
        SYSDATE,2000,100,50);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'ȫ�浿3','CLERK',7788,
        SYSDATE,2000,100,50);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'ȫ�浿4','CLERK',7788,
        SYSDATE,2000,100,50);        
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'ȫ�浿5','CLERK',7788,
        SYSDATE,2000,100,50);   
commit;
 
 -- ���������� �̿��� UPDATE
UPDATE emp_update SET
deptno=60
WHERE deptno=(SELECT deptno FROM emp_update WHERE empno=7938);

select * from emp_update;
commit;
-- ����, ��¥�� �׻� ��������ǥ(�� ��) ���, ������ ��� byteȮ�� �� desc�� ������ ���̺� ���� Ȯ��

-- ��ü����(�����͸�)
DELETE FROM emp_update;
SELECT * FROM emp_update;
rollback;

-- 60�� �μ� ����
delete from emp_update
where deptno=60;
commit;

-- �ڹ��� ����
delete from emp_update
where empno=7937;
commit;

-- ���� ū �μ���ȣ(���⼱ 40) ������ �����
delete from emp_update
where deptno=(SELECT MAX(deptno) from emp_update);

-- truncate(DDL)�� rollback�� �ȵȴ�. / commit, rollback�� DML�� ����ȴ�.
truncate table emp_update;
select * from emp_update;
rollback;

-- ���̺� ����
DROP TABLE emp_update;