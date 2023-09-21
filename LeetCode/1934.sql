select s.user_id,round(sum(case when action='confirmed' then 1 else 0 end)/count(s.user_id),2) as confirmation_rate
from confirmations c
right join signups s on s.user_id=c.user_id
group by s. user_id