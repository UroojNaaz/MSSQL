use Hr
--MSSQL QUERIES

--1) Select locations with postal codes less than or equal to '50000'.
 select *
 from locations
 where postal_code >= 50000

--2) Get all jobs with a minimum salary greater than 50000.
select *
from jobs 
where min_salary > 50000

--3) Retrieve departments where the manager ID is not null.
select *
from departments
where manager_id is not null;

--4) Find employees with a commission percentage equal to 0.10.
select *
from employees
where commission_pct = 0.10

--5) Select employees hired after '2022-01-01'.
select *
from employees
where hire_date > '2022-01-01'

--6) Retrieve employees with salaries between 40000 and 60000.
select *
from employees
where salary between 40000 and 60000;

--7) Retrieve regions with names containing 'Americas'.
select *
from regions
where region_name ='Americas'

--8) Find countries with region IDs between 3 and 6.
select *
from regions
where region_id between 3 and 6

--9) Select locations in cities starting with 'New'.
select *
from locations
where city like '%New%'

--10) Get jobs with titles not containing 'Manager'.
select *
from jobs
where job_title not like '%Manager%'

--11) Retrieve departments where the manager ID is either 101 or 102.
select *
from departments
where manager_id in (101,102)

--12) Find employees in departments with IDs not between 100 and 190.
select *
from departments
where department_id not between 100 and 190

--13) Select employees hired between '2022-01-01' and '2022-06-30'.
select *
from employees
where hire_date between '2022-01-01' and '2022-06-30'

--14) Retrieve job history records for employees with IDs in (101, 109, 113).
select *
from job_history
where employee_id in (101, 109, 113)

--15) Find employees with first names starting with 'j' and last names starting with 'D'.
select *
from employees
where first_name like 'j%' and last_name like 'd%'

--16) Get employees with salaries greater than 5000 and commission percentage less than 0.15.
select *
from employees
where salary > 5000 and commission_pct < 0.15

--17) Retrieve countries with names ending with 'nd'.
select *
from countries
where country_name like '%nd'

--18) Find locations with street addresses containing 'Street'.
select *
from locations
where street_address like '%Street%'

--19) Select jobs with titles starting with 'Senior'.
select *
from jobs
where job_title  like 'Senior%'

--19) Select jobs with titles starting with 'Senior'.
select *
from jobs
where job_title  like 'Senior%'

--20) Retrieve departments with names containing 'HR'.
select *
from departments
where department_name like '%HR%'

--21) Find countries with region IDs in (1, 2, 3).
select *
from countries
where region_id in (1, 2, 3)

--22) Retrieve locations in countries with IDs in ('US', 'UK', 'CA').
select *
from countries
where country_id in ('US', 'UK', 'CA')

--23) Select jobs with IDs in ('IT_PROG', 'SA_REP', 'HR_REP').
select *
from jobs
where job_id in ('IT_PROG', 'SA_REP', 'HR_REP')

--24) Get departments with IDs in (100, 200, 300).
select *
from departments
where department_id in (100, 200, 300)

--25) Retrieve employees in departments with names in ('IT', 'Finance').
select *
from departments
where department_name in ('IT', 'Finance')

--26) Find regions with IDs between 3 and 6.
select *
from countries
where region_id between 3 and 6

--27) Retrieve countries with region IDs between 1 and 3.
select *
from countries
where region_id between 1 and 3

--28) Select locations with postal codes between '1000' and '2000'.
select *
from locations
where postal_code between '1000' and '2000'

--29) Get jobs with salaries between 4000 and 6000
select *
from employees
where salary between 4000 and 6000

--30) Retrieve departments with IDs between 100 and 200.
select *
from employees
where department_id  between 100 and 200
