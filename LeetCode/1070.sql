with temp as(select product_id,year,quantity,price,rank()over(partition by product_id order by year) as r
from sales)

select product_id,year as first_year,quantity,price
from temp
where r=1