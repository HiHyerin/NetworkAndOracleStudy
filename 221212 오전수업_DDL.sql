-- 221212
-- p. 179 DDL(������ ���� ���)
/*
    DQL
        SELECT
    DML
        INSERT, UPDATE, DELETE
    DDL
        CREATE, ALTER, DROP, TRUNCATE
    DCL
        GRANT, REVOKE
    TCL
        COMMIT, ROLLBACK
        
-- �̹��� ��ǥ DML, DDL
    * DDL
        - ����(Table : ������ �������)
        - View : �������̺�
        - Index : ����ȭ(�˻��ӵ� ���)
        - Sequence : �ڵ�������ȣ => �ߺ����� ������ ex) MAX() + 1
        - PL/SQL => Function, Procedure, Trigger
    
    Table : ������ ���� ��� �����
        1. ��������
            ������
                CHAR(1~2000byte) -> ��������Ʈ (���ڼ��� ������ �� ex) ����/����, y/n
                                 -> CHAR(10)
                                    ���嵥���� 'A'�� �־ ������ 10byte ���(�޸� �������� ���)
                                    A \0 \0 \0 \0 \0 \0 \0 \0 \0 => ������ 10byte(������)
                VARCHAR2 (1~4000byte) =====> default
                    -> ���� ����Ʈ
                    -> VARCHAR2(10)
                        10byte �̳��� �޸� �Ҵ� ����
                        ���嵥���� 'A' = 1byte�� �Ҵ�
                    -> ũ�⸦ �ణ �÷��� ��°� ����.
                    -> ���� : ����Ŭ������ ��� ����
                CLOB (4gb)
                    -> ���� ����Ʈ (���ڿ��� ����)
                    -> �ٰŸ�, ȸ��Ұ�, �ڼҼ� ��� ���� ���ڰ� ���� ���̴� �Ϳ� ���
                --------------------------------------------------------------- String
            ������
                NUMBER(38) => 38�ڸ� ��, int, long��
                NUMBER(4) => ���� ������ ������ => 0~9999
                NUMBER => 8�ڸ� ���� NUMBER = NUMBER(8,2) : ���� 6�ڸ��� �Ҽ��� �ΰ�
                NUMBER(7,2) => ���� 5�ڸ�, �Ҽ��� ���ڸ�
                            => ������ �Ǽ��� �����ϴ� ���� �ƴϴ�.(������ �����ص� �ȴ�)
                    -> ����� �����Ͱ� �Ǽ��� double, ������ int
            ��¥��
                DATE -- default
                TIMESTAMP : ��ϰ�� (�츮���� �� �Ⱦ�)
            ��Ÿ��
                -> ������, �̹���(�ΰ�), �������...
                -> BLOB(2������=�������), 
                -> BFILE(file�������� ����) ���� �� �Ⱦ� ���, ������ ���� �� ������ �о ����ϴ� ���
                -> HTML�� ��ũ�� �̿�(����)
                
        1-1. ���̺��(�ĺ���)
            1) ���� �����ͺ��̽�(XE)������ ���� �̸��� ���̺��� ���� �� ����.
            2) ���ڷ� ����(���ĺ�, �ѱ�) -> ��������� ���ĺ�(�ü������ �ѱ��� �д� ����� �ٸ���)
                                      -> ���ĺ��� ���ÿ� ��ҹ��� ������ ����
                                      -> *** ���� ����Ŭ�� ����� �� �빮�ڷ� ������ �ȴ�(���� ���̺��� ������ ���� �� �빮�� ���)
                                            ex) WHERE table_name ='emp' -> ������ ���� ���ҷ���
                                                WHERE table_name='EMP' -> ������ ���� �ҷ���
            3) ���̺��(30) => 15�� : ���̺�� �÷����� ���� �� �� �ִ�.
            4) ���� ��� ����(��, �տ� ��� ����)
            5) Ű����� ����� �� ����(SELECT, INSERT...)
            6) Ư������ ��� ����( _ )
            
        2. �������� : �̻����� ����(���α׷��� �ʿ��� �����͸� ����), ������ ����ϴ� ���� �ƴϴ�
                    -------- ����, ���� => ������ �ʴ� �����Ͱ� ����, ���� �� �� �ִ�.
                    ex) 
                        id name sex
                        aaa hong man
                        aaa shim woman
                        ---------------- DELETE FROM member WHERE id='aaa' => �̻����� �߻�
                1) NOT NULL : NULL �� ������� �ʴ´� (������ �����Ͱ��� �ʿ�� �Ѵ�)
                    ex) * �ʼ��Է�
                    
                2) UNIQUE : ���ϰ� (�ߺ��� ���� ������) ����) null�� ���
                    ex) �ĺ�Ű(��üŰ) -> id(�⺻Ű)�� �ؾ������ ��� �̸���,��ȭ��ȣ�� idã��
                                        �̸����̳� ��ȭ��ȣ�� ���� �� �ֱ� ������ null�� ���
                3) PRIMARY KEY
                    �⺻Ű : ������, ID -> �ߺ��� ���� ������
                    ��� ���̺��� Primary Key�� �� �� �̻� ������ ���� ����
                    NOT NULL + UNIQUE
                    �Խù� ��ȣ , ��ȭ��ȣ...
                4) FOREING KEY
                    ����Ű(�ܷ�Ű) : �����ϰ� �ִ� �����Ͱ��� ����
                    ex) �Խ��� <-> ���  /  ��ȭ <-> ����    --- �ٸ� ���̺�� ����
                5) CHECK
                    ������ ������ ���� �Է��� �����ϰ� �����
                    ex) �μ���, �ٹ���
                        ���� �ڽ�, �޺��ڽ�
                6) DEFAULT 
                    �̸� �⺻���� ������ �Ŀ� -> �����Ͱ��� ���� ��� �ڵ����� ���� �Է�
                    ex) regdate DATE DEFAULT SYSDATE
                        hit NUMBER DEFAULT 0
                        
        2-1. TABLE �����
            1) ������ ���̺��� ���� (�����Ͱ�+���̺� ����)
                CREATE TABLE table_name
                AS
                SELECT ~
                (SELECT �� ��� ���¸� table_name�� �����ض�)
            2) ���̺� ���¸� ����
                CREATE TABLE table_name
                AS
                SELECT ~
                WHERE 1=2; -> WHERE������ false�� �ǰ� �ؾ���
            3) ����� ����(���� ����)
            ----------------------------------CREATE�� commit�� ������ ���� (�ڵ����� ��)
        3. ����, ����, ������ �ڸ���
        
        
*/

