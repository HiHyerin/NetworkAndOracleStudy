CREATE TABLE ��ǰ(
    ǰ�� number,
    ��ǰ�� varchar2(30),
    �ܰ� number
);

CREATE TABLE �԰�(
    ǰ�� number,
    ���� number,
    �ݾ� number
);

CREATE TABLE ���(
    ǰ�� number,
    ���� number,
    �ݾ� number
);

CREATE TABLE ���(
    ǰ�� number,
    ���� number,
    �ݾ� NUMBER,
    �����ݾ� NUMBER
);

-- ��ǰ
INSERT INTO ��ǰ VALUES(100,'�����',1500);
INSERT INTO ��ǰ VALUES(200,'���ڱ�',1300);
INSERT INTO ��ǰ VALUES(300,'������',1100);
INSERT INTO ��ǰ VALUES(400,'������',1200);
INSERT INTO ��ǰ VALUES(500,'�˻���Ĩ',1400);
COMMIT;

SELECT * FROM ��ǰ;

-- �԰�ÿ� ��� ó��
/*
    1. �԰� �� �ش� ��ǰ�� �����ϴ��� Ȯ��
        �� ���� : update
        �� ������ : insert
    2. ���
        �� ��� �ȿ��� ��ǰ�� ���� Ȯ��
        �� ��� 0 : delete
        �� ���>0 : update
    
    ** ������ �ִ� ��� �÷��� �б� => :old.ǰ��
*/
CREATE OR REPLACE TRIGGER input_trigger
AFTER INSERT ON �԰�
FOR EACH ROW
DECLARE
    v_cnt number:=0;
BEGIN
    select count(*) into v_cnt -- =0 �̸� insert, =1�̸� update
    from ���
    where ǰ��=:new.ǰ��; -- (:new) : insert, update, delete �� �� ������ ��
    
    if v_cnt=0 then -- ������ ��ǰ�� ���°��
    -- insert
        insert into ��� values(:new.ǰ��,:new.����,:new.�ݾ�,:new.����*:new.�ݾ�);
    else -- ������ ��ǰ�� �����ϴ� ���
    -- update
    update ��� set
        ����=����+:new.����,
        �����ݾ�=�����ݾ�+(:new.����*:new.�ݾ�)
    where ǰ��=:new.ǰ��;
    -- ������ : autocommit ���� (commit ����� ��� ����)
    end if;
END;
/

insert into �԰� values(100,3,1500);
select * from �԰�;
select * from ���;
----------------------------------------------------------------
----------------------------------------------------------------
-- ��� : update/delete
create or replace trigger output_trigger
after insert on ���
for each row

declare
    v_cnt NUMBER:=0;
begin
    select ���� into v_cnt
    from ���
    where ǰ��=:new.ǰ��;
    
    if :new.����=v_cnt then -- ��� ���� ����
        delete from ���
        where ǰ��=:new.ǰ��;
    else -- ��� �ִ� ����(����-:new.����, �����ݾ�-:new.�ݾ�*new.����
        update ��� set
        ����=����-:new.����,
        �����ݾ�=�����ݾ�-(:new.����*:new.�ݾ�)
        where ǰ��=:new.ǰ��;

    end if;
end;
/

select * from ���;
insert into ��� values(100,4,1500);

----------------------------------------------------------------
----------------------------------------------------------------
-- ����Ŭ app product 18.0 dbhomeXE jdbc lib ojebc8


-- ������������
select fno,name,poster,score,num 
from (select fno,name,poster,score,rownum as num 
from (select /*+index_asc(food_location pk_food_location)*/fno,name,poster,score 
from food_location)) 
where num between 21 and 40;
