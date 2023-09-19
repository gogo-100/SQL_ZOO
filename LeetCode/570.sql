select name
from employee
where id in (select managerId
from employee
where managerId
group by managerId
having count(*)>=5)