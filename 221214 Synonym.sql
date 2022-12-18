/*

*/
CREATE SYNONYM 사원정보
FOR emp;

select * from 사원정보;

DROP SYNONYM 사원정보;

desc food_location;

select name,hit from food_location order by hit desc;

SELECT CEIL(COUNT(*)/20.0) FROM food_location;
------------------------------------------------------------




