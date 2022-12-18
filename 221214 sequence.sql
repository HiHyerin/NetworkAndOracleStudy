CREATE SEQUENCE test_no_seq
    start with 1
    increment by 1
    NOCACHE
    nocycle;
    
SELECT test_no_seq.nextval from dual;
select test_no_seq.currval from dual;

-- seq ����
drop sequence test_no_seq;

--========================================================
/*
    ����ȭ�� ������ : ���α׷����� �ʿ��� �����͸� ���� => RDBMS(����Ŭ, MYSQL...) => ���� ���� �ִ� ��
    ------------ > �����͸� ���� / ��������
    ������ȭ : �ʿ���� �����͸� ����, ������ �Ǿ� �ִ�.(HTML, XML,JSON)
    ������ȭ : �ʿ��� ������, �ʿ���� ������ ���� �ִ�. ���е� ����(TWITER, FACEBOOK..)
    ------- ����ȭ(������) : ��迡 �н�(AI)
*/

create table board(
    no number,
    name varchar2(34) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(4000) CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
    regdate DATE default sysdate,
    hit NUMBER default 0,
    CONSTRAINT board_no_pk PRIMARY KEY(no)
);

-- no ó��(�ߺ� ���� ������) => �ڵ����� ó��
-- �ߺ��Ǹ� �ȵǴ� �͵� : ���̺��, �÷���, �� �̸�, ��������, �������Ǹ�
create SEQUENCE board_no_seq
    start with 1
    increment by 1
    nocycle
    nocache;
    
insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'ȫ�浿','������','�����������','1234');

commit;

-- Ȯ��
select * from board;

-- ������ ����
delete from board where no=3; -- ��ȣ�� �մ������ �ʴ´�.

--����2)
create table notice(
    no NUMBER,
    name varchar2(34) constraint notice_name_nn NOT NULL,
    msg clob constraint notice_msg_nn NOT NULL,
    constraint notice_no_pk PRIMARY KEY(no)
);

create sequence notice_no_seq
    start with 1
    increment by 1
    nocycle
    nocache;
    
insert into notice values(notice_no_seq.nextval,'ȫ�浿','��������');
insert into notice values(notice_no_seq.nextval,'ȫ�浿','��������');
insert into notice values(notice_no_seq.nextval,'ȫ�浿','��������');
insert into notice values(notice_no_seq.nextval,'ȫ�浿','��������');

commit;
select * from notice;