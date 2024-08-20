--Question: Write a SQL query to retrieve the maximum, minimum, average, count, and total sum of employee salaries, grouped by each state's province.

-- Fetch salary statistics grouped by state's province :
SELECT l.state_province,
    MAX(e.salary),
    MIN(e.salary),
    AVG(e.salary),
    COUNT(e.salary),
    SUM(e.salary)
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id
FULL OUTER JOIN jobs j ON e.job_id = j.job_id
FULL OUTER JOIN job_history jh ON jh.job_id = j.job_id
FULL OUTER JOIN locations l ON l.location_id = d.location_id
FULL OUTER JOIN countries c ON c.country_id = l.country_id
FULL OUTER JOIN regions r ON r.region_id = c.region_id
GROUP BY l.state_province;

--Question: How can you create a stored procedure that allows grouping salary statistics dynamically by any column specified as a parameter? 
--Provide an example of executing this procedure to group salary statistics by city.

--Dynamically group salary statistics by any column using a stored procedure:
CREATE PROC Group_By_Employees @column VARCHAR(30)
AS
BEGIN
    DECLARE @Query NVARCHAR(MAX);
    SET @Query = '
        SELECT ' + @column + ',
            MAX(e.salary),
            MIN(e.salary),
            AVG(e.salary),
            COUNT(e.salary),
            SUM(e.salary)
        FROM employees e
        FULL OUTER JOIN departments d ON e.department_id = d.department_id
        FULL OUTER JOIN jobs j ON e.job_id = j.job_id
        FULL OUTER JOIN job_history jh ON jh.job_id = j.job_id
        FULL OUTER JOIN locations l ON l.location_id = d.location_id
        FULL OUTER JOIN countries c ON c.country_id = l.country_id
        FULL OUTER JOIN regions r ON r.region_id = c.region_id
        GROUP BY ' + @column;
    EXEC sp_executesql @Query;
END;

-- Execute the procedure to group by city
EXEC Group_By_Employees 'l.city';
-------------------------------------------------------------------------------------------------------------------------------------------

--Question: How would you create a SQL view that combines employee details such as name, email, salary, department, job title, and location 
--information into a single view named emp_120?

-- Create a view to display detailed employee information:
CREATE VIEW emp_120
AS
SELECT e.employee_id, e.first_name, e.last_name, e.email, e.manager_id, e.salary,
    d.department_name, j.job_title, jh.start_date, jh.end_date, l.city, l.state_province,
    l.postal_code, l.street_address, c.country_name, r.region_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id
FULL OUTER JOIN jobs j ON e.job_id = j.job_id
FULL OUTER JOIN job_history jh ON jh.job_id = j.job_id
FULL OUTER JOIN locations l ON l.location_id = d.location_id
FULL OUTER JOIN countries c ON c.country_id = l.country_id
FULL OUTER JOIN regions r ON r.region_id = c.region_id;

--Question: Create a stored procedure that dynamically generates a view containing detailed information for a specific employee based on their employee ID. 
--Provide an example of executing this stored procedure for employee ID 117.

-- Stored procedure to create dynamic views based on employee ID
ALTER PROC CreateViews @EID VARCHAR(10)
AS
BEGIN
    DECLARE @Query NVARCHAR(MAX);
    SET @Query = '
        CREATE VIEW emp_' + @EID + '
        AS
        SELECT e.employee_id, e.first_name, e.last_name, e.email, e.manager_id, e.salary,
            d.department_name, j.job_title, jh.start_date, jh.end_date, l.city, l.state_province,
            l.postal_code, l.street_address, c.country_name, r.region_name
        FROM employees e
        FULL OUTER JOIN departments d ON e.department_id = d.department_id
        FULL OUTER JOIN jobs j ON e.job_id = j.job_id
        FULL OUTER JOIN job_history jh ON jh.job_id = j.job_id
        FULL OUTER JOIN locations l ON l.location_id = d.location_id
        FULL OUTER JOIN countries c ON c.country_id = l.country_id
        FULL OUTER JOIN regions r ON r.region_id = c.region_id
        WHERE e.employee_id =' + @EID;
    EXEC sp_executesql @Query;
END;

-- Execute the procedure 
EXEC CreateViews @EID = 117;

---------------------------------------------------------------------------------------------------------------------------------------------------

--Question: How can you create a view in SQL that lists employees who earn commissions, including their employee ID, first name, last name, salary,  
--and commission percentage? Write a query to select all records from this view.

-- Create a view 
CREATE VIEW EmployeeCompensationDetails
AS
SELECT employee_id, first_name, last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- Select all records from the EmployeeCompensationDetails view
SELECT * FROM EmployeeCompensationDetails;

