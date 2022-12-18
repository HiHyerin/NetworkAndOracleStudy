-- ���̺� (���Ϲ���)
-- liked, jjim => alter�̿��غ��� (alter �� : ��ٱ���, ����)
create table genie_music(
    mno number , --pk
    cno number(2) constraint gm_cno_nn NOT NULL, -- nn
    title varchar2(200) constraint gm_title_nn NOT NULL, -- nn
    singer varchar2(100)constraint gm_singer_nn NOT NULL,-- nn
    album varchar(200)constraint gm_album_nn NOT NULL,-- nn
    poster varchar2(260) constraint gm_poster_nn NOT NULL,
    state varchar(30), --ck
    idcrement number(3)constraint gm_id_nn NOT NULL,-- nn
    key varchar2(30),
    hit number default 0, -- default 0
    constraint gm_mno_pk Primary key(mno),
    constraint gm_state_ck CHECK(state IN('����','���','�ϰ�'))
);

-- alter�� �̿��ؼ� ���̺� ����
/*
alter : ����, ����, �߰� (�÷�, ��������, �߰��� �����ϴ�)
�÷�����
1) �߰�
    ALTER TABLE table_name ADD �÷��� �������� [��������]
2) ����
    ALTER TABLE table_name DROP COLUMN �÷���
3) ����
    ALTER TABLE table_name MODIFY �÷��� �������� [��������]

��������
1) �߰�
2) ����
3) ����
*/

-- �ڵ�ȭ ó��(Ʈ����)
ALTER TABLE genie_music ADD liked NUMBER;
ALTER table genie_music ADD jjim NUMBER;

DESC genie_music;

alter table genie_music modify liked default 0 constraint gm_liked_nn NOT NULL;
alter table genie_music modify jjim default 0 constraint gm_jjim_nn NOT NULL;

/*
    ������Ʈ => ����������
                => ũ��
                => ��������
---------------------------------------�ΰ��� �߰� : ALTER, �������� : ALTER
*/


-- ���̺�(��й���)
CREATE TABLE melon_music(
mno number,
cno number(2) constraint mm_cno_nn NOT NULL, -- �帣��ȣ
title varchar2(200) constraint mm_title_nn NOT NULL,
singer varchar2(200) constraint mm_singer_nn NOT NULL,
album varchar2(200) constraint mm_album_nn NOT NULL,
poster varchar2(260) constraint mm_poster_nn NOT NULL,
state varchar2(30),
idcrement number(3) constraint mm_id_nn NOT NULL, -- ������
key varchar(30),
hit number default 0,
liked number default 0 constraint mm_liked_nn NOT NULL,
jjim number default 0 constraint mm_jjim_nn NOT NULL,
constraint mm_mno_pk PRIMARY KEY(mno),
constraint mm_state_ck CHECK(state in('����','���','�϶�'))
);

-- ����
    DROP TABLE genie_music;
    drop table melon_music;
    rollback;
    desc genie_music;
    
    
-- �̸�����
    RENAME genie_music TO genie;
    desc genie;
    RENAME genie to genie_music;

-- �������߶󳻱� : ���̺� ����, �����͸� ���� : rollback �Ұ���
-- truncate table table_name
truncate table genie_music;

    
-- ���̺� ���� => ������ ���� => dml(select, insert, update, delete)
-- ���̺� ���� ���� Ȯ��
/*
    ����
        1) table : user_talbes
        2) constraint : user_constraints
        3) view : user_views
        *** ��� ��Ī�� �빮�ڷ� ����Ǿ� �ִ�.
*/


select owner, constraint_name, constraint_type,status
from user_constraints
where table_name='GENIE_MUSIC';

select owner, constraint_name, table_name, column_name
from user_cons_columns
where table_name='GENIE_MUSIC';
---------------------------------------------------------------------���� �����
/*
        TYPE
        C  : NOT NULL, CHECK
        P : PRIMARY KEY : ���̺� �� �Ѱ��� ���� ����
        R : FOREIGN KEY : primary key, unique �϶��� ��� ����
        U :UNIQUE
*/
-- primary key : ���̺� �� �Ѱ��� ���� ����



-- FOREIGN KEY ���� (���� ���̺��� �÷��� primary key�̰ų�, unique�϶��� ����)
CREATE TABLE test1(
    no number,
    id varchar(20) constraint test1_id_nn NOT NULL,
    name varchar2(34) constraint test1_name_nn  not null,
    sex varchar(20),
    constraint test1_no_pk PRIMARY KEY(no),
    constraint test1_sex_ck CHECK(sex IN('����','����')),
    constraint test_id_uk unique(id)
    
    -- id�� ����Ű�� �߰��ϰ� ���� �� unique�� ���������� �ɰų� �ؿ�ó�� �����̸Ӹ� Ű�� �� �� ���� ��ġ�� ���� ����
    -- constraint test1_no_pk PRIMARY KEY(no,id)
);

create table test2(
    no number,
    tno number,
    id varchar(20),
    address varchar2(100) constraint test2_addr_nn NOT NULL,
    tel varchar2(20) CONSTRAINT test2_tel_nn  NOT NULL,
    CONSTRAINT test2_no_pk PRIMARY KEY(no),
    constraint test2_tno_fk FOREIGN KEY(tno)
    references test1(no) ON DELETE CASCADE,
    constraint test2_id_fk foreign key(id)
    references test1(id)
);

DROP TABLE test2;
DROP TABLE test1;

-- insert
--insert into test1 values(1,'ȫ�浿','����');
--insert into test1 values(2,'��û��','����');
--commit;
--
--insert into test2 values(1,1,'������ Ⱦ����','010-2222-2222');
--insert into test2 values(2,2,'�λ걤����','010-2222-1111');
--commit;

select * from test1;
select * from test2;

delete from test2
where no=1;

delete from test1
where no=1; -------------- test2�� test1�� �����ϰ� �ֱ� ������ test2�� ���� �����ؾ� 1�� ������ �� �ִ�.
                                -- TEST2 ���� FROEIGN�� ON DELETE CASCADE �ɼ��� �־��ָ� ���� ��� ���� ���� ����
                                -- EX) constraint test2_tno_fk FOREIGN KEY(tno)
                                --      references test1(no) ON DELETE CASCADE
    






