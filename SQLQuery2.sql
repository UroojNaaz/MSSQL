-----------------------Creating a Database and Using It-------------------------

-- Create a new database named Hr
CREATE DATABASE Hr;

-- Use the Hr database
USE Hr;


---------------------------Selecting Data from a Table---------------------------

-- Select all columns from the employees table
SELECT * FROM employees;

-- Select specific columns 
SELECT employee_id, first_name, last_name, email FROM employees;

-- Select unique job_ids from the employees table (Using DISTINCT)
SELECT DISTINCT job_id FROM employees;


---------------------------------Ordering Results-------------------------------

-- employees table ordered by first_name
SELECT * FROM employees ORDER BY first_name;

-- employees table ordered by last_name
SELECT * FROM employees ORDER BY last_name;

-- employees table ordered by salary in Ascending order
SELECT * FROM employees ORDER BY salary;

-- employees table ordered by salary in descending order
SELECT * FROM employees ORDER BY salary DESC;


--------------------------------Filtering Data-------------------------------

-- Select all columns (Filter Rows Based on a Condition)
SELECT * FROM employees WHERE last_name = 'King';

-- Select employees with a specific job_id
SELECT * FROM employees WHERE job_id = 'SA_REP';

-- Select employees with a salary greater than a specific amount
SELECT * FROM employees WHERE salary > 13000.00;


--------------------Declaring Variables & Assigning Values---------------------

-- Declare and initialize variables
DECLARE @num1 INT, @num2 INT;
SET @num1 = 15;
SET @num2 = 5;

-- Arithmetic operations (multiple queries)
SELECT @num1 AS "Num 1", @num2 AS "Num 2", @num1 + @num2 AS "ADD";
SELECT @num1 AS "Num 1", @num2 AS "Num 2", @num1 - @num2 AS "SUB";
SELECT @num1 AS "Num 1", @num2 AS "Num 2", @num1 / @num2 AS "DIVIDE";
SELECT @num1 AS "Num 1", @num2 AS "Num 2", @num1 * @num2 AS "MULTIPLY";
SELECT @num1 AS "Num 1", @num2 AS "Num 2", @num1 % @num2 AS "MODE";

-- Arithmetic operations (single query)
SELECT 
    @num1 AS "Num 1",
    @num2 AS "Num 2", 
    @num1 + @num2 AS "ADD",
    @num1 - @num2 AS "SUB",
    @num1 / @num2 AS "DIVIDE", 
    @num1 * @num2 AS "MULTIPLY", 
    @num1 % @num2 AS "MODE";

---------------------------Arithmetic Operators------------------------------

-- Declare and initialize variables
DECLARE @num3 INT, @num4 INT;
SET @num3 = 1;
SET @num4 = 2;

-- Compound operations
SET @num3 += @num4;  -- Addition
SELECT @num3 AS "NUM+";

SET @num3 *= 8;      -- Multiplication
SELECT @num3 AS "NUM*";

SET @num3 /= 9;      -- Division
SELECT @num3 AS "NUM/";