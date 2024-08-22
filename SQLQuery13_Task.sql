----------------------------------------------------PROCEDURES TASK----------------------------------------------------------

-- USE DATABASE:
USE HR;

-- EXECUTE TABLE:
SELECT * FROM REGIONS;

--*********************************************PROCEDURES FOR REGION TABLE************************************************

-- CREATE INSERT PROCEDURE
CREATE PROC INSERTREGION @ID INT, @NAME VARCHAR(30)
AS 
BEGIN
    INSERT INTO REGIONS (REGION_ID, REGION_NAME)
    VALUES (@ID, @NAME);
END;
GO

-- DROP PROCEDURE (IF NEEDED):
-- DROP PROC INSERTREGION;

-- ADD VALUES BY USING PROCEDURE
EXEC INSERTREGION @ID = 5, @NAME = 'MIDDLE EAST';
EXEC INSERTREGION @ID = 6, @NAME = 'AFRICA';
EXEC INSERTREGION @ID = 7, @NAME = 'MIDDLE ASIA';
EXEC INSERTREGION @ID = 8, @NAME = 'MIDDLE AMERICA';

-- EXECUTE TABLE TO SEE THE INSERTED VALUES:
SELECT * FROM REGIONS;

-- CREATE DELETE PROCEDURE
CREATE PROC DELETEREGION @R_ID INT
AS 
BEGIN
    DELETE FROM REGIONS 
    WHERE REGION_ID = @R_ID;
END;
GO

-- DELETE VALUES BY USING PROCEDURE
EXEC DELETEREGION @R_ID = 8;

-- EXECUTE TABLE TO CONFIRM DELETION:
SELECT * FROM REGIONS;

-- CREATE UPDATE PROCEDURE
CREATE PROC UPDATEREGION @R_ID INT, @NAME VARCHAR(30)
AS 
BEGIN
    UPDATE REGIONS
    SET REGION_NAME = @NAME
    WHERE REGION_ID = @R_ID;
END;
GO

-- UPDATE VALUES BY USING PROCEDURE
EXEC UPDATEREGION @R_ID = 8, @NAME = 'AMERICA';

-- EXECUTE TABLE TO SEE THE UPDATED VALUES:
SELECT * FROM REGIONS;

--*********************************************PROCEDURES FOR EMPLOYEES TABLE************************************************



--************************************************PROCEDURES FOR JOB TABLE***************************************************



--********************************************PROCEDURES FOR JOB HISTORY TABLE***********************************************



--********************************************PROCEDURES FOR LOCATION TABLE*************************************************



--******************************************PROCEDURES FOR JOB DEPARTMENTS TABLE*********************************************



-------------------------------------------------------TRIGGER TASK------------------------------------------------------------

--************************************************TRIGGER FOR JOB TABLE*****************************************************



---------------------------------------------------TRIGGER-LOG TASK----------------------------------------------------------



--***********************************************TRIGGER-LOG FOR JOB TABLE***************************************************


