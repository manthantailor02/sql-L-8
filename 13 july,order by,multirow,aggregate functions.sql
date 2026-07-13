use world;
select continent from country;

-- multirow functions
select distinct(continent) from country; -- distinct gives only unique values

select count(name), count(distinct(name)) from country; -- count gives the count of all rows in a colums

-- aggregate functions=> are the functions which are use to apply calculation on a set of rows
-- example- max,min,sum,count

select count(population), sum(population), avg(population) from country;

select count(continent), max(continent), min(continent) from country;
-- sum and avg() should always be applied on numbers not on string

select population, count(population) from country; -- will give error
-- population==> is non aggregate column
-- count(population() is aggregate function
-- both cant be used together

select avg(population) from country;

select avg( replace(population, 1,4)) from country;

select avg( replace(population, 1,4)) - avg(population) from country;

-- data sorting

select name, continent,region, population from country
order by continent;

