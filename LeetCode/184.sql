select d.name Department, e.name Employee, e.salary Salary
from employee e
join (select departmentId,max(salary) m
from employee
group by departmentId) as f 
on e.departmentId=f.departmentId and e.salary=f.m
join department d on d.id=e.departmentId 