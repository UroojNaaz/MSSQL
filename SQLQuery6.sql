--10-08-2024; 
--today's topics: groupby,having,on,join

--group by: use for grouping of 1 table's rows
use Hr
select job_id   --here i am only using column
from employees
group by job_id


select job_id,                     --column
count(first_name) as "emp_count"   --apply function column
from employees
group by job_id


select job_id,
count(first_name) as "emp_count",
min(salary) as "min_salary",
max(salary) as "max_salary",
avg(salary) as "avg_salary",
sum(salary) as "sum_salary"
from employees
group by job_id
 
--we use having instead of where for condition
select job_id,
count(first_name) as "emp_count",
min(salary) as "min_salary",
max(salary) as "max_salary",
avg(salary) as "avg_salary",
sum(salary) as "sum_salary"
from employees
group by job_id
having avg(salary)>1000 and count(first_name)>1;



select department_id 
from employees
group by department_id 

select department_id ,
count(first_name) as "emp_count",
min(salary) as "min_salary",
max(salary) as "max_salary",
avg(salary) as "avg_salary",
sum(salary) as "sum_salary"
from employees
group by department_id 
having avg(salary)>1000 and count(first_name)>1;


select department_id ,
count(first_name) as "emp_count",
min(salary) as "min_salary",
max(salary) as "max_salary",
avg(salary) as "avg_salary",
sum(salary) as "sum_salary"
from employees
group by department_id 
having  count(first_name)>=6 and min(salary)>2000 and max (salary)>=12000;


select employee_id,
first_name,
salary,
job_id
from employees
where salary = ( 
select max(salary)
from employees
where salary in (
select max(salary)
from employees
group by job_id) and job_id= 'SA_REP');


select employee_id,
first_name,
salary,
job_id
from employees
where salary = ( 
select max(salary)
from employees
where salary in (
select max(salary)
from employees
group by department_id) and department_id= 80);

---------------------------JOIN----------------------------------
--cross join:
select * from 
locations 
cross join
regions

--inner join:
select * from 
employees

--inner join 
jobs 
on employees.job_id = jobs.job_id

--self join
select e.first_name as "Emplyee",
m.first_name as "Manager"
from employees as e join employees as m on e.manager_id = m.employee_id;


--outer join
select *
from employees as e full outer join departments as d
on e.department_id=d.department_id;