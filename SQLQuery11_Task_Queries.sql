--****************************************************************************Questions on Views************************************************************************
--1) Create a view named EmployeeCompensationDetails that shows the employee_id, first_name, last_name, salary, and commission_pct.
--Ensure that the view includes only employees with a non-null commission_pct.


create view EmployeeCompensationDetails 
as
select employee_id,first_name,last_name, salary , commission_pct 
from employees
WHERE commission_pct IS NOT NULL

select * from EmployeeCompensationDetails

--2) Create a view named DepartmentSalaryRange that shows the department_name and the salary range 
--(MIN(salary) and MAX(salary)) for employees in each department.

create view DepartmentSalaryRange
AS
SELECT d.department_name, 
MAX(e.salary) as 'max_s', 
MIN(e.salary) as 'min_s'
FROM
employees AS e
inner join departments as d
on d.department_id= e.department_id
group by d.department_name

select * from DepartmentSalaryRange

--3) Create a view called EmployeeLocationDetails that includes employee_id, 
--first_name, last_name, city, and state_province by joining employees with locations. 
--Ensure that the view excludes employees without a location.
create view EmployeeLocationDetails
as
SELECT e.employee_id,
e.first_name,
e.last_name,
l.city,
l.state_province
from employees as e
inner join departments as d
on d.department_id= e.department_id
inner join locations as l 
on d.location_id=l.location_id

select * from EmployeeLocationDetails

--4) Design a view named HighCommissionEmployees that displays employee_id, 
--first_name, last_name, and commission_pct for employees whose commission percentage 
--is greater than 0.2.

create view HighCommissionEmployees
as
select e.employee_id,
e.first_name,
e.last_name,
e.commission_pct
from employees as e
where e.commission_pct > 0.2

select * from HighCommissionEmployees

--5) Create a view EmployeeJobHistoryView that shows employee_id, job_title, 
--start_date, and end_date by joining the employees and job_history tables. 
--Ensure it only includes records where end_date is not null.
create view EmployeeJobHistoryView
as
select e.employee_id,
jh.start_date,
jh.end_date,
j.job_title
from employees as e
inner join job_history jh
on jh.employee_id= e.employee_id
inner join jobs as j
on j.job_id=jh.job_id
where end_date is not null

select * from  EmployeeJobHistoryView

--6) Design a view named RecentHires that includes employee_id, first_name, last_name, 
--and hire_date for employees hired in the last 6 months.


--7) Create a view EmployeeDepartmentJobCount that shows department_name, job_title, and the count of employees in each job title per department.



--8) Create a view named EmployeeSalaryComparison that includes employee_id, first_name, last_name, and salary, along with a calculated column that indicates whether their salary is above or below the average salary for their job title.



--9) Design a view CountryCities that shows country_name and a list of city names, where cities are grouped by their country.



--10) Create a view named EmployeeSalaryGrade that classifies employees into salary grades based on salary ranges (e.g., 'Low', 'Medium', 'High') and includes employee_id, first_name, last_name, and salary_grade.



--****************************************************************************Questions on Stored Procedures****************************************************************************


--11) Create a stored procedure GetEmployeeSalaryComparison that compares the salary of an employee with their departmentâ€™s average salary and returns whether the employeeâ€™s salary is above or below the average.

--12) Write a stored procedure AdjustEmployeeSalaries that increases the salary of employees by a percentage, where the percentage is passed as a parameter. Include error handling to manage invalid input.

--13) Create a stored procedure MergeEmployeeData that merges data from a temporary table into the employees table. The procedure should handle both updates to existing records and insertion of new records.

--14) Write a stored procedure GetEmployeeJobHistoryRange that retrieves job history records for employees between two specified dates, including all columns from the job_history table.

--15) Design a stored procedure TransferEmployee that updates the department_id for an employee and logs this transfer into an employee_transfers table.

--16) Create a stored procedure BatchUpdateEmployeeCommission that updates the commission_pct for employees in a specified department based on a percentage increase provided as a parameter.

--17) Write a stored procedure GetEmployeeDetailsByDynamicQuery that accepts a column name as a parameter and returns the values for all employees in that column using dynamic SQL.

--18) Create a stored procedure EmployeePromotionHistory that records employee promotions by adding entries to a promotion_history table, handling both new promotions and updates to existing records.

--19) Write a stored procedure GenerateEmployeeReports that produces a report of employeesâ€™ details, including job titles, department names, and locations, and exports the data to a CSV file.

--20) Design a stored procedure CalculateDepartmentBudgets that calculates the total salary and commission for each department and updates a summary table with this data.

--21) Create a stored procedure UpdateEmployeeJobTitle that updates an employeeâ€™s job title based on employee_id and logs the changes in a job_title_changes table.

--22) Write a stored procedure CalculateEmployeeBonuses that calculates bonuses for employees based on performance criteria and updates the employees table with these bonus amounts.

--23) Design a stored procedure AuditEmployeeChanges that tracks changes made to the employees table and logs these changes in an audit_log table, capturing old and new values.

--24) Create a stored procedure ProcessEmployeeData that accepts a table-valued parameter containing employee records and processes them accordingly, including error handling for invalid records.

--25) Write a stored procedure GenerateEmployeeSummary that calculates and updates a summary table with total earnings (salary + commission) for each employee.

--26) Design a stored procedure EmployeeSalaryUpdateLog that records changes to employee salaries into a salary_update_log table, including the old and new salary values.

--27) Create a stored procedure GetHighEarningEmployees that retrieves employees with salaries above a specified threshold and includes their previous job history.

--28) Write a stored procedure CalculateEmployeeRetention that analyzes employee retention rates over specified periods and outputs this data to a retention_summary table.

--29) Design a stored procedure GenerateDepartmentReports that generates detailed reports for each department, including employee counts, average salaries, and total compensation.

--30) Create a stored procedure EncryptSensitiveEmployeeData that encrypts sensitive data in the employees table using SQL Server encryption features, and provide an example of how to decrypt this data when needed.
