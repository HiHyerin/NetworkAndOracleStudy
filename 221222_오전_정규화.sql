create table test_1(
    name varchar2(20),
    subject varchar2(20)
);

insert into test_1 values('홍길동','수학');
insert into test_1 values('홍길동','물리');
insert into test_1 values('심청이','미술');
insert into test_1 values('박문수','음악');
insert into test_1 values('강감찬','국어');
insert into test_1 values('이순신','과학');

select * from test_1;
delete from test_1
where name='홍길동';

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100,'자바',25000);
insert into summer values(200,'오라클',30000);
insert into summer values(300,'JSP',35000);
insert into summer values(400,'HTML/CSS',15000);
insert into summer values(500,'스프링',20000);
COMMIT;

-- 1. 수강이 가능한 과목 출력
SELECT sid,class from summer;

-- 2. 자바의 수강료
select price from summer
where class='자바';

-- 삭제
delete from summer
where sid=100;

select * from summer;

-- 데이터를 추가할 때 문제 발생(삭제 후 추가한다는것은 여기서 수강 취소 후 회원가입을 다시해야 한다는 의미-번거로움)
insert into summer values(100,'자바',25000);
commit;


-- 수정 : 같은 값을 가지고 있는 경우 -> 원하지 않는 데이터가 수정
-- 삭제 : 같은 값을 가지고 있는 경우 -> 원하지 않는 데이터가 삭제

/*
    1 정규화
    2 정규화
    3 정규화
*/

create table member_event(
    id varchar2(10),
    event varchar2(20),
    aaa char(1),
    name varchar2(34),
    primary key(id,event)
);  

insert into member_event values('hong','aaa','y','홍길동1');
insert into member_event values('hong','bbb','y','홍길동2');
insert into member_event values('shim','aaa','y','홍길동3');
insert into member_event values('ki','aaa','y','홍길동4');
