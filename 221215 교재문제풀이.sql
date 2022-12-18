desc book;

/* book
�̸�        ��?       ����           
--------- -------- ------------ 
BOOKID    NOT NULL NUMBER(2)    
BOOKNAME           VARCHAR2(40) 
PUBLISHER          VARCHAR2(40) 
PRICE              NUMBER(8) 
*/

-- [3-1] ��� ������ �̸��� ���� �˻�
select bookname, price from book;
--=> �ݵ�� �ڹٷ� ����ͺ���

-- [3-2] ��� ������ ������ȣ, �����̸�, ���ǻ�, ���� �˻�
select bookid,bookname,publisher,price from book; => ���� ���� ����
select * from book;

-- [3-3] ���� ���̺� �ִ� ��� ���ǻ縦 �˻� (�ߺ�����)
-- �ߺ� ���� : distinct
select distinct publisher from book;
/*
-- * �ɼ�
    1. �ߺ����� : distinct
    2. ���ڿ� ���� : ||
    3. ��Ī : �÷��� "��Ī"   |    �÷��� ��Ī    |    �÷��� as ��Ī
        ��> ��Į�� ��������, �Լ�, ������... 
    */


--[3-4] ������ 20,000�� �̸��� ���� �˻�
    /* ����Ŭ���� �����ϴ� ������
    NOT : ���������� => NOT IN, NOT LIKE, NOT BETWEEN
    NULL : NULL���� ��� ����ó���� �ȵȴ�. IS NULL, IS NOT NULL
    IN : OR�� �������϶� ó���ϴ� ������
    BETWEEN : >= AND <= ����, �Ⱓ , ������ ������
    LIKE : ���� ���ڿ� ã�� (�˻�)
        % : ���� ������ �𸣴� ���
        _ : ���� �Ѱ�
    */
SELECT * FROM book where price<20000;


--[3-5] ������ �����̻� �̸��� ������ ���� �˻�
select * from book
where price between 10000 and 20000;
-- = where price>=10000 and price<=20000;


--[3-6] ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�
select * from book
where publisher='�½�����' or publisher='���ѹ̵��';
-- = where publisher in('�½�����','���ѹ̵��');


--[3-7] '�౸�� ����'�� �Ⱓ�� ���ǻ� �˻�
select publisher from book
where bookname='�౸�� ����';


--[3-8] �����̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�
select bookname,publisher from book 
where bookname like '%�౸%';

select bookname,publisher from book 
where regexp_like(bookname,'�౸');


--[3-9] �����̸��� ���� �ι�° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻��Ͻÿ�
select bookname from book
where bookname like '_��%';


--[3-10] �౸�� ���� ���� �� ������ 20000�� �̻��� ������ �˻�
select * from book
where price>=20000 and bookname like '%�౸%';


--[3-11] ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.
select * from book
where publisher in('�½�����', '���ѹ̵��');


==[3-12] ������ �̸������� �˻��Ͻÿ�
select * from book order by bookname;
select * from book order by 1 desc, 2 asc;
                                 //------> ���� ���� �ִ� ��쿡�� ó��(ex) �亯�� �Խ���, ����
/* order by
    �ӵ� ����( index�� �ӵ� ����ȭ , index_asc(), index_desc())
    ����� �� �������� ���� �ȴ�
        (from - where groub by having select order by)
*/


--[3-13] ������ ���ݼ����� �˻��ϰ� ������ ������ �̸������� �˻��Ͻÿ�
select bookname, publisher, price
from book
order by price asc, bookname asc;


--[3-14] ������ ������ ������������ �˻�, ���� ������ ������ ���ǻ� ������������ ���
select bookname, publisher, price
from book
order by price desc, publisher asc;


--[3-15] ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ� 
desc orders;
select sum(saleprice) "���Ǹž�" from orders;
/* orders ���̺�
�̸�        ��?       ����        
--------- -------- --------- 
ORDERID   NOT NULL NUMBER(2) 
CUSTID             NUMBER(2) 
BOOKID             NUMBER(2) 
SALEPRICE          NUMBER(8) 
ORDERDATE          DATE 
*/

/*
-- �����Լ� : sum,avg,max,min,count
-- ������ �Լ� :  ���� : length(), substr(), instr(), rpad(), replace()
                ���� : mod(),ceil(), round(), trunc()
                ��¥ : sysdate, months_between()
                ��ȯ : to_char()
                        ��¥ => YYYY MM DD MI SS HH/HH24 DY
                        ���� => 999,999
                ��Ÿ : NVL() - null���� ��ü�ϴ� �Լ�
*/

--[3-16] 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž�
select sum(saleprice) from orders
where custid=2;

--[3-17] ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�
select sum(saleprice), avg(saleprice),min(saleprice),max(saleprice)
from orders;

--[3-18] ���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�
select count(*) �ǸŰǼ� from orders;

--[3-19] ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�
    -- group by => custid
select (select name from customer where custid=orders.custid),count(*) "�Ѽ���", sum(saleprice) "���Ǹž�"
from orders
group by custid;
    -- groub by�� �������� ���� �ȵ�

--[3-20] ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
--       �� �α� �̻� ������ ���� ���Ͻÿ�
select custid, count(*) "��������"
from orders
where saleprice>=8000
group by custid
having count(*)>=2;

--[3-21] ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�
select * from customer c, orders o
where c.custid=o.custid;

