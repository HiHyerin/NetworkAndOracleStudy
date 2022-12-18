select rowid, ename from emp;

-- 인덱스 생성
CREATE INDEX idx_emp_ename ON emp(ename DESC);

select * from emp;
select * from emp where ename>='A';
--                 -----------------
--                      sort 조건

create index idx_emp_sal on emp(sal);
select * from emp where sal>0;


select title from seoul_hotel order by title asc;
select /*+ index asc(seoul_hotel sh_no_pk) */ no,title from seoul_hotel;
create index idx_sh_title on seoul_hotel(title);
select title from seoul_hotel where title>='A';

-- 인덱스 삭제
drop index idx_emp_ename;
drop index idx_emp_sal;
drop index idx_sh_title;