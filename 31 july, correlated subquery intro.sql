-- correlated subquery is also called as dependent sub query
-- in which the inner query depend on outer query
-- in this the inner query runs multiple times for ech row of outer query
-- a correlated subquery is a subquery that depends on the outer query.

-- it cannot run independently.
-- it executes once for every row processed by the outer query.
-- the inner query uses a column from the outer query

-- example 1: employees earning more than the average salary of their department
-- ans: 
-- select emp_name, salary, dept_id
-- from employee e1 
-- where salary >(select avg(salary) from employee e2 where e1.dept_id = e2.dept_id);


use corr_db;
create table orders1(order_id int,name varchar(20),amount int);
insert into orders1 values(1,'a', 100), (2,'a',200), (3,'a', 300), (4,'b', 400), (5,'b', 300);

select * from orders1;

select order_id, name, amount from
orders1 where name='a' and amount=(select max(amount) from orders1 where name ='a'); -- a customer ka max amount without correlated

select order_id, name, amount from
orders1 as outer1 where amount=(select max(amount) from orders1 where name=outer1.name);

-- har customer ka lowest amount===>
select min(amount) from orders1 where name=outer1.name;
select * from orders1 as outer1 where amount=(select min(amount) from orders1 where name=outer1.name);

-- note that correlated subquery me alleas dena zruri hota h!!!