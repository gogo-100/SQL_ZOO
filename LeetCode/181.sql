select x.name Employee
from Employee x
join Employee y
on x.managerId = y.id
where x.salary > y.salary;