/*
    ����) 2��
        ���̺��_2
        CREATE TABLE table_name(
            �÷��� �������� [��������] -- not null, default,
            �÷��� �������� [��������],
            �÷��� �������� [��������],
            �÷��� �������� [��������],
            [��������] -- pk, fk, ck, uk
        );
*/

-- ȸ������ ���̺�
/*
create table project_member( 
    id varchar2(20),
    pwd varchar2(10) constraint pm_pwd_nn NOT NULL, 
    name varchar2(34) constraint pm_name_nn NOT NULL,
    sex varchar2(6),
    birthday varchar2(15) constraint pm_day_nn NOT NULL,
    email varchar2(50),
    post varchar2(7) constraint pm_post_nn NOT NULL,
    addr1 varchar2(200) constraint pm_addr1_nn NOT NULL,
    addr2 varchar2(200),
    phone varchar2(20) constraint pm_phone_nn NOT NULL,
    content clob,
    admin char(1),
    rgdate date default sysdate,
    constraint pm_id_pk primary key(id),
    constraint pm_sex_ck check(sex in('����','����')),
    constraint pm_email_uk unique(email),
    constraint pm_phone_uk unique(phone),
    constraint pm_admin_ck check(admin in('y','n'))
);
*/

-- �Խ��� / ���
create table project_board(
    bno number ,
    name varchar2(34) constraint pb_name_nn NOT NULL,
    subject varchar2(4000) constraint pb_sub_nn not null,
    content clob constraint pb_cont_nn not null,
    pwd varchar2(10) constraint pb_pwd_nn not null,
    regdate date default sysdate,
    hit number default 0,
    constraint pb_bno_pk primary key(bno)
);

create sequence pb_bno_seq -- �ڵ�������ȣ
    start with 1
    increment by 1
    nocache
    nocycle;

create table project_reply(
    rno number,
    bno number,
    id varchar2(20),
    name varchar2(34) constraint pr_name_nn not null,
    msg  clob constraint pr_msg_nn not null,
    regdate date default sysdate,
    group_id number constraint pr_gi_nn not null,
    group_step number default 0,
    group_tab number default 0,
    root number default 0,
    depth number default 0,
    constraint pr_rno_pk primary key(rno),
    constraint pr_bno_fk foreign key(bno)
    references project_board(bno),
    constraint pr_id_fk foreign key(id)
    references project_member(id) 

);

create sequence pr_rno_seq
    start with 1
    increment by 1
    nocache
    nocycle;

-- �ڷ����

-- <���� ī�װ�>
CREATE TABLE project_category(
    cno number,
    title varchar2(100) constraint pc_title_nn NOT NULL,
    subject varchar2(200) constraint pc_subject_nn NOT NULL,
    poster varchar2(300) constraint pc_poster_nn NOT NULL,
    link varchar2(200) constraint pc_link_nn NOT NULL,
    CONSTRAINT pc_cno_pk PRIMARY KEY(cno)
);
CREATE SEQUENCE pc_cno_seq
    start with 1
    increment by 1
    nocache
    nocycle;



/*
    ���� => ī�װ��� �ִ� ����
                �˻��� (������ ����)
    
    * <���� ���̺�(��ġ��ŷ)> -- ������ �̹����� erd�� �������� ���̺��� �ϳ���
        ���� ��ȣ
        ī�װ���ȣ
        ������
        ����
        �ּ�
        ��ȭ
        �������S
        ���ݴ�
        ����
        �����ð�
        ��Ƚ��
        ���ƿ� Ƚ��
        �湮Ƚ��
*/

CREATE TABLE project_food(
    fno number,
    cno number,
    poster varchar2(1000) constraint pf_poster_nn NOT NULL,
    name varchar2(100) constraint pf_name_nn NOT NULL,
    score number(2,1) constraint pf_number_nn NOT NULL,
    address varchar2(250) constraint pf_address_nn NOT NULL,
    tel varchar2(20) constraint pf_tel_nn NOT NULL,
    type varchar2(100) constraint pf_type_nn NOT NULL,
    price varchar2(20),
    parking varchar2(20),
    time varchar2(20),
    menu varchar2(500),
    jjim_count number default 0,
    like_count number default 0,
    hit number default 0,
    constraint pf_fno_pk primary key(fno),
    constraint pf_cno_fk foreign key(cno)
    references project_category(cno)
);

CREATE SEQUENCE pf_fno_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
    
    -- ���� ���� ���� ����(������� �˻���)
    CREATE TABLE project_location_food(
    fno number,
    cno number,
    poster varchar2(1000) constraint plf_poster_nn NOT NULL,
    name varchar2(100) constraint plf_name_nn NOT NULL,
    score number(2,1) constraint plf_number_nn NOT NULL,
    address varchar2(250) constraint plf_address_nn NOT NULL,
    tel varchar2(20) constraint plf_tel_nn NOT NULL,
    type varchar2(100) constraint plf_type_nn NOT NULL,
    price varchar2(20),
    parking varchar2(20),
    time varchar2(20),
    menu varchar2(500),
    jjim_count number default 0,
    like_count number default 0,
    hit number default 0,
    constraint plf_fno_pk primary key(fno)
);

