-- Write your PostgreSQL query statement below
select e2.employee_id, e2.name, count(*) reports_count, round(avg(e1.age),0) average_age
from employees e1 join employees e2
on e1.reports_to = e2.employee_id
group by e2.employee_id, e2.name
having 3>=1
order by e2.employee_id