-- Write your PostgreSQL query statement below
select customer_id, count(*) as count_no_trans
from visits as v left join transactions as t on v.visit_id=t.visit_id
group by customer_id, transaction_id 
having transaction_id is null