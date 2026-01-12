/*
Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer.

Thought process - 1) I  need salary of myself and best friend. (Students Join Packages > My_Salary (with studentID) ; Friends Join Packages > Best_Friend_Salary (with FriendsID))
                  2) I will have 2 tables : ID, Name, My_Salary & ID, Friends_ID, Friends_Salary
                  3) Easy Join and Apply conditions as per question.
*/

/*
Enter your MySQL query here.
*/

with my_salary as (
    select s.id, s.name, p.salary as my_sal 
    from students as s
    inner join packages as p 
    on s.id =p.id 
),
friend_salary as (
    select f.id, f.friend_id, p.salary as best_sal
    from friends as f 
    inner join packages as p 
    on f.friend_id =p.id 
)


select m.name 
from my_salary as m
inner join friend_salary as f
on m.id = f.id
where best_sal > my_sal
order by best_sal
