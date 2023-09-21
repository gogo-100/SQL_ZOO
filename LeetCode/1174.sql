select round(sum(first)/count(*)*100,2) as immediate_percentage
from (select case when(order_date=customer_pref_delivery_date) then 1 else 0 end as first,rank() over (partition by customer_id order by order_date asc) as rank1
from delivery) as t
where t.rank1=1