-- 1.emp에서 급여가 2000 이상인 사람을 출력하세요
SELECT *
FROM emp
WHERE sal>=2000;

-- 2. emp에서 급여 sal가 2000 이상인 사람의 이름 ename과 사번 empno을 출력하세요.
SELECT ename "이름", empno "사번"
FROM emp
WHERE sal>=2000;

-- 3.emp에서 이름이 'FORD'인 사람의 사번 empno과 급여 sal을 출력하세요
SELECT empno "사번", sal "급여"
FROM emp
WHERE ename = 'FORD';

-- 4. emp에서 입사일자 hiredate가 82년 이후에 입사한 사람의
--   이름과 입사일자를 출력하세요.
--   (날짜를 넣을때는 YY/MM/DD형태를 사용하면된다.)

SELECT ename, hiredate
FROM emp
WHERE hiredate>= '82/01/01';

-- 5. emp에서 이름이 J가 들어가는 사원의 이름과 사번을 출력하세요.
SELECT ename, deptno
FROM emp
WHERE ename LIKE '%J%';


-- 6. emp에서 이름이 S로 끝나는 사원의 이름과 사번을 출력하세요.
SELECT ename, deptno
FROM emp
WHERE ename LIKE '%S';

-- 7. emp에서 이름의 두번째 글자가 A가 들어가는 사원의 이름과 사번을 출력하세요.
SELECT ename, deptno
FROM emp
WHERE ename LIKE '_A%';

-- 8. emp에서 보너스가 300이거나 5000이거나 1400인 사람의 이름, 사번, 보너스를 출력하세요.
SELECT ename, deptno, comm
FROM emp
WHERE comm IN(300, 500, 1400);

-- 9. emp에서 보너스가 500에서 4000 사이의 사원의 이름과 사번, 보너스를 출력하세요.
SELECT ename, deptno, comm
FROM emp
WHERE comm BETWEEN 500 AND 4000;

-- 10. emp에서 부서가 10이고 직책이 CLERK인 직원이름,사번,직책(job),부서(deptno)를 출력하세요.
SELECT ename, empno, job, deptno
FROM emp
WHERE deptno=10 and job='CLERK';

-- 11. emp에서 입사일자가 82년 이후이거나 직책이 MANAGER인 사람의 이름과 입사일자를 출력하세요.
SELECT ename, hiredate
FROM emp
WHERE hiredate>='82/01/01' OR job='MANAGER';

-- 12. emp에서 부서번호가 10이 아닌 직원의 사번,이름,부서번호를 출력하세요.
SELECT empno,ename, deptno
FROM emp
WHERE deptno <>10;

-- 13. emp에서 이름에 A가 없는 직원의 사번과 이름을 출력하세요. VVVVVVVVVVVVVVVVV
SELECT empno,ename
FROM emp
WHERE ename NOT LIKE '%A%';

-- 14. emp에서 보너스가 500에서 1400이 아닌 직원의 사번과 보너스를 출력하세요.
SELECT empno, comm
FROM emp
WHERE comm NOT BETWEEN 500 AND 1400 AND comm<>0;

-- 15. emp에서 매니저를 갖지 않은 직원이름을 출력하세요.
-- null값은 is null로 표현한다.
SELECT ename, job
FROM emp
WHERE mgr IS NULL;



-- 16. emp에서 커미션을 받는(커미션이 null값이 아닌) 직원이름과 커미션을 출력하세요.

-- 17. emp에서 사번, 이름, 급여를 출력하는데 급여가 적은사람부터 출력하세요.


-- 18. emp에서 사번, 이름, 급여를 출력하는데 급여가 많은 사람부터 출력하세요.


-- 19. emp에서 사번, 이름, 급여를 출력하는데 이름이 빠른사람부터 출력하세요.


-- 20. emp에서 사번, 이름, 입사일을 출력하는데 입사일자가 최근인 사람부터 출력하세요.



