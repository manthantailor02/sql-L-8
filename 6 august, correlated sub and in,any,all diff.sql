-- second highest salary
-- select max(salary) from employee where salary>(select max(salary) from employee where salary);

-- customer info whose salary is highest in their own dept
-- select * from employee as outer where salary=(select max(salary) from employee where dept_id=outer.dept_id );

-- whose salary should be less then the salary of all the employees among the same dept
-- select name, dept from employee as outer where salary=(select min(salary) from employee where dept_id=outer.dept_id );

-- gte the dept name, if the sum of all their employees salary should bre less then 900;
-- select dept from employee as outer where salary<any(select sum(salary) as sumS from employee where dept_id=outer.dept_id and sumS<900);


-- find ebery employee detail if in its department the salary of all the employees in the same dept should be less then 500 
-- select * from employee as outer where (select salary as sumS from employee where dept_id=outer.dept_id )<500
-- (select salary from employee where dept_id=hr and salary<500)
-- select * from employee as outer where 500>all(select salary from employee where dept_id=outer.dept_id)