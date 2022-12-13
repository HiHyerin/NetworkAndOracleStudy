/* 
    P.187 
    DML (데이터 조작언어) ==> ROW 단위
    - INSERT : 데이터 추가
        1. INSERT ALL
            전체 데이터 등록, 나눠서 저장
        2. 전체 데이터 등록(모든 컬럼에 데이터 추가)
            INSERT INTO talbe_name VALUES(값...)
                        ----------       ------
                        컬럼 개수           값 개수가 동일
        3. 필요한 데이터만 등록(컬럼을 지정해서 처리)
            INSERT INTO table_name(컬럼, 컬럼...) VALUES(값...)
                                  --------------      -------
                                  지정된 컬럼 개수와      값의 개수가 동일
                                  (DEFAULT가 있는경우)
    - UPDATE : 데이터 수정
        UPDATE table_name SET
        컬럼명=값, 컬럼명=값...
        [WHERE 조건] --> 안쓰면 다 바뀌고 쓰면 그 조건만 변경 (거의 WHERE 필수적으로 씀)
        
    - DELETE : 데이터 삭제
        DELETE FROM table_name
        [WHERE 조건]
    *** INSERT, UPDATE, DELETE => 반드시 COMMIT 사용(자바에선 에러가 없는데 데이터를 읽지 못하면 오라클에서 COMMIT을 하지 않은 것)
    
*/

CREATE TABLE emp_20
AS
    SELECT empno,ename,job,hiredate,sal FROM emp
    WHERE 1=2;

SELECT * FROM emp_20;
desc emp_10;

-- INSERT ALL -- 하나의 테이블을 분리할 때 많이 사용
-- ex) 부서별로 행 나누기 / 이 외에도 분기별 통계 ..
INSERT ALL 
    WHEN deptno=10 THEN
        INTO emp_10 VALUES(empno, ename,job,hiredate,sal)
        
    WHEN deptno=20 THEN
        INTO emp_20 VALUES(empno, ename,job,hiredate,sal)
        
    WHEN deptno=30 THEN
        INTO emp_30 VALUES(empno, ename,job,hiredate,sal)
        
    select * from emp;
    --------------------------
    
select * from emp_10;
select * from emp_20;
select * from emp_30;

--===========================================================
SELECT DISTINCT TO_CHAR(hiredate,'YYYY') FROM emp;

CREATE TABLE emp_1980
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;


CREATE TABLE emp_1981
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;

CREATE TABLE emp_1982
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;

CREATE TABLE emp_1983
AS
    SELECT empno, ename,job,hiredate,sal FROM emp
    WHERE 1=2;

INSERT ALL 
    WHEN To_CHAR(hiredate,'YYYY')=1980 THEN
        INTO emp_1980 VALUES(empno,ename,job,hiredate,sal)
        
    WHEN To_CHAR(hiredate,'YYYY')=1981 THEN
        INTO emp_1981 VALUES(empno,ename,job,hiredate,sal)
    
    WHEN To_CHAR(hiredate,'YYYY')=1982 THEN
        INTO emp_1982 VALUES(empno,ename,job,hiredate,sal)
    
    WHEN To_CHAR(hiredate,'YYYY')=1983 THEN
        INTO emp_1983 VALUES(empno,ename,job,hiredate,sal)
select * from emp;
----------------------------

    select * from emp_1980;
    select * from emp_1981;
    select * from emp_1982;
    select * from emp_1983;

-- 맛집 => 한식/양식/중식/일식/기타
-- 노래 => 가요/pop/트롯...
-- SNS hong => hong_board

drop table emp_30;
drop table emp_1983;

--===========================================================================

CREATE TABLE student(
    hakbun NUMBER,
    name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
    subject VARCHAR2(100),
    kor NUMBER(3),
    eng NUMBER(3),
    math NUMBER(3),
    regdate DATE DEFAULT SYSDATE,
    CONSTRAINT std_hak_pk PRIMARY KEY(hakbun)
);

-- TABLE 저장공간에 데이터 추가 (INSERT)
INSERT INTO student VALUES(1,'홍길동','',90,80,90,SYSDATE); -- 개수 맞춰야함
INSERT INTO student(hakbun,name, kor,eng,math) VALUES(2,'심청이', 89,78,90); -- DEFAULT 값은 적용하려면 구체적으로 지정
SELECT * FROM student;
select hakbun,name,kor,eng,math,(kor+eng+math) total, round((kor+eng+math)/3,2) avg
FROM student;
-- 서브쿼리는 insert, update, delete에서 사용 가능
-- 조인은 select에서만 가능

-- 자동증가번호 사용
INSERT INTO student(hakbun, name, kor, eng,math) VALUES((SELECT MAX(hakbun)+1 FROM student), '박문수',90,80,67);

-- 자동 증가, 형식(필요한 데이터 추가, 전체 데이터 추가)
-- default가 많은 경우 : 선택적으로 추가, 그렇지 않을 경우 전체적으로 추가
-- 문자/날짜는 반드시 ''를 이용해서 추가한다. sysdate는 찍는 거 x
    INSERT INTO student VALUES((SELECT MAX(hakbun)+1 FROM student), '홍길동','',90,90,80,'22/10/10');

ALTER TABLE student drop column subject;
ALTER TABLE student drop column regdate;

CREATE TABLE emp_test
as
select * from emp;

select * from emp_test;

truncate table emp_test; -- 데이터 전체 지움(형태는 존재)

insert into emp_test(empno, ename,job,mgr,hiredate,sal,comm,deptno)
select * from emp; -- 값 집어넣기

truncate table student; -- 값 지워버려

select * from student;










