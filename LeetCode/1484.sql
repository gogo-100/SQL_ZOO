select sell_date,count(distinct product) num_sold,GROUP_CONCAT(distinct product order by product) as products
from activities
group by sell_date