create database joinsdbb;
use joinsdbb;
CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);

INSERT INTO departments VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);

INSERT INTO employees VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');
CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);

-- 1
select e.emp_id,e.emp_name,d.dept_name,d.location
from employees as e
join departments as d
on e.dept_id=d.dept_id;

-- 2
select p.proj_id,p.proj_name,d.dept_name
from projects as p
left join departments as d
on p.dept_id=d.dept_id;

-- 3


-- 4
select e.emp_id,e.emp_name,e.dept_id,d.dept_name 
from employees as e
left join departments as d
on e.dept_id=d.dept_id;

-- 5

select d.dept_id,d.dept_name,p.proj_name,p.budget
from departments as d
left join projects as p
on d.dept_id=p.dept_id;

-- 6
select e.emp_id,e.emp_name,d.dept_id
from employees as e
left join departments as d
on e.dept_id=d.dept_id
where d.dept_name is null;

-- 7
select e.emp_name,d.dept_id,d.dept_name
from employees as e
right join departments as d
on e.dept_id=d.dept_id; 
-- 8
select p.proj_id,p.proj_name,d.dept_name
from projects as p
left join departments as d
on p.dept_id=d.dept_id;


-- 10
select * from employees as e cross join departments as d
where (dept_name='legal' or dept_name='finance')
and salary>70000;

-- 11
select p.proj_name,p.budget,d.dept_name,d.location
from projects as p
cross join departments as d
on p.dept_id=d.dept_id
where budget<=400000 and (location='Mumbai' or 'pune');

-- 12
select count(*) as total_rows
from employees
cross join departments;

-- 13
select emp_id,emp_name,salary
from employees
where salary>60000;

-- 14
select emp_id,emp_name,city
from employees
where city='delhi' or city='mumbai';

-- 15
select emp_id,emp_name,dept_id,salary
from employees
where dept_id is null;

-- 16
select dept_id,dept_name,location
from departments
where location='bangalore' or location='delhi';

-- 17 
select dept_id,dept_name,location
from departments
where dept_id>=30;

-- 18
select dept_id,dept_name,location
from departments
where dept_name like 'f%' or dept_name like 'l%';

-- 19
select proj_id,proj_name,dept_id,budget
from projects
where budget between 200000 and 400000;

-- 20
select proj_id,proj_name,dept_id,budget
from projects
where dept_id=20;

-- 21
select proj_id,proj_name,budget
from projects
where proj_name like '%a%' and budget<300000;

-- 22
select e.emp_name,d.dept_name,d.location,p.proj_name,p.budget
from employees as e
join departments as d
on e.dept_id=d.dept_id
join projects as p
on d.dept_id=p.dept_id;

-- 26
select e.emp_name,d.location,p.proj_name
from employees as e
join departments as d
on e.dept_id=d.dept_id
join projects as p
on d.dept_id=p.dept_id
where d.location='bangalore' or d.location='mumbai';

-- 27

-- 28
select p.proj_name,p.dept_id,e.emp_name
from projects as p
left join employees as e
on p.dept_id=e.dept_id;
