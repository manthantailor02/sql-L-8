-- set operations in sql:

create databASE newdb2;
use newdb;
CREATE TABLE city3 as SELECT * FRom world.city limit 3;

CREATE TABLE city4 as SELECT * FRom world.city limit 2;

select * from city3
union 
select * from city4;

select * from city3
union all
select * from city4;

select * from city3
intersect 
select * from city4;

select * from city3
except 
select * from city4;

-- recursive cte

select 10 as num;

with cte as
(select 10 as num)
select * from cte;

-- 14 tk colum me value chahiye
with recursive cte as
(select 10 as num

union
select num+1 from cte
where num<14)
select * from cte;

with recursive cte as
(select 2 as num2

union
select num2*2 from cte
where num2<20)
select * from cte;
use newdb2;

create table employees(emp_id int, emp_name varchar(100), manager_id int);

insert into employees( emp_id,emp_name,manager_id)
values(1,'john',null),
	  (2,'alice',1),
	  (3,'bob',1),
      (4,'david',2),
      (5,'sarah',2),
      (6,'mike',3),
       (7,'tom',4);
       
with tempcte as
(select *, emp_name as hireachy from employees where manager_id is null )
select * from tempcte;

with tempcte as
(select *, emp_name as hireachy from employees where manager_id is null )


select * from tempcte

union

select e.emp_id, e.emp_name, e.manager_id,concat(e.emp_name,' -> ',tempcte.hireachy) as hireachy
from employees as e join tempcte
on e.manager_id=tempcte.emp_id where e.emp_id=2; -- 2first 2 ppl's hireachy

-- to make it dinamic-->

with recursive tempcte as
(select *, emp_name as hireachy from employees where manager_id is null 

union

select e.emp_id, e.emp_name, e.manager_id,concat(e.emp_name,' -> ',tempcte.hireachy) as hireachy
from employees as e join tempcte
on e.manager_id=tempcte.emp_id )

select * from tempcte;

-- now level hireachy
with recursive tempcte as
(select *, 1 as level from employees where manager_id is null 

union

select e.emp_id, e.emp_name, e.manager_id,level+1 as level
from employees as e join tempcte
on e.manager_id=tempcte.emp_id )

select * from tempcte;




