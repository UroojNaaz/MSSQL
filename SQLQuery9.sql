-- Create the database
CREATE DATABASE MY_School;
GO

-- Use the newly created database
USE MY_School;
GO

-------------------------------------------------------
----------- CREATE TABLES AND INSERT VALUES -----------
-------------------------------------------------------

-- Create table: Employee_type

CREATE TABLE Employee_type
(
    ET_ID int PRIMARY KEY IDENTITY,
    ET_Name varchar(28) NOT NULL
);
GO

-- Add values in table
INSERT INTO Employee_type (ET_Name) 
VALUES 
('Teacher'),
('HR'),
('Finance'),
('Staff'),
('Marketing');
GO

SELECT * FROM Employee_type;
GO
---------------------------------------------------------------------------------------------------------------------------

-- Create table: Employees
CREATE TABLE Employees
(
    Emp_ID int PRIMARY KEY IDENTITY,
    Emp_Name varchar(28) NOT NULL,
    Emp_Address varchar(200) NOT NULL,
    Emp_Email varchar(255) UNIQUE,
    Emp_salary int NOT NULL,
    Emp_Type int,
    CONSTRAINT FK_Employees_EmployeeType FOREIGN KEY (Emp_Type) 
    REFERENCES Employee_type(ET_ID) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
GO

-- Add values in table
INSERT INTO Employees (Emp_Name, Emp_Address, Emp_Email, Emp_salary, Emp_Type)
VALUES
('Asad Ali', 'Gilgit Baltistan', 'asad@gmail.com', 20000, 1),
('Abid Ali', 'Gilgit Baltistan', 'abid@gmail.com', 20000, 1),
('Urooj', 'Karachi, Pakistan', 'urooj@gmail.com', 25000, 2),
('Samama','Karachi, Pakistan','samama@gmail.com',50000,3),
('Rizwan','Islamabad, Pakistan','rizwan@gmail.com',30000,2),
('Muaaz Hassan','Gilgit Baltistan','muaaz@gmail.com',40000,3),
('Hammad','Rawalpindi, Pakistan','Hammad@gmail.com',20000,2),
('Mairaj','Karachi, Pakistan','mairaj@gmail.com',25000,5),
('Saboor','Hyderabad, Pakistan','Saboor@gmail.com',15000,5),
('Ali Hasnain','Gilgit Baltistan','ali@gmail.com',30000,4)

SELECT * FROM  Employees
----------------------------------------------------------------------------------------------------------------------

-- Create table: Student

CREATE TABLE Student
(
    ID int PRIMARY KEY IDENTITY,
    Name varchar(25) NOT NULL,
    Course varchar(50) NOT NULL,
    Class varchar(20) NOT NULL,
    TID int FOREIGN KEY REFERENCES Employees(Emp_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CR int FOREIGN KEY REFERENCES Student(ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

SELECT * FROM Student;

-- Add values in table
INSERT INTO Student(Name, Course, Class, TID, CR)
VALUES
('Rizwan Khan', 'Mobile Application Development', 'Lab 209', 4, 1),
('Hasnain', 'Mobile Application Development', 'Lab 209', 4, 1),
('Masoma', 'Mobile Application Development', 'Lab 209', 4, 1),
('Urooj', 'Mobile Application Development', 'Lab 209', 4, 1),
('Ali', 'Mobile Application Development', 'Lab 209', 4, 1),
('Hammad', 'Mobile Application Development', 'Lab 209', 4, 1),
('Saboor', 'Mobile Application Development', 'Lab 209', 4, 1);

SELECT * FROM Student;
---------------------------------------------------------------------------------------------------------------------------

--Execute All Tables:
SELECT * FROM Student
SELECT * FROM Employees
SELECT * FROM Employee_type

---------------------------------------------------UPDATE, DELETE---------------------------------------------------------------

-- Update Student table
UPDATE Student
SET Name = 'Noor'
WHERE ID = 4;


-- Update the CR value for students with ID > 5
UPDATE Student
SET CR = 4
WHERE ID > 5;


-- Delete students where CR = 4
DELETE FROM Student
WHERE CR = 4;


-- Delete student with ID = 4
DELETE FROM Student
WHERE ID = 4;

---------------------------------------------------USE DROP (FOR TABLE AND DATABASE)--------------------------------------------------------

--Drop Tables:
DROP TABLE Employee_type;
DROP TABLE Employees;
DROP TABLE Student;

-- Drop the Database:
-- Switch to the master database to avoid conflicts
USE master;
GO

-- Set the database to single-user mode to close any open connections
ALTER DATABASE MY_School SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Drop the database
DROP DATABASE MY_School;
GO

----------------------------------------------------------------USE OF ALTER-------------------------------------------------------------------
