/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

MySQL Query 

Full question - https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true
*/

select sum(ci.population) as Total_Population
from city as ci 
inner join country as co 
on ci.countrycode = co.code
where co.continent = 'Asia'
