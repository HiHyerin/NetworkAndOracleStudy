create table test_1(
    name varchar2(20),
    subject varchar2(20)
);

insert into test_1 values('ȫ�浿','����');
insert into test_1 values('ȫ�浿','����');
insert into test_1 values('��û��','�̼�');
insert into test_1 values('�ڹ���','����');
insert into test_1 values('������','����');
insert into test_1 values('�̼���','����');

select * from test_1;
delete from test_1
where name='ȫ�浿';

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100,'�ڹ�',25000);
insert into summer values(200,'����Ŭ',30000);
insert into summer values(300,'JSP',35000);
insert into summer values(400,'HTML/CSS',15000);
insert into summer values(500,'������',20000);
COMMIT;

-- 1. ������ ������ ���� ���
SELECT sid,class from summer;

-- 2. �ڹ��� ������
select price from summer
where class='�ڹ�';

-- ����
delete from summer
where sid=100;

select * from summer;

-- �����͸� �߰��� �� ���� �߻�(���� �� �߰��Ѵٴ°��� ���⼭ ���� ��� �� ȸ�������� �ٽ��ؾ� �Ѵٴ� �ǹ�-���ŷο�)
insert into summer values(100,'�ڹ�',25000);
commit;


-- ���� : ���� ���� ������ �ִ� ��� -> ������ �ʴ� �����Ͱ� ����
-- ���� : ���� ���� ������ �ִ� ��� -> ������ �ʴ� �����Ͱ� ����

/*
    1 ����ȭ
    2 ����ȭ
    3 ����ȭ
*/

create table member_event(
    id varchar2(10),
    event varchar2(20),
    aaa char(1),
    name varchar2(34),
    primary key(id,event)
);  

insert into member_event values('hong','aaa','y','ȫ�浿1');
insert into member_event values('hong','bbb','y','ȫ�浿2');
insert into member_event values('shim','aaa','y','ȫ�浿3');
insert into member_event values('ki','aaa','y','ȫ�浿4');
