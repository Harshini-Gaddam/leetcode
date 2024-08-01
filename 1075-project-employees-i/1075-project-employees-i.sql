-- Write your PostgreSQL query statement below
select p.project_id, round(sum(experience_years)::numeric / count(project_id)::numeric, 2) as average_years
from employee e join project p 
on e.employee_id = p.employee_id 
group by p.project_id
order by project_id