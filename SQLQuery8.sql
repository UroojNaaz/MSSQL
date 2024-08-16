--13-aug-2024 (ERD):-

--Create database AB_School;

--use AB_School

/*create table Employee_type
(
ET_ID int Primary key identity,
ET_Name varchar(28) not null
)
select * from Employee_type

insert into Employee_type(ET_Name) values('Teacher'),('HR'),('Finance'),('Staff'),('Marketing')

Create table Employees
(
Emp_ID int primary key identity,
Emp_Name varchar(28) not null,
Emp_Address varchar(200) not null,
Emp_Email varchar(255) unique,
Emp_salary int not null,
Emp_Type int foreign key references Employee_type(ET_ID)
)
select * from Employees

--insert into Employees(Emp_Name,Emp_Address,Emp_Email,Emp_salary,Emp_Type)
--values('asad Ali','Gilgit Baltistan','asad@gmail.com',20000,1),
--('Abid Ali','Gilgit Baltistan','abid@gmail.com',20000,1),
--('Urooj','Karachi, Pakistan','urooj@gmail.com',25000,2),
--('Samama','Karachi, Pakistan','samama@gmail.com',50000,3),
--('Rizwan','Islamabad, Pakistan','rizwan@gmail.com',30000,2),
--('Muaaz Hassan','Gilgit Baltistan','muaaz@gmail.com',40000,3),
--('Hammad','Rawalpindi, Pakistan','Hammad@gmail.com',20000,2),
--('Mairaj','Karachi, Pakistan','mairaj@gmail.com',25000,5),
--('Saboor','Hyderabad, Pakistan','Saboor@gmail.com',15000,5),
--('Ali Hasnain','Gilgit Baltistan','ali@gmail.com',30000,4)

create table Student(
ID int primary key identity,
Name varchar(25) not null,
Course varchar(50) not null,
Class varchar(20) not null,
TID int foreign key references Employees(Emp_ID),
CR int foreign key references Student(ID) null
)

select * from Student

--insert into Student(Name,Course,Class,TID,CR)
--values('Rizwan khan','Mobile Application Development','Lab 209',4,1),
--('Hasnain','Mobile Application Development','Lab 209',4,1),
--('Masoma','Mobile Application Development','Lab 209',4,1),
--('urooj','Mobile Application Development','Lab 209',4,1),
--('ali','Mobile Application Development','Lab 209',4,1),
--('hammad','Mobile Application Development','Lab 209',4,1),
--('saboor','Mobile Application Development','Lab 209',4,1)

select * from Student
select * from Employees
select * from Employee_type

update Student
set Name = 'Noor'
where ID = 4;

update Student
set CR = 4
where ID > 5;

delete from Student
where CR = 4;

delete from Student
where ID = 4;

drop table Student
drop table Employees
drop table Employee_type*/

---------------------------------------------------------MART DATABASE (Using ERD)--------------------------------------------------------

-- Create the database
CREATE DATABASE Mart;
USE Mart;

-- Create the Productline table
CREATE TABLE Productline (
    PL_ID INT PRIMARY KEY IDENTITY,
    DesclnText VARCHAR(255) NOT NULL,
    DesclnHTML VARCHAR(255) NOT NULL,
    Image VARCHAR(100) NOT NULL
);

-- Insert data into Productline
INSERT INTO Productline (DesclnText, DesclnHTML, Image) 
VALUES 
('hair spray', 'hair spray', 'hair spray.jpg'),
('lipbaam', 'lipbaam', 'lipbaam.jpg'),
('handwash', 'handwash', 'handwash.jpg'),
('shampoo', 'shampoo', 'shampoo.jpg'),
('face wash', 'face wash', 'facewash.jpg'),
('body lotion', 'body lotion', 'bodylotion.jpg');

-- Select all data from Productline
SELECT * FROM Productline;

-- Create the Product table
CREATE TABLE Product (
    Pro_Code INT PRIMARY KEY IDENTITY,
    ProductlineID INT FOREIGN KEY REFERENCES Productline(PL_ID),
    Name VARCHAR(255) NOT NULL,
    Scale INT NOT NULL,
    Vendor VARCHAR(255) NOT NULL,
    PdtDescription VARCHAR(255) NOT NULL,
    QtyInStock INT NOT NULL,
    BuyPrice INT NOT NULL,
    MSRP VARCHAR(255) NOT NULL
);

