select p.product_id, ifnull(round(sum(units*price)/sum(units),2),0) average_price
from unitssold u
right join prices p on p.product_id=u.product_id and u.purchase_date between start_date and end_date
group by p.product_id