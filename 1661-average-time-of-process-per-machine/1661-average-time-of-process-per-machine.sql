-- Write your PostgreSQL query statement below
select t1.machine_id, round(cast(avg(t1.diff) as numeric), 3) as processing_time
from (
select a.machine_id, a.process_id, abs(b.timestamp - a.timestamp) as diff 
from activity a join activity b 
on a.machine_id = b.machine_id
and a.process_id = b.process_id
and a.activity_type='start' and b.activity_type='end' 
) as t1
group by t1.machine_id
order by t1.machine_id
