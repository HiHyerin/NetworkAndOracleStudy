-- emp�� �ִ� ��� ������ �˻�
SELECT * FROM emp;

-- emp�� �ִ� ������ �� ���, �̸�, ����, �Ի��ϸ� ����
SELECT empno,ename,job,hiredate FROM emp;

-- �÷��� ��Ī�� �ִ� ��� => ����ڰ� ���� �� �� �ְ� ������ ��
SELECT empno "���", ename "�̸�",hiredate "�Ի���"
FROM emp;

SELECT empno as ���, ename as �̸�, hiredate as �Ի���
FROM emp;

SELECT empno as ���, ename as �̸�, hiredate as �Ի���
FROM emp e;

-- ���ڿ� ����
SELECT ename || '���� �Ի�����' || hiredate|| '�Դϴ�.' FROM emp;

-- �ߺ��� ���� DISTINCT
SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;


-- ���������
SELECT 10+2,10-2,10*2,10/3
FROM DUAL; -- -> ������ ���̺�

SELECT 10+2,10-2,10*2,10/0
FROM DUAL; -- -> 0���� ������ ����

SELECT ' 10'+2,10-2,10*2,10/3
FROM DUAL; -- -> �ڵ� Integer.parseInt() ���� ('10'�� �ڵ����� ������ �ٲ�)
           -- -> ���ڰ� ���ڿ��� ���� ��쿡 �ڵ����� ���������� ��ȯ 
           -- -> �������� ������ �־ ���� X 

SELECT '10'+'A'
FROM DUAL; -- -> ����

SELECT '10'||'A'
FROM DUAL; --> 10A

SELECT ename,sal+NVL(comm,0) "�����޿�" -- NVL = null���̸� 0���� �ٲ��
FROM emp;

SELECT * FROM emp
WHERE empno=&sabun;




CREATE TABLE student(
    name VARCHAR2(34),
    kor NUMBER,
    eng NUMBER,
    math NUMBER
    );
    
SELECT * FROM student;
INSERT INTO student VALUES('ȫ�浿',89,78,34);
INSERT INTO student VALUES('��û��',78,73,97);
INSERT INTO student VALUES('�ڹ���',45,76,68);
COMMIT;

-- �������
SELECT name,kor,eng,math,kor+eng+math "total",(kor+eng+math)/3 "���"
FROM student;

-- �񱳿�����
SELECT ename,sal FROM emp;

-- = ���� (emp���� �޿��� 3000�� ����� �̸�, ����, �Ի���, �޿� ���)
SELECT ename,job,hiredate,sal
FROM emp
WHERE sal=3000;

-- <> : ���� �ʴ�(emp���� �޿��� 3000�� �ƴ� ����� �̸�, ����, �Ի���, �޿� ���)
SELECT ename,job,hiredate,sal
FROM emp
WHERE sal<>3000;

SELECT ename,job,hiredate,sal
FROM emp
WHERE sal!=3000;

SELECT ename,job,hiredate,sal
FROM emp
WHERE sal^=3000;

-- �۴� < : �޿��� 2500 �̸��� ����� ��� ���� ���
SELECT *
FROM emp
WHERE sal<2500;

-- �񱳿����� : ����, ��¥�� �񱳿����ڸ� ����Ѵ�.
-- ��¥ : YY/MM/DD 81/01/01
-- 81�� ���Ŀ� �Ի��� ����� ��� ������ ���

SELECT * 
FROM emp
WHERE hiredate>'81/12/31'; -- ''(���ڿ��������� ����)
-- WHERE ������ �ڹ� IF�� ���� => TRUE�� �� ó��

/*
    SQL���� => select
    for(int i=0, i<=emp.length;i++){
     WHERE 
     if (hiredate > '81/12/31') {}
    }
*/

-- 81�⿡ �Ի��� ����� ��� ���� ���
/* 
SELECT *
FROM emp
WHERE hiredate>='81/01/01' AND hiredate<='81/12/31';
*/

-- �޿��� 1500 �̻��� ����� �̸�, �޿�
SELECT ename,sal
FROM emp
WHERE sal>=1500;

-- KING���� ���� �̸��� ���� ����� �̸�, �޿�, ����
SELECT ename, sal, job
FROM emp
WHERE ename>'KING';
-- => ������ : ���ڰ� �� ��� ��ҹ��ڸ� ����

-- king�� ��� ����
SELECT *
FROM emp
WHERE ename = 'KING';
-- �ڹٿ��� �빮�ڷ� �����Ŀ� ����Ŭ�� ����(toUpperCase())

------------------------------------------------------------------------
-- OR ������ => IN ������ ��ü ����
-- AND ������ => BETWEEN ��ü ����

-- AND 
-- 1500 �̻� 3000���� �޿��� �޴� ����� ��� ���� ���
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;

-- 1500�̰ų� 3000�� ����� ������� ���
SELECT *
FROM emp
WHERE sal=1500 OR sal=3000;

-- �μ���ȣ�� 30��, 20���� ����� ��� ������ ������ �´�
SELECT *
FROM emp
WHERE deptno=30 OR deptno=20;

-- NULL ������ (���� NULL�� ��� ����ó���� �ȵȴ�.
-- IS NULL (comm=null => xx), IS NOT NULL
-- comm ������ => �������� �޴� ����� ��� ������ ���
SELECT *
FROM emp
WHERE comm IS NOT NULL AND comm<>0;


-- comm ������ => �������� �����ʴ� ����� ��� ������ ���
SELECT *
FROM emp
WHERE comm IS NULL OR comm=0;

-- IN ������ => OR�� �������� ��쿡 ó��
-- �޿��� 5000, 2850, 1500, 3000, 950�� �޴� ����� ��� ����
SELECT *
FROM emp
WHERE sal=5000 OR sal=2850 OR sal=3000 OR sal=950;

SELECT *
FROM emp
WHERE sal IN(5000,2850,3000,950);

-- ����
-- ������ MANAGER, CLERK, SALESMAN
SELECT *
FROM emp
WHERE JOB IN('MANAGER', 'CLERK', 'SALESMAN');

-- ������ MANAGER, CLERK, SALESMAN �ƴ� ���
SELECT *
FROM emp
WHERE JOB NOT IN('MANAGER', 'CLERK', 'SALESMAN');

-- BETWEEN AND => >=AND<=
-- ����, ����, ��¥ ����
-- �޿��� 1500~3000 ���̿� �ִ� ����� ��� ����
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;

SELECT *
FROM emp
WHERE NOT (sal>=1500 AND sal<=3000);

-- ��(����¡)
SELECT *
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

-- BETWEEN ����
SELECT *
FROM emp
WHERE sal NOT BETWEEN 1500 AND 3000;
-- NOT IN, NOT BETWEEN, NOT LIKE

--  �������߿� ���� ���� ���Ǵ� ������ => LIKE ==> ��� �˻���
-- ���� : WHERE �÷��� LIKE '����'(A%, %A, %A%, _ _A%, _ _A_ _ ...)
-- ��� �̸��߿� A�ڷ� �����ϴ� ����� ��� ������ ���� �޶�
SELECT *
FROM emp
WHERE ename LIKE 'A%';

SELECT *
FROM emp
WHERE ename LIKE '%T';

SELECT *
FROM emp
WHERE ename LIKE '%A%';

SELECT *
FROM emp
WHERE ename LIKE '%EN'; OR LIKE '%AN';

-- _ : �ѱ���
SELECT *
FROM emp
WHERE ename LIKE '_A%';
