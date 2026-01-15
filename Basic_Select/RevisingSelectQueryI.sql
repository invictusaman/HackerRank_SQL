/*
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

Full problem statement - https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
*/

select * from city
where countrycode = 'USA' AND 
population > 100000;
