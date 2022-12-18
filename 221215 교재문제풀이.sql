desc book;

/* book
이름        널?       유형           
--------- -------- ------------ 
BOOKID    NOT NULL NUMBER(2)    
BOOKNAME           VARCHAR2(40) 
PUBLISHER          VARCHAR2(40) 
PRICE              NUMBER(8) 
*/

-- [3-1] 모든 도서의 이름과 가격 검색
select bookname, price from book;
--=> 반드시 자바로 갖고와보기

-- [3-2] 모든 도서의 도서번호, 도서이름, 출판사, 가격 검색
select bookid,bookname,publisher,price from book; => 순서 지정 가능
select * from book;

-- [3-3] 도서 테이블에 있는 모든 출판사를 검색 (중복제거)
-- 중복 제거 : distinct
select distinct publisher from book;
/*
-- * 옵션
    1. 중복제거 : distinct
    2. 문자열 결합 : ||
    3. 별칭 : 컬럼명 "별칭"   |    컬럼명 별칭    |    컬럼명 as 별칭
        ㄴ> 스칼라 서브쿼리, 함수, 연산자... 
    */


--[3-4] 가격이 20,000원 미만인 도서 검색
    /* 오라클에서 지원하는 연산자
    NOT : 부정연산자 => NOT IN, NOT LIKE, NOT BETWEEN
    NULL : NULL값일 경우 연산처리가 안된다. IS NULL, IS NOT NULL
    IN : OR가 여러개일때 처리하는 연산자
    BETWEEN : >= AND <= 범위, 기간 , 페이지 나누기
    LIKE : 유사 문자열 찾기 (검색)
        % : 문자 개수를 모르는 경우
        _ : 문자 한개
    */
SELECT * FROM book where price<20000;


--[3-5] 가격이 만원이상 이만원 이하인 도서 검색
select * from book
where price between 10000 and 20000;
-- = where price>=10000 and price<=20000;


--[3-6] 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오
select * from book
where publisher='굿스포츠' or publisher='대한미디어';
-- = where publisher in('굿스포츠','대한미디어');


--[3-7] '축구의 역사'를 출간한 출판사 검색
select publisher from book
where bookname='축구의 역사';


--[3-8] 도서이름에 '축구'가 포함된 출판사를 검색하시오
select bookname,publisher from book 
where bookname like '%축구%';

select bookname,publisher from book 
where regexp_like(bookname,'축구');


--[3-9] 도서이름의 왼쪽 두번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오
select bookname from book
where bookname like '_구%';


--[3-10] 축구에 관한 도서 중 가격이 20000원 이상인 도서를 검색
select * from book
where price>=20000 and bookname like '%축구%';


--[3-11] 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.
select * from book
where publisher in('굿스포츠', '대한미디어');


==[3-12] 도서를 이름순으로 검색하시오
select * from book order by bookname;
select * from book order by 1 desc, 2 asc;
                                 //------> 같은 값이 있는 경우에만 처리(ex) 답변형 게시판, 대댓글
/* order by
    속도 저하( index는 속도 최적화 , index_asc(), index_desc())
    실행시 맨 마지막에 실행 된다
        (from - where groub by having select order by)
*/


--[3-13] 도서를 가격순으로 검색하고 가격이 같으면 이름순으로 검색하시오
select bookname, publisher, price
from book
order by price asc, bookname asc;


--[3-14] 도서를 가격의 내림차순으로 검색, 만약 가격이 같으면 출판사 오름차순으로 출력
select bookname, publisher, price
from book
order by price desc, publisher asc;


--[3-15] 고객이 주문한 도서의 총 판매액을 구하시오 
desc orders;
select sum(saleprice) "총판매액" from orders;
/* orders 테이블
이름        널?       유형        
--------- -------- --------- 
ORDERID   NOT NULL NUMBER(2) 
CUSTID             NUMBER(2) 
BOOKID             NUMBER(2) 
SALEPRICE          NUMBER(8) 
ORDERDATE          DATE 
*/

/*
-- 집합함수 : sum,avg,max,min,count
-- 단일행 함수 :  문자 : length(), substr(), instr(), rpad(), replace()
                숫자 : mod(),ceil(), round(), trunc()
                날짜 : sysdate, months_between()
                변환 : to_char()
                        날짜 => YYYY MM DD MI SS HH/HH24 DY
                        숫자 => 999,999
                기타 : NVL() - null값을 대체하는 함수
*/

--[3-16] 2번 김연아 고객이 주문한 도서의 총 판매액
select sum(saleprice) from orders
where custid=2;

--[3-17] 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오
select sum(saleprice), avg(saleprice),min(saleprice),max(saleprice)
from orders;

--[3-18] 마당서점의 도서 판매 건수를 구하시오
select count(*) 판매건수 from orders;

--[3-19] 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오
    -- group by => custid
select (select name from customer where custid=orders.custid),count(*) "총수량", sum(saleprice) "총판매액"
from orders
group by custid;
    -- groub by는 서브쿼리 적용 안됨

--[3-20] 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
--       단 두권 이상 구매한 고객만 구하시오
select custid, count(*) "도서수량"
from orders
where saleprice>=8000
group by custid
having count(*)>=2;

--[3-21] 고객과 고객의 주문에 관한 데이터를 모두 보이시오
select * from customer c, orders o
where c.custid=o.custid;

