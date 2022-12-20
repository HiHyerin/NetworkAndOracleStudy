CREATE TABLE 상품(
    품번 number,
    상품명 varchar2(30),
    단가 number
);

CREATE TABLE 입고(
    품번 number,
    수량 number,
    금액 number
);

CREATE TABLE 출고(
    품번 number,
    수량 number,
    금액 number
);

CREATE TABLE 재고(
    품번 number,
    수량 number,
    금액 NUMBER,
    누적금액 NUMBER
);

-- 상품
INSERT INTO 상품 VALUES(100,'새우깡',1500);
INSERT INTO 상품 VALUES(200,'감자깡',1300);
INSERT INTO 상품 VALUES(300,'빼빼로',1100);
INSERT INTO 상품 VALUES(400,'조리퐁',1200);
INSERT INTO 상품 VALUES(500,'알새우칩',1400);
COMMIT;

SELECT * FROM 상품;

-- 입고시에 재고를 처리
/*
    1. 입고 시 해당 상품이 존재하는지 확인
        ㄴ 존재 : update
        ㄴ 미존재 : insert
    2. 출고
        ㄴ 재고 안에서 상품의 개수 확인
        ㄴ 재고 0 : delete
        ㄴ 재고>0 : update
    
    ** 기존에 있는 재고 컬럼값 읽기 => :old.품번
*/
CREATE OR REPLACE TRIGGER input_trigger
AFTER INSERT ON 입고
FOR EACH ROW
DECLARE
    v_cnt number:=0;
BEGIN
    select count(*) into v_cnt -- =0 이면 insert, =1이면 update
    from 재고
    where 품번=:new.품번; -- (:new) : insert, update, delete 할 때 들어오는 값
    
    if v_cnt=0 then -- 기존에 상품이 없는경우
    -- insert
        insert into 재고 values(:new.품번,:new.수량,:new.금액,:new.수량*:new.금액);
    else -- 기존에 상품이 존재하는 경우
    -- update
    update 재고 set
        수량=수량+:new.수량,
        누적금액=누적금액+(:new.수량*:new.금액)
    where 품번=:new.품번;
    -- 주의점 : autocommit 수행 (commit 사용할 경우 오류)
    end if;
END;
/

insert into 입고 values(100,3,1500);
select * from 입고;
select * from 재고;
----------------------------------------------------------------
----------------------------------------------------------------
-- 출고 : update/delete
create or replace trigger output_trigger
after insert on 출고
for each row

declare
    v_cnt NUMBER:=0;
begin
    select 수량 into v_cnt
    from 재고
    where 품번=:new.품번;
    
    if :new.수량=v_cnt then -- 재고가 없는 상태
        delete from 재고
        where 품번=:new.품번;
    else -- 재고가 있는 상태(수량-:new.수량, 누적금액-:new.금액*new.수량
        update 재고 set
        수량=수량-:new.수량,
        누적금액=누적금액-(:new.수량*:new.금액)
        where 품번=:new.품번;

    end if;
end;
/

select * from 재고;
insert into 출고 values(100,4,1500);

----------------------------------------------------------------
----------------------------------------------------------------
-- 오라클 app product 18.0 dbhomeXE jdbc lib ojebc8


-- 페이지나누기
select fno,name,poster,score,num 
from (select fno,name,poster,score,rownum as num 
from (select /*+index_asc(food_location pk_food_location)*/fno,name,poster,score 
from food_location)) 
where num between 21 and 40;
