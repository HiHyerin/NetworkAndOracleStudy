-- DML
/*
    DQL : 질의언어, SELECT (데이터 검색)
    
          SELECT 컬럼명, (SELECT~) -------> 컬럼대신(스칼라 서브쿼리)
          FROM talbe명 또는 (select~) -------> 테이블 대신(인라인뷰)
          WHERE 컬럼명 연산자 (SELECT~) ------> 서브쿼리(단일, 다중)
        => ROW 단위
          
    DDL : 정의언어(table , view, index..)
          CREATE - 테이블 제작
            CREATE TABLE table_name
            CREATE VIEW view_name
            CREATE INDEX index_name
            CREATE SEQUENCE seq_name
            CREATE FUNCTION func_name
            CREATE PROCEDURE pro_name
            CREATE TRIGGER trigger_name
          ALTER : 수정
            ADD : 추가
            MODIFY : 수정
            DROP COLUMN : 컬럼 삭제
            RENAME COLUMN : 이름변경
          DROP : 완전 삭제
          TRUNCATE : 데이터 잘라내기(테이블 형태는 그대로, 데이터만 삭제)
          RENAME : 테이블 이름 변경
        => 컬럼 단위
        
    DML : 데이터 조작 (ROW단위)
        데이터 추가 : INSERT
        데이터 수정 : UPDATE
        데이터 삭제 : DELETE
*/

-- SELECT * FROM emp;
/*
    개념설계 ===> 논리설계 , 물리 설계
    ------       -------   --------
        데이터 추출   데이터형     메모리 크기
        
        
        판매전표
        -----------------------------------------------------------
        컬럼명         전표번호    판매일자    고객명     총액
        -----------------------------------------------------------
        제약조건        pk          nn         NN       CK
                                DEFAULT 
        -----------------------------------------------------------
        참조테이블
        -----------------------------------------------------------
        참조 컬럼
        -----------------------------------------------------------
        체크속성                                         >0
        -----------------------------------------------------------
        데이터형    VARCHAR2      DATE       VARCHAR2   NUMBER  => NUMBER(8,2)
        -----------------------------------------------------------
        데이터 크기    13                       34
        -----------------------------------------------------------
        */
    -- 테이블 만들기
        CREATE TABLE 판매전표(
         전표번호  VARCHAR(13),  
         판매일자  DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL,
         고객명   VARCHAR(34) CONSTRAINT 판매전표_고객명_nn NOT NULL,
         총액     NUMBER,
         constraint 판매전표_전표번호_pk PRIMARY KEY(전표번호),
         CONSTRAINT 판매전표_총액_ck CHECK(총액>0)
        );
        
        -- DEFAULT 추가
        ALTER TABLE 판매전표 MODIFY 판매일자 DEFAULT SYSDATE;
        
        
      /*  
        
        제품
        -----------------------------------------------------------
        컬럼명         제품번호    제품명     제품단가    
        -----------------------------------------------------------
        제약조건        pk          nn         CK       
                                
        -----------------------------------------------------------
        참조테이블
        -----------------------------------------------------------
        참조 컬럼
        -----------------------------------------------------------
        체크속성                                 >0
        -----------------------------------------------------------
        데이터형    VARCHAR2      VARCHAR2     NUMBER  => NUMBER(8,2)
        -----------------------------------------------------------
        데이터 크기    13            100          
        -----------------------------------------------------------
        */
        CREATE TABLE 제품(
            제품번호  VARCHAR2(12),
            제품명     VARCHAR(100) CONSTRAINT 제품_제품명_nn NOT NULL,
            제품단가    NUMBER,
            CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호),
            CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0)
        );
        
        
        /*
        전표상세
        -----------------------------------------------------------
        컬럼명         전표번호    제품번호    수량      단가      금액
        -----------------------------------------------------------
        제약조건        pk/FK        FK       NN        NN      CK       
                                
        -----------------------------------------------------------
        참조테이블       판매전표    제품
        -----------------------------------------------------------
        참조 컬럼        전표번호   제품번호         
        -----------------------------------------------------------
        체크속성                                                >0
        -----------------------------------------------------------
        데이터형       VARCHAR2   VARCHAR2     NUMBER  => NUMBER(8,2)
        -----------------------------------------------------------
        데이터 크기    13            100          
        -----------------------------------------------------------

*/

    CREATE TABLE 전표상세(
        전표번호 VARCHAR2(13),
        제품번호  VARCHAR2(100),
        수량      NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL,
        단가      NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL,
        금액      NUMBER,
        CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
        CONSTRAINT 전표상세_금액_ck CHECK(금액>0),
        CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
        REFERENCES 판매전표(전표번호),
        CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
        REFERENCES 제품(제품번호)
    );
    
    --------------------------------------------------------------------
    --------------------------------------------------------------------
    
    -- 테이블 제약조건 확인
    SELECT * FROM user_constraints
    WHERE table_name='전표상세';
    
     @c:\javaDev\db\slocation
    commit;
    
    SELECT * FROM user_constraints
    WHERE table_name='SEOUL_LOCATION';
    SELECT * FROM seoul_location;
    
    -- 오후 첫번째 영상 한 30분...?
    -- 테이블_컬럼_제약조건자
    -- 모든 테이블명은 대문자로 저장 되어있다.
    
   
