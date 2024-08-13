USE Hr

 -------------------------------------------------USE OF WHERE-----------------------------------------

 --The WHERE clause in SQL is used to filter records in a query based on specified conditions.
 --WHERE clause ensures that only records matching the specified criteria are included in the results.

 -- Selects all employees with a salary greater than 5000
SELECT *
FROM employees
WHERE salary > 5000;

-- Selects all employees hired after January 1, 2000
SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

 -------------------------------------------------USE OF OR-----------------------------------------
 --OR SQL operator ko use karte hain jab aapko multiple conditions mai se kisi ek ko satisfy karna ho. 
 --Agar koi bhi condition true ho, toh record select ho jata hai.

-- Selects all employees who were hired in both 1999 and 2022.
SELECT *
FROM employees
WHERE YEAR(hire_date) = '1999' OR YEAR(hire_date) = '2022';

-------------------------------------------------USE OF AND-----------------------------------------
--AND operator ko do ya zyada conditions ko mila kar data filter karne ke liye use kiya jata hai. Sirf wohi records 
--select hote hain jo saari conditions ko satisfy karte hain.

-- Selects all employees who were hired after January 1, 2000, and before December 31, 2005,
SELECT *
FROM employees
WHERE hire_date >= '2000-01-01' AND hire_date <= '2005-12-31';

--Selects all employees who were hired after January 1, 2000, and before December 31, 2005, and orders them by first name.
SELECT *
FROM employees
WHERE hire_date >= '2000-01-01' AND hire_date <= '2005-12-31'
ORDER BY first_name;

--------------------------------------USE OF BETWEEN------------------------------------------
--The BETWEEN operator in SQL is used to filter the result set within a specified range
--The use of BETWEEN was replaced with >= and <= for clear and explicit date range filtering
--BETWEEN is typically used with the AND operator to specify the lower and upper bounds of the range.

--Selects all employees hired in between 2000 to 2022 
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 2000 AND 2022;

-- Selects all employees who were hired between January 1, 2000, and December 31, 2005, and orders them by first name.
SELECT *
FROM employees
WHERE hire_date BETWEEN '2000-01-01' AND '2005-12-31'
ORDER BY first_name;

-- Selects all employees with salaries between 5000 and 8000 (inclusive)
SELECT *
FROM employees
WHERE salary BETWEEN 5000 AND 8000;

-- Selects employees with a salary between 5000 and 8000,employee details including employee_id, full name, job_id, department_id, and salary.
SELECT employee_id, 
first_name + ' ' + last_name AS "Full_name",
job_id,
department_id,
salary
FROM employees
WHERE salary BETWEEN 5000 AND 8000;

-- Selects employees with a salary between 5000 and 6000,employee details including employee_id, full name, job_id, department_id, and salary.
SELECT employee_id, 
first_name + ' ' + last_name AS "Full_name",
job_id,
department_id,
salary
FROM employees
WHERE salary BETWEEN 5000 AND 6000;


------------------------------------------------USE OF IN------------------------------------------------

--The IN SQL operator is used to filter records where a column's value matches any value within a specified list or set of values.
--IN operator se aap ek column ko multiple values ke against filter kar sakte hain. Agar column ki value list mein se kisi bhi 
--value se match hoti hai, toh woh record select ho jata hai.

-- Selects all employees whose salary is one of the specified values: 5000, 1000, 2000, 3000, or 6000
SELECT *
FROM employees
WHERE salary IN (5000, 1000, 2000, 3000, 6000);

-- Selects all employees who report to one of the specified manager IDs: 105, 160, 150, or 120
SELECT *
FROM employees
WHERE manager_id IN (105, 160, 150, 120);

 ------------------------------------------SUB QUERY------------------------------------------------

-- Selects all employees who have the same job_id as the employee with employee_id 160
SELECT *
FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 160);

--NOTE: Single Value Comparison: The = operator is used because the subquery is expected to return a single value. 
--The = operator is suitable when you are comparing a column to a single value.


-- Selects all employees whose job_id is in the list of job_ids for employees with salaries 5000, 1000, 2000, 3000, or 6000
SELECT *
FROM employees
WHERE job_id IN (SELECT job_id
                 FROM employees
                 WHERE salary IN (5000, 1000, 2000, 3000, 6000));

--Why IN is used instead of =: IN is used when you need to match a column against a list of values (which can be multiple), 
--whereas = is used for comparing a column to a single value.

-- Selects the first name, job_id, and salary of employees whose job_id is in the list of job_ids for employees with salaries 5000, 1000, 2000, 3000, or 6000
SELECT first_name,
       job_id,
       salary
FROM employees
WHERE job_id IN (SELECT job_id
                 FROM employees
                 WHERE salary IN (5000, 1000, 2000, 3000, 6000));


-- Selects all employees who work in the same department as an employee named 'David'
SELECT *
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM employees
                        WHERE first_name = 'David');

