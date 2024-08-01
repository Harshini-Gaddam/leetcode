-- Write your PostgreSQL query statement below
with cte as (
    select *, dense_rank() over(partition by player_id order by event_date) as dr
    from activity
)

select player_id, event_date as first_login
from cte
where dr=1