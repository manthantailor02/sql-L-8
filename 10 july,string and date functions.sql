use world;

-- string function
select name, continent,concat(continent, ' have ' , name) from country; -- space dena pad rha tha alag se

select name, continent,concat_ws(' ',continent, 'have' , name) from country;-- concat_ws apne aap space lga deta h

select name,substr(name,2) from country;

select name,substr(name,2,4) from country; -- 2 se 4 tk ke index tk ka string data milega

select name,substr(name,-4,2) from country;

select name,length(name), char_length(name) from country; -- char_length gives the length of the characters,length gives length in bytes

select name, replace(name,'a','@') from country; -- replace giver character replcements string

select name, lpad(name,6,'@') from country; -- muje agar saare name at least 6 character chiye then i will use lpad or rpad.

select current_date(),current_time(),current_timestamp(),now(); -- for current day

select now(), adddate(now(), 1),adddate(now(),-1); -- adddate adds days in a colums

select now(), adddate(now(), interval 1 year), adddate(now(), interval 1 quarter);

select now(), year(now()), month(now()), 
extract(month from now()),extract(minute from now()), extract(week from now());