-- ����(������ ��+���̺� ����)
CREATE TABLE myEmp
as
select * from emp;
select * from myEmp;

desc myEmp;

-- ����(���¸�)
create table myEmp2
as
select * from emp
where 1=2;
select * from myEmp2;

-- ����
drop table myEmp;
drop table myEmp2;

CREATE TABLE myEmp
as
select Emp.*, dname,loc
from emp,dept
where emp.deptno=dept.deptno;

select * from myEmp;
drop table myEmp; -- ���̺�, �� ��� ����
DESC myEmp; 
truncate table myEmp; -- ���̺� ���´� �����ϰ� ���� ����
/*
    �ʿ� ���� �����͸� ���� : DELETE => ���(��������)
    ��ü �����͸� ���� : TRUNCATE -> ��� �Ұ���(������ �� ����.)
    ���̺� ��ü ���� : DROP => ��� �Ұ���(������ �� ����.)
    => DML(��������), DDL(������ �� ����) => ���
*/ 

DESC myEmp;
-- ���̺�� ���� => RENAME old_name To new_name
RENAME myEmp To myEmp2; -- ���̺� �̸� ����

/*
    ����� ���� ���̺�(p.179)
    ����)
        CREATE TABLE ���̺��(
            �÷��� �������� [��������], => �÷�����(�÷��� ���ÿ� ����) => NOT NULL, DEFAULT
            �÷��� �������� [��������],
            �÷��� �������� [��������],
            �÷��� �������� [��������],
            �÷��� �������� [��������],
            [��������] => ���̺���(���̺��� ������� ������ ����) => PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE
        );
    
    ���¹��)
        - ���
            CREATE TABLE member
            (
                id VARCHAR2(20) PRIMARY KEY, -- �ߺ��� �ȵǰ� �ʼ� �Է°�
                pwd VARCHAR2(10) NOT NULL, -- �ݵ�� �Է�
                name VARCHAR2(34) NOT NULL,
                sex CHAR(10) CHECK(sex IN('��','��')
                email VARCHAR2(100) UNIQUE, -- ��üŰ(NULL�� ����)
                tel VARCHAR2(13) UNIQUE, -- ��üŰ
                regdate DATE DEFAULT SYSDATE  -- ��ϳ�¥ : ���� ��¥
            );
            
        - �������ǿ� �̸� �ο� (����) : �������Ǹ� ����, ���� ���� (constraint~~ ��Ī)
            CREATE TABLE member
            (
                id VARCHAR2(20),
                pwd VARCHAR2(10) CONSTRAINT member_pwd_nn NOT NULL,
                                           --------------- �ߺ��� ������� �ʴ´�.
                                          ���̺��_�÷���_�������Ǿ���
                                            -> pk (PRIMARY KEY)
                                            -> nn (NOT NULL)
                                            -> fk (FOREIGN KEY)
                                            -> ck (CHECK)
                                            -> uk (UNIQUE)
                name VARCHAR2(34) CONSTRAINT member_name_nn NOT NULL, 
                sex CHAR(10),
                eamil VARCHAR2(100),
                tel VARCHAR2(13)
                regdate DATE DEFAULT SYSDATE,
                CONSTRAINT member_id_pk PRIMARY KEY(id)
                CONSTRAINT member_sex_ck CHECK(sex IN('��','��')),
                CONSTRAINT member_et_uk UNIQUE(email, tel)
            ); -- not null�� �÷��� ���� ���� �������� �Ʒ��� ����?
            
emp            
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)

dept
DEPTNO NOT NULL NUMBER       
DNAME           VARCHAR2(20) 
LOC             VARCHAR2(20)

        CREATE TABLE dept(
            deptno NUMBER(2),
            dname VARCHAR2(20) CONSTRAINT dept_dname_nn NOT NULL,
            loc VARCHAR2(20) CONSTRAINT dept_loc_nn NOT NULL,
            CONSTRAINT dept_deptno_pk PRIMARY KEY(deptno)
        );
        
        CREATE TABLE emp(
            empno NUMBER(4),
            ENAME             VARCHAR2(10) CONSTRAINT emp_ename_nn NOT NULL,
            JOB               VARCHAR2(9)  CONSTRAINT emp_job_nn NOT NULL,
            MGR               NUMBER(4)    -- null�� ���
            HIREDATE          DATE         DEFAULT SYSDATE,
            SAL               NUMBER(7,2)  CONSTRAINT emp_sal_nn NOT NULL,
            COMM              NUMBER(7,2)  
            DEPTNO            NUMBER(2)
            CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
            CONSTRAINT emp_deptno_fk FOREIGN KEY(deptno)
            REFERENCES dept(deptno) ----- foreign key ���� ���
        );
    
*/

