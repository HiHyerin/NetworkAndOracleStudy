-- DML
/*
    DQL : ���Ǿ��, SELECT (������ �˻�)
    
          SELECT �÷���, (SELECT~) -------> �÷����(��Į�� ��������)
          FROM talbe�� �Ǵ� (select~) -------> ���̺� ���(�ζ��κ�)
          WHERE �÷��� ������ (SELECT~) ------> ��������(����, ����)
        => ROW ����
          
    DDL : ���Ǿ��(table , view, index..)
          CREATE - ���̺� ����
            CREATE TABLE table_name
            CREATE VIEW view_name
            CREATE INDEX index_name
            CREATE SEQUENCE seq_name
            CREATE FUNCTION func_name
            CREATE PROCEDURE pro_name
            CREATE TRIGGER trigger_name
          ALTER : ����
            ADD : �߰�
            MODIFY : ����
            DROP COLUMN : �÷� ����
            RENAME COLUMN : �̸�����
          DROP : ���� ����
          TRUNCATE : ������ �߶󳻱�(���̺� ���´� �״��, �����͸� ����)
          RENAME : ���̺� �̸� ����
        => �÷� ����
        
    DML : ������ ���� (ROW����)
        ������ �߰� : INSERT
        ������ ���� : UPDATE
        ������ ���� : DELETE
*/

-- SELECT * FROM emp;
/*
    ���伳�� ===> ������ , ���� ����
    ------       -------   --------
        ������ ����   ��������     �޸� ũ��
        
        
        �Ǹ���ǥ
        -----------------------------------------------------------
        �÷���         ��ǥ��ȣ    �Ǹ�����    ����     �Ѿ�
        -----------------------------------------------------------
        ��������        pk          nn         NN       CK
                                DEFAULT 
        -----------------------------------------------------------
        �������̺�
        -----------------------------------------------------------
        ���� �÷�
        -----------------------------------------------------------
        üũ�Ӽ�                                         >0
        -----------------------------------------------------------
        ��������    VARCHAR2      DATE       VARCHAR2   NUMBER  => NUMBER(8,2)
        -----------------------------------------------------------
        ������ ũ��    13                       34
        -----------------------------------------------------------
        */
    -- ���̺� �����
        CREATE TABLE �Ǹ���ǥ(
         ��ǥ��ȣ  VARCHAR(13),  
         �Ǹ�����  DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL,
         ����   VARCHAR(34) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL,
         �Ѿ�     NUMBER,
         constraint �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
         CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0)
        );
        
        -- DEFAULT �߰�
        ALTER TABLE �Ǹ���ǥ MODIFY �Ǹ����� DEFAULT SYSDATE;
        
        
      /*  
        
        ��ǰ
        -----------------------------------------------------------
        �÷���         ��ǰ��ȣ    ��ǰ��     ��ǰ�ܰ�    
        -----------------------------------------------------------
        ��������        pk          nn         CK       
                                
        -----------------------------------------------------------
        �������̺�
        -----------------------------------------------------------
        ���� �÷�
        -----------------------------------------------------------
        üũ�Ӽ�                                 >0
        -----------------------------------------------------------
        ��������    VARCHAR2      VARCHAR2     NUMBER  => NUMBER(8,2)
        -----------------------------------------------------------
        ������ ũ��    13            100          
        -----------------------------------------------------------
        */
        CREATE TABLE ��ǰ(
            ��ǰ��ȣ  VARCHAR2(12),
            ��ǰ��     VARCHAR(100) CONSTRAINT ��ǰ_��ǰ��_nn NOT NULL,
            ��ǰ�ܰ�    NUMBER,
            CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ),
            CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ�>0)
        );
        
        
        /*
        ��ǥ��
        -----------------------------------------------------------
        �÷���         ��ǥ��ȣ    ��ǰ��ȣ    ����      �ܰ�      �ݾ�
        -----------------------------------------------------------
        ��������        pk/FK        FK       NN        NN      CK       
                                
        -----------------------------------------------------------
        �������̺�       �Ǹ���ǥ    ��ǰ
        -----------------------------------------------------------
        ���� �÷�        ��ǥ��ȣ   ��ǰ��ȣ         
        -----------------------------------------------------------
        üũ�Ӽ�                                                >0
        -----------------------------------------------------------
        ��������       VARCHAR2   VARCHAR2     NUMBER  => NUMBER(8,2)
        -----------------------------------------------------------
        ������ ũ��    13            100          
        -----------------------------------------------------------

*/

    CREATE TABLE ��ǥ��(
        ��ǥ��ȣ VARCHAR2(13),
        ��ǰ��ȣ  VARCHAR2(100),
        ����      NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL,
        �ܰ�      NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL,
        �ݾ�      NUMBER,
        CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
        CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0),
        CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
        REFERENCES �Ǹ���ǥ(��ǥ��ȣ),
        CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
        REFERENCES ��ǰ(��ǰ��ȣ)
    );
    
    --------------------------------------------------------------------
    --------------------------------------------------------------------
    
    -- ���̺� �������� Ȯ��
    SELECT * FROM user_constraints
    WHERE table_name='��ǥ��';
    
     @c:\javaDev\db\slocation
    commit;
    
    SELECT * FROM user_constraints
    WHERE table_name='SEOUL_LOCATION';
    SELECT * FROM seoul_location;
    
    -- ���� ù��° ���� �� 30��...?
    -- ���̺�_�÷�_����������
    -- ��� ���̺���� �빮�ڷ� ���� �Ǿ��ִ�.
    
   
