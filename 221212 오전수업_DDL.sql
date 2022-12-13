-- 221212
-- p. 179 DDL(데이터 정의 언어)
/*
    DQL
        SELECT
    DML
        INSERT, UPDATE, DELETE
    DDL
        CREATE, ALTER, DROP, TRUNCATE
    DCL
        GRANT, REVOKE
    TCL
        COMMIT, ROLLBACK
        
-- 이번주 목표 DML, DDL
    * DDL
        - 생성(Table : 데이터 저장장소)
        - View : 가상테이블
        - Index : 최적화(검색속도 향상)
        - Sequence : 자동증가번호 => 중복없는 데이터 ex) MAX() + 1
        - PL/SQL => Function, Procedure, Trigger
    
    Table : 데이터 저장 장소 만들기
        1. 데이터형
            문자형
                CHAR(1~2000byte) -> 고정바이트 (글자수가 동일할 때 ex) 남자/여자, y/n
                                 -> CHAR(10)
                                    저장데이터 'A'만 있어도 무조건 10byte 취급(메모리 누수현상 빈번)
                                    A \0 \0 \0 \0 \0 \0 \0 \0 \0 => 무조건 10byte(고정형)
                VARCHAR2 (1~4000byte) =====> default
                    -> 가변 바이트
                    -> VARCHAR2(10)
                        10byte 이내에 메모리 할당 가능
                        저장데이터 'A' = 1byte만 할당
                    -> 크기를 약간 늘려서 잡는게 좋다.
                    -> 단점 : 오라클에서만 사용 가능
                CLOB (4gb)
                    -> 가변 바이트 (문자열만 저장)
                    -> 줄거리, 회사소개, 자소서 등과 같은 글자가 많이 쓰이는 것에 사용
                --------------------------------------------------------------- String
            숫자형
                NUMBER(38) => 38자리 수, int, long형
                NUMBER(4) => 저장 가능한 데이터 => 0~9999
                NUMBER => 8자리 저장 NUMBER = NUMBER(8,2) : 정수 6자리에 소수점 두개
                NUMBER(7,2) => 정수 5자리, 소수점 두자리
                            => 무조건 실수를 저장하는 것은 아니다.(정수만 저장해도 된다)
                    -> 저장된 데이터가 실수면 double, 정수면 int
            날짜형
                DATE -- default
                TIMESTAMP : 기록경기 (우리쪽은 잘 안씀)
            기타형
                -> 동영상, 이미지(로고), 증명사진...
                -> BLOB(2진파일=헥사파일), 
                -> BFILE(file형식으로 저장) 요즘 잘 안씀 대신, 폴더에 저장 후 파일을 읽어서 출력하는 방식
                -> HTML의 링크를 이용(원격)
                
        1-1. 테이블명(식별자)
            1) 같은 데이터베이스(XE)에서는 같은 이름의 테이블을 만들 수 없다.
            2) 문자로 시작(알파벳, 한글) -> 권장사항은 알파벳(운영체제마다 한글을 읽는 방식이 다르다)
                                      -> 알파벳을 사용시에 대소문자 구분이 없다
                                      -> *** 실제 오라클에 저장될 떄 대문자로 저장이 된다(실제 테이블의 형식을 읽을 때 대문자 사용)
                                            ex) WHERE table_name ='emp' -> 데이터 형식 못불러옴
                                                WHERE table_name='EMP' -> 데이터 형식 불러옴
            3) 테이블명(30) => 15자 : 테이블명 컬럼명은 동일 할 수 있다.
            4) 숫자 사용 가능(단, 앞에 사용 금지)
            5) 키워드는 사용할 수 없다(SELECT, INSERT...)
            6) 특수문자 사용 가능( _ )
            
        2. 제약조건 : 이상현상 방지(프로그램에 필요한 데이터만 저장), 무조건 사용하는 것은 아니다
                    -------- 수정, 삭제 => 원하지 않는 데이터가 수정, 삭제 될 수 있다.
                    ex) 
                        id name sex
                        aaa hong man
                        aaa shim woman
                        ---------------- DELETE FROM member WHERE id='aaa' => 이상현상 발생
                1) NOT NULL : NULL 을 허용하지 않는다 (무조건 데이터값을 필요로 한다)
                    ex) * 필수입력
                    
                2) UNIQUE : 유일값 (중복이 없는 데이터) 단점) null값 허용
                    ex) 후보키(대체키) -> id(기본키)를 잊어버렸을 경우 이메일,전화번호로 id찾음
                                        이메일이나 전화번호가 없을 수 있기 때문에 null값 허용
                3) PRIMARY KEY
                    기본키 : 정수값, ID -> 중복이 없는 데이터
                    모든 테이블은 Primary Key를 한 개 이상 설정할 것을 권장
                    NOT NULL + UNIQUE
                    게시물 번호 , 영화번호...
                4) FOREING KEY
                    참조키(외래키) : 참조하고 있는 데이터값만 저장
                    ex) 게시판 <-> 댓글  /  영화 <-> 리뷰    --- 다른 테이블과 연결
                5) CHECK
                    지정된 데이터 값만 입력이 가능하게 만든다
                    ex) 부서명, 근무지
                        라디오 박스, 콤보박스
                6) DEFAULT 
                    미리 기본값을 설정한 후에 -> 데이터값이 없는 경우 자동으로 값을 입력
                    ex) regdate DATE DEFAULT SYSDATE
                        hit NUMBER DEFAULT 0
                        
        2-1. TABLE 만들기
            1) 기존의 테이블을 복사 (데이터값+테이블 형태)
                CREATE TABLE table_name
                AS
                SELECT ~
                (SELECT 한 모든 형태를 table_name에 복사해라)
            2) 테이블 형태만 복사
                CREATE TABLE table_name
                AS
                SELECT ~
                WHERE 1=2; -> WHERE문장이 false가 되게 해야함
            3) 사용자 정의(가장 많음)
            ----------------------------------CREATE는 commit을 날리지 않음 (자동으로 됨)
        3. 수정, 삭제, 데이터 자르기
        
        
*/

