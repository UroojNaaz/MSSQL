-- Use the Hr database
USE Hr;

-----------------------------Basic Queries-----------------------------------

-- Select all columns from employees
SELECT *
FROM employees;

-- Select employees with salary (after 15% increase) greater than 10,000
SELECT *
FROM employees
WHERE (salary * 1.15) > 10000;

-- Select employee ID, full name, and salary in dollars ($280 per unit)
SELECT
    employee_id,
    first_name + ' ' + last_name AS "full_name",
    salary / 280 AS "salary in $"
FROM employees
WHERE (salary * 1.15) > 10000;

-- Select non-null commission percentages
SELECT
    commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- Select employees hired after January 1, 1992 with non-null commission percentages
SELECT *
FROM employees
WHERE hire_date > '1992-01-01'
  AND commission_pct IS NOT NULL;

-- Select employees with first name 'John'
SELECT *
FROM employees
WHERE first_name = 'John';

-- Declare and set a variable for name
DECLARE @name VARCHAR(28);
SET @name = 'Nancy';

-- Select employees with first name matching the variable
SELECT *
FROM employees
WHERE first_name = @name;

-----------------------------Advanced Queries-----------------------------

-- Select employee with ID 160
SELECT *
FROM employees
WHERE employee_id = 160;

-- Select employees with ID less than 160
SELECT *
FROM employees
WHERE employee_id < 160;


--------------------------------Subquery-----------------------------------

-- Subquery: Select employees with the same job_id as employee 160
SELECT *
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 160);

-- Subquery: Select employees with the same manager_id as employee 150
SELECT *
FROM employees
WHERE manager_id = (SELECT manager_id
                    FROM employees
                    WHERE employee_id = 150);


----------------------------Table Variable-----------------------------------

-- Declare a table variable for employee summary
DECLARE @emp_summary TABLE (
    emp_id INT NOT NULL,
    Full_Name VARCHAR(100) NOT NULL,
    Annual_Salary INT
);

-- Insert employee summary into the table variable
INSERT INTO @emp_summary (emp_id, Full_Name, Annual_Salary)
SELECT
    employee_id,
    first_name + ' ' + last_name,
    salary * 12
FROM employees;

-- Select from the employee summary table variable
SELECT * FROM @emp_summary;
