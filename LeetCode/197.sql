select x.id
from Weather x
inner join 
Weather y
on
y.recordDate=addDate(x.recordDate,-1)
where x.temperature>y.temperature;