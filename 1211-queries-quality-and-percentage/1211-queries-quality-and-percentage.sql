-- Write your PostgreSQL query statement below
/*
with cte1 as (select query_name, round((sum(rating / position:: numeric)) / count(query_name), 2) as quality
from queries
group by query_name),
cte2 as (
select query_name, round(count(rating) / 3::numeric *100, 2) as poor_query_percentage
from queries
where rating<3
group by query_name)

select cte1.*, cte2.poor_query_percentage 
from cte1 join cte2 on cte1.query_name = cte2.query_name
order by quality
*/

select query_name, round(sum(rating/position :: numeric) / count(*), 2) as quality,
round(sum(case 
when rating<3 then 1 else 0 
end) / count(*) ::numeric *100, 2) as poor_query_percentage
from queries
where query_name is not null
group by query_name