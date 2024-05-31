CREATE DATABASE LINK connectToSystem 
CONNECT TO system IDENTIFIED BY admin 
USING 'localhost:1521/XE';

CREATE SYNONYM Alice_Department FOR system.Department@connectToSystem;
CREATE SYNONYM Alice_Employee FOR system.Employee@connectToSystem;

-- Create a table with department information for Alice
CREATE TABLE Alice_MyDepartments AS
SELECT * 
FROM Alice_Department 
WHERE dept_id IN (SELECT dept_id 
                  FROM Alice_Employee
                  WHERE emp_id = 101);

-- Display
SELECT * FROM Alice_MyDepartments;