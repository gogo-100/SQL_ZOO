select d as Department, e as Employee, salary as Salary 
from (
select  dept.name as d , emp.name as e, salary,dense_rank()over(partition by departmentId order by salary desc) as dense_rank1
from employee emp  join department dept
on emp.departmentId=dept.id) as t
where dense_rank1<=3