/*
    �Խ��� / ��� => �� ����
    **** �����Ǵ� ���̺� (�켱������ ����)
    **** �����ϴ� ���̺�
    ����
    V �Խù���ȣ => NUMBER, �ߺ��� ���� �ʴ� ������ pk -> �ڵ�����(������) => MAX()
      �̸� => NOT NULL    VARCHAR2
      ���� => NOT NULL    VARCHAR2
      ���� => NOT NULL    CLOB
      ��й�ȣ => NOT NULL    ����/������ ���� Ȯ��
    V ����� => DEFAULT SYSDATE
    V ��ȸ�� => DEFAULT 0
   V => ���α׷� �ȿ��� �ڵ����� ó�� �Ǿ�� ��
*/
desc emp;
SELECT * FROM emp;

CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(34) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(4) CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd  VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    address VARCHAR2(100),
    CONSTRAINT board_no_pk PRIMARY KEY(no)

);

    -- hit �߰�
    ALTER TABLE board ADD hit NUMBER DEFAULT 0; -- �ڵ����� �����ؾ���
    DESC board;
    -- subject ���ڼ� ����
    alter table board modify subject VARCHAR2(4000);
    DESC board;
    -- address ����
    alter table board drop column address;
    desc board;
    -- address �������Ǳ��� �ؼ� �߰�
    alter table board add address VARCHAR2(100) CONSTRAINT board_address_nn NOT NULL;
    desc board;
    -- �÷��� ����
    alter table board rename column address to email;
    desc board;
    -- ���������� �߰��ϴ� ��� : �����Ͱ� ���� ��쿡�� ����x
    --                         �����Ͱ� �ִ� ��� : NOT NULL, PRIMARY KEY, FOREIGN KEY, CHECK�� ���� �߻�

DROP TABLE board;

-- ALTER : �÷��� ����, ����, �߰�, �������� ����...

/*
    �߰�: add
    ���� : modify
    ���� : drop column
    
*/

