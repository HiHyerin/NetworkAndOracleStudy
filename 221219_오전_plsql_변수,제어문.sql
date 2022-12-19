set serveroutput on;
-- ��Į�󺯼�
-- �ʱⰪ ����
DECLARE -- �ӽ÷�
-- ������ ����Ǵ� ��ġ => �������� , �Ű�����
-- CREATE FUNCTION
-- CREATE PROCEDURE
-- CREATE TRIGGER           ->  declare ��� ��
pEmpno NUMBER(4):=10; -- �ʱⰪ �� �� ���� ���� (:=)
pEname VARCHAR2(34); -- �ʱ�ȭ�� �ټ��� �ְ� ���ټ��� �ִ�.
pJob VARCHAR2(20);
pHiredate DATE;
pSal NUMBER(7,2);

BEGIN
-- ������ (SQL)
    SELECT empno,ename,job,hiredate,sal INTO pEmpno,pEname,pJob,pHiredate,pSal
    FROM emp
    WHERE empno=7788;
    -- select�� ���ؼ� ������ �� �ʱ�ȭ => �Ѱ��� row / ������ row�� ������ ��(cursor)
    DBMS_OUTPUT.PUT_LINE('-------------���------------');
    DBMS_OUTPUT.PUT_LINE('���:'||pEmpno);
    DBMS_OUTPUT.PUT_LINE('�̸�:'||pEname);
    DBMS_OUTPUT.PUT_LINE('����:'||pJob);
    DBMS_OUTPUT.PUT_LINE('�Ի���:'||pHiredate);
    DBMS_OUTPUT.PUT_LINE('�޿�:' ||pSal);
END;
/
/*
    create or replace procedure pro_name(
        �Ű����� 
    )
    is
        => �������� �����
    -------------------------
    begin
        ������
    -------------------------
    end;
    =========================================
    create or replace function func_name(
        �Ű�����
    ) return ��������
    is
        ��������
    begin
        ����
        return �� ------------------ex) length(���ڿ�) => ����(���ϰ�)
    end;
    /
    ==============================================================
    create or replace trigger tri_name
    is
        ��������
    begin
        ������
        => �̹� �����ϸ� : update
        => �������� ������ : insert


    create or replace trigger tri_name( ----- �Ű����� ---- )
    create or replace trigger tri_name IS ----- �������� ----
    
    ===============================
    �Ű������� ���� ���� (�ڹٿ��� ȣ������ �ʴ´�) => �ڵ�ȣ��
    create or replace trigger tri_name
    => insert|update|delete on(���̺��)
        is
            ��������
        begin 
            ������
                => �̹� �����ϸ� : update
                => �������� ������ : insert
        end;
        /
                
*/

-- ���� ���̺��� �÷��������� �б� : %TYPE
DECLARE
-- ���� ���� ��ġ
vEmpno emp.empno%type;
vEname emp.ename%type;
vJob emp.job%type;
vDname dept.dname%type;
vLoc dept.loc%type;
vGrade salgrade.grade%type;
BEGIN
-- ������
    select empno, ename,job,dname,loc,grade INTO vEmpno,vEname,vJob,vDname,vLoc,vGrade
    from emp join dept
    on emp.deptno=dept.deptno
    join salgrade
    on sal between losal and hisal
    where empno=7788;
    
    --����� ��� -> ���߿� �Լ��� ��
    DBMS_OUTPUT.PUT_LINE('-------------���------------');
    DBMS_OUTPUT.PUT_LINE('���:'||vEmpno);
    DBMS_OUTPUT.PUT_LINE('�̸�:'||vEname);
    DBMS_OUTPUT.PUT_LINE('����:'||vJob);
    DBMS_OUTPUT.PUT_LINE('�μ���:'||vDname);
    DBMS_OUTPUT.PUT_LINE('�ٹ���:'||vLoc);
    DBMS_OUTPUT.PUT_LINE('ȣ��:'||vGrade);
END;
/



