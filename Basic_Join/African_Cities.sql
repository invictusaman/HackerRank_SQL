/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

MySQL Query 

Full question - https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true
*/

select ci.name
from city as ci 
inner join country as co
on ci.countrycode = co.code
where continent ='Africa'
