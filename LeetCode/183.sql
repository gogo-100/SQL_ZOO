select name Customers
from customers c
left join orders o on c.id=o.customerId
group by name,c.id 
having count(o.id)=0