-- ���̺� ��ü�� �������� �ޱ�
select*from emp;
-- %rowtype => �ڹ�(~vo) : �Ѹ� ���� ��� ���� / ���� : ���̺� �Ѱ��� ��� ����(JOIN �Ұ���) -> ������ ���̺��� ����Ͽ� �������� ���� ����� ���� ROWTYPE(=RECORD)
declare
 -- �������� ��ġ
 vEmp emp%ROWTYPE; -- ���������� �� ����(8�� ���� ��ü�� ����)
 BEGIN
  --���� 
  SELECT * INTO vEmp
  FROM emp
  WHERE empno=7900;
  DBMS_OUTPUT.put_line('--------���--------');
  DBMS_OUTPUT.PUT_LINE('���:'||vEmp.empno);
  DBMS_OUTPUT.PUT_LINE('�̸�:'||vEmp.ename);
  DBMS_OUTPUT.PUT_LINE('����:'||vEmp.job);
  DBMS_OUTPUT.PUT_LINE('�����ȣ:'||vEmp.mgr);
  DBMS_OUTPUT.PUT_LINE('�Ի���:'||vEmp.hiredate);
  DBMS_OUTPUT.PUT_LINE('�޿�:'||vEmp.sal);
  DBMS_OUTPUT.PUT_LINE('������:'||vEmp.comm);
  DBMS_OUTPUT.PUT_LINE('�μ���ȣ:'||vEmp.deptno);
 END;
 /
 
 
 -- join,subquery => �ٸ����̺� ���� => %rowtype�� ����� �� ���� => ����� ���� �������� ���
 -- record
 /*
 record �����
 type record�� is record(
    �������� ...
);
 
 */
 
 declare 
    type empdept is record(
        empno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        hiredate emp.hiredate%type,
        dname dept.dname%type,
        loc dept.loc%type
    );
    -- ��������
    ed empDept;
    
begin
    select empno,ename,job,hiredate,dname,loc into ed
    from emp,dept
    where emp.deptno=dept.deptno
    and empno=7902;
  DBMS_OUTPUT.put_line('--------���--------');
  DBMS_OUTPUT.PUT_LINE('���:'||ed.empno);
  DBMS_OUTPUT.PUT_LINE('�̸�:'||ed.ename);
  DBMS_OUTPUT.PUT_LINE('����:'||ed.job);
  DBMS_OUTPUT.PUT_LINE('�Ի���:'||ed.hiredate);
  DBMS_OUTPUT.PUT_LINE('�μ���:'||ed.dname);
  DBMS_OUTPUT.PUT_LINE('�ٹ���:'||ed.loc);

end;
/

-- ��� : record(group by, join, subquery)
/*
    ���

    *if (�������ǹ�)
        ����)
            if ���ǹ� then
                ���๮�� => ������ true�� ���� ���
            end if;
*/
DECLARE
    --��Į�󺯼�
    vEmpno NUMBER(4):=0;
    vEname varchar2(34):=' ';
    vJob varchar2(20):=' ';
    vDname varchar2(20):=' ';
    vLoc varchar2(20):=' ';
    vDeptno number(3):=0;   
    
BEGIN
    -- ���� �����Ͱ��� �о ������ ����
    -- pl/sql������ ����(into)
    select empno,ename,job,deptno into vEmpno,vEname,vJob,vDeptno
    from emp
    where empno=&empno; --�Է°� �ޱ�(&)
    
    if vDeptno=10 then
        vDname:='������';
    end if;
    
     if vDeptno=20 then
        vDname:='���ߺ�';
    end if;
    
     if vDeptno=30 then
        vDname:='�����';
    end if;
    
    if vDeptno=40 then
        vDname:='����';
    end if;
    
    dbms_output.put_line('======���=======');
    dbms_output.put_line('���:'||vEmpno);
    dbms_output.put_line('�̸�'||vEname);
    dbms_output.put_line('����'||vJob);
    dbms_output.put_line('�μ���'||vDname);
    dbms_output.put_line('�μ���ȣ'||vDeptno);
END;
/

/*   
    * if~else(�������ǹ�)
        ����)
            if ���ǹ� then
                ���๮��(true�϶�)
            else
                ���๮��(false�϶�)
            end if;
            */
            
        declare
            vEname emp.ename%type:=' ';
            vComm emp.comm%type:=0;
            vSal emp.sal%type:=0;
            vTotal number(7,2):=0;
        begin
            select ename,comm,sal,sal+nvl(comm,0) into vEname,vComm,vSal,vTotal
            from emp
            where empno=&empno;
            
            if vComm>0 then
                dbms_output.put_line(vEname||'���� �޿��� '||vSal||'�̰� �������� '||vComm||'�̸� �ѱ޿��� '||vTotal||'�Դϴ�');
            else
                dbms_output.put_line(vEname||'���� �޿��� '||vSal||'�̰� �������� ���� '||vComm||'�̸� �ѱ޿��� '||vTotal||'�Դϴ�');
            end if;
        end;
        /
    /*
    * if ~ elsif ~ elsif ~ else(���� ���ǹ�)
        ����) -> �Ѱ��� ���常 ���� (��ü�� �ѹ������� ����, �������� �ƴϴ�)
            if ���ǹ� then
                ó������
            if ���ǹ� then
                ó������
            if ���ǹ� then
                ó������
            else
                ó������
            end if;
            */
            
