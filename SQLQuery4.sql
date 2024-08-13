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
