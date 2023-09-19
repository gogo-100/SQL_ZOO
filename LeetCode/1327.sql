select product_name, sum(unit) unit
from orders
join products on orders.product_id=products.product_id
where order_date BETWEEN '2020-02-01' AND '2020-02-29'
group by orders.product_id
having sum(unit)>=100