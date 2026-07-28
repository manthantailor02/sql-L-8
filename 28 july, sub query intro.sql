create database corr_db;
use corr_db;
create table employee_c(id int,name varchar(20),salary int);
insert into employee_c values(1,'a', 100), (2,'b',250), (3,'c', 400), (4,'d', 380);
insert into employee_c values(5,'aman', 250);
-- highest salary kya hai

select max(salary) from employee_c;

select * from employee_c where salary=400;

-- sub query/nested query--> query inside a query is called sub query
select * from employee_c where salary=(select min(salary) from employee_c );

-- highest salary with sub query
select max(salary) from employee_c;
select * from employee_c where salary=(select max(salary) from employee_c );

select * from employee_c where salary=(select salary from employee_c where name='b'); -- will return all the ppl with the same salary
-- of the guy with name "b"

-- employees ki salary jinki salry avg sal se zada ho

select avg(salary) from employee_c; -- gave 276.00
select * from employee_c where salary>276 ;


 use world;
-- get the name of the city where the disctrict of the city is same for the city abu dhabi
select name from city where district = (select district from city where name = 'abu dhabi');




-- get all the columns from the city table where the population is the maximum
select max(population) from city;
select * from city where population=(select max(population) from city);



-- gte the disctrict and name of the city where the country code is same for 'herat'
select countrycode from city where countrycode='herat';
select district, name from city where countrycode = ( select countrycode from city where name = 'herat');



-- gte the disctrict,the city, population for all the countries where amsterdam is present aand sort the data by population
select * from city;
select countrycode from city where name='Amsterdam';
select district,name,population from city where countrycode=(select countrycode from city where name='Amsterdam')
order by population;
