-- Create the database
CREATE DATABASE MY_School;

-- Use the newly created database
USE MY_School;

--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------- CREATE TABLES AND INSERT VALUES ----------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

-- Create table: Employee_type

CREATE TABLE Employee_type
(
    ET_ID int PRIMARY KEY IDENTITY,
    ET_Name varchar(28) NOT NULL
);


-- Add values in table
INSERT INTO Employee_type (ET_Name) 
VALUES 
('Teacher'),
('HR'),
('Finance'),
('Staff'),
('Marketing');


SELECT * FROM Employee_type;

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

------------------------------------------------------- UPDATE, DELETE ---------------------------------------------------------------

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

-- Set the database to single-user mode to close any open connections
ALTER DATABASE MY_School SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- Drop the database
DROP DATABASE MY_School;

----------------------------------------------------------------USE OF ALTER-------------------------------------------------------------------
-- Add a new column 'email' with a default value to Employee_type
ALTER TABLE Employee_type
ADD email varchar(255) DEFAULT 'abc@gmail.com' NOT NULL;


-- Verify the added column
SELECT * FROM Employee_type;


-- Rename the table from Employee_type to Category
EXEC sp_rename 'Employee_type', 'Category';


-- Drop the ET_ID column from the renamed table
ALTER TABLE Category
DROP COLUMN ET_ID;


-- Add an 'email' column to the Student table with a default value
ALTER TABLE Student
ADD email varchar(150) DEFAULT 'abc@gmail.com' NOT NULL;


-- Update the email column in Student table using Name
UPDATE Student
SET email = LOWER(Name) + '@gmail.com';


-- Update the email column in Category table using ET_Name
UPDATE Category
SET email = UPPER(ET_Name) + '@gmail.com';


-- Verify updates in Category table
SELECT * FROM Category;


-- Alter the column 'email' in Student table to a new size
ALTER TABLE Student
ALTER COLUMN email varchar(200);

--------------------------------------Rename Table and View Structure-------------------------------

-- Rename the 'Employees' table to 'Teacher'
EXEC sp_rename 'Employees', 'Teacher';

-- Rename 'Employee_type' table to 'profession'
EXEC sp_rename 'Employee_type', 'profession';

-- Check the contents of the 'profession' table
SELECT * FROM profession;


-- View the structure of 'Employee_type' table (after it was renamed to 'profession')
EXEC sp_help 'dbo.profession';
GO

-----------------------------------------Alter Column Data Type-------------------------------------
-- Alter the data type of the 'email' column in the 'profession' table
ALTER TABLE profession
ALTER COLUMN email varchar(255);
GO

-- Check the contents of 'profession' tables
SELECT * FROM profession;

-----------------------------------------Rename Column Names----------------------------------------

-- Rename the 'ET_ID' column to 'Roll_no' in the 'profession' table
EXEC sp_rename 'profession.ET_ID', 'Roll_no', 'COLUMN';

-- Rename the 'ET_Name' column to 'emp_name' in the 'profession' table
EXEC sp_rename 'profession.ET_Name', 'emp_name', 'COLUMN';


-------------------------------------------Rename Database--------------------------------------------------

EXEC sp_rename 'MY_School', 'Uroojs_School','database';

-----------------------------------------Dropping Constraints----------------------------------------

-- BREAKING RELATION B/W KEYS 

	alter table Employees 
	drop constraint[PK__Employee__2623598B896F30FD]
	
	alter table Student
	drop constraint[FK__Student__CR__300424B4]

	alter table Student
	drop constraint [FK__Student__TID__2F10007B]

	alter table Student 
	drop constraint [PK__Student__3214EC27015C8A14]

	alter table Employees
	drop constraint [FK__Employees__Emp_T__267ABA7A]

	alter table Employees 
   drop constraint [PK__Employee__2623598B896F30FD]
   
   alter table Employees 
   drop constraint [UQ__Employee__54DFB5F42470396F]

   alter table profession
   drop constraint [PK__Employee__3ECEBBA2C543D00C]
