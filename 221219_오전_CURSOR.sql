-- cursor ==> �ڹٸ�Ī Ŭ����(ResultSet)
-- cursor�� �̿��ϰ� �Ǹ� �������� ���ÿ� ��� ����(ArrayList)
-- �ڹٿ� ��� ����� �� => cursor�� �̿��Ѵ�
/*
    1. cursor ����
        cursor Ŀ���� is
            select~~=> ����� ������� ������ �ִ�.
    2. cursor ����
        open Ŀ����;
    3. loop(����)
        1) fetch �޴� ������ in Ŀ����
        2) ������� ����
            Ŀ����%notfound => �����Ͱ� ���� ���
            Ŀ����%found
            Ŀ����%count
    4. cursor �ݱ�
        close Ŀ����
*/

declare
    vemp emp%rowtype;
    -- Ŀ�� �����ϴ� ���
    cursor cur is
        select * from emp;

begin
    -- Ŀ�� ����
    OPEN cur;
    -- ������ ����
    loop
        fetch cur into vemp;
        -- �������
        exit when cur%NOTFOUND; --�����Ͱ� ���� ���±��� ���� ����
        DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
        
    end loop;
    close cur;
end;
/

-- cursor�� for������ ����(���� ���� ���Ǵ� ���)
declare
    vemp emp%rowtype;
    cursor cur is
        select * from emp; -- ����� ����� cursor�� ÷��(join, subquery)
begin
    /*
        vemp = EmpVO
        cursor = ArrayList
        
        for(EmpVO vo:list)
    */
    for vemp in cur loop
    DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
    end loop;
end;
/

-- join�� �����͸� ���� => for�� �̿��ؼ� ���
declare
    type empDept IS RECORD(
        empno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        dname emp.empno%type,
        loc dept.loc%type
    );
    ed empDept;
    -- Ŀ������
    cursor cur is
        select empno, ename, job, dname,loc
        from emp,dept
        where emp.deptno=dept.deptno;

begin
    -- ����
    for ed IN cur LOOP
        dbms_output.put_line(ed.empno||' '||ed.ename||' '||ed.job||' '||ed.dname||' '||ed.loc);
    end loop;
end;
/

-- �Լ�, ���ν���, Ʈ���� => �����Ҷ� ���Ǵ� ��� => ó�������� sql => pl/sql
-- 270 page ���ν��� ���







