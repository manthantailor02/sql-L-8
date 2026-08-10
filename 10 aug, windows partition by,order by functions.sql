use sakila;

select * from employees;
select *, sum(salary) over(partition by department) from employees;
select *, sum(salary) over(order by salary) from employees;
select first_name, department,salary, sum(salary) over(partition by department order by salary) from employees;

-- only over() likhege to to vo pure data per work krega or result dega
-- agar over(partition by location) ya over(partition by department) ya esa kuch likhege to usme similer groups ke uper calculations hogi
-- for example agar over(partition by name) likhege to name to almost saare alg alg hote to similer values km hogi to har ekname pe same hi value 
-- result me dega, by chance agar same name se data h to unpe alag calculation hogi.

create table emp_2 as select first_name, department,salary, round(salary/100) as amount from employees;
select * from emp_2;

create table emp_3 as select first_name, department,salary, round(salary/100) as amount from employees limit 6;
select * from emp_3;

-- __rank, dense rank, and rrow number function__
-- __rank, dense rank, and rrow number function__