-- ���ν���
-- �������� ���� �Լ�
-- �ڹ��� �޼ҵ�� ���ν����� �ش� => PL
-- ex) ���
/*
    = ������ ������ �Լ�(��)
                       -- : �Խ���, ���, ����¡, ���, ����, ��õ ...
    = ERP : ���� ���α׷�(�ǹ� => erp) - ����
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
    IN : INSERT, UPDATE, DELETE : ���� ������ �� ���Ǵ� ���� => �Ϲݺ���(Call By Value)
        => �޸� �ּҰ� ������ ������ �޶�����.
    OUT : SELECT => ���� �Ű������� �̿��ؼ� ������ ���� ���� => ��������(call by reference)
        => ���� �޸� �ּҸ� �̿��Ѵ�
    ** ����Ŭ => c���� ���������(������)
    
    int a=10;
    void aaa(int* p)
    {
        *p=100;
    }
*/
create or replace procedure studentInsert(
    pName in student.name%type, -- in ���� ����
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

-- ÷��
call studentInsert('ȫ�浿',90,70,80);
call studentInsert('��û��',90,70,80);
select * from student;


-- update
create or replace procedure studentUpdate(
    pHakbun in student.hakbun%type,
    pName in student.name%type, -- in ���� ����
    pKor student.kor%type,
    pEng student.eng%type,
    pMath student.math%type
)
is
begin
    update student set
    name=pName,kor=pKor,eng=pEng,math=pMath
    where hakbun=pHakbun;
    commit;--�ݵ��
end;
/

call studentUpdate(1,'ȫ�浿',100,90,80);
select * from student;
-- delete
create or replace procedure studentDelete(
    pHakbun in student.hakbun%type -- �� ������ �� in(��������)
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



-- select (���)
set serveroutput on;
create or replace procedure studentDetailData( -- (out�� ������ �ȵ�)
    pHakbun student.hakbun%type, -- in ����
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
call studentDetailData(2,:pName,:pKor,:pEng,:pMath,:pTotal,:pAvg); --: = �ּ�
print pName;
print pKor; 
-------------------------------->> ������


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