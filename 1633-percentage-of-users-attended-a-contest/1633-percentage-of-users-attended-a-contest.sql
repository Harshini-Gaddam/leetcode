-- Write your PostgreSQL query statement below
with cte as (
    select count(distinct user_id) as user_count
    from users
)

select contest_id, round((count(user_id) / user_count:: numeric) *100, 2) as percentage 
from register
cross join cte 
group by contest_id, user_count
order by percentage desc, contest_id




