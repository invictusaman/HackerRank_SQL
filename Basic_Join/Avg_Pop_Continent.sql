/*
Given the CITY and COUNTRY tables, 
Query the names of all the continents and their respective average city populations rounded down to the nearest integer.

MySQL Query 

Full question - https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true
*/

select co.continent, floor(avg(ci.population)) as Avg_Population
from city as ci 
inner join country as co
on ci.countrycode = co.code
group by co.continent
