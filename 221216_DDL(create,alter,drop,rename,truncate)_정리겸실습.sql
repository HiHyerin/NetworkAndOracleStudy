-- 테이블 (지니뮤직)
-- liked, jjim => alter이용해볼거 (alter 예 : 장바구니, 구매)
create table genie_music(
    mno number , --pk
    cno number(2) constraint gm_cno_nn NOT NULL, -- nn
    title varchar2(200) constraint gm_title_nn NOT NULL, -- nn
    singer varchar2(100)constraint gm_singer_nn NOT NULL,-- nn
    album varchar(200)constraint gm_album_nn NOT NULL,-- nn
    poster varchar2(260) constraint gm_poster_nn NOT NULL,
    state varchar(30), --ck
    idcrement number(3)constraint gm_id_nn NOT NULL,-- nn
    key varchar2(30),
    hit number default 0, -- default 0
    constraint gm_mno_pk Primary key(mno),
    constraint gm_state_ck CHECK(state IN('유지','상승','하강'))
);

-- alter을 이용해서 테이블 수정
/*
alter : 수정, 삭제, 추가 (컬럼, 제약조건, 추가가 가능하다)
컬럼관련
1) 추가
    ALTER TABLE table_name ADD 컬럼명 데이터형 [제약조건]
2) 삭제
    ALTER TABLE table_name DROP COLUMN 컬럼명
3) 수정
    ALTER TABLE table_name MODIFY 컬럼명 데이터형 [제약조건]

제약조건
1) 추가
2) 삭제
3) 수정
*/

-- 자동화 처리(트리거)
ALTER TABLE genie_music ADD liked NUMBER;
ALTER table genie_music ADD jjim NUMBER;

DESC genie_music;

alter table genie_music modify liked default 0 constraint gm_liked_nn NOT NULL;
alter table genie_music modify jjim default 0 constraint gm_jjim_nn NOT NULL;

/*
    웹사이트 => 데이터추출
                => 크기
                => 제약조건
---------------------------------------부가적 추가 : ALTER, 제약조건 : ALTER
*/


-- 테이블(멜론뮤직)
CREATE TABLE melon_music(
mno number,
cno number(2) constraint mm_cno_nn NOT NULL, -- 장르번호
title varchar2(200) constraint mm_title_nn NOT NULL,
singer varchar2(200) constraint mm_singer_nn NOT NULL,
album varchar2(200) constraint mm_album_nn NOT NULL,
poster varchar2(260) constraint mm_poster_nn NOT NULL,
state varchar2(30),
idcrement number(3) constraint mm_id_nn NOT NULL, -- 증감폭
key varchar(30),
hit number default 0,
liked number default 0 constraint mm_liked_nn NOT NULL,
jjim number default 0 constraint mm_jjim_nn NOT NULL,
constraint mm_mno_pk PRIMARY KEY(mno),
constraint mm_state_ck CHECK(state in('유지','상승','하락'))
);

-- 삭제
    DROP TABLE genie_music;
    drop table melon_music;
    rollback;
    desc genie_music;
    
    
-- 이름변경
    RENAME genie_music TO genie;
    desc genie;
    RENAME genie to genie_music;

-- 데이터잘라내기 : 테이블 유지, 데이터만 삭제 : rollback 불가능
-- truncate table table_name
truncate table genie_music;

    
-- 테이블 제작 => 데이터 수집 => dml(select, insert, update, delete)
-- 테이블에 대한 정보 확인
/*
    저장
        1) table : user_talbes
        2) constraint : user_constraints
        3) view : user_views
        *** 모든 명칭이 대문자로 저장되어 있다.
*/


select owner, constraint_name, constraint_type,status
from user_constraints
where table_name='GENIE_MUSIC';

select owner, constraint_name, table_name, column_name
from user_cons_columns
where table_name='GENIE_MUSIC';
---------------------------------------------------------------------같은 결과값
/*
        TYPE
        C  : NOT NULL, CHECK
        P : PRIMARY KEY : 테이블 당 한개만 생성 권장
        R : FOREIGN KEY : primary key, unique 일때만 사용 가능
        U :UNIQUE
*/
-- primary key : 테이블 당 한개만 생성 권장



-- FOREIGN KEY 연습 (참조 테이블의 컬럼이 primary key이거나, unique일때만 가능)
CREATE TABLE test1(
    no number,
    id varchar(20) constraint test1_id_nn NOT NULL,
    name varchar2(34) constraint test1_name_nn  not null,
    sex varchar(20),
    constraint test1_no_pk PRIMARY KEY(no),
    constraint test1_sex_ck CHECK(sex IN('남자','여자')),
    constraint test_id_uk unique(id)
    
    -- id를 포린키에 추가하고 싶을 때 unique로 제약조건을 걸거나 밑에처럼 프라이머리 키를 두 개 설정 그치만 권장 안함
    -- constraint test1_no_pk PRIMARY KEY(no,id)
);

create table test2(
    no number,
    tno number,
    id varchar(20),
    address varchar2(100) constraint test2_addr_nn NOT NULL,
    tel varchar2(20) CONSTRAINT test2_tel_nn  NOT NULL,
    CONSTRAINT test2_no_pk PRIMARY KEY(no),
    constraint test2_tno_fk FOREIGN KEY(tno)
    references test1(no) ON DELETE CASCADE,
    constraint test2_id_fk foreign key(id)
    references test1(id)
);

DROP TABLE test2;
DROP TABLE test1;

-- insert
--insert into test1 values(1,'홍길동','남자');
--insert into test1 values(2,'심청이','여자');
--commit;
--
--insert into test2 values(1,1,'강원도 횡성군','010-2222-2222');
--insert into test2 values(2,2,'부산광역시','010-2222-1111');
--commit;

select * from test1;
select * from test2;

delete from test2
where no=1;

delete from test1
where no=1; -------------- test2가 test1을 참조하고 있기 때문에 test2를 먼저 삭제해야 1을 삭제할 수 있다.
                                -- TEST2 에서 FROEIGN에 ON DELETE CASCADE 옵션을 넣어주면 순서 상관 없이 삭제 가능
                                -- EX) constraint test2_tno_fk FOREIGN KEY(tno)
                                --      references test1(no) ON DELETE CASCADE
    






