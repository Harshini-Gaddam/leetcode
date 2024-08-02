-- Write your PostgreSQL query statement below
with prod as (
select
    customer_id 
    , count(distinct product_key) as prod_count
from Customer 
group by 1
)

select 
    customer_id
from prod
where prod_count = (select count(distinct product_key) from Product)