--          =================================
--            ==================================
    declare
        vEname emp.ename%type;
        vDname dept.dname%type;
        vDeptno emp.deptno%type;
    Begin
        select ename,deptno into vEname,vDeptno
        from emp
        where empno=7902;
        
        if vDeptno=10 then
            vDname:='������';
        elsif vDeptno=20 then
            vDname:='��ȹ��';
        elsif vDeptno=30 then
            vDname:='�����';
        else
            vDname:='����';
        end if;
        
        dbms_output.put_line('---���---');
        dbms_output.put_line('�̸�: '||vEname);
        dbms_output.put_line('�μ���: '||vDeptno);
    End;
    ---------------------------------------
   
   /*
    * �ݺ���
        basic ~ loop
        while ~ loop
        for(REVERSE) ~ loop => �Ϲ� FOR, ForEach������ �ִ�.(������ ������ ����)
            -------
            ������ ���
        1. �⺻�ݺ���
            ����)
                loop
                 �ݺ�ó������
                 exit [����] => ����
                end loop
        2. while
            ����)
                while ���� loop
                    �ݺ�ó������
                end loop;
        3. for
            ����)
                for ���� in [reserve] low..hi loop (.. : ��������)
                    ó������
                end loop
            ��)
                for i in 1..9
                    ���
                end loop ===>1~9
            
    * ���� => CURSOR


*/

-- ���ù� switch ~ case => case
declare
    vEname emp.ename%type;
    vDeptno emp.deptno%type;
    vDname dept.dname%type;
    
begin
    select ename,deptno into vEname, vDeptno
    from emp
    where empno=7788;
    
    vDname:=case vDeptno
        when 10 then '���ߺ�'
        when 20 then '������'
        when 30 then '������'
        else
            '����'
        end;
    
        dbms_output.put_line('---���---');
        dbms_output.put_line('�̸�:'||vEname);
        dbms_output.put_line('�μ���:'||vDeptno);

end;
    
-- loop ���� (do~while) => ������(������ 1�� �̻��� ������ ����)
declare
    sno number:=1;
    eno number:=10;
begin
    loop
     -- ���๮��
     dbms_output.put_line(sno);
     --������
     sno:=sno+1;
     -- �����ϴ� ���ǽ�
     exit when sno>eno;
     end loop;
end;
/

-- while
declare 
    no number:=1;
begin
    while no<=10 loop
    -- �ݺ� ���๮��
     dbms_output.put_line(no);
     -- ������
     no:=no+1;
    end loop;
end;

-- for
declare -- ���� �ʿ� ������ ���� ����
begin
  for i in reverse 1..10 loop
  dbms_output.put_line(i);
  end loop;
end;
/


begin
    for i in 1..10 loop
        if mod(i,2)=0 then
            dbms_output.put_line(i);
        end if;
    end loop;
end;
/

--1~100 ¦���� ��, Ȧ���� ��, ��ü��
declare
    total number:=0;
    even number:=0;
    odd number:=0;
begin
    -- ������
    for i in 1..100 loop
        total:=total+i; -- total +=i
        if mod(i,2)=0 then
            even:=even+i;
        end if;
        if mod(i,2)<>0 then
            odd:=odd+i;
        end if;
    end loop;
    dbms_output.put_line('--�����---');
    dbms_output.put_line('1~100���� ����:'||total);
    dbms_output.put_line('1~100���� ¦����:'||even);
    dbms_output.put_line('1~100���� Ȧ����:'||odd);
    
end;
/

declare
    dan number:=&dan;
    result VARCHAR2(100):=' ';
BEGIN
  FOR i IN 1..9 loop
    result:=dan||'*'||i||'='||(dan*i);
    dbms_output.put_line(result);
  end loop;
END;








