
with rank1 as (select player_id,event_date,rank() over (partition by player_id order by event_date asc) as r from activity)

select round(count(*) / (select count(distinct player_id) from activity),2) as fraction
from rank1 as a
join rank1 as b
on a.player_id=b.player_id and a.r=1 and b.r=2 and adddate(a.event_date,1)=b.event_date