/*
        CONSTRAINT TYPE
        C : CHECK, NOT NULL
        P : PRIMARY
        R : FOREIGN KEY
        U : UNIQUE
*/
/* 
     CREATE TABLE 판매전표(
     전표번호  VARCHAR(13),  
     판매일자  DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL,
     고객명   VARCHAR(34) CONSTRAINT 판매전표_고객명_nn NOT NULL,
     총액     NUMBER,
     constraint 판매전표_전표번호_pk PRIMARY KEY(전표번호),
     CONSTRAINT 판매전표_총액_ck CHECK(총액>0)
    );
        
        CREATE TABLE 제품(
        제품번호  VARCHAR2(12),
        제품명     VARCHAR(100) CONSTRAINT 제품_제품명_nn NOT NULL,
        제품단가    NUMBER,
        CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호),
        CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0)
    );
        
    CREATE TABLE 전표상세(
    전표번호 VARCHAR2(13),
    제품번호  VARCHAR2(100),
    수량      NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL,
    단가      NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL,
    금액      NUMBER,
    CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
    CONSTRAINT 전표상세_금액_ck CHECK(금액>0),
    CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
    REFERENCES 판매전표(전표번호),
    CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
    REFERENCES 제품(제품번호)
);
        
        -- DEFAULT 추가
        ALTER TABLE 판매전표 MODIFY 판매일자 DEFAULT SYSDATE; 
        
    -- 제약조건 변경
    NOT NULL => MODIFY
    ALTER TABLE table_name MODIFY column_name CONSTRAINT cons_name NOT NULL
    
    CHECK, FROEIGN, PRIMARY, UNIQUE => ADD
    ADD TABLE table_name ADD CONSTRAINT cons_name CHECK~
*/

-- 테이블 삭제는 참조한 테이블부터(foreign key 있는것부터 삭제) / 순서 상관없이 사용하고 싶을 땐 on delete cascade
drop table 판매전표;
drop table 제품;
drop table 전표상세;

        CREATE TABLE 판매전표(
         전표번호  VARCHAR(13),  -- PK
         판매일자  DATE , -- NN
         고객명   VARCHAR(34), -- NN
         총액     NUMBER -- CHECK
    );
        -- PRIMARY KEY 변경
        ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호);
        -- NOT NULL 설정
        ALTER TABLE 판매전표 MODIFY 판매일자 DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL;
        --
        ALTER TABLE 판매전표 MODIFY 고객명 VARCHAR2(34) CONSTRAINT 판매전표_고객명_nn NOT NULL;
        ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_총액_ck CHECK(총액>0);
        --------------------------------------------------------------------
        
        CREATE TABLE 제품(
        제품번호  VARCHAR2(12),
        제품명     VARCHAR(100) ,
        제품단가    NUMBER
    );
        --
        ALTER TABLE 제품 ADD CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호);
        ALTER TABLE 제품 ADD CONSTRAINT 제품_제품명_uk UNIQUE(제품명);
        ALTER TABLE 제품 ADD CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0);
        -- ㄴ CHECK(dname IN('개발부','영업부','총무부','자재부','기획부')) -> 5개 중 하나 체크 /(여러개 나열할 땐 IN 사용)
        -- ex) CHECK(isLogin IN('y','n'))
        
        ------------------------------------------------------------------------
        
        
        
        CREATE TABLE 전표상세(
        전표번호 VARCHAR2(13), -- PK, FK
        제품번호  VARCHAR2(100), -- FK
        수량      NUMBER, --CONSTRAINT 전표상세_수량_nn NOT NULL, -- NN
        단가      NUMBER, --CONSTRAINT 전표상세_단가_nn NOT NULL, --NN
        금액      NUMBER -- CK
--        CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
--        CONSTRAINT 전표상세_금액_ck CHECK(금액>0),
--        CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
--        REFERENCES 판매전표(전표번호) on delete cascade,-- 포린키 상관없이 순서 상관없이 삭제 가능(사용 안하는게 좋음)
--        CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
--        REFERENCES 제품(제품번호) on delete cascade
    );
    
        ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호);
        ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
        REFERENCES 판매전표(전표번호); -- REFERENCES 테이블명(컬럼명)    
        
        ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(전표번호)
        REFERENCES 제품(제품번호); -- REFERENCES 테이블명(컬럼명)
        
        ALTER TABLE 전표상세 MODIFY 수량 NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL;
        ALTER TABLE 전표상세 MODIFY 단가 NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL;
        ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_금액_ck CHECK(금액>0);
        
        -- 메모리 삭제
        DROP TABLE 전표상세;
        DROP TABLE 판매전표;
        DROP TABLE 제품;
        
/* 
    게시물 번호                     댓글(게시물 번호 참조)
    1                                1
    2                                1
    3                                1
    4                                2
    5                                3
                                     4
                                     6 -> 오류(참조값이 없어서 1~5 까지)
    
*/

/*
    ALTER : 테이블 수정
        컬럼 추가
        컬럼 수정
        컬럼 삭제
        컬럼 이름변경
        컬럼 제약조건 변경
        
        데이터만 삭제 : TRUNCATE
            형식
                TRUNCATE TABLE table_name; => 테이블 구조는 남아있다
            
        테이블 삭제 : DROP
            형식
                DROP TABLE table_name; => 테이블 구조까지 사라진다
                
        테이블 이름변경 : RENAME
            형식
                RENAME old+name TO new_name
*/
drop table student; 
CREATE TABLE student(
    hakbun NUMBER,
    name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
    CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun)
);

-- 컬럼추가
ALTER table student add kor number default 0;
ALTER table student add eng number default 0;
ALTER table student add math number default 0;
ALTER table student add avg number not null;

-- 컬럼 수정
alter table student modify avg number(5,2);
alter table student modify kor number(3);
alter table student modify eng number(3);
alter table student modify math number(3);


-- 컬럼 삭제
ALTER TABLE student DROP COLUMN avg;

-- 컬럼명 변경
ALTER TABLE student RENAME COLUMN hakbun TO hak;
DESC student;