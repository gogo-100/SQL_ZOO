select p.product_id, ifnull(res.new_price,10) as price
from (select distinct product_id from products) p
left join
(select product_id,new_price,rank()over(partition by product_id order by change_date desc) as r
from products
where change_date <= '2019-08-16') res on res.r=1 and res.product_id=p.product_id
