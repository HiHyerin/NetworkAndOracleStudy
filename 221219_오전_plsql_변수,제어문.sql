set serveroutput on;
-- 스칼라변수
-- 초기값 설정
DECLARE -- 임시로
-- 변수가 선언되는 위치 => 지역변수 , 매개변수
-- CREATE FUNCTION
-- CREATE PROCEDURE
-- CREATE TRIGGER           ->  declare 대신 들어감
pEmpno NUMBER(4):=10; -- 초기값 줄 때 쓰는 형식 (:=)
pEname VARCHAR2(34); -- 초기화를 줄수도 있고 안줄수도 있다.
pJob VARCHAR2(20);
pHiredate DATE;
pSal NUMBER(7,2);

BEGIN
-- 구현부 (SQL)
    SELECT empno,ename,job,hiredate,sal INTO pEmpno,pEname,pJob,pHiredate,pSal
    FROM emp
    WHERE empno=7788;
    -- select를 통해서 변수의 값 초기화 => 한개의 row / 여러개 row를 가져올 땐(cursor)
    DBMS_OUTPUT.PUT_LINE('-------------결과------------');
    DBMS_OUTPUT.PUT_LINE('사번:'||pEmpno);
    DBMS_OUTPUT.PUT_LINE('이름:'||pEname);
    DBMS_OUTPUT.PUT_LINE('직위:'||pJob);
    DBMS_OUTPUT.PUT_LINE('입사일:'||pHiredate);
    DBMS_OUTPUT.PUT_LINE('급여:' ||pSal);
END;
/
/*
    create or replace procedure pro_name(
        매개변수 
    )
    is
        => 지역변수 선언부
    -------------------------
    begin
        구현부
    -------------------------
    end;
    =========================================
    create or replace function func_name(
        매개변수
    ) return 데이터형
    is
        지역변수
    begin
        구현
        return 값 ------------------ex) length(문자열) => 개수(리턴값)
    end;
    /
    ==============================================================
    create or replace trigger tri_name
    is
        지역변수
    begin
        구현부
        => 이미 존재하면 : update
        => 존재하지 않으면 : insert


    create or replace trigger tri_name( ----- 매개변수 ---- )
    create or replace trigger tri_name IS ----- 지역변수 ----
    
    ===============================
    매개변수가 없는 이유 (자바에서 호출하지 않는다) => 자동호출
    create or replace trigger tri_name
    => insert|update|delete on(테이블명)
        is
            지역변수
        begin 
            구현부
                => 이미 존재하면 : update
                => 존재하지 않으면 : insert
        end;
        /
                
*/

-- 실제 테이블의 컬럼데이터형 읽기 : %TYPE
DECLARE
-- 변수 선언 위치
vEmpno emp.empno%type;
vEname emp.ename%type;
vJob emp.job%type;
vDname dept.dname%type;
vLoc dept.loc%type;
vGrade salgrade.grade%type;
BEGIN
-- 구현부
    select empno, ename,job,dname,loc,grade INTO vEmpno,vEname,vJob,vDname,vLoc,vGrade
    from emp join dept
    on emp.deptno=dept.deptno
    join salgrade
    on sal between losal and hisal
    where empno=7788;
    
    --결과값 출력 -> 나중에 함수가 됨
    DBMS_OUTPUT.PUT_LINE('-------------결과------------');
    DBMS_OUTPUT.PUT_LINE('사번:'||vEmpno);
    DBMS_OUTPUT.PUT_LINE('이름:'||vEname);
    DBMS_OUTPUT.PUT_LINE('직위:'||vJob);
    DBMS_OUTPUT.PUT_LINE('부서명:'||vDname);
    DBMS_OUTPUT.PUT_LINE('근무지:'||vLoc);
    DBMS_OUTPUT.PUT_LINE('호봉:'||vGrade);
END;
/



-- 테이블 전체의 데이터형 받기
select*from emp;
-- %rowtype => 자바(~vo) : 한명에 대한 모든 정보 / 단점 : 테이블 한개만 사용 가능(JOIN 불가능) -> 여러개 테이블을 사용하여 가져오고 싶음 사용자 정의 ROWTYPE(=RECORD)
declare
 -- 변수선언 위치
 vEmp emp%ROWTYPE; -- 데이터형이 다 들어옴(8개 변수 전체가 들어옴)
 BEGIN
  --구현 
  SELECT * INTO vEmp
  FROM emp
  WHERE empno=7900;
  DBMS_OUTPUT.put_line('--------결과--------');
  DBMS_OUTPUT.PUT_LINE('사번:'||vEmp.empno);
  DBMS_OUTPUT.PUT_LINE('이름:'||vEmp.ename);
  DBMS_OUTPUT.PUT_LINE('직위:'||vEmp.job);
  DBMS_OUTPUT.PUT_LINE('사수번호:'||vEmp.mgr);
  DBMS_OUTPUT.PUT_LINE('입사일:'||vEmp.hiredate);
  DBMS_OUTPUT.PUT_LINE('급여:'||vEmp.sal);
  DBMS_OUTPUT.PUT_LINE('성과급:'||vEmp.comm);
  DBMS_OUTPUT.PUT_LINE('부서번호:'||vEmp.deptno);
 END;
 /
 
 
 -- join,subquery => 다른테이블 연결 => %rowtype을 사용할 수 없다 => 사용자 정의 데이터형 사용
 -- record
 /*
 record 사용방법
 type record명 is record(
    변수설정 ...
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
    -- 변수선언
    ed empDept;
    
begin
    select empno,ename,job,hiredate,dname,loc into ed
    from emp,dept
    where emp.deptno=dept.deptno
    and empno=7902;
  DBMS_OUTPUT.put_line('--------결과--------');
  DBMS_OUTPUT.PUT_LINE('사번:'||ed.empno);
  DBMS_OUTPUT.PUT_LINE('이름:'||ed.ename);
  DBMS_OUTPUT.PUT_LINE('직위:'||ed.job);
  DBMS_OUTPUT.PUT_LINE('입사일:'||ed.hiredate);
  DBMS_OUTPUT.PUT_LINE('부서명:'||ed.dname);
  DBMS_OUTPUT.PUT_LINE('근무지:'||ed.loc);

end;
/

-- 제어문 : record(group by, join, subquery)
/*
    제어문

    *if (단일조건문)
        형식)
            if 조건문 then
                실행문장 => 조건이 true일 때만 사용
            end if;
*/
DECLARE
    --스칼라변수
    vEmpno NUMBER(4):=0;
    vEname varchar2(34):=' ';
    vJob varchar2(20):=' ';
    vDname varchar2(20):=' ';
    vLoc varchar2(20):=' ';
    vDeptno number(3):=0;   
    
