-- 응용 CURD(게시판)
CREATE TABLE freeboard(
    no NUMBER, -- 자동증가
    name VARCHAR2(34) constraint fb_name_nn NOT NULL,
    subject VARCHAR2(4000) CONSTRAINT fb_subject_nn NOT NULL,
    content CLOB CONSTRAINT fb_content_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT fb_pwd_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE, -- 디폴트 값이면 오늘 날짜 넣겠다
    hit NUMBER DEFAULT 0, -- 디폴트 값이면 0을 넣어라
    CONSTRAINT fb_no_pk PRIMARY KEY(no)
);

desc freeboard;

-- 데이터 추가 (insert)
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(1,'홍길동','CURD연습',
        'CURD연습중..','1234');
SELECT * FROM freeboard;
commit;

INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(2,'홍길동','CURD연습',
        'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(3,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(4,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(5,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(6,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(7,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(8,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(9,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(10,'홍길동','CURD연습',
'CURD연습중..','1234');
INSERT INTO freeboard(no, name, subject, content,pwd) VALUES(11,'홍길동','CURD연습',
'CURD연습중..','1234');
COMMIT;
SELECT * FROM freeboard;