-- 복사(데이터 값+테이블 형태)
CREATE TABLE myEmp
as
select * from emp;
select * from myEmp;

desc myEmp;

-- 복사(형태만)
create table myEmp2
as
select * from emp
where 1=2;
select * from myEmp2;

-- 삭제
drop table myEmp;
drop table myEmp2;

CREATE TABLE myEmp
as
select Emp.*, dname,loc
from emp,dept
where emp.deptno=dept.deptno;

select * from myEmp;
drop table myEmp; -- 테이블, 값 모두 삭제
DESC myEmp; 
truncate table myEmp; -- 테이블 형태는 유지하고 값만 삭제
/*
    필요 없는 데이터만 삭제 : DELETE => 취소(복구가능)
    전체 데이터만 삭제 : TRUNCATE -> 취소 불가능(복구할 수 없다.)
    테이블 자체 삭제 : DROP => 취소 불가능(복구할 수 없다.)
    => DML(복구가능), DDL(복구할 수 없다) => 백업
*/ 

DESC myEmp;
-- 테이블명 변경 => RENAME old_name To new_name
RENAME myEmp To myEmp2; -- 테이블 이름 변경

/*
    사용자 정의 테이블(p.179)
    형식)
        CREATE TABLE 테이블명(
            컬럼명 데이터형 [제약조건], => 컬럼레벨(컬럼과 동시에 생성) => NOT NULL, DEFAULT
            컬럼명 데이터형 [제약조건],
            컬럼명 데이터형 [제약조건],
            컬럼명 데이터형 [제약조건],
            컬럼명 데이터형 [제약조건],
            [제약조건] => 테이블레벨(테이블이 만들어진 다음에 생성) => PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE
        );
    
    쓰는방식)
        - 약식
            CREATE TABLE member
            (
                id VARCHAR2(20) PRIMARY KEY, -- 중복이 안되고 필수 입력값
                pwd VARCHAR2(10) NOT NULL, -- 반드시 입력
                name VARCHAR2(34) NOT NULL,
                sex CHAR(10) CHECK(sex IN('남','여')
                email VARCHAR2(100) UNIQUE, -- 대체키(NULL값 가능)
                tel VARCHAR2(13) UNIQUE, -- 대체키
                regdate DATE DEFAULT SYSDATE  -- 등록날짜 : 오늘 날짜
            );
            
        - 제약조건에 이름 부여 (권장) : 제약조건만 수정, 삭제 가능 (constraint~~ 약칭)
            CREATE TABLE member
            (
                id VARCHAR2(20),
                pwd VARCHAR2(10) CONSTRAINT member_pwd_nn NOT NULL,
                                           --------------- 중복을 허용하지 않는다.
                                          테이블명_컬럼명_제약조건약자
                                            -> pk (PRIMARY KEY)
                                            -> nn (NOT NULL)
                                            -> fk (FOREIGN KEY)
                                            -> ck (CHECK)
                                            -> uk (UNIQUE)
                name VARCHAR2(34) CONSTRAINT member_name_nn NOT NULL, 
                sex CHAR(10),
                eamil VARCHAR2(100),
                tel VARCHAR2(13)
                regdate DATE DEFAULT SYSDATE,
                CONSTRAINT member_id_pk PRIMARY KEY(id)
                CONSTRAINT member_sex_ck CHECK(sex IN('남','여')),
                CONSTRAINT member_et_uk UNIQUE(email, tel)
            ); -- not null만 컬럼명 옆에 쓰고 나머지는 아래에 쓴다?
            
emp            
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)

dept
DEPTNO NOT NULL NUMBER       
DNAME           VARCHAR2(20) 
LOC             VARCHAR2(20)

        CREATE TABLE dept(
            deptno NUMBER(2),
            dname VARCHAR2(20) CONSTRAINT dept_dname_nn NOT NULL,
            loc VARCHAR2(20) CONSTRAINT dept_loc_nn NOT NULL,
            CONSTRAINT dept_deptno_pk PRIMARY KEY(deptno)
        );
        
        CREATE TABLE emp(
            empno NUMBER(4),
            ENAME             VARCHAR2(10) CONSTRAINT emp_ename_nn NOT NULL,
            JOB               VARCHAR2(9)  CONSTRAINT emp_job_nn NOT NULL,
            MGR               NUMBER(4)    -- null값 허용
            HIREDATE          DATE         DEFAULT SYSDATE,
            SAL               NUMBER(7,2)  CONSTRAINT emp_sal_nn NOT NULL,
            COMM              NUMBER(7,2)  
            DEPTNO            NUMBER(2)
            CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
            CONSTRAINT emp_deptno_fk FOREIGN KEY(deptno)
            REFERENCES dept(deptno) ----- foreign key 설정 방법
        );
    
*/

