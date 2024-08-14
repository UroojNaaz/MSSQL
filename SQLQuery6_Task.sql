--------------------------------------------------------Join-------------------------------------------------------------------

--31) Retrieve employee details along with their department names.
use Hr
select *
from departments
select *
from employees

select e.*, d.department_name
from employees as e inner join departments as d
on e.department_id=d.department_id;

--32) Find countries along with their region names.
select *
from countries
select *
from regions

select c.*, r.region_name
from countries as c inner join regions as r
on c.region_id=r.region_id;

--33) Select locations with their corresponding country names.
select *
from locations
select *
from countries

select l.*, c.country_name
from countries as c inner join locations as l
on c.country_id=l.country_id;

--34) Get job details along with their department names.
select *
from jobs
select *
from departments

select j.*, d.department_name
from jobs as j cross join departments as d;

--35) Retrieve employee details along with their job titles.
select *
from jobs
select *
from employees

select e.*, j.job_title
from employees as e inner join jobs as j
on e.job_id= j.job_id;


--36) Find employees along with their managers' details.

select 
e.first_name +' '+ e.last_name as "Employee Name",
m.first_name +' '+ m.last_name as "Manager Name",
m.*
from employees as e join employees as m 
on e.manager_id = m.employee_id;

--37) Retrieve employees along with their department and location details.

select *
from locations
select *
from departments
select *
from employees

select emp.first_name +' '+emp.last_name as 'Full Name',
emp.department_name,
emp.department_id,
l. *
from locations as l
cross join  (select e.*, 
d.department_name
from employees as e inner join departments as d
on e.department_id=d.department_id) emp

--38) Get employees along with their country and region details.
select *
from employees
select *
from countries
select *
from regions

select  
e.first_name +' '+e.last_name as 'Full Name',
st.*
from employees as e
cross join  (select c.*, r.region_name
from countries as c inner join  regions as r
on c.region_id= r.region_id) st ;

--39) Retrieve employees along with their job titles and department names.

select e.*,
emp_d.job_title, 
emp_d.department_name
from employees as e
cross join (select j.job_title , d.department_name
from jobs as j cross join departments as d) emp_d;


--40) Find employees along with their location details and country names.
select *
from employees
select *
from countries
select *
from locations

select  
e.first_name +' '+e.last_name as 'Full Name',
st.country_name,
st.*
from employees as e
cross join  (select l.* , c.country_name
from countries as c inner join  locations as l
on c.country_id= l.country_id ) st ;

--41) Retrieve job history records along with employee details.

select  
e.*,
jh.*
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id

--42) Find employees with their corresponding job history.

select  
e.first_name +' '+e.last_name as 'Full Name',
jh.*
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id

--43) Select employees along with their job history and department names.

select  
e.first_name +' '+e.last_name as 'Full Name',
emp.*
from employees as e cross join
(select jh.*,
d.department_name 
from job_history as jh inner join
departments as d
on jh.department_id= d.department_id) emp;

select  
e.first_name + ' ' + e.last_name as 'Full Name',
jh.*,
d.department_name
from employees as e 
inner join 
job_history as jh 
on e.employee_id = jh.employee_id
inner join departments as d 
on jh.department_id = d.department_id;


--44) Get employees with their job history, department, and location details.
use Hr
select * from locations
select * from job_history
select * from departments

select
jh.*,
d.department_name, 
l.*
from 
job_history as jh 
inner join departments as d 
on jh.department_id = d.department_id
cross  join locations as l

--45) Retrieve employees along with their job history and country names.

select * from job_history
select * from countries

select  
e.first_name +' '+e.last_name as 'Full Name',
jh.*,
c.country_name
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id
cross join  countries as c

--46) Find job history records with employee and department details.
select * from job_history
select * from departments

select  
e.first_name +' '+e.last_name as 'Full Name',
jh.*,
d.department_name, d.manager_id,d.location_id
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id
inner join departments as d
on jh.department_id=d.department_id

--47) Retrieve job history records along with employee and job details.
select * from job_history
select * from jobs

select  
e.first_name +' '+e.last_name as 'Full Name',
jh.*,
j.job_title,j.max_salary,j.min_salary
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id
inner join jobs as j
on jh.job_id=j.job_id

--48) Get job history records with employee, job, and department details.
select * from job_history
select * from jobs
select * from departments

