CREATE TABLE emp_update
AS 
SELECT * FROM emp;

select * from emp_update;

-- 직위 변경
update emp_update set
job='CLERK';

-- 원상복귀(ROLLBACK) COMMIT날리면 변경이 안됨(자바는 자동 COMMIT이기 때문에 주의 또 주의)
ROLLBACK;

-- 추가
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'홍길동','CLERK',7788,
        SYSDATE,2000,100,40);
    -- max()를 쓸 때 데이터가 없을 떈 NVL을 사용해야하고, 데이터가 있을 땐 MAX()+1사용 가능
    -- (SELECT NVL(MAX(empno)+1,1) FROM emp_update : 값이 없는 경우 초기값1
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'심청이','MANAGER',7788,
        SYSDATE,3000,500,40);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'박문수','CLERK',7788,
        SYSDATE,2000,100,40);
commit;
        
SELECT * FROM emp_update;

-- 박문수 update
UPDATE emp_update SET
job='SALESMAN', mgr=7698,hiredate='20/02/05',sal=3500,comm=700,deptno=30
-- -- = 은 대입
WHERE empno=7937;
--        ---  = 은 비교연산자
commit;

-- 데이터 추가
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'홍길동1','CLERK',7788,
        SYSDATE,2000,100,50);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'홍길동2','CLERK',7788,
        SYSDATE,2000,100,50);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'홍길동3','CLERK',7788,
        SYSDATE,2000,100,50);
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'홍길동4','CLERK',7788,
        SYSDATE,2000,100,50);        
INSERT INTO emp_update VALUES((SELECT MAX(empno)+1 FROM emp_update),'홍길동5','CLERK',7788,
        SYSDATE,2000,100,50);   
commit;
 
 -- 서브쿼리를 이용한 UPDATE
UPDATE emp_update SET
deptno=60
WHERE deptno=(SELECT deptno FROM emp_update WHERE empno=7938);

select * from emp_update;
commit;
-- 문장, 날짜는 항상 작은따옴표(’ ‘) 사용, 문자일 경우 byte확인 ⇒ desc를 날려서 테이블 구조 확인

-- 전체삭제(데이터만)
DELETE FROM emp_update;
SELECT * FROM emp_update;
rollback;

-- 60번 부서 삭제
delete from emp_update
where deptno=60;
commit;

-- 박문수 삭제
delete from emp_update
where empno=7937;
commit;

-- 가장 큰 부서번호(여기선 40) 데이터 지우기
delete from emp_update
where deptno=(SELECT MAX(deptno) from emp_update);

-- truncate(DDL)는 rollback가 안된다. / commit, rollback는 DML만 적용된다.
truncate table emp_update;
select * from emp_update;
rollback;

-- 테이블 삭제
DROP TABLE emp_update;