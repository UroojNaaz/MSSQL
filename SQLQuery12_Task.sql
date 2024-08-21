------------------------------------------------------------------------Scalar Function's Queries-------------------------------------------------------------------------------------------

1) Create a scalar function named GetJobTitle that returns the job_title for a given job_id from the jobs table.

CREATE FUNCTION GetJobTitle(
@JID varchar(15)
)
RETURNS varchar(100)
AS
BEGIN 
RETURN (SELECT job_title FROM jobs WHERE job_id = @JID)
END

SELECT dbo.GetJobTitle('AD_ASST') AS 'JOB_TITLE';
  
2) Develop a scalar function called FormatPostalCode that takes a postal_code as input and formats it as 12345-6789 if the input is 123456789.

CREATE FUNCTION FormatPostalCode (
@POSTAL_C VARCHAR(20) )
RETURNS VARCHAR(20)
AS
BEGIN 
DECLARE @RESULT VARCHAR(20)
SET @RESULT= STUFF (@POSTAL_C ,6,0,'-')
RETURN  @RESULT
END

SELECT dbo.FormatPostalCode ('123456789')
  
3) Write a scalar function named IsHighSalary that takes an employee_id and returns 'Yes' if the employee's salary is greater than $100,000, and 'No' otherwise.


4) Create a scalar function GetYearsOfService that takes an employee_id and returns the number of years the employee has been with the company based on the hire_date.


5) Implement a scalar function GetDefaultRegionName that returns a default value of 'Unknown Region' if the region_name in the regions table is NULL.


6) Write a scalar function GetEmployeeContactInfo that returns the concatenated email and phone_number of an employee, separated by a space.


7) Create a scalar function GetEmployeeFullName that returns the full name of an employee in the format "LastName, FirstName", handling cases where first_name or last_name might be NULL.


8) Develop a scalar function CalculateAnnualSalary that takes an employee_id and returns the annual salary (monthly salary multiplied by 12) of the employee.


9) Write a scalar function FormatEmployeeSalary that takes an employee_id and returns the salary formatted as $1,234.56.


10) Create a scalar function GetCountryNameLength that returns the length of the country_name for a given country_id.


11) Implement a scalar function ToUpperCase that takes an input string and returns it in uppercase.

12) Write a scalar function GetJobCodePrefix that extracts the first 3 characters from the job_id in the jobs table.


13) Create a scalar function GetEmployeeAge that calculates the age of an employee based on their hire_date.


14) Develop a scalar function CompareSalaries that takes two employee_id values and returns 'Higher' if the salary of the first employee is higher than the second, 'Lower' if it's lower, and 'Equal' if they are the same.


15) Write a scalar function GetEmployeeStatus that returns a custom message indicating if an employee is a "New Hire" (hired in the last 30 days) or "Experienced".


16) Create a scalar function FormatHireDate that returns the hire_date of an employee in the format 'YYYY-MM-DD'.


17) Develop a scalar function IsValidCountryID that returns 'Valid' if the country_id exists in the countries table and 'Invalid' otherwise.


18) Write a scalar function HasMinimumSalary that takes a job_id and returns 'Above Minimum' if there are employees with a salary greater than or equal to the min_salary for that job, and 'Below Minimum' otherwise.


19) Create a scalar function GetDepartmentManagerName that takes a department_id and returns the full name of the manager of that department.


20) Implement a scalar function GetEmployeeCountInDepartment that takes a department_id and returns the total number of employees in that department.