/*
    게시판 / 댓글 => 웹 등장
    **** 참조되는 테이블 (우선순위로 생성)
    **** 참조하는 테이블
    설계
    V 게시물번호 => NUMBER, 중복이 되지 않는 데이터 pk -> 자동증가(구분자) => MAX()
      이름 => NOT NULL    VARCHAR2
      제목 => NOT NULL    VARCHAR2
      내용 => NOT NULL    CLOB
      비밀번호 => NOT NULL    수정/삭제시 본인 확인
    V 등록일 => DEFAULT SYSDATE
    V 조회수 => DEFAULT 0
   V => 프로그램 안에서 자동으로 처리 되어야 함
*/
desc emp;
SELECT * FROM emp;

CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(34) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(4) CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd  VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    address VARCHAR2(100),
    CONSTRAINT board_no_pk PRIMARY KEY(no)

);

    -- hit 추가
    ALTER TABLE board ADD hit NUMBER DEFAULT 0; -- 자동으로 증가해야함
    DESC board;
    -- subject 글자수 변경
    alter table board modify subject VARCHAR2(4000);
    DESC board;
    -- address 삭제
    alter table board drop column address;
    desc board;
    -- address 제약조건까지 해서 추가
    alter table board add address VARCHAR2(100) CONSTRAINT board_address_nn NOT NULL;
    desc board;
    -- 컬럼명 변경
    alter table board rename column address to email;
    desc board;
    -- 제약조건을 추가하는 경우 : 데이터가 없는 경우에는 문제x
    --                         데이터가 있는 경우 : NOT NULL, PRIMARY KEY, FOREIGN KEY, CHECK는 문제 발생

DROP TABLE board;

-- ALTER : 컬럼을 수정, 삭제, 추가, 제약조건 변경...

/*
    추가: add
    수정 : modify
    삭제 : drop column
    
*/