select * from customer c join rders o
on c.custid=o.custid;

select * from customer c natural join orders o; -- 컬럼명이 같아서 natural join 사용 가능(컬럼명은 달라도 컬럼 값이 같으면 됨)
select * from customer join orders using(custid); -- 컬럼명이 같아서 join using 사용 가능(컬럼명은 달라도 컬럼 값이 같으면 됨)

-- ==> 자바에서 join이 있으면 포함클래스를 이용한다.
desc orders;
desc customer;

/* orders
이름        널?       유형        
--------- -------- --------- 
ORDERID   NOT NULL NUMBER(2) 
CUSTID             NUMBER(2) 
BOOKID             NUMBER(2) 
SALEPRICE          NUMBER(8) 
ORDERDATE          DATE 
*/

/* customer
	이름      널?       유형           
------- -------- ------------ 
CUSTID  NOT NULL NUMBER(2)    
NAME             VARCHAR2(40) 
ADDRESS          VARCHAR2(50) 
PHONE            VARCHAR2(20) 
*/

--[3-22] 고객과 고객의 주문에 관한 데이터를 고객별로 정렬해 보시오
select * from customer c, orders o
where c.custid=o.custid
order by c.custid;


--[3-23] 고객 이름과 고객이 주문한 도서의 판매가격을 검색하시오
-- join 대체 => subquery (컬럼 대신 : 인라인뷰,  테이블 대신: 스칼라서브쿼리)
select name, (select bookname from book where bookid=o.bookid) bookname,saleprice from customer c, orders o
where c.custid=o.custid;
---------------------------------------------------------------------
select empno,ename,hiredate,job,sal,dname,loc,grade
from emp 
join dept
on emp.deptno=dept.deptno
join salgrade
on sal between losal and hisal;

-- 오라클 조인
elect empno,ename,hiredate,job,sal,dname,loc,grade
from emp,dept,salgrade
jwhere emp.deptno=dept.deptno
and sal between losal and hisal;
------------------------------------------------------------------------

--[3-24] 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오
select name,sum(saleprice)
from customer c, orders o
where  c.custid=o.custid              --> 조인조건
group by c.name
order by c.name;                     --> 정렬조건

--[질의 3-25] 고객의 이름과 고객이 주문한 도서의 이름을 구하시오. 
-- 이중조인
select name, bookname
from customer c, orders o, book b
where c.custid=o.custid
and o.bookid=b.bookid;

-- 안시조인
select name,bookname
from customer c join orders o
on c.custid=o.custid
join book b
on o.bookid=b.bookid;

--[질의 3-26] 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
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
where price>=20000;             ---> and를 쓰면 join on과 연결이되기 때문에 select랑 연결되는 where 을 사용해야한다.


--[질의 3-27] 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
select name, saleprice, (select bookname from book where bookid=o.bookid) bookname
from orders o, customer c
where c.custid=o.custid(+);                 --> outer join

select name, saleprice, (select bookname from book where bookid=o.bookid) bookname
from orders o right outer join customer c
on c.custid=o.custid;   

--[질의 3-28] 가장 비싼 도서의 이름을 보이시오.
    -- 서브쿼리
select bookname
from book
where price= (select max(price) from book); --> 단일행 서브쿼리


--[질의 3-29] 도서를 구매한 적 있는 고객의 이름을 검색하시오.
select name
from customer
where custid in (select custid from orders); --> 데이터가 여러개일 때에는 in사용 (다중행 서브쿼리)





--[질의 3-30] ‘대한미디어’에서 출판한 도서를 구매한 고객의 이름을 보이시오. 221215 16:43

SELECT name, bookname
FROM customer
INNER JOIN orders ON customer.custid = orders.custid
INNER JOIN book ON orders.bookid = book.bookid
WHERE book.publisher = '대한미디어';

select name from customer
where custid in(select custid from orders
                    where bookid in(select bookid from book 
                                            where publisher='대한미디어'));



--[질의 3-31] 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오. 
select bookname, price from book where price>=(select avg(price) from book);

select bookname,price from book group by publisher
having price>=(select avg(price) from book);

select avg(price) from book;

--[질의 3-32] 도서를 주문하지 않은 고객의 이름을 보이시오.  221215 17:10
select name from customer 
where custid not in (select custid from orders);

--[질의 3-33] 주문이 있는 고객의 이름과 주소를 보이시오.
select name, address from customer
where custid in (select custid from orders);

--[질의 3-34] Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
-- update
update customer set address='대한민국 부산' 
where custid=5;

select * from customer;
rollback



/*
    dml : 데이터 조작언어
        insert : 추가
                전체데이터 추가
                    = insert into table_name VALUES(값...) => table의 컬럼 개수와 값의 개수가 반드시 일치
                필요한 데이터 추가 (default가 많이 있는경우)
                    = insert into table_name(컬럼명,컬럼명...) values(컬럼지정된 순서와 개수를 맞춘다)
        update : 수정 
        delete : 삭제
                전체 삭제
                    = delete from table_name
                조건에 맞는 row만 삭제
                    = delete from gable_name
                        where 조건문
        merge : 병합
*/

--[질의 3-35] Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.


--[질의 3-36] Customer 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인하시오.


--[질의 3-37] 모든 고객을 삭제하시오.





