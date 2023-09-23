select user_id as buyer_id,join_date,ifnull(c,0)as orders_in_2019 
from (
select buyer_id,count(*) as c
from orders
where year(order_date)=2019
group by buyer_id) count19
right join users on users.user_id=count19.buyer_id