select  
e.first_name +' '+e.last_name as 'Full Name',
jh.*,
j.job_title,j.max_salary,j.min_salary,
d.department_name, d.manager_id,d.location_id
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id
inner join jobs as j
on jh.job_id=j.job_id
inner join departments as d
on jh.department_id=d.department_id

--49) Retrieve job history records along with employee, job, and location details.
select * from locations

select  
e.first_name +' '+e.last_name as 'Full Name',
jh.*,
j.job_title,j.max_salary,j.min_salary,
l.*
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id
inner join jobs as j
on jh.job_id=j.job_id
cross  join locations as l

--50) Find job history records with employee, job, and country details.
select * from countries

select  
e.first_name +' '+e.last_name as 'Full Name',
jh.*,
j.job_title,j.max_salary,j.min_salary,
c.*
from employees as e inner join
job_history as jh
on e.employee_id=jh.employee_id
inner join jobs as j
on jh.job_id=j.job_id
cross join countries as c 

--51) Retrieve regions along with their countries and locations.

select * from regions
select * from countries
select * from locations

select r.*,
c.country_name,
l.*
from regions as r inner join countries as c
on r.region_id= c.region_id
inner join locations as l
on c.country_id=l.country_id

--52) Find countries along with their regions and locations.

select * from regions
select * from countries
select * from locations

select c.country_name,
l.*,
r.*
from regions as r inner join countries as c
on r.region_id= c.region_id
inner join locations as l
on c.country_id=l.country_id

--53) Retrieve locations along with their countries and regions.
select * from regions
select * from countries
select * from locations

select l.*,
c.country_name,
r.*
from regions as r inner join countries as c
on r.region_id= c.region_id
inner join locations as l
on c.country_id=l.country_id

--54) Find departments along with their employees and locations.
select * from departments
select * from locations

select e.first_name +' '+e.last_name as 'Full Name',
d.department_name,d.department_id,d.manager_id,
l.*
from employees as e 
inner join departments as d
on e.department_id= d.department_id
inner join locations as l
on l.location_id=d.location_id;


--55) Retrieve employees along with their departments, locations, and countries.
select * from countries
select * from locations
select * from departments

select e.first_name +' '+e.last_name as 'Full Name',
d.department_name,d.department_id,d.manager_id,
l.*,
c.country_name,c.region_id
from employees as e 
inner join departments as d
on e.department_id= d.department_id
inner join locations as l
on l.location_id=d.location_id
inner join
countries as c
on c.country_id=l.country_id

--56) Find employees along with their managers, departments, and locations.

select 
e.first_name +' '+ e.last_name as "Employee Name",
m.first_name +' '+ m.last_name as "Manager Name",
d.manager_id,d.department_id,d.department_name,
l.*
from employees as e join employees as m 
on e.manager_id = m.employee_id
inner join departments as d
on e.department_id= d.department_id
inner join locations as l
on l.location_id=d.location_id;

--57) Retrieve employees along with their job titles, departments, and locations.

select e.first_name +' '+e.last_name as 'Full Name',
j.job_title,
d.department_name,d.department_id,d.manager_id,
l.*
from employees as e 
inner join departments as d
on e.department_id= d.department_id
inner join jobs as j
on j.job_id=e.job_id
inner join locations as l
on l.location_id=d.location_id;

--58) Find employees along with their job titles, departments, and managers.

select 
e.first_name +' '+ e.last_name as "Employee Name",
j.job_title,
m.first_name +' '+ m.last_name as "Manager Name",
d.manager_id,d.department_id,d.department_name

from employees as e 
join employees as m 
on e.manager_id = m.employee_id

inner join departments as d
on e.department_id= d.department_id

inner join jobs as j
on j.job_id=e.job_id;


--59) Retrieve employees along with their job titles, departments, managers, and locations.

select 
e.first_name +' '+ e.last_name as "Employee Name",
j.job_title,
m.first_name +' '+ m.last_name as "Manager Name",
d.manager_id,d.department_id,d.department_name,
l.*

from employees as e 
join employees as m 
on e.manager_id = m.employee_id

inner join departments as d
on e.department_id= d.department_id

inner join jobs as j
on j.job_id=e.job_id

inner join locations as l
on l.location_id=d.location_id;