select * from customer c join rders o
on c.custid=o.custid;

select * from customer c natural join orders o; -- �÷����� ���Ƽ� natural join ��� ����(�÷����� �޶� �÷� ���� ������ ��)
select * from customer join orders using(custid); -- �÷����� ���Ƽ� join using ��� ����(�÷����� �޶� �÷� ���� ������ ��)

-- ==> �ڹٿ��� join�� ������ ����Ŭ������ �̿��Ѵ�.
desc orders;
desc customer;

/* orders
�̸�        ��?       ����        
--------- -------- --------- 
ORDERID   NOT NULL NUMBER(2) 
CUSTID             NUMBER(2) 
BOOKID             NUMBER(2) 
SALEPRICE          NUMBER(8) 
ORDERDATE          DATE 
*/

/* customer
	�̸�      ��?       ����           
------- -------- ------------ 
CUSTID  NOT NULL NUMBER(2)    
NAME             VARCHAR2(40) 
ADDRESS          VARCHAR2(50) 
PHONE            VARCHAR2(20) 
*/

--[3-22] ���� ���� �ֹ��� ���� �����͸� ������ ������ ���ÿ�
select * from customer c, orders o
where c.custid=o.custid
order by c.custid;


--[3-23] �� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
-- join ��ü => subquery (�÷� ��� : �ζ��κ�,  ���̺� ���: ��Į�󼭺�����)
select name, (select bookname from book where bookid=o.bookid) bookname,saleprice from customer c, orders o
where c.custid=o.custid;
---------------------------------------------------------------------
select empno,ename,hiredate,job,sal,dname,loc,grade
from emp 
join dept
on emp.deptno=dept.deptno
join salgrade
on sal between losal and hisal;

-- ����Ŭ ����
elect empno,ename,hiredate,job,sal,dname,loc,grade
from emp,dept,salgrade
jwhere emp.deptno=dept.deptno
and sal between losal and hisal;
------------------------------------------------------------------------

--[3-24] ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�
select name,sum(saleprice)
from customer c, orders o
where  c.custid=o.custid              --> ��������
group by c.name
order by c.name;                     --> ��������

--[���� 3-25] ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�. 
-- ��������
select name, bookname
from customer c, orders o, book b
where c.custid=o.custid
and o.bookid=b.bookid;

-- �Ƚ�����
select name,bookname
from customer c join orders o
on c.custid=o.custid
join book b
on o.bookid=b.bookid;

--[���� 3-26] ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
select name,bookname,price
from customer c, book b, orders o
where o.saleprice>=20000
and o.bookid=b.bookid
and c.custid=o.custid;


-- ansijoin
select name,bookname,price
from customer c join orders o
on c.custid = o.custid
join book b
on o.bookid=b.bookid
where price>=20000;             ---> and�� ���� join on�� �����̵Ǳ� ������ select�� ����Ǵ� where �� ����ؾ��Ѵ�.


--[���� 3-27] ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
select name, saleprice, (select bookname from book where bookid=o.bookid) bookname
from orders o, customer c
where c.custid=o.custid(+);                 --> outer join

select name, saleprice, (select bookname from book where bookid=o.bookid) bookname
from orders o right outer join customer c
on c.custid=o.custid;   

--[���� 3-28] ���� ��� ������ �̸��� ���̽ÿ�.
    -- ��������
select bookname
from book
where price= (select max(price) from book); --> ������ ��������


--[���� 3-29] ������ ������ �� �ִ� ���� �̸��� �˻��Ͻÿ�.
select name
from customer
where custid in (select custid from orders); --> �����Ͱ� �������� ������ in��� (������ ��������)





--[���� 3-30] �����ѹ̵����� ������ ������ ������ ���� �̸��� ���̽ÿ�. 221215 16:43

SELECT name, bookname
FROM customer
INNER JOIN orders ON customer.custid = orders.custid
INNER JOIN book ON orders.bookid = book.bookid
WHERE book.publisher = '���ѹ̵��';

select name from customer
where custid in(select custid from orders
                    where bookid in(select bookid from book 
                                            where publisher='���ѹ̵��'));



--[���� 3-31] ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�. 
select bookname, price from book where price>=(select avg(price) from book);

select bookname,price from book group by publisher
having price>=(select avg(price) from book);

select avg(price) from book;

--[���� 3-32] ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.  221215 17:10
select name from customer 
where custid not in (select custid from orders);

--[���� 3-33] �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
select name, address from customer
where custid in (select custid from orders);

--[���� 3-34] Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� �����ѹα� �λꡯ���� �����Ͻÿ�.
-- update
update customer set address='���ѹα� �λ�' 
where custid=5;

select * from customer;
rollback



/*
    dml : ������ ���۾��
        insert : �߰�
                ��ü������ �߰�
                    = insert into table_name VALUES(��...) => table�� �÷� ������ ���� ������ �ݵ�� ��ġ
                �ʿ��� ������ �߰� (default�� ���� �ִ°��)
                    = insert into table_name(�÷���,�÷���...) values(�÷������� ������ ������ �����)
        update : ���� 
        delete : ����
                ��ü ����
                    = delete from table_name
                ���ǿ� �´� row�� ����
                    = delete from gable_name
                        where ���ǹ�
        merge : ����
*/

--[���� 3-35] Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.


--[���� 3-36] Customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ���Ͻÿ�.


--[���� 3-37] ��� ���� �����Ͻÿ�.