BEGIN
    -- 실제 데이터값을 읽어서 변수에 대입
    -- pl/sql에서만 가능(into)
    select empno,ename,job,deptno into vEmpno,vEname,vJob,vDeptno
    from emp
    where empno=&empno; --입력값 받기(&)
    
    if vDeptno=10 then
        vDname:='영업부';
    end if;
    
     if vDeptno=20 then
        vDname:='개발부';
    end if;
    
     if vDeptno=30 then
        vDname:='자재부';
    end if;
    
    if vDeptno=40 then
        vDname:='신입';
    end if;
    
    dbms_output.put_line('======결과=======');
    dbms_output.put_line('사번:'||vEmpno);
    dbms_output.put_line('이름'||vEname);
    dbms_output.put_line('직위'||vJob);
    dbms_output.put_line('부서명'||vDname);
    dbms_output.put_line('부서번호'||vDeptno);
END;
/

/*   
    * if~else(선택조건문)
        형식)
            if 조건문 then
                실행문장(true일때)
            else
                실행문장(false일때)
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
                dbms_output.put_line(vEname||'님의 급여는 '||vSal||'이고 성과급은 '||vComm||'이며 총급여는 '||vTotal||'입니다');
            else
                dbms_output.put_line(vEname||'님의 급여는 '||vSal||'이고 성과급은 없고 '||vComm||'이며 총급여는 '||vTotal||'입니다');
            end if;
        end;
        /
    /*
    * if ~ elsif ~ elsif ~ else(다중 조건문)
        형식) -> 한개의 문장만 수행 (전체를 한문장으로 본다, 독립적이 아니다)
            if 조건문 then
                처리문장
            if 조건문 then
                처리문장
            if 조건문 then
                처리문장
            else
                처리문장
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
            vDname:='영업부';
        elsif vDeptno=20 then
            vDname:='기획부';
        elsif vDeptno=30 then
            vDname:='자재부';
        else
            vDname:='신입';
        end if;
        
        dbms_output.put_line('---결과---');
        dbms_output.put_line('이름: '||vEname);
        dbms_output.put_line('부서명: '||vDeptno);
    End;
    ---------------------------------------
   
   /*
    * 반복문
        basic ~ loop
        while ~ loop
        for(REVERSE) ~ loop => 일반 FOR, ForEach구문이 있다.(무조건 증가만 가능)
            -------
            역으로 출력
        1. 기본반복문
            형식)
                loop
                 반복처리문장
                 exit [조건] => 종료
                end loop
        2. while
            형식)
                while 조건 loop
                    반복처리문장
                end loop;
        3. for
            형식)
                for 변수 in [reserve] low..hi loop (.. : 범위지정)
                    처리문장
                end loop
            예)
                for i in 1..9
                    출력
                end loop ===>1~9
            
    * 변수 => CURSOR


*/

-- 선택문 switch ~ case => case
declare
    vEname emp.ename%type;
    vDeptno emp.deptno%type;
    vDname dept.dname%type;
    
begin
    select ename,deptno into vEname, vDeptno
    from emp
    where empno=7788;
    
    vDname:=case vDeptno
        when 10 then '개발부'
        when 20 then '영업부'
        when 30 then '기힉부'
        else
            '신입'
        end;
    
        dbms_output.put_line('---결과---');
        dbms_output.put_line('이름:'||vEname);
        dbms_output.put_line('부서명:'||vDeptno);

end;
    
-- loop 실행 (do~while) => 후조건(무조건 1개 이상의 문장을 수행)
declare
    sno number:=1;
    eno number:=10;
begin
    loop
     -- 실행문장
     dbms_output.put_line(sno);
     --증가식
     sno:=sno+1;
     -- 종료하는 조건식
     exit when sno>eno;
     end loop;
end;
/

-- while
declare 
    no number:=1;
begin
    while no<=10 loop
    -- 반복 수행문장
     dbms_output.put_line(no);
     -- 증가식
     no:=no+1;
    end loop;
end;

-- for
declare -- 변수 필요 없으면 생략 가능
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

--1~100 짝수의 합, 홀수의 합, 전체합
declare
    total number:=0;
    even number:=0;
    odd number:=0;
begin
    -- 구현부
    for i in 1..100 loop
        total:=total+i; -- total +=i
        if mod(i,2)=0 then
            even:=even+i;
        end if;
        if mod(i,2)<>0 then
            odd:=odd+i;
        end if;
    end loop;
    dbms_output.put_line('--결과값---');
    dbms_output.put_line('1~100까지 총합:'||total);
    dbms_output.put_line('1~100까지 짝수합:'||even);
    dbms_output.put_line('1~100까지 홀수합:'||odd);
    
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