create sequence plf_fno_seq
    start with 1
    increment by 1
    nocache
    nocycle;
    
-- �˻� �ڵ��ϼ���( jquery auto~~)
create table project_keyword(
    kno number,
    id varchar2(20),
    keyword varchar2(100) constraint pk_keyword_nn NOT NULL,
    constraint pk_kno_pk primary key(kno),
    constraint pk_id_fk foreign key(id)
    references project_member(id)
);
create sequence pk_kno_seq
    start with 1
    increment by 1
    nocycle
    nocache;
    
    select * from tab;
    -- [������, �����ǻ�, �����ǻ�ǰ (��������)]
-- ������
    CREATE TABLE project_recipe(
        rno NUMBER,
        title VARCHAR2(500) CONSTRAINT pro_title_nn NOT NULL,
        poster VARCHAR2(260) CONSTRAINT pro_poster_nn NOT NULL,
        chef VARCHAR2(100) CONSTRAINT pro_chef_nn NOT NULL,
        hit NUMBER DEFAULT 0,
        jjim_count NUMBER DEFAULT 0,
        like_count NUMBER DEFAULT 0, -- like�� ���� �Լ��� �ν�
        CONSTRAINT pro_rno_pk PRIMARY KEY(rno)
    );
    
-- ������ ��
    CREATE TABLE project_recipe_detail(
        rno NUMBER,
        title VARCHAR2(100) CONSTRAINT prd_title_nn NOT NULL,
        poster VARCHAR2(260) CONSTRAINT prd_poster_nn NOT NULL,
        content VARCHAR2(1000) CONSTRAINT prd_content_nn NOT NULL,
        chef_name VARCHAR2(100) CONSTRAINT prd_cf_nn NOT NULL,
        chef_poster VARCHAR2(260) CONSTRAINT prd_cp_nn NOT NULL,
        info1 VARCHAR2(20) CONSTRAINT prd_info1_nn NOT NULL,
        info2 VARCHAR2(20) CONSTRAINT prd_info2_nn NOT NULL,
        info3 VARCHAR2(20) CONSTRAINT prd_info3_nn NOT NULL,
        food_data CLOB CONSTRAINT prd_fd_nn NOT NULL,
        food_make CLOB CONSTRAINT prd_fm_nn NOT NULL,
        chef_email VARCHAR2(100) CONSTRAINT prd_ce_nn NOT NULL,
        hashtag CLOB,
        CONSTRAINT prd_rno_fk FOREIGN KEY(rno)
        REFERENCES project_recipe(rno)
    );
    
-- ���� , ������ ���� => �˻�(ajax)
create table project_recipe_chef(
    cno NUMBER,
    chef_name varchar2(100) constraint prc_cn_nn not null,
    mem_cont1 number default 0,
    mem_cont2 number default 0,
    mem_cont7 number default 0,
    mem_cont3 number default 0,
    chef_poster varchar2(260) constraint prc_cp_nn not null,
    constraint prc_cno_pk primary key(cno)
);

-- ��ǰī�װ� ��ü, ����Ʈ, Ư��, �Ż�ǰ
    create table project_goods_category(
        cno number,
        cate_name varchar2(30) constraint pgc_name_nn not null,
        constraint pgc_cno_pk primary key(cno)
    );

-- ��ǰ
    CREATE TABLE project_recipe_goods(
        gno NUMBER,
        cno number,
        goods_name varchar2(4000) constraint prg_gn_nn not null,
        goods_content varchar2(4000) constraint prg_gc_nn not null,
        goods_price NUMBER constraint prg_gp_nn not null,
        goods_percent number constraint prg_gp2_nn not null,
        first_buy_price number constraint prg_fb_nn not null,
        send varchar2(30) constraint prg_send_nn not null,
        account number constraint prg_acc_nn not null,
        jjim_count number default 0,
        like_count number default 0, 
        hit number default 0,
        goods_poster varchar2(260) constraint prg_gpo_nn not null,
        constraint prg_gno_pk primary key(gno),
        constraint prg_cno_fk foreign key(cno)
        references project_goods_category(cno)     
    );
    
    -- ��ǰ ����(����)
    create table project_goods_buy(
    bno number,
    gno number,
    id varchar2(20),
    account number,
    total_price number,
    buy_ok char(1),
    constraint pgb_bno_pk primary key(bno),
    constraint pgb_gno_fk foreign key(gno)
    references project_recipe_goods(gno),
    constraint pgb_account_ck check(account>0),
    constraint pgb_tp_ck check(total_price>0),
    constraint pgb_bo_ck check(buy_ok in('y','n'))
     );
    alter table project_goods_buy add constraint pgb_id_fk foreign key(id)
    references project_member(id);
    
    -- ��ٱ��ϴ� db�� �ƴ� => session���� ���� cookie�� ó���� �� (�ӽ�����)
    -- �ֽ� �湮 -> cookie
    -- ���������� -> ������ db�� �о� �´� (���, ���ϱ�, ȸ������)
    -- ������������ -> ������ ��ϵ� �����͸� ����
    
    -- ���￩��
    create table project_seoul_category(
        cno number,
        cate_name varchar2(20) constraint psc_cn_nn not null,
        constraint psc_cno_pk primary key(cno)
    );
    
    create table project_seoul(
        sno number,
        cno number,
        name varchar2(100) constraint ps_name_nn not null,
        poster varchar2(260) constraint ps_poster_nn not null,
        content clob,
        address varchar2(300) constraint ps_addr_nn not null,
        jjim_count number default 0,
        like_count number default 0,
        hit number default 0,
        constraint ps_sno_pk primary key(sno),
        constraint ps_cno_fk foreign key(cno)
        references project_seoul_category(cno)
    );
    select * from tab;
    
    select * from tab;
    
