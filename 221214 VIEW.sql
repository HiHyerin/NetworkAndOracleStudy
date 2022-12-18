-- p.235 view

CREATE VIEW emp_view
as
    select empno, ename,job,hiredate,sal,deptno from emp;

-- 사용자 계정은 권한이 없는 것이 많다. => system 계정에서 권한을 부여해야 한다.
-- 오라클에 저장
-- user_tables(생성된 테이블 볼 수 있음)user_views(생성된 뷰 목록), users_constraints
select * from tab;
select * from user_views;  -- 데이터 저장이 아닌 sql문장만 저장하고 있다.
select * from user_tables;
select * from user_constraints;
select * from user_tables where table_name='EMP'; --> 대문자로 , 저장된 값이 무엇인지 확인(여긴 데이터가 저장)
select * from user_views where view_name='EMP_VIEW'; --> 대문자로 , 저장된 값이 무엇인지 확인(여긴 SQL문장만 저장)
SELECT * FROM emp_view;

--삭제
drop view emp_view;

--------------------
-- 단순뷰 단점 : 뷰 뿐만 아니라 테이블도 데이터가 같이 변경된다.
--             뷰에 저장되는 것이 아니라 참조한 테이블에 저장을 한다
-- 테이블 복사
create table myDept
as
    select * from dept;

-- 뷰 제작
create view dept_view
as
    select * from myDept;
    
-- dml
INSERT INTO dept_view VALUES(50,'영업부','서울');

-- 추가 후 뷰 확인
SELECT * FROM dept_view;

-- 추가 후 테이블 확인 (테이블에도 데이터 저장)
select * from myDept;
----------------------------------------------------
----------------------------------------------------
drop view dept_view;

-- view제작시 옵션 추가
create view dept_view
as
    select * from myDept with read only;

-- dml
INSERT INTO dept_view VALUES(50,'개발부','서울'); --> read only 옵션을 추가했기 때문에 데이터 수정삭제 안됨

-- 단순뷰는 데이터 수정시 drop한 후에 다시 뷰를 생성해야 한다.
drop view dept_view;

-- 수정과 동시에 생성 -> 사용빈도가 거의 없다.
create or replace view dept_view
as
    select empno, ename, job, hiredate,sal from emp;
    
-- 뷰는 테이블과 동일시 된다 => 함수, 연산자 사용이 가능 => 많이 사용되는  sql 문장이 있는 경우 => view 생성
-- 단순뷰 보다는 복합뷰를 더 많이 사용
-- 복합뷰 : 테이블 여러개를 연결해서 사용하는 뷰
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--<복합뷰> - 테이블 여러개를 조인
create or replace view empDeptGrade_view
as
    select e1.empno,e1.ename,e2.ename "manager",e1.job,e1.hiredate,e1.sal,e1.comm,dname,loc,grade
    from emp e1, dept, salgrade, emp e2
    where e1.deptno=dept.deptno
    and e1.sal between losal and hisal
    and e1.mgr=e2.empno;
    
select * from empDeptGrade_view;

create or replace view empDeptGrade_1
as
    select e1.empno,e1.ename,e2.ename "manager",e1.job,e1.hiredate,e1.sal,e1.comm,dname,loc,grade
    from emp e1 join dept
    ON e1.deptno=dept.deptno
    join salgrade
    on e1.sal between losal and hisal
    left outer join emp e2
    on e1.mgr=e2.empno;
    
create or replace view empDeptGrade_2
as
    select empno, ename,hiredate,sal,comm,
        (select ename from emp e2 where e1.mgr=e2.empno) manager,
        (select dname from dept where deptno=e1.deptno) dname,
        (select loc from dept where deptno=e1.deptno) loc,
        (select grade from salgrade where e1.sal between losal and hisal) grade
    from emp e1;
    
----------------------------------------------------------
select * from empDeptGrade_2;                               => 이 두식은 같은 결과값을 갖는데 뷰를 생성하면 아래식처럼 일일히 길게 쓰는것보다 간결하게 식을 쓸 수 있다.
----------------------------------------------------------
select empno, ename,hiredate,sal,comm,
        (select ename from emp e2 where e1.mgr=e2.empno) manager, --  별칭 필수
        (select dname from dept where deptno=e1.deptno) dname,
        (select loc from dept where deptno=e1.deptno) loc,
        (select grade from salgrade where e1.sal between losal and hisal) grade
    from emp e1;
    
----------------------------------------------------------
 desc empDeptGrade_2;
    
-- JOIN, SubQuery => view를 만들어서 재사용하면 응용프로그램에서 편리하게 사용 가능

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--<인라인뷰>
-- 뷰를 생성하는 것이 아니라 select를 이용하는 방식, 테이블에서 몇개를 잘라서 출력(페이지 나눠서 출력)
-- 단점) Top-N
-- 형식)
-- 221214 11시부터~~

-- 오류발생(컬럼보다 많은 데이터를 원해서)
select empno,ename,job,hiredate,sal,comm
from (select empno,ename,job,hiredate,sal from emp);

-- 정상수행
select empno,ename,job
from (select empno,ename,job,hiredate,sal from emp);

-- join / subquery
select empno, ename, job, dname, loc
from (select empno, ename, job, dname, loc from emp, dept
        where emp.deptno=dept.deptno);
        
select empno, ename, dname,loc
from (select empno, ename,job,
        (select dname from dept where deptno=emp.deptno) as dname, 
        (select loc from dept where deptno=emp.deptno) as loc
        from emp);

/*
    인라인 => 자바스크립트, css
    <style>
        button(background-color:yellow)
    </style>
    <button style="background-color:yellow">
    <button onclick="javascript:history.back()">
*/

-- 필요한 개수만큼 row를 자른다
select empno,ename,sal,rownum
from (select empno,ename,sal from emp)
where rownum<=5;

select empno,ename,job,hiredate,sal,rownum
from emp;

-- rownum번호 변경
select empno,ename,job,hiredate,sal,rownum
from (select empno,ename,job,hiredate,sal from emp order by sal desc);

-- rownum의 단점 : Top-N (중간은 자를 수 없다) 무조건 1번부터나 맨 뒤부터
--                페이지를 나눌 수 없다.

-- rownum 예제
-- 급여를 많이 받는 사원의 이름,직위,급여 => 상위 5명
-- 이렇게 자르면 일단 1~5번째 사람 자르고 그 후에 order by
select ename, job, sal, rownum --- 3
from emp --1
where rownum<=5 --2
order by sal desc;--4

-- 인라인뷰를 이용해 문제 해결
select ename, job, sal, rownum --3
from (select ename,job,sal from emp order by sal desc) --1
where rownum<=5; --2

-- 중간에서 자르기(페이징) : 인라인뷰에서 자르는게 아니고 테이블을 만들어서 거기서 자름
select ename,job,sal,num
from (select ename,job,sal,rownum as num 
    from(select ename,job,sal 
        from emp order by sal desc))
where num between 4 and 8;

select count(*) from food_location;
/*
    * 뷰 사용하는 경우
    sql문장이 길거나 복잡(join,subquery), 보안 필요할 경우 : 일반 뷰
    상위에서부터 자르기, 페이지 나누기 : 인라인 뷰
    같은 sql 문장 자주 사용(재사용을 위해 뷰 제작)
*/












