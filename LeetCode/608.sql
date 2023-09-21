select t1.id,case when t1.p_id is null then 'Root' when kid is null then 'Leaf' else 'Inner' end as type
from tree t1
left join
(select p_id,count(*) as kid
from tree
group by p_id) t2 on t1.id=t2.p_id 