-- Insert data into Product
INSERT INTO Product (ProductlineID, Name, Scale, Vendor, PdtDescription, QtyInStock, BuyPrice, MSRP)
VALUES 
(1, 'Hair Care', 40, 'AK-Group', 'use for hair growth', 1000, 460, 'Rs.500'),
(2, 'Lip Care', 40, 'AK-Group', 'use for Skin care', 600, 460, 'Rs.500'),
(3, 'Hand Care', 40, 'AB-Group', 'use for Skin care', 800, 260, 'Rs.300'),
(4, 'Hair Grow', 40, 'A-Group', 'use for hair wash', 2000, 660, 'Rs.700'),
(5, 'Face Wash', 30, 'ZK-Group', 'use for facial cleansing', 1500, 500, 'Rs.550'),
(6, 'Body Lotion', 50, 'XY-Group', 'use for moisturizing skin', 1800, 750, 'Rs.800');

-- Select all data from Product
SELECT * FROM Product;

-- Create the Office table
CREATE TABLE Office (
    Code INT PRIMARY KEY IDENTITY,
    City VARCHAR(255) NOT NULL,
    Phone VARCHAR(255) NOT NULL,
    Address1 VARCHAR(255) NOT NULL,
    Address2 VARCHAR(255),
    State VARCHAR(255),
    Country VARCHAR(255) NOT NULL,
    PostalCode INT NOT NULL,
    Territory VARCHAR(255) NOT NULL
);

-- Insert data into Office
INSERT INTO Office (City, Phone, Address1, Address2, State, Country, PostalCode, Territory)
VALUES 
('Karachi', '021-1234567', 'Street 1', 'Near Park', 'Sindh', 'Pakistan', 75500, 'South Asia'),
('Lahore', '042-7654321', 'Street 2', 'Near Market', 'Punjab', 'Pakistan', 54000, 'South Asia'),
('Islamabad', '051-2345678', 'Street 3', 'Near Lake', 'Islamabad Capital Territory', 'Pakistan', 44000, 'South Asia'),
('Peshawar', '091-9876543', 'Street 4', 'Near Mall', 'Khyber Pakhtunkhwa', 'Pakistan', 25000, 'South Asia'),
('Quetta', '081-3456789', 'Street 5', 'Near Hills', 'Balochistan', 'Pakistan', 87300, 'South Asia');

-- Select all data from Office
SELECT * FROM Office;

-- Create the Employee table
--CREATE TABLE Employee (
--    Emp_ID INT PRIMARY KEY IDENTITY,
--    OfficeCode INT FOREIGN KEY REFERENCES Office(Code),
--    ReportsTo INT FOREIGN KEY REFERENCES Employee (Emp_ID), --search krny pr ALTER TABLE Employee arha ta
--    LastName VARCHAR(255) NOT NULL,
--    FirstName VARCHAR(255) NOT NULL,
--    Extension VARCHAR(255) NOT NULL,
--    Email VARCHAR(255) NOT NULL,
--    JobTitle VARCHAR(100) NOT NULL
--);  

-- Create the Employee table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY IDENTITY,
    OfficeCode INT FOREIGN KEY REFERENCES Office(Code),
    ReportsTo INT NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    Extension VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    JobTitle VARCHAR(100) NOT NULL
);

-- Insert data into Employee
INSERT INTO Employee (OfficeCode, ReportsTo, LastName, FirstName, Extension, Email, JobTitle)
VALUES 
(1, NULL, 'Khan', 'Ali', '123', 'ali.khan@example.com', 'Manager'),
(2, 1, 'Ahmed', 'Sara', '124', 'sara.ahmed@example.com', 'Sales Representative'),
(3, 1, 'Butt', 'Amir', '125', 'amir.butt@example.com', 'HR'),
(4, 2, 'Iqbal', 'Zain', '126', 'zain.iqbal@example.com', 'IT Support'),
(5, 3, 'Shah', 'Ayesha', '127', 'ayesha.shah@example.com', 'Finance Manager');

-- Select all data from Employee
SELECT * FROM Employee;

