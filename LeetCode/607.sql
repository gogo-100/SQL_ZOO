select name
from salesperson
where sales_id not in(select sales_id
from company 
join orders on company.com_id=orders.com_id
where name='RED')