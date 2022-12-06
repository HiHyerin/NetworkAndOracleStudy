-- 1.emp���� �޿��� 2000 �̻��� ����� ����ϼ���
SELECT *
FROM emp
WHERE sal>=2000;

-- 2. emp���� �޿� sal�� 2000 �̻��� ����� �̸� ename�� ��� empno�� ����ϼ���.
SELECT ename "�̸�", empno "���"
FROM emp
WHERE sal>=2000;

-- 3.emp���� �̸��� 'FORD'�� ����� ��� empno�� �޿� sal�� ����ϼ���
SELECT empno "���", sal "�޿�"
FROM emp
WHERE ename = 'FORD';

-- 4. emp���� �Ի����� hiredate�� 82�� ���Ŀ� �Ի��� �����
--   �̸��� �Ի����ڸ� ����ϼ���.
--   (��¥�� �������� YY/MM/DD���¸� ����ϸ�ȴ�.)

SELECT ename, hiredate
FROM emp
WHERE hiredate>= '82/01/01';

-- 5. emp���� �̸��� J�� ���� ����� �̸��� ����� ����ϼ���.
SELECT ename, deptno
FROM emp
WHERE ename LIKE '%J%';


-- 6. emp���� �̸��� S�� ������ ����� �̸��� ����� ����ϼ���.
SELECT ename, deptno
FROM emp
WHERE ename LIKE '%S';

-- 7. emp���� �̸��� �ι�° ���ڰ� A�� ���� ����� �̸��� ����� ����ϼ���.
SELECT ename, deptno
FROM emp
WHERE ename LIKE '_A%';

-- 8. emp���� ���ʽ��� 300�̰ų� 5000�̰ų� 1400�� ����� �̸�, ���, ���ʽ��� ����ϼ���.
SELECT ename, deptno, comm
FROM emp
WHERE comm IN(300, 500, 1400);

-- 9. emp���� ���ʽ��� 500���� 4000 ������ ����� �̸��� ���, ���ʽ��� ����ϼ���.
SELECT ename, deptno, comm
FROM emp
WHERE comm BETWEEN 500 AND 4000;

-- 10. emp���� �μ��� 10�̰� ��å�� CLERK�� �����̸�,���,��å(job),�μ�(deptno)�� ����ϼ���.
SELECT ename, empno, job, deptno
FROM emp
WHERE deptno=10 and job='CLERK';

-- 11. emp���� �Ի����ڰ� 82�� �����̰ų� ��å�� MANAGER�� ����� �̸��� �Ի����ڸ� ����ϼ���.
SELECT ename, hiredate
FROM emp
WHERE hiredate>='82/01/01' OR job='MANAGER';

-- 12. emp���� �μ���ȣ�� 10�� �ƴ� ������ ���,�̸�,�μ���ȣ�� ����ϼ���.
SELECT empno,ename, deptno
FROM emp
WHERE deptno <>10;

-- 13. emp���� �̸��� A�� ���� ������ ����� �̸��� ����ϼ���. VVVVVVVVVVVVVVVVV
SELECT empno,ename
FROM emp
WHERE ename NOT LIKE '%A%';

-- 14. emp���� ���ʽ��� 500���� 1400�� �ƴ� ������ ����� ���ʽ��� ����ϼ���.
SELECT empno, comm
FROM emp
WHERE comm NOT BETWEEN 500 AND 1400 AND comm<>0;

-- 15. emp���� �Ŵ����� ���� ���� �����̸��� ����ϼ���.
-- null���� is null�� ǥ���Ѵ�.
SELECT ename, job
FROM emp
WHERE mgr IS NULL;



-- 16. emp���� Ŀ�̼��� �޴�(Ŀ�̼��� null���� �ƴ�) �����̸��� Ŀ�̼��� ����ϼ���.

-- 17. emp���� ���, �̸�, �޿��� ����ϴµ� �޿��� ����������� ����ϼ���.


-- 18. emp���� ���, �̸�, �޿��� ����ϴµ� �޿��� ���� ������� ����ϼ���.


-- 19. emp���� ���, �̸�, �޿��� ����ϴµ� �̸��� ����������� ����ϼ���.


-- 20. emp���� ���, �̸�, �Ի����� ����ϴµ� �Ի����ڰ� �ֱ��� ������� ����ϼ���.



