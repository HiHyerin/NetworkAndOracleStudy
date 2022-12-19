-- cursor ==> 자바매칭 클래스(ResultSet)
-- cursor을 이용하게 되면 여러명을 동시에 출력 가능(ArrayList)
-- 자바에 목록 출력할 때 => cursor만 이용한다
/*
    1. cursor 설정
        cursor 커서명 is
            select~~=> 실행된 결과값을 가지고 있다.
    2. cursor 열기
        open 커서명;
    3. loop(인출)
        1) fetch 받는 변수명 in 커서명
        2) 종료시점 설정
            커서명%notfound => 데이터가 없는 경우
            커서명%found
            커서명%count
    4. cursor 닫기
        close 커서명
*/

declare
    vemp emp%rowtype;
    -- 커서 설정하는 방법
    cursor cur is
        select * from emp;

begin
    -- 커서 열기
    OPEN cur;
    -- 데이터 인출
    loop
        fetch cur into vemp;
        -- 종료시점
        exit when cur%NOTFOUND; --데이터가 없는 상태까지 루프 수행
        DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
        
    end loop;
    close cur;
end;
/

-- cursor을 for문으로 제어(가장 많이 사용되는 방법)
declare
    vemp emp%rowtype;
    cursor cur is
        select * from emp; -- 실행된 결과를 cursor에 첨부(join, subquery)
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

-- join된 데이터를 저장 => for을 이용해서 출력
declare
    type empDept IS RECORD(
        empno emp.empno%type,
        ename emp.ename%type,
        job emp.job%type,
        dname emp.empno%type,
        loc dept.loc%type
    );
    ed empDept;
    -- 커서설정
    cursor cur is
        select empno, ename, job, dname,loc
        from emp,dept
        where emp.deptno=dept.deptno;

begin
    -- 구현
    for ed IN cur LOOP
        dbms_output.put_line(ed.empno||' '||ed.ename||' '||ed.job||' '||ed.dname||' '||ed.loc);
    end loop;
end;
/

-- 함수, 프로시저, 트리거 => 제작할때 사용되는 언어 => 처리문장은 sql => pl/sql
-- 270 page 프로시저 방법







