# Write your MySQL query statement below

(select name as results
from movierating
join users on movierating.user_id=users.user_id
group by users.user_id
order by count(*) desc, name
limit 1)

union all

(select title as results
from movierating
join movies on movies.movie_id=movierating.movie_id
where created_at between '2020-02-01' and '2020-02-29'
group by movies.movie_id
order by avg(rating) desc, title
limit 1)
