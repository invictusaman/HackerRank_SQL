/*
Contest LeaderBoard
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of  from your result. 

[Link to full question - https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true] 

Enter your MySQL Query here

-- For some reason, CTE was not working.
-- Thought process : 1) I need to find max(score) from submissions table 
                     2) Second, join Hackers table to get name column
                     3) Find the total score after joining and apply conditions as per questions
*/

select h.hacker_id, h.name, sum(m.max_score) as final_score from (
    select hacker_id, 
           challenge_id, 
           max(score) as max_score
    from submissions
    group by hacker_id, challenge_id
) as m
inner join hackers as h
on m.hacker_id = h.hacker_id
group by h.hacker_id, h.name
having final_score > 0
order by final_score desc, h.hacker_id