-- Create the Customer table
CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY IDENTITY,
    SalesRepEmployeeNum INT FOREIGN KEY REFERENCES Employee(Emp_ID),
    Name VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    Phone VARCHAR(255) NOT NULL,
    Address1 VARCHAR(255) NOT NULL,
    Address2 VARCHAR(255),
    City VARCHAR(255) NOT NULL,
    State VARCHAR(255),
    PostalCode INT NOT NULL,
    Country VARCHAR(255) NOT NULL,
    CreditLimit INT NOT NULL
);

-- Insert data into Customer
INSERT INTO Customer (SalesRepEmployeeNum, Name, LastName, FirstName, Phone, Address1, Address2, City, State, PostalCode, Country, CreditLimit)
VALUES 
(1, 'ABC Corp', 'Doe', 'John', '021-7654321', 'Street 2', 'Near Market', 'Lahore', 'Punjab', 54000, 'Pakistan', 100000),
(2, 'XYZ Pvt Ltd', 'Smith', 'Jane', '042-5432109', 'Street 6', 'Near School', 'Karachi', 'Sindh', 75500, 'Pakistan', 150000),
(3, 'Global Tech', 'Lee', 'Tom', '051-6789012', 'Street 7', 'Near River', 'Islamabad', 'Islamabad Capital Territory', 44000, 'Pakistan', 200000),
(4, 'Innovative Solutions', 'Brown', 'Alice', '091-2345678', 'Street 8', 'Near Plaza', 'Peshawar', 'Khyber Pakhtunkhwa', 25000, 'Pakistan', 120000),
(5, 'Future Vision', 'Patel', 'Raj', '081-8765432', 'Street 9', 'Near Mountains', 'Quetta', 'Balochistan', 87300, 'Pakistan', 180000);

-- Select all data from Customer
SELECT * FROM Customer;

-- Create the Payment table
CREATE TABLE Payment (
    CheckNum VARCHAR(255) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customer(Cust_ID),
    PaymentDate DATE NOT NULL,
    Amount INT NOT NULL
);

-- Insert data into Payment
INSERT INTO Payment (CheckNum, CustomerID, PaymentDate, Amount)
VALUES 
('CHK123', 1, '2024-08-16', 5000),
('CHK124', 2, '2024-08-15', 7500),
('CHK125', 3, '2024-08-14', 10000),
('CHK126', 4, '2024-08-13', 6000),
('CHK127', 5, '2024-08-12', 8500);

-- Select all data from Payment
SELECT * FROM Payment;

-- Create the Order_Table table
CREATE TABLE Order_Table (
    Ord_ID INT PRIMARY KEY IDENTITY,
    CustomerID INT FOREIGN KEY REFERENCES Customer(Cust_ID),
    OrderDate DATE NOT NULL,
    RequiredDate DATE NOT NULL,
    ShippedDate DATE,
    Status INT NOT NULL,
    Comments VARCHAR(255)
);

-- Insert data into Order_Table
INSERT INTO Order_Table (CustomerID, OrderDate, RequiredDate, ShippedDate, Status, Comments)
VALUES 
(1, '2024-08-10', '2024-08-15', '2024-08-12', 1, 'Delivered successfully'),
(2, '2024-08-09', '2024-08-14', '2024-08-11', 2, 'In Transit'),
(3, '2024-08-08', '2024-08-13', '2024-08-10', 3, 'Processing'),
(4, '2024-08-07', '2024-08-12', NULL, 4, 'Pending'),
(5, '2024-08-06', '2024-08-11', '2024-08-08', 1, 'Delivered successfully');

-- Select all data from Order_Table
SELECT * FROM Order_Table;

-- Create the Order_Product table
CREATE TABLE Order_Product (
    OP_ID INT PRIMARY KEY IDENTITY,
    OrderID INT FOREIGN KEY REFERENCES Order_Table(Ord_ID),
    ProductCode INT FOREIGN KEY REFERENCES Product(Pro_Code),
    QtyOrdered INT NOT NULL,
    PriceEach INT NOT NULL,
    OrderLineNumber INT NOT NULL
);

-- Insert data into Order_Product
INSERT INTO Order_Product (OrderID, ProductCode, QtyOrdered, PriceEach, OrderLineNumber)
VALUES 
(1, 1, 100, 50, 1),
(2, 2, 150, 40, 2),
(3, 3, 200, 60, 3),
(4, 4, 120, 30, 4),
(5, 5, 180, 70, 5);

-- Select all data from Order_Product
SELECT * FROM Order_Product;
