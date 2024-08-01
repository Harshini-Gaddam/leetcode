-- Write your PostgreSQL query statement below
with cte as (
    select *, row_number() over(partition by email) as rn
    from person
)

select email from cte
where rn=2