/*
        CONSTRAINT TYPE
        C : CHECK, NOT NULL
        P : PRIMARY
        R : FOREIGN KEY
        U : UNIQUE
*/
/* 
     CREATE TABLE �Ǹ���ǥ(
     ��ǥ��ȣ  VARCHAR(13),  
     �Ǹ�����  DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL,
     ����   VARCHAR(34) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL,
     �Ѿ�     NUMBER,
     constraint �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
     CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0)
    );
        
        CREATE TABLE ��ǰ(
        ��ǰ��ȣ  VARCHAR2(12),
        ��ǰ��     VARCHAR(100) CONSTRAINT ��ǰ_��ǰ��_nn NOT NULL,
        ��ǰ�ܰ�    NUMBER,
        CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ),
        CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ�>0)
    );
        
    CREATE TABLE ��ǥ��(
    ��ǥ��ȣ VARCHAR2(13),
    ��ǰ��ȣ  VARCHAR2(100),
    ����      NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL,
    �ܰ�      NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL,
    �ݾ�      NUMBER,
    CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
    CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0),
    CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
    REFERENCES �Ǹ���ǥ(��ǥ��ȣ),
    CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
    REFERENCES ��ǰ(��ǰ��ȣ)
);
        
        -- DEFAULT �߰�
        ALTER TABLE �Ǹ���ǥ MODIFY �Ǹ����� DEFAULT SYSDATE; 
        
    -- �������� ����
    NOT NULL => MODIFY
    ALTER TABLE table_name MODIFY column_name CONSTRAINT cons_name NOT NULL
    
    CHECK, FROEIGN, PRIMARY, UNIQUE => ADD
    ADD TABLE table_name ADD CONSTRAINT cons_name CHECK~
*/

-- ���̺� ������ ������ ���̺����(foreign key �ִ°ͺ��� ����) / ���� ������� ����ϰ� ���� �� on delete cascade
drop table �Ǹ���ǥ;
drop table ��ǰ;
drop table ��ǥ��;

        CREATE TABLE �Ǹ���ǥ(
         ��ǥ��ȣ  VARCHAR(13),  -- PK
         �Ǹ�����  DATE , -- NN
         ����   VARCHAR(34), -- NN
         �Ѿ�     NUMBER -- CHECK
    );
        -- PRIMARY KEY ����
        ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ);
        -- NOT NULL ����
        ALTER TABLE �Ǹ���ǥ MODIFY �Ǹ����� DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL;
        --
        ALTER TABLE �Ǹ���ǥ MODIFY ���� VARCHAR2(34) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL;
        ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0);
        --------------------------------------------------------------------
        
        CREATE TABLE ��ǰ(
        ��ǰ��ȣ  VARCHAR2(12),
        ��ǰ��     VARCHAR(100) ,
        ��ǰ�ܰ�    NUMBER
    );
        --
        ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ);
        ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ��_uk UNIQUE(��ǰ��);
        ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ�>0);
        -- �� CHECK(dname IN('���ߺ�','������','�ѹ���','�����','��ȹ��')) -> 5�� �� �ϳ� üũ /(������ ������ �� IN ���)
        -- ex) CHECK(isLogin IN('y','n'))
        
        ------------------------------------------------------------------------
        
        
        
        CREATE TABLE ��ǥ��(
        ��ǥ��ȣ VARCHAR2(13), -- PK, FK
        ��ǰ��ȣ  VARCHAR2(100), -- FK
        ����      NUMBER, --CONSTRAINT ��ǥ��_����_nn NOT NULL, -- NN
        �ܰ�      NUMBER, --CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL, --NN
        �ݾ�      NUMBER -- CK
--        CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
--        CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0),
--        CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
--        REFERENCES �Ǹ���ǥ(��ǥ��ȣ) on delete cascade,-- ����Ű ������� ���� ������� ���� ����(��� ���ϴ°� ����)
--        CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
--        REFERENCES ��ǰ(��ǰ��ȣ) on delete cascade
    );
    
        ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ);
        ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
        REFERENCES �Ǹ���ǥ(��ǥ��ȣ); -- REFERENCES ���̺��(�÷���)    
        
        ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
        REFERENCES ��ǰ(��ǰ��ȣ); -- REFERENCES ���̺��(�÷���)
        
        ALTER TABLE ��ǥ�� MODIFY ���� NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL;
        ALTER TABLE ��ǥ�� MODIFY �ܰ� NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL;
        ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0);
        
        -- �޸� ����
        DROP TABLE ��ǥ��;
        DROP TABLE �Ǹ���ǥ;
        DROP TABLE ��ǰ;
        
/* 
    �Խù� ��ȣ                     ���(�Խù� ��ȣ ����)
    1                                1
    2                                1
    3                                1
    4                                2
    5                                3
                                     4
                                     6 -> ����(�������� ��� 1~5 ����)
    
*/

/*
    ALTER : ���̺� ����
        �÷� �߰�
        �÷� ����
        �÷� ����
        �÷� �̸�����
        �÷� �������� ����
        
        �����͸� ���� : TRUNCATE
            ����
                TRUNCATE TABLE table_name; => ���̺� ������ �����ִ�
            
        ���̺� ���� : DROP
            ����
                DROP TABLE table_name; => ���̺� �������� �������
                
        ���̺� �̸����� : RENAME
            ����
                RENAME old+name TO new_name
*/
drop table student; 
CREATE TABLE student(
    hakbun NUMBER,
    name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
    CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun)
);

-- �÷��߰�
ALTER table student add kor number default 0;
ALTER table student add eng number default 0;
ALTER table student add math number default 0;
ALTER table student add avg number not null;

-- �÷� ����
alter table student modify avg number(5,2);
alter table student modify kor number(3);
alter table student modify eng number(3);
alter table student modify math number(3);


-- �÷� ����
ALTER TABLE student DROP COLUMN avg;

-- �÷��� ����
ALTER TABLE student RENAME COLUMN hakbun TO hak;
DESC student;