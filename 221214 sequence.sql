CREATE SEQUENCE test_no_seq
    start with 1
    increment by 1
    NOCACHE
    nocycle;
    
SELECT test_no_seq.nextval from dual;
select test_no_seq.currval from dual;

-- seq 삭제
drop sequence test_no_seq;

--========================================================
/*
    정형화된 데이터 : 프로그램에서 필요한 데이터만 저장 => RDBMS(오라클, MYSQL...) => 지금 배우고 있는 것
    ------------ > 데이터를 공유 / 제약조건
    반정형화 : 필요없는 데이터를 포함, 구분은 되어 있다.(HTML, XML,JSON)
    비정형화 : 필요한 데이터, 필요없는 데이터 섞여 있다. 구분도 없다(TWITER, FACEBOOK..)
    ------- 정형화(빅데이터) : 기계에 학습(AI)
*/

create table board(
    no number,
    name varchar2(34) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(4000) CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
    regdate DATE default sysdate,
    hit NUMBER default 0,
    CONSTRAINT board_no_pk PRIMARY KEY(no)
);

-- no 처리(중복 없는 데이터) => 자동으로 처리
-- 중복되면 안되는 것들 : 테이블명, 컬럼명, 뷰 이름, 시퀀스명, 제약조건명
create SEQUENCE board_no_seq
    start with 1
    increment by 1
    nocycle
    nocache;
    
insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

insert into board(no,name,subject,content,pwd)
values(board_no_seq.NEXTVAL,'홍길동','시퀀스','시퀀스사용중','1234');

commit;

-- 확인
select * from board;

-- 데이터 삭제
delete from board where no=3; -- 번호가 앞당겨지진 않는다.

--예제2)
create table notice(
    no NUMBER,
    name varchar2(34) constraint notice_name_nn NOT NULL,
    msg clob constraint notice_msg_nn NOT NULL,
    constraint notice_no_pk PRIMARY KEY(no)
);

create sequence notice_no_seq
    start with 1
    increment by 1
    nocycle
    nocache;
    
insert into notice values(notice_no_seq.nextval,'홍길동','공지사항');
insert into notice values(notice_no_seq.nextval,'홍길동','공지사항');
insert into notice values(notice_no_seq.nextval,'홍길동','공지사항');
insert into notice values(notice_no_seq.nextval,'홍길동','공지사항');

commit;
select * from notice;