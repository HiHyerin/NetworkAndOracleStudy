-- FUNCTION 제작
-- 단일행 서브쿼리, join에서 다른 테이블 데이터 읽기에서 function 자주사용
-- 반복되는 경우, 재사용이 필요할 때 제작
-- 단점 : 데이터값(리턴값)을 한개만 설정할 수 있다.(프로시저는 여러개를 가져올 수 있다) => 날짜, 이름, 부서명... , 최대값, 평균값 .. 등
   --   ㄴ> 그래서 자주 쓰이지 않음
  

-- join
SELECT empno,ename,job,hiredate, sal, comm,dname,loc,grade
from emp,dept,salgrade
where emp.deptno=dept.deptno
and sal between losal and hisal;

-- subQuery
SELECT empno, ename,job,hiredate,sal,comm,
    (select dname from dept where deptno=emp.deptno) dname,
    (select loc from dept where deptno=emp.deptno) loc,
    (select grade from salgrade where emp.sal between losal and hisal) grade
from emp;

-- 함수만들기
create or replace function getDname(
    vDeptno emp.deptno%type -- 매개변수
) return VARCHAR2 -- 문자열을 리턴하겠다(return 데이터형)
IS
    vDname dept.dname%type;
begin
    select dname into vDname from dept where deptno=vDeptno;
    return vDname;
end;
/
---------------------------------------------------------------
create or replace function getLoc(
    vDeptno emp.deptno%type -- 매개변수
) return VARCHAR2 -- 문자열을 리턴하겠다(return 데이터형)
IS
    vLoc dept.loc%type;
begin
    select loc into vLoc from dept where deptno=vDeptno;
    return vLoc;
end;
/

-- 사용
select empno,ename,job,hiredate,sal,getDname(deptno) dname, getLoc(deptno) loc
from emp;

---------------------------------------------------------------

create or replace function getGrade(
    vSal emp.sal%type
) return number
is
    vGrade salgrade.grade%type;
begin
    select grade into vGrade
    from salGrade
    where vSal between losal and hisal;
    return vGrade;
end;
/

-- 사용
select empno,ename,job,hiredate,sal,getDname(deptno) dname, getLoc(sal) grade
from emp;

---------------------------------------------------------------
select empno,ename,job,hiredate,sal
from emp
where sal>(select round(avg(sal)) from emp);

create or replace function getAvg
return number
is
    vAvg number; -- 지역변수
begin
    select round(avg(sal)) into vAvg
    from emp;
    return vAvg;
end;
/
select empno,ename,job,hiredate,sal
from emp
where sal>getAvg();

---------------------------------------------

create or replace function getMax
return number
is
    vMax NUMBER;
begin
    SELECT MAX(empno)+1 into vMAX
    from emp;
    
    return vMax;
end;
/

select getMax() from dual;

-- 삭제
drop function getAvg;
drop function getDname;
drop function getGrade;
drop function getLoc;
drop function getMax;







