
use newdb;

create table test2(rollno tinyint); -- create==> DDl statement
insert into test2 values(128); -- insert==> DML statement

-- tinyint range is 1 byte
-- 1 byte =>8 bit
-- 2**8=>256
-- so its range is -128 to 127
insert into test2 values(127);
insert into test2 values(-128);


-- 0 to 255 but no negetive nums
create table test3(rollno tinyint unsigned); -- create==> DDl statement
insert into test3 values(129); 
insert into test3 values(255); 
insert into test3 values(256); -- error

/*
small int=2 byte
int =4 byte
big int => 8 byte, 84  bit=> 2**64
*/

-- string data type
-- varchar
-- char=> fixed size of character
-- 10=> 10 character ke liye size block kr deta

create table test4(gender char(10)); -- create==> DDl statement
insert into test4 values('Male');
select * from test4;

create table test5(gender char(10)); -- create==> DDl statement
insert into test5 values('Male');
select * from test5;

create table test6(name varchar(20)); -- create==> DDl statement
insert into test6 values('OM'); 
select * from test6;

create table test7(name char(10), name2 varchar(10)); -- create==> DDl statement
insert into test7 values('abc', 'abc');
insert into test7 values('def  ', 'def  ');  -- last ke spaces ko nhi ginta char() data type

select name, char_length(name), name2, char_length(name2) from test7; 

-- constraint--> set of rules that we  apply on a column to prevent invailed data entry;
-- example=> mele me security guard

create table test9(id int, name varchar(20) not null); -- create==> DDl statement
insert into test9 values(10, 'abhishek');
insert into test9 values(10, null); -- it didnt work coz of the contraint not null ki vajah se invalid value insert nhi krne di
select * from test9;

create table test10(id int, name varchar(20) default 'regex'); -- default value in name column 
insert into test10 values(10, 'abhishek');
insert into test10(id) values(11);
select * from test10; 

create table test12(id int unique, name varchar(20) default 'regex'); -- unique constraint
insert into test12 values(10, 'abhishek');
insert into test12 values(10, 'ujjwal');-- error coz of duplicate value in id
insert into test12 values(null, 'happy');-- works
insert into test12 values(null, 'isha');-- works

select * from test12; 

create table test14(id int primary key, name varchar(20) default 'regex'); -- primary key constraint
insert into test14 values(10, 'abhishek');
insert into test14 values(10, 'abhi'); -- error coz of duplicasy
insert into test14 values(null, 'abhishek'); -- primary key cant have null values so will give error
select * from test14;
