------------------------------------------------------MSSQL USER DEFINED FUNCTIONS------------------------------------------------------

--User-Defined Functions:
--Definition: These functions return a single value of any data type.In MSSQL, User-Defined Functions (UDFs) are functions created by 
--users to encapsulate reusable logic in SQL queries. These functions can take parameters, perform actions, and return a result. 

--There are two main types of UDFs in MSSQL:
--1) Scalar Functions:
--Definition: These functions return a single value of any data type.

--2) Table-Valued Functions (TVFs):
--Definition: These functions return a table data type, which can be used like a regular table in SQL queries.

------------------------------------------------------------SCALAR FUNCTIONS------------------------------------------------------------
-- Function to add two numbers
CREATE FUNCTION Add_num(
    @num1 INT,
    @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 + @num2
END
GO

-- Function to subtract two numbers
CREATE FUNCTION Sub_num(
    @num1 INT,
    @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 - @num2
END
GO

-- Function to get the modulus of two numbers
CREATE FUNCTION Mod_num(
    @num1 INT,
    @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 % @num2
END
GO

-- Function to multiply two numbers
CREATE FUNCTION Multiply_num(
    @num1 INT,
    @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 * @num2
END
GO

-- Function to divide two numbers
CREATE FUNCTION Divide_num(
    @num1 INT,
    @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 / @num2
END
GO

-- Usage
SELECT 
    dbo.Add_num(8, 9) AS "Addition",
    dbo.Sub_num(8, 9) AS "Subtraction",
    dbo.Mod_num(8, 9) AS "Modulus",
    dbo.Multiply_num(8, 9) AS "Multiplication",
    dbo.Divide_num(8, 9) AS "Division";

----------------------------------------------------------------------------------------------------------------------------------------

-- Function for Calculator:

CREATE FUNCTION calculator(
    @num1 INT,
    @num2 INT,
    @op VARCHAR(1)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @result DECIMAL(10,2);

    SET @result = CASE
        WHEN @op = '+' THEN CAST(@num1 AS DECIMAL(10,2)) + CAST(@num2 AS DECIMAL(10,2))
        WHEN @op = '*' THEN CAST(@num1 AS DECIMAL(10,2)) * CAST(@num2 AS DECIMAL(10,2))
        WHEN @op = '-' THEN
            CASE
                WHEN @num2 > @num1 THEN CAST(@num2 AS DECIMAL(10,2)) - CAST(@num1 AS DECIMAL(10,2))
                ELSE CAST(@num1 AS DECIMAL(10,2)) - CAST(@num2 AS DECIMAL(10,2))
            END
        WHEN @op = '/' THEN
            CASE
                WHEN @num2 > @num1 THEN CAST(@num2 AS DECIMAL(10,2)) / CAST(@num1 AS DECIMAL(10,2))
                ELSE CAST(@num1 AS DECIMAL(10,2)) / CAST(@num2 AS DECIMAL(10,2))
            END
        WHEN @op = '%' THEN
            CASE
                WHEN @num2 > @num1 THEN CAST(@num2 AS DECIMAL(10,2)) % CAST(@num1 AS DECIMAL(10,2))
                ELSE CAST(@num1 AS DECIMAL(10,2)) % CAST(@num2 AS DECIMAL(10,2))
            END
        ELSE NULL  
    END;

    RETURN @result;
END;

-- Addition 
SELECT dbo.calculator(10, 5, '+') AS Result;  -- Output: 15.00

-- Subtraction
SELECT dbo.calculator(10, 5, '-') AS Result;  -- Output: 5.00

-- Multiplication
SELECT dbo.calculator(10, 5, '*') AS Result;  -- Output: 50.00

-- Division 
SELECT dbo.calculator(10, 5, '/') AS Result;  -- Output: 2.00

-- Modulus
SELECT dbo.calculator(10, 5, '%') AS Result;  -- Output: 0.00

--------------------------------------------------------TABLE BASED FUNCTIONS---------------------------------------------------------

--Create a Table based function named GetByJobID that returns the first name, last name, email, job id, salary for a given job_id from 
--the jobs table.

ALTER FUNCTION GetByJobID(@J_id VARCHAR(20))
RETURNS TABLE
AS
RETURN 
(
    SELECT first_name, last_name, email, job_id, salary
    FROM employees
    WHERE job_id = @J_id
);
-- Query to select job_id from jobs
SELECT job_id 
FROM jobs;

-- Query to use the function and get employees with job_id 'FI_MGR'
SELECT first_name, salary 
FROM dbo.GetByJobID('FI_MGR');

