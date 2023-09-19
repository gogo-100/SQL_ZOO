select distinct p.product_id,product_name
from sales s
join product p on p.product_id=s.product_id
group by product_id
having min(sale_date)>='2019-01-01' and max(sale_date)<='2019-03-31'