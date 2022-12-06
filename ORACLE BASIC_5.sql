-- emp테이블에서 사번 정력 => 올림차순
SELECT *
FROM emp
ORDER BY empno ASC; -- ASC는 생략 가능

-- emp테이블에서 사번 정력 => 내림차순
SELECT *
FROM emp
ORDER BY empno DESC;

-- 급여가 많은 순서로 출력
SELECT *
FROM emp
ORDER BY sal DESC;

-- 입사일이 빠른 순서로 출력
SELECT *
FROM emp
ORDER BY hiredate ASC;

-- 이름을 알파벳 순서
SELECT *
FROM emp
ORDER BY ename ASC;

-- 부서별로 출력 => 정렬, GROUP BY
SELECT *
FROM emp
ORDER BY deptno ASC;

-- 이중정렬
SELECT ename, deptno
FROM emp
ORDER BY 2, 1 DESC;
