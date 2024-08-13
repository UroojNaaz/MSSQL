--12-aug-2024
use Hr

select employee_id,
CONCAT_ws(' ',first_name,last_name) as "Full name",
e.salary,
e.department_id
from employees e inner join (select department_id as ID,max(salary) as max_salary
from employees
group by department_id)dept_salary
on dept_salary.ID = e.department_id and
dept_salary.max_salary = e.salary


select emp.*,CONCAT_WS(' ',mgr.first_name,mgr.last_name) as Manager
from employees mgr inner join (select employee_id,
CONCAT_ws(' ',first_name,last_name) as "Full name",
e.salary,
e.department_id,
e.manager_id
from employees e inner join (select department_id as ID,max(salary) as max_salary
from employees
group by department_id)dept_salary
on dept_salary.ID = e.department_id and
dept_salary.max_salary = e.salary
)emp
on emp.manager_id = mgr.employee_id


select * from employees
select * from departments
select * from jobs
select * from job_history
select * from locations
select * from regions
select * from countries

select e.employee_id, CONCAT_WS(' ',e.first_name,e.last_name) as "Full Name",
e.salary,d.department_name,j.job_title,jh.start_date,jh.end_date,
l.state_province,l.street_address,l.postal_code,c.country_name,r.region_name
from employees e full outer join departments d
on e.department_id = d.department_id
full outer join jobs j on j.job_id = e.job_id
full outer join job_history jh on jh.employee_id = e.employee_id
full outer join locations l on l.location_id =d.location_id
full outer join countries c on c.country_id = l.country_id
full outer join regions r on r.region_id = c.region_id


select emp_dt.state_province,
count(emp_dt.state_province) as "Employee Count"
from (select e.employee_id, CONCAT_WS(' ',e.first_name,e.last_name) as "Full Name",
e.salary,d.department_name,j.job_title,jh.start_date,jh.end_date,
l.state_province,l.street_address,l.postal_code,c.country_name,r.region_name
from employees e full outer join departments d
on e.department_id = d.department_id
full outer join jobs j on j.job_id = e.job_id
full outer join job_history jh on jh.employee_id = e.employee_id
full outer join locations l on l.location_id =d.location_id
full outer join countries c on c.country_id = l.country_id
full outer join regions r on r.region_id = c.region_id)emp_dt
group by emp_dt.state_province


select e.first_name,e.department_id,e.salary,de.Salary50
from employees e inner join (select department_id,sum(salary)*0.5 as "Salary50"
from employees
group by department_id)de
on e.department_id = de.department_id and e.salary<de.Salary50


select department_id,sum(salary)*0.5
from employees
group by department_id