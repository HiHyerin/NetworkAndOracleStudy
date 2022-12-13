/* 
    P.187 
    DML (������ ���۾��) ==> ROW ����
    - INSERT : ������ �߰�
        1. INSERT ALL
            ��ü ������ ���, ������ ����
        2. ��ü ������ ���(��� �÷��� ������ �߰�)
            INSERT INTO talbe_name VALUES(��...)
                        ----------       ------
                        �÷� ����           �� ������ ����
        3. �ʿ��� �����͸� ���(�÷��� �����ؼ� ó��)
            INSERT INTO table_name(�÷�, �÷�...) VALUES(��...)
                                  --------------      -------
                                  ������ �÷� ������      ���� ������ ����
                                  (DEFAULT�� �ִ°��)
    - UPDATE : ������ ����
        UPDATE table_name SET
        �÷���=��, �÷���=��...
        [WHERE ����] --> �Ⱦ��� �� �ٲ�� ���� �� ���Ǹ� ���� (���� WHERE �ʼ������� ��)
        
    - DELETE : ������ ����
        DELETE FROM table_name
        [WHERE ����]
    *** INSERT, UPDATE, DELETE => �ݵ�� COMMIT ���(�ڹٿ��� ������ ���µ� �����͸� ���� ���ϸ� ����Ŭ���� COMMIT�� ���� ���� ��)
    
*/

CREATE TABLE emp_20
AS
    SELECT empno,ename,job,hiredate,sal FROM emp
    WHERE 1=2;

SELECT * FROM emp_20;
desc emp_10;

-- INSERT ALL -- �ϳ��� ���̺��� �и��� �� ���� ���
-- ex) �μ����� �� ������ / �� �ܿ��� �б⺰ ��� ..
INSERT ALL 
    WHEN deptno=10 THEN
        INTO emp_10 VALUES(empno, ename,job,hiredate,sal)
        
    WHEN deptno=20 THEN
        INTO emp_20 VALUES(empno, ename,job,hiredate,sal)
        
    WHEN deptno=30 THEN
        INTO emp_30 VALUES(empno, ename,job,hiredate,sal)
        
    select * from emp;
    --------------------------
    
select * from emp_10;
select * from emp_20;
select * from emp_30;

--===========================================================
SELECT DISTINCT TO_CHAR(hiredate,'YYYY') FROM emp;

CREATE TABLE emp_1980
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;


CREATE TABLE emp_1981
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;

CREATE TABLE emp_1982
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;

CREATE TABLE emp_1983
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;

INSERT ALL 
    WHEN To_CHAR(hiredate,'YYYY')=1980 THEN
        INTO emp_1980 VALUES(empno,ename,job,hiredate,sal)
        
    WHEN To_CHAR(hiredate,'YYYY')=1981 THEN
        INTO emp_1981 VALUES(empno,ename,job,hiredate,sal)
    
    WHEN To_CHAR(hiredate,'YYYY')=1982 THEN
        INTO emp_1982 VALUES(empno,ename,job,hiredate,sal)
    
    WHEN To_CHAR(hiredate,'YYYY')=1983 THEN
        INTO emp_1983 VALUES(empno,ename,job,hiredate,sal)
select * from emp;
----------------------------

    select * from emp_1980;
    select * from emp_1981;
    select * from emp_1982;
    select * from emp_1983;

-- ���� => �ѽ�/���/�߽�/�Ͻ�/��Ÿ
-- �뷡 => ����/pop/Ʈ��...
-- SNS hong => hong_board

drop table emp_30;
drop table emp_1983;

--===========================================================================

CREATE TABLE student(
    hakbun NUMBER,
    name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
    subject VARCHAR2(100),
    kor NUMBER(3),
    eng NUMBER(3),
    math NUMBER(3),
    regdate DATE DEFAULT SYSDATE,
    CONSTRAINT std_hak_pk PRIMARY KEY(hakbun)
);

-- TABLE ��������� ������ �߰� (INSERT)
INSERT INTO student VALUES(1,'ȫ�浿','',90,80,90,SYSDATE); -- ���� �������
INSERT INTO student(hakbun,name, kor,eng,math) VALUES(2,'��û��', 89,78,90); -- DEFAULT ���� �����Ϸ��� ��ü������ ����
SELECT * FROM student;
select hakbun,name,kor,eng,math,(kor+eng+math) total, round((kor+eng+math)/3,2) avg
FROM student;
-- ���������� insert, update, delete���� ��� ����
-- ������ select������ ����

-- �ڵ�������ȣ ���
INSERT INTO student(hakbun, name, kor, eng,math) VALUES((SELECT MAX(hakbun)+1 FROM student), '�ڹ���',90,80,67);

-- �ڵ� ����, ����(�ʿ��� ������ �߰�, ��ü ������ �߰�)
-- default�� ���� ��� : ���������� �߰�, �׷��� ���� ��� ��ü������ �߰�
-- ����/��¥�� �ݵ�� ''�� �̿��ؼ� �߰��Ѵ�. sysdate�� ��� �� x
    INSERT INTO student VALUES((SELECT MAX(hakbun)+1 FROM student), 'ȫ�浿','',90,90,80,'22/10/10');

ALTER TABLE student drop column subject;
ALTER TABLE student drop column regdate;

CREATE TABLE emp_test
as
select * from emp;

select * from emp_test;

truncate table emp_test; -- ������ ��ü ����(���´� ����)

insert into emp_test(empno, ename,job,mgr,hiredate,sal,comm,deptno)
select * from emp; -- �� ����ֱ�

truncate table student; -- �� ��������

select * from student;










