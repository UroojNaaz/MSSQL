--Todays's date (09-08-2024)
use Hr
--***********************Number Functions***********************
--1=> power()  
select POWER(2,3); 
select POWER(salary,2) from employees;


--2=> least() 
select least(7,2,0,40,5,6,32,1452); --use min with column, least iska funation nhe ha

select min(salary) from employees;


--3=> greatest() 
select greatest(7,2,0,40,5,6,32,1452); --use max with column, greatest iska funation nhe ha
select max(salary) from employees;
--4=> PI()  
select PI()*(5*5)   --find radius 

--5=> Mod() --iska funation nhe ha

--6=> sqrt()  
select sqrt(salary) AS 'DOUBLE_SALARY' from employees;
select sqrt(employee_id) AS 'DOUBLE_ID' from employees;

--7=> Round() 
select round(5.3625,3)
select round(5.3625,2)
select round(5.3625,1)

--8=> abs()  
select abs(-654),abs(+968)

--9=> ceiling() 

select CEILING(5.0)
select CEILING(5.2)
select CEILING(5.6)

--10=> floor() 
select FLOOR(5.0)
select FLOOR(5.3)
select FLOOR(5.9)

--11=> Square() 
select square(salary) from employees;
select square(16);
select Pi()*square(8);  --FORMULA OF RADIUS

--*******************************String Function***********************
--11=> Concat() 
select CONCAT('Hello',' ','World',' ','asda',' ','dasdas'); 

select CONCAT(employee_id,salary,manager_id,first_name)
from employees;

select CONCAT('+',salary,' | ', employee_id,' | ',first_name)
from employees;


--11=> Concat_WS()     --iska funation nhe ha

--select CONCAT_ws(' | ',employee_id,salary,manager_id,first_name) as "Concat Employee Column"
--from employees;

--12=> Trim()   --not working	
select TRIM(' Abid Ali ')
--20=> Ltrim()
select LTRIM(' Abid Ali ')
--21=> Rtrim()	
select RTRIM(' Abid Ali ')

--13=> Left()	
select left('Abid',3);

--14=> Rigth()
select Right('Abid',3);

select left('Abid',2),Right('Abid',1);

--15=> length()/len() 	
select len('sdkjad')

--16=> Lower()      
select LOWER('ABID');

--17=> Upper()
select UPPER('abid');

--24=> Replace() 	
select REPLACE('Abid Ali','Ali','Khan')

--25=> REVERSE()  	
select REVERSE(first_name) from employees;

--27=> SUBSTRING()  
select SUBSTRING('i am navttc student',3,8);

------------------------------date and time function----------------------------------

-- SYSDATETIME( )

-- SYSDATETIMEOFFSET() 

--CURRENT_TIMESTAMP     --it is procedure

--GETDATE()

SELECT DATEPART(WEEKDAY,SYSDATETIME())
--day
--month
--Year

-- DATEFROMPARTS  
SELECT DATEFROMPARTS ( 2010, 12, 31 ) AS Result; 


SELECT DATEDIFF(year,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(quarter,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(month,       '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(dayofyear,   '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(day,         '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(week,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(weekday,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(hour,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(minute,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(second,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(millisecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(microsecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');


SELECT DATEADD(month, 1, '20240830');
SELECT DATEADD(month, 1, '2024-08-31');

--EOMONTH() 
select EOMONTH(GETDATE());

select CURRENT_TIMESTAMP,SYSDATETIME(),SYSDATETIMEOFFSET(),GETDATE();

--DATEPART
select DATEPART(YEAR,CURRENT_TIMESTAMP),
DATEPART(MONTH,CURRENT_TIMESTAMP),
DATEPART(DAY,CURRENT_TIMESTAMP),
DATEPART(DAYOFYEAR,CURRENT_TIMESTAMP),
DATEPART(WEEKDAY,CURRENT_TIMESTAMP),
DATEPART(WEEK,CURRENT_TIMESTAMP),
DATEPART(MINUTE,CURRENT_TIMESTAMP),
DATEPART(SECOND,CURRENT_TIMESTAMP),
DATEPART(MILLISECOND,CURRENT_TIMESTAMP);

select DATEFROMPARTS(2005,01,12);

select first_name,DATEDIFF(YEAR,hire_date,GETDATE()),
DATEDIFF(MONTH,hire_date,GETDATE()),
DATEDIFF(DAY,hire_date,GETDATE()),
DATEDIFF(DAYOFYEAR,hire_date,GETDATE()),
DATEDIFF(WEEK,hire_date,GETDATE()),
DATEDIFF(MINUTE,hire_date,GETDATE()) 
from employees;

--DATEADD
select DATEADD(YEAR,4,GETDATE()),
DATEADD(MONTH,4,GETDATE()),
DATEADD(day,4,GETDATE()); 

select EOMONTH(GETDATE());

select year(getdate()),day(GETDATE());