-- emp에 있는 모든 데이터 검색
SELECT * FROM emp;

-- emp에 있는 데이터 중 사번, 이름, 직위, 입사일만 추출
SELECT empno,ename,job,hiredate FROM emp;

-- 컬럼에 별칭을 주는 방법 => 사용자가 쉽게 볼 수 있게 만들어야 함
SELECT empno "사번", ename "이름",hiredate "입사일"
FROM emp;

SELECT empno as 사번, ename as 이름, hiredate as 입사일
FROM emp;

SELECT empno as 사번, ename as 이름, hiredate as 입사일
FROM emp e;

-- 문자열 결합
SELECT ename || '님의 입사일은' || hiredate|| '입니다.' FROM emp;

-- 중복을 제거 DISTINCT
SELECT deptno FROM emp;
SELECT DISTINCT deptno FROM emp;


-- 산술연산자
SELECT 10+2,10-2,10*2,10/3
FROM DUAL; -- -> 연습용 테이블

SELECT 10+2,10-2,10*2,10/0
FROM DUAL; -- -> 0으로 나누면 오류

SELECT ' 10'+2,10-2,10*2,10/3
FROM DUAL; -- -> 자동 Integer.parseInt() 실행 ('10'이 자동으로 정수로 바뀜)
           -- -> 숫자가 문자열로 묶인 경우에 자동으로 정수형으로 변환 
           -- -> 정수형은 공백이 있어도 오류 X 

SELECT '10'+'A'
FROM DUAL; -- -> 오류

SELECT '10'||'A'
FROM DUAL; --> 10A

SELECT ename,sal+NVL(comm,0) "실제급여" -- NVL = null값이면 0으로 바꿔라
FROM emp;

SELECT * FROM emp
WHERE empno=&sabun;




CREATE TABLE student(
    name VARCHAR2(34),
    kor NUMBER,
    eng NUMBER,
    math NUMBER
    );
    
SELECT * FROM student;
INSERT INTO student VALUES('홍길동',89,78,34);
INSERT INTO student VALUES('심청이',78,73,97);
INSERT INTO student VALUES('박문수',45,76,68);
COMMIT;

-- 산술연산
SELECT name,kor,eng,math,kor+eng+math "total",(kor+eng+math)/3 "평균"
FROM student;

-- 비교연산자
SELECT ename,sal FROM emp;

-- = 같다 (emp에서 급여가 3000인 사원의 이름, 직위, 입사일, 급여 출력)
SELECT ename,job,hiredate,sal
FROM emp
WHERE sal=3000;

-- <> : 같지 않다(emp에서 급여가 3000이 아닌 사원의 이름, 직위, 입사일, 급여 출력)
SELECT ename,job,hiredate,sal
FROM emp
WHERE sal<>3000;

SELECT ename,job,hiredate,sal
FROM emp
WHERE sal!=3000;

SELECT ename,job,hiredate,sal
FROM emp
WHERE sal^=3000;

-- 작다 < : 급여가 2500 미만인 사원의 모든 정보 출력
SELECT *
FROM emp
WHERE sal<2500;

-- 비교연산자 : 문자, 날짜도 비교연산자를 사용한다.
-- 날짜 : YY/MM/DD 81/01/01
-- 81년 이후에 입사한 사원의 모든 정보를 출력

SELECT * 
FROM emp
WHERE hiredate>'81/12/31'; -- ''(문자열형식으로 저장)
-- WHERE 문장은 자바 IF와 동일 => TRUE일 때 처리

/*
    SQL문장 => select
    for(int i=0, i<=emp.length;i++){
     WHERE 
     if (hiredate > '81/12/31') {}
    }
*/

-- 81년에 입사한 사원의 모든 정보 출력
/* 
SELECT *
FROM emp
WHERE hiredate>='81/01/01' AND hiredate<='81/12/31';
*/

-- 급여가 1500 이상인 사원의 이름, 급여
SELECT ename,sal
FROM emp
WHERE sal>=1500;

-- KING보다 높은 이름을 가진 사원의 이름, 급여, 직위
SELECT ename, sal, job
FROM emp
WHERE ename>'KING';
-- => 주의점 : 문자가 들어간 경우 대소문자를 구분

-- king의 모든 정보
SELECT *
FROM emp
WHERE ename = 'KING';
-- 자바에서 대문자로 변경후에 오라클로 전송(toUpperCase())

------------------------------------------------------------------------
-- OR 연산자 => IN 연산자 대체 가능
-- AND 연산자 => BETWEEN 대체 가능

-- AND 
-- 1500 이상 3000이하 급여를 받는 사원의 모든 정보 출력
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;

-- 1500이거나 3000인 사원의 모든정보 출력
SELECT *
FROM emp
WHERE sal=1500 OR sal=3000;

-- 부서번호가 30번, 20번인 사원의 모든 정보를 가지고 온다
SELECT *
FROM emp
WHERE deptno=30 OR deptno=20;

-- NULL 연산자 (값이 NULL일 경우 연산처리가 안된다.
-- IS NULL (comm=null => xx), IS NOT NULL
-- comm 성과급 => 성과급을 받는 사원의 모든 정보를 출력
SELECT *
FROM emp
WHERE comm IS NOT NULL AND comm<>0;


-- comm 성과급 => 성과급을 받지않는 사원의 모든 정보를 출력
SELECT *
FROM emp
WHERE comm IS NULL OR comm=0;

-- IN 연산자 => OR가 여러개일 경우에 처리
-- 급여가 5000, 2850, 1500, 3000, 950을 받는 사원의 모든 정보
SELECT *
FROM emp
WHERE sal=5000 OR sal=2850 OR sal=3000 OR sal=950;

SELECT *
FROM emp
WHERE sal IN(5000,2850,3000,950);

-- 문자
-- 직위가 MANAGER, CLERK, SALESMAN
SELECT *
FROM emp
WHERE JOB IN('MANAGER', 'CLERK', 'SALESMAN');

-- 직위가 MANAGER, CLERK, SALESMAN 아닌 사람
SELECT *
FROM emp
WHERE JOB NOT IN('MANAGER', 'CLERK', 'SALESMAN');

-- BETWEEN AND => >=AND<=
-- 문자, 숫자, 날짜 가능
-- 급여가 1500~3000 사이에 있는 사원의 모든 정보
SELECT *
FROM emp
WHERE sal>=1500 AND sal<=3000;

SELECT *
FROM emp
WHERE NOT (sal>=1500 AND sal<=3000);

-- 웹(페이징)
SELECT *
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

-- BETWEEN 부정
SELECT *
FROM emp
WHERE sal NOT BETWEEN 1500 AND 3000;
-- NOT IN, NOT BETWEEN, NOT LIKE

--  연산자중에 가장 많이 사용되는 연산자 => LIKE ==> 모든 검색기
-- 형식 : WHERE 컬럼명 LIKE '패턴'(A%, %A, %A%, _ _A%, _ _A_ _ ...)
-- 사원 이름중에 A자로 시작하는 사원의 모든 정보를 보여 달라
SELECT *
FROM emp
WHERE ename LIKE 'A%';

SELECT *
FROM emp
WHERE ename LIKE '%T';

SELECT *
FROM emp
WHERE ename LIKE '%A%';

SELECT *
FROM emp
WHERE ename LIKE '%EN'; OR LIKE '%AN';

-- _ : 한글자
SELECT *
FROM emp
WHERE ename LIKE '_A%';