SELECT * FROM tab; -- �����Ǿ� �ִ� ���̺� Ȯ��

/*
    member
    id => pk
    pwd => nn
    sex => CHECK
    name => nn
    ------------
    address
    tel
    ------------ �߰�
    
*/
create table member(
    id VARCHAR2(20),
    pwd varchar2(10) constraint member_pwd_nn NOT NULL,
    sex varchar2(6) ,
    name varchar(34) constraint member_name_nn NOT NULL,
    constraint member_id_pk PRIMARY KEY(id),
    constraint member_sex_ck CHECK(sex IN('����','����'))
);

-- �����Ͱ� �߰�
insert into member values('aaa','1234','����','ȫ�浿');
insert into member values('aaa','1234','����','ȫ�浿'); -- pk�� ����
insert into member values('bbb','','����','ȫ�浿'); -- not null ���� 
insert into member values('bbb',' ','����','ȫ�浿'); -- ' ' ���� �ν� �ϱ� ������ ����x
select * from member;

-- '' (NULL), ' '(����)
alter table member add address varchar2(100) constraint member_address_nn NOT NULL; -- �����߻�, �����Ͱ� �ִ� ��� NOT NULL�� �����ߴµ� NULL���� ���ϱ� ����
alter table member add address varchar2(100) DEFAULT ' ' constraint member_address_nn NOT NULL; -- �������� ������ �����ϸ� ����X(DEFAULT)

-- ���������� ������ ��� ���� , �ٵ� Ư���� ��찡 �ƴϰ� ���ÿ� ��� �� ����
-- ������ NOT NULL UNIQUE CHECK

DROP table board;

CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(34) ,
    subject VARCHAR2(4000) ,
    content CLOB,
    pwd varchar2(10),
    regdate DATE,
    address VARCHAR2(100)
    );

-- alter�� �̿��ؼ� �������� �߰�
-- primary key �߰�
ALTER TABLE board ADD CONSTRAINT board_no_pk PRIMARY KEY(no);
alter table board modify name constraint board_name_nn NOT NULL;
desc board;
    -- primary key, foreign key, check, unique => add
    -- not null => modify
    
-- default�� ���������� �ƴϴ�
alter table board modify regdate DATE DEFAULT SYSDATE;

-- �������� ����
ALTER TABLE board DROP CONSTRAINT board_name_nn; -- name�� not null �������Ǹ� ����

-- �÷� ������ ��� ���� 
-- �α����� �� email �Ǵ� ���̵� �Է� primary key�� �ΰ��� ��ƺ���
CREATE TABLE member2(
    id varchar2(20),
    name varchar2(30)CONSTRAINT mem_name_nn NOT NULL,
    email varchar2(100),
    pwd varchar2(10) CONSTRAINT mem_pwd_nn NOT NULL,
    constraint member2_id_pk primary key(id),
    constraint member2_email_pk primary key(email)
); -- �̷��� primary key�� �ΰ��� ������ ����(������ primary key�� �ϳ�)

CREATE TABLE member2(
    id varchar2(20),
    name varchar2(30)CONSTRAINT mem_name_nn NOT NULL,
    email varchar2(100),
    pwd varchar2(10) CONSTRAINT mem_pwd_nn NOT NULL,
    constraint member2_et_pk primary key(id,email)
); -- �̷��� �ϸ� primary key�� �ΰ� �̻� ���� �� �ִ�(�ļ�) ���������� ���� ������ �� �� �ֱ� ������
    -- id, email�� ��� ���ƾ� ������ ��.

-- insert into member2 values('aaa','hong','hong@co.kr','1234');
insert into member2 values('aaa','shim','shim@co.kr','1234');
insert into member2 values('bbb','park','park@co.kr','1234');
insert into member2 values('ccc','kim','park@co.kr','1234');
-- email�� ������ id�� �ٸ��� ������ ������ �ȳ� (�����ϱ� �����)
-- �ڵ� COMMIT���� ����
-- sql�� COMMIT �� ����Ϸ��� ROLLBACK but �ڹٴ� commit �ϸ� ��...? (���� �ι�° ���� 1�ð� 25����..?)

desc member2;

--constraint member2_et_pk primary key(id,email)

insert into member2 values('aaa','hong','','1234');
select * from member2;
delete from member2 where id='aaa'; -- �̻�����(�ߺ� �ȵǴ� ������ �ʿ�)
drop table member2;