SELECT * FROM tab; -- 생성되어 있는 테이블 확인

/*
    member
    id => pk
    pwd => nn
    sex => CHECK
    name => nn
    ------------
    address
    tel
    ------------ 추가
    
*/
create table member(
    id VARCHAR2(20),
    pwd varchar2(10) constraint member_pwd_nn NOT NULL,
    sex varchar2(6) ,
    name varchar(34) constraint member_name_nn NOT NULL,
    constraint member_id_pk PRIMARY KEY(id),
    constraint member_sex_ck CHECK(sex IN('남자','여자'))
);

-- 데이터값 추가
insert into member values('aaa','1234','남자','홍길동');
insert into member values('aaa','1234','남자','홍길동'); -- pk값 위반
insert into member values('bbb','','남자','홍길동'); -- not null 위반 
insert into member values('bbb',' ','남자','홍길동'); -- ' ' 공백 인식 하기 때문에 오류x
select * from member;

-- '' (NULL), ' '(공백)
alter table member add address varchar2(100) constraint member_address_nn NOT NULL; -- 오류발생, 데이터가 있는 경우 NOT NULL을 설정했는데 NULL값이 들어가니까 오류
alter table member add address varchar2(100) DEFAULT ' ' constraint member_address_nn NOT NULL; -- 공백으로 내용을 삽입하면 오류X(DEFAULT)

-- 제약조건은 여러개 사용 가능 , 근데 특별한 경우가 아니고선 동시에 사용 잘 안함
-- 데이터 NOT NULL UNIQUE CHECK

DROP table board;

CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(34) ,
    subject VARCHAR2(4000) ,
    content CLOB,
    pwd varchar2(10),
    regdate DATE,
    address VARCHAR2(100)
    );

-- alter를 이용해서 제약조건 추가
-- primary key 추가
ALTER TABLE board ADD CONSTRAINT board_no_pk PRIMARY KEY(no);
alter table board modify name constraint board_name_nn NOT NULL;
desc board;
    -- primary key, foreign key, check, unique => add
    -- not null => modify
    
-- default는 제약조건이 아니다
alter table board modify regdate DATE DEFAULT SYSDATE;

-- 제약조건 삭제
ALTER TABLE board DROP CONSTRAINT board_name_nn; -- name의 not null 제약조건만 삭제

-- 컬럼 순서는 상관 없다 
-- 로그인할 떄 email 또는 아이디 입력 primary key를 두개로 잡아보기
CREATE TABLE member2(
    id varchar2(20),
    name varchar2(30)CONSTRAINT mem_name_nn NOT NULL,
    email varchar2(100),
    pwd varchar2(10) CONSTRAINT mem_pwd_nn NOT NULL,
    constraint member2_id_pk primary key(id),
    constraint member2_email_pk primary key(email)
); -- 이렇게 primary key를 두개씩 잡으면 오류(원래는 primary key는 하나)

CREATE TABLE member2(
    id varchar2(20),
    name varchar2(30)CONSTRAINT mem_name_nn NOT NULL,
    email varchar2(100),
    pwd varchar2(10) CONSTRAINT mem_pwd_nn NOT NULL,
    constraint member2_et_pk primary key(id,email)
); -- 이렇게 하면 primary key를 두개 이상 잡을 수 있다(꼼수) 권장하지는 않음 오류가 날 수 있기 때문에
    -- id, email이 모두 같아야 오류가 남.

-- insert into member2 values('aaa','hong','hong@co.kr','1234');
insert into member2 values('aaa','shim','shim@co.kr','1234');
insert into member2 values('bbb','park','park@co.kr','1234');
insert into member2 values('ccc','kim','park@co.kr','1234');
-- email은 같지만 id가 다르기 때문에 오류가 안남 (제어하기 어려움)
-- 자동 COMMIT되지 않음
-- sql은 COMMIT 후 취소하려면 ROLLBACK but 자바는 commit 하면 끝...? (오전 두번째 영상 1시간 25분쯤..?)

desc member2;

--constraint member2_et_pk primary key(id,email)

insert into member2 values('aaa','hong','','1234');
select * from member2;
delete from member2 where id='aaa'; -- 이상현상(중복 안되는 데이터 필요)
drop table member2;




