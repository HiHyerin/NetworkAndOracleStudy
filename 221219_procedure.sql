-- 프로시저
-- 리턴형이 없는 함수
-- 자바의 메소드는 프로시저에 해당 => PL
-- ex) 댓글
/*
    = 재사용이 가능한 함수(웹)
                       -- : 게시판, 목록, 페이징, 댓글, 예매, 추천 ...
    = ERP : 관리 프로그램(실무 => erp) - 어드민
*/

drop table student;

create table student(
    hakbun number,
    name varchar2(34) constraint std_name_nn NOT NULL,
    kor number(3),
    eng number(3),
    math number(3),
    constraint std_hak_pk Primary key(hakbun),
    constraint std_kor_ck check(kor>0),
    constraint std_eng_ck check(eng>0),
    constraint std_math_ck check(math>0)
);

-- insert
/*
    IN : INSERT, UPDATE, DELETE : 값을 대입할 때 사용되는 변수 => 일반변수(Call By Value)
        => 메모리 주소가 생성할 때마다 달라진다.
    OUT : SELECT => 값을 매개변수를 이용해서 가지고 오는 변수 => 참조변수(call by reference)
        => 같은 메모리 주소를 이용한다
    ** 오라클 => c언어로 만들어진다(포인터)
    
    int a=10;
    void aaa(int* p)
    {
        *p=100;
    }
*/
create or replace procedure studentInsert(
    pName in student.name%type, -- in 생략 가능
    pKor student.kor%type,
    pEng student.eng%type,
    pMath student.math%type
)
is
    pMax NUMBER:=0;
begin
    SELECT NVL(MAX(hakbun)+1,1) into pMax
    from student;
    
    insert into student values(pMax,pName,pKor,pEng,pMath);
    commit;
end;
/

-- 첨부
call studentInsert('홍길동',90,70,80);
call studentInsert('심청이',90,70,80);
select * from student;


-- update
create or replace procedure studentUpdate(
    pHakbun in student.hakbun%type,
    pName in student.name%type, -- in 생략 가능
    pKor student.kor%type,
    pEng student.eng%type,
    pMath student.math%type
)
is
begin
    update student set
    name=pName,kor=pKor,eng=pEng,math=pMath
    where hakbun=pHakbun;
    commit;--반드시
end;
/

call studentUpdate(1,'홍길동',100,90,80);
select * from student;
-- delete
create or replace procedure studentDelete(
    pHakbun in student.hakbun%type -- 값 대입할 땐 in(생략가능)
)
is
begin
    delete from student
    where hakbun=pHakbun;
    commit;
end;
/

call studentDelete(1);
select * from student;



-- select (어렵)
set serveroutput on;
create or replace procedure studentDetailData( -- (out은 생략이 안됨)
    pHakbun student.hakbun%type, -- in 생략
    pName out student.name%type,
    pKor out student.kor%type,
    pEng out student.eng%type,
    pMath out student.math%type,
    pTotal out number,
    pAvg out number
)
is
begin
    select name,kor,eng,math,(kor+eng+math),ROUND((kor+eng+math)/3) into pName,pKor,pEng,pMath,pTotal,pAvg
    FROM student
    where hakbun=pHakbun;
    
    dbms_output.put_line(pName);
    dbms_output.put_line(pKor);
    dbms_output.put_line(pEng);
    dbms_output.put_line(pMath);
    dbms_output.put_line(pTotal);
    dbms_output.put_line(pAvg);
    
end;
/

variable pName varchar2(34);
variable pKor number;
variable pEng number;
variable pMath number;
variable pTotal number;
variable pAvg number;

---------------------------------
call studentDetailData(2,:pName,:pKor,:pEng,:pMath,:pTotal,:pAvg); --: = 주소
print pName;
print pKor; 
-------------------------------->> 오류남


create or replace procedure studentListData(
    pResult OUT SYS_REFCURSOR
)
is
begin
    OPEN pResult For
        SELECT * FROM student;
end;
/

select * from student;