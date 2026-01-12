/*
Julia asked her students to create some coding challenges.   
Write a query to print the hacker_id, name, and the total number of challenges created by each student.   
Sort your results by the total number of challenges in descending order.   
If more than one student created the same number of challenges, then sort the result by hacker_id.   
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.   

[Complete Question Link - https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true]

Enter your MySQL query here.
*/

with count_challenge as (
select hacker_id, count(hacker_id) as challenges_created
from challenges
group by hacker_id
)

select h.hacker_id, h.name, cc.challenges_created
from hackers as h 
inner join count_challenge as cc 
on h.hacker_id = cc.hacker_id
where 
(
cc.challenges_created = (select max(challenges_created) from count_challenge)
)
OR
(
  cc.challenges_created IN (
    select challenges_created
    from count_challenge
    group by challenges_created
    having count(challenges_created) = 1
  )
)
order by cc.challenges_created DESC, h.hacker_id