-- ���߿�, ��, ���(���ν���)
create table project_all_jjim(
    jno NUMBER,
    cate_no number,
    no number,
    id varchar2(20),
    constraint paj_jno_pk primary key(jno),
    constraint paj_id_fk foreign key(id)
    references project_member(id)
);

create table project_all_like(
     lno NUMBER,
    cate_no number,
    no number,
    id varchar2(20),
    constraint pal_lno_pk primary key(lno),
    constraint pal_id_fk foreign key(id)
    references project_member(id)
);

-- ���ν��� (���̺��� ����)
create table project_all_reply(
    rno number,
    cate_no number,
    no number,
    id varchar2(20) ,
    name varchar2(34) constraint par_name_nn not null,
    msg clob constraint par_msg_nn not null,
    regdate date default sysdate,
    constraint par_rno_pk primary key(rno),
    constraint par_id_fk foreign key(id)
    references project_member(id)
);
/*
    ** ����Ʈ �ʼ� 
        1. ȸ�� : ���̵� �ߺ�üũ, �����ȣ �˻�
        2. �Խ��� : curd
        3. �������� : Ư�� user
*/
-- ��������
create table project_notice(
    no number,
    type number,
    name varchar2(34) constraint pro_no_name_nn not null,
    subject varchar2(1000) constraint pro_no_subject_nn not null,
    content clob constraint pro_no_content_nn not null,
    regdate date default sysdate,
    hit number default 0,
    constraint pro_no_pk primary key(no)
);

select * from tab;


-- [���� , ����������, ����ð�����]
--���� ����
create table project_reserve_time(
    tno number,
    time varchar2(20) constraint prt_time_nn not null,
    constraint prt_tno_pk primary key(tno)
);

create table project_reserve_date(
    dno number,
    rdate number constraint prd_rdate_nn not null,
    time varchar2(20) constraint prd_time_nn not null,
    constraint prd_dno_pk primary key(dno)
);

create table project_reserve(
    rno number,
    fno number,
    id varchar2(20) ,
    rdate varchar2(20) constraint pro_res_rdate_nn not null,
    rtime varchar2(20) constraint pro_res_rtime_nn not null,
    inwon number,
    reserve_no varchar2(20) constraint pro_res_ro_nn not null,
    ok char(1),
    regdate date default sysdate,
    constraint pro_res_rno_pk primary key(rno),
    constraint pro_res_fno_fk foreign key(fno)
    references project_food(fno),
    constraint pro_res_id_fk foreign key(id)
    references project_member(id),
    constraint pro_res_inwon_ck check(inwon>0)
);


-- [������ϱ�, �ڷ��]
-- ������ϱ�(������ ���, ����ڸ��)
create table project_replyBoard(
    no number,
    name varchar2(34) CONSTRAINT pro_re_name_nn not null,
    subject varchar2(1000) CONSTRAINT pro_re_sub_nn not null,
    content clob CONSTRAINT pro_re_cont_nn not null,
    pwd varchar(10) CONSTRAINT pro_re_pwd_nn not null,
    regdate date default sysdate,
    hit number default 0,
    group_id number default 0,
    group_step number default 0,
    group_tab number default 0,
    constraint pro_re_no_pk primary key(no)
);
-- alter table project_replyBoard rename column group_step to group_step1;(�����ϰ� ���� ��)


-- �ڷ��(���ε� �ٿ�ε�)
create table project_dataBoard(
    no number,
    name varchar2(34) constraint pro_data_name_nn not null,
    subject varchar2(1000) constraint pro_data_sub_nn not null,
    content clob constraint pro_data_cont_nn not null,
    pwd varchar(10) constraint pro_data_pwd_nn not null,
    regdate date default sysdate,
    hit number default 0,
    filename varchar2(260),
    filesize number default 0,
    constraint pro_data_no_pk primary key(no)
);
commit;