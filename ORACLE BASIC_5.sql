-- emp���̺��� ��� ���� => �ø�����
SELECT *
FROM emp
ORDER BY empno ASC; -- ASC�� ���� ����

-- emp���̺��� ��� ���� => ��������
SELECT *
FROM emp
ORDER BY empno DESC;

-- �޿��� ���� ������ ���
SELECT *
FROM emp
ORDER BY sal DESC;

-- �Ի����� ���� ������ ���
SELECT *
FROM emp
ORDER BY hiredate ASC;

-- �̸��� ���ĺ� ����
SELECT *
FROM emp
ORDER BY ename ASC;

-- �μ����� ��� => ����, GROUP BY
SELECT *
FROM emp
ORDER BY deptno ASC;

-- ��������
SELECT ename, deptno
FROM emp
ORDER BY 2, 1 DESC;
