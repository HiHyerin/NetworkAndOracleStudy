-- ���� CURD(�Խ���)
CREATE TABLE freeboard(
    no NUMBER, -- �ڵ�����
    name VARCHAR2(34) constraint fb_name_nn NOT NULL,
    subject VARCHAR2(4000) CONSTRAINT fb_subject_nn NOT NULL,
    content CLOB CONSTRAINT fb_content_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT fb_pwd_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE, -- ����Ʈ ���̸� ���� ��¥ �ְڴ�
    hit NUMBER DEFAULT 0, -- ����Ʈ ���̸� 0�� �־��
    CONSTRAINT fb_no_pk PRIMARY KEY(no)
);

desc freeboard;

-- ������ �߰� (insert)
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(1,'ȫ�浿','CURD����',
        'CURD������..','1234');
SELECT * FROM freeboard;
commit;

INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(2,'ȫ�浿','CURD����',
        'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(3,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(4,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(5,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(6,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(7,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(8,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(9,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(10,'ȫ�浿','CURD����',
'CURD������..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(11,'ȫ�浿','CURD����',
'CURD������..','1234');
COMMIT;
SELECT * FROM freeboard;

