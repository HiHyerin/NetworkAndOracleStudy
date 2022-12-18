@C:\javaDev\book
select * from book; -- 책정보
select * from customer; --사용자정보
select * from orders;   -- 책판매

desc book;
/*
    이름        널?       유형           
    --------- -------- ------------ 
    BOOKID    NOT NULL NUMBER(2)        => 책구분
    BOOKNAME           VARCHAR2(40)     => 책 이름
    PUBLISHER          VARCHAR2(40)     => 출판사 이름
    PRICE              NUMBER(8)        => 가격
*/

desc customer;
/*
    이름      널?       유형           
    ------- -------- ------------ 
    CUSTID  NOT NULL NUMBER(2)      => 구분자
    NAME             VARCHAR2(40)   => 이름
    ADDRESS          VARCHAR2(50)   => 주소
    PHONE            VARCHAR2(20)   => 전화
*/

desc orders;
/*
    이름        널?       유형        
    --------- -------- --------- 
    ORDERID   NOT NULL NUMBER(2)    => 구분자
    CUSTID             NUMBER(2)    => 사용자 구분
    BOOKID             NUMBER(2)    => 책 구분
    SALEPRICE          NUMBER(8)    => 구매가격
    ORDERDATE          DATE         => 구매날짜
*/

select name,address,phone, saleprice, orderdate,bookname,publisher,price
from customer, orders,book
where customer.custid=orders.custid
and book.bookid=orders.bookid;

-- 뷰로 만들기(sql문장을 저장)
CREATE or replace view book_all
as
    select name,address,phone, saleprice, orderdate,bookname,publisher,price
    from customer, orders,book
    where customer.custid=orders.custid
    and book.bookid=orders.bookid;
    
select * from book_all;

-- 디스크에 저장이 안된다(보안이 뛰어남)
select text from user_views where view_name='BOOK_ALL';

drop view book_all;