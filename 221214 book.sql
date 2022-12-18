@C:\javaDev\book
select * from book; -- å����
select * from customer; --���������
select * from orders;   -- å�Ǹ�

desc book;
/*
    �̸�        ��?       ����           
    --------- -------- ------------ 
    BOOKID    NOT NULL NUMBER(2)        => å����
    BOOKNAME           VARCHAR2(40)     => å �̸�
    PUBLISHER          VARCHAR2(40)     => ���ǻ� �̸�
    PRICE              NUMBER(8)        => ����
*/

desc customer;
/*
    �̸�      ��?       ����           
    ------- -------- ------------ 
    CUSTID  NOT NULL NUMBER(2)      => ������
    NAME             VARCHAR2(40)   => �̸�
    ADDRESS          VARCHAR2(50)   => �ּ�
    PHONE            VARCHAR2(20)   => ��ȭ
*/

desc orders;
/*
    �̸�        ��?       ����        
    --------- -------- --------- 
    ORDERID   NOT NULL NUMBER(2)    => ������
    CUSTID             NUMBER(2)    => ����� ����
    BOOKID             NUMBER(2)    => å ����
    SALEPRICE          NUMBER(8)    => ���Ű���
    ORDERDATE          DATE         => ���ų�¥
*/

select name,address,phone, saleprice, orderdate,bookname,publisher,price
from customer, orders,book
where customer.custid=orders.custid
and book.bookid=orders.bookid;

-- ��� �����(sql������ ����)
CREATE or replace view book_all
as
    select name,address,phone, saleprice, orderdate,bookname,publisher,price
    from customer, orders,book
    where customer.custid=orders.custid
    and book.bookid=orders.bookid;
    
select * from book_all;

-- ��ũ�� ������ �ȵȴ�(������ �پ)
select text from user_views where view_name='BOOK_ALL';

drop view book_all;