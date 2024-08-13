------------------------------------------------------MSSQL QUERIES TASK------------------------------------------------------
use Hr
 
--MSSQL QUERIE:
 
--QUERY-01:write a  SQL query to find the unique designations of the employees. Return job name.

 select distinct job_id as "job_name"
 from employees;

--QUERY-02:write a SQL query to list the employees Details, increased their salary by 15%.

 select *,
 salary * 1.15 as "salary_inc"
 from employees;
 
--QUERY-03:Write a query in SQL to produce the output of employees as follows.

 select * from employees;

--QUERY-04:write a  SQL query to identify those employees whose salaries exceed 3000 after receiving a 25% salary increase. Return complete information about the employees.

 select *
 from employees
 where (salary * 1.25)> 3000;

--QUERY-05:write a SQL query to find the names of the employees whose length is six. Return employee name.

 select *
 from employees
 where len (first_name)=6;

 QUERY-06:write a SQL query to find out which employees joined in the month of January. Return complete information about the employees.

 select *
 from employees
 where MONTH(hire_date)=1;

--QUERY-07:write a SQL query to find those employees whose salaries are less than 3500. Return complete information about the employees.

 select *
 from employees
 where salary < 3500;

--QUERY-08:write a SQL query to identify those employees who joined the company in 1991. Return complete information about the employees.
 select *
 from employees
 where YEAR(hire_date)=1991;

--QUERY-09:write a SQL query to find those employees who joined before 1st April 1991. Return employee ID, employee name, hire date and salary.
 select *
 from employees
 where hire_date<'1991-04-01';

--QUERY-10:write a  SQL query to find out which employees earn more than 100 per day as a salary. Return employee ID, employee name, salary, and experience.

 select employee_id,
 first_name +' '+ last_name as "employee_name", 
 salary,
 job_id as "experience"
 from employees
 where salary/30 >= 100;

 --QUERY-11:write a SQL query to identify the employees whose salaries are odd. Return complete information about the employees.

 select *
 from employees
 where salary%2 >=1;

