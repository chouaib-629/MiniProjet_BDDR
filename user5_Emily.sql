CREATE DATABASE LINK connectToSystem 
CONNECT TO system IDENTIFIED BY admin 
USING 'localhost:1521/XE';

CREATE SYNONYM Emily_Employee FOR system.Employee@connectToSystem;
CREATE SYNONYM Emily_WorksOn FOR system.WorksOn@connectToSystem;
CREATE SYNONYM Emily_Project FOR system.Project@connectToSystem;

-- Create fragmented table for Emily's tasks
CREATE TABLE emily_tasks AS
SELECT * FROM Emily_WorksOnWorksOn
WHERE emp_id = 105;

-- Display
SELECT * FROM emily_tasks;

-- Create a table with employees and their projects
CREATE TABLE Emily_MyEmployeeProjects AS
SELECT e.emp_id, e.name, p.project_id, p.project_name
FROM Emily_Employee e
JOIN Emily_WorksOn w ON e.emp_id = w.emp_id
JOIN Emily_Project p ON w.project_id = p.project_id;

-- Display
SELECT * FROM Emily_MyEmployeeProjects;