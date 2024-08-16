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


-------------------------------------------------LIKE,WHERE,IN,ON-----------------------------------------------

--60) Retrieve the names of countries in Region 1.

select * from regions
select country_name ,region_id from countries
WHERE  region_id=1 

--61) Find the departments located in cities starting with 'N'.

select * from countries
select * from  locations
select * from  departments

select d.*,
l.city,
c.country_name
from 
departments as d inner join
locations as l
on l.location_id= d.location_id
inner join countries as c
on l.country_id= c.country_id
WHERE city LIKE 'N%';


--62) Select employees who work in departments managed by employees with a commission percentage greater than 0.15.

select e.first_name +' '+ e.last_name as "Employee Name" ,
e.commission_pct
from employees as e
WHERE e.commission_pct > 0.15

--63) Get the job titles of employees who are managers.
select * from jobs 
select * from employees

select 
j.job_title,
m.first_name +' '+ m.last_name as "Manager Name"
from employees as e 
join employees as m 
on e.employee_id = m.manager_id
inner join jobs as j
on m.job_id = j.job_id;

--64) Retrieve the postal codes of locations where the country's region name is 'Asia'.
select * from locations
select * from regions
select * from countries

select c.country_name,
r.*,
l.postal_code from
locations as l
inner join countries as c
on l.country_id= c.country_id
inner join regions as r
on c.region_id = r.region_id
WHERE region_name = 'Asia';


--65) Select the names of departments that have employees with commission percentages less than the average commission percentage across all departments.

select * from employees
select * from departments

select d.department_name,
e.first_name +' '+ e.last_name as "Employee Name",
e.commission_pct
from employees as e
inner join departments as d
on d.department_id=e.department_id
where e.commission_pct < ( select
avg (commission_pct) from
employees) 

--66) Retrieve the job titles of employees whose salary is higher than the average salary of employees in the same department.

select j.job_title,
e.first_name +' '+ e.last_name as "Employee Name",
e.salary
from employees as e
inner join jobs as j
on j.job_id=e.job_id
where e.salary > ( select
avg (salary) from
employees) 

--67) Find the IDs of employees who have not been assigned to any department.

SELECT 
e.employee_id,
e.first_name + ' ' + e.last_name as "Employee Name",
d.department_name
FROM employees e
LEFT JOIN 
departments d 
ON e.department_id = d.department_id
WHERE e.department_id IS NULL;


-------------------------------------------------AGGREGATE FUNCTIONS, GROUPBY, HAVING------------------------------------------------------

--68) Get the names of employees who have held more than one job position (multiple entries in the job history table).
select * from job_history

SELECT 
    e.first_name + ' ' + e.last_name AS "Employee Name",
    COUNT(jh.job_id) AS "Number of Positions Held"
FROM 
    employees e
INNER JOIN 
    job_history jh 
ON 
    e.employee_id = jh.employee_id
GROUP BY 
    e.first_name, e.last_name
HAVING 
    COUNT(jh.job_id) > 1;

--69) Retrieve the count of employees in each department.

SELECT d.department_name,
count(e.employee_id) as 'No. of employees'
FROM employees e
inner join departments as d
on e.department_id=d.department_id
group by department_name;

--70) Find the total salary for each job title.


select sum(e.salary) as 'Total Salary',
j.job_title
from
jobs as j
inner join employees as e
on e.job_id =j.job_id
group by job_title

--71) Get the average commission percentage for each department.

select d.department_name,
avg(commission_pct)* 100  as 'commission_%age'
from employees as e
inner join departments as d
on e.department_id=d.department_id
group by department_name

--Note: Sales department with an average commission percentage of 0.225000 represents the value in its decimal form, which is equivalent to 22.5%.

select d.department_name,
avg(commission_pct)* 100  as 'commission_%age'  --Here i multiply the avg(commission_pct) by 100 to get 22.5%
from employees as e
inner join departments as d
on e.department_id=d.department_id
group by department_name


--72) Retrieve the maximum salary in each country.
select * from countries
select * from jobs
select * from employees

--first method
select 
max (e.salary) as 'Max_Salary',
c.country_name
from countries as c
cross join jobs as j
inner join employees as e
on e.job_id =j.job_id
group by country_name

--2nd method
select 
max (j.max_salary) as 'Max_Salary',
c.country_name
from countries as c
cross join jobs as j
group by country_name


--73)Write a query in SQL to display those employees who contain a letter z to their first name and
--also display their last name, department, city, and state province.
select * from employees
select * from  departments
select * from locations

select e.first_name +' '+ e.last_name as Full_name,
e.last_name,
d.department_name,
l.city,
l.state_province
from employees as e
inner join departments as d
on d.department_id=e.department_id
inner join locations as l
on d.location_id =l.location_id
where first_name like '%z%'

--74) Write a query in SQL to display the job title, department name, full name (first and last name) of the employee,
--and starting date for all the jobs that started on or after 1st January 1993 and ending with on or before 31 August 1997.
select * from jobs
select * from employees
select * from  departments
select * from job_history

select e.first_name +' '+ e.last_name as Full_name,
d.department_name,
j.job_title,
jh.start_date, jh.end_date
from employees as e
inner join departments as d
on d.department_id=e.department_id
inner join jobs as j
on j.job_id =e.job_id
inner join job_history as jh
on jh.job_id = e.job_id
where jh.start_date > '1993-01-01' and  jh.end_date <'1997-08-31'

--75) Write a query in SQL to display the country name, city, and number of those departments where at least 2 employees are working.
select * from countries
select * from  departments
select * from locations

select c.country_name,
l.city,
d.department_name,
count(e.employee_id) as 'count of emp'
from employees as e
inner join departments as d
on d.department_id=e.department_id
inner join locations as l
on d.location_id=l.location_id
inner join countries as c
on c.country_id=l.country_id
group by department_name,c.country_name,l.city
having count(e.employee_id) >= 2


-- 76) Write a query in SQL to display full name (first and last name), job title, and starting and ending
--date of last jobs for those employees with worked without a commission percentage.

select * from employees
select * from jobs
select * from job_history

select e.first_name +' '+ e.last_name as Full_name,
j.job_title,
jh.start_date, jh.end_date,
e.commission_pct
from employees as e
inner join jobs as j
on j.job_id =e.job_id
inner join job_history as jh
on jh.employee_id =e.employee_id
where e.commission_pct is null

--77) Write a query in SQL to display the full name (first and last name) of the employee with ID and name of
--the country presently where (s)he is working.

select e.first_name +' '+ e.last_name as Full_name,
e.employee_id,
c.country_name
from employees as e
cross join countries as c

--78) Write a query to display the name (first name and last name), salary, and department ID for those
--employees who earn such an amount of salary which is the smallest salary of any of the departments.

select e.first_name +' '+ e.last_name as Full_name,
e.salary as 'min_dep_salary',
e.department_id
from employees as e
inner join jobs as j
on j.job_id = e.job_id
where e.salary <= j.min_salary

--79) Write a query to display all the information for those employees whose id is any id who earn the third highest salary.

SELECT 
    e.first_name + ' ' + e.last_name AS Full_name,
    e.salary AS '3rd Highest salary',
    j.job_title
FROM 
    employees AS e
INNER JOIN 
    jobs AS j 
	ON j.job_id = e.job_id
WHERE 
    e.salary = (
        SELECT TOP 1 salary
        FROM (
            SELECT DISTINCT TOP 3 salary
            FROM employees
            ORDER BY salary DESC
        ) AS ThirdHighest
        ORDER BY salary ASC
    );


