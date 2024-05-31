CREATE DATABASE LINK connectToSystem 
CONNECT TO system IDENTIFIED BY admin 
USING 'localhost:1521/XE';

CREATE SYNONYM Bob_Employee FOR system.Employee@connectToSystem;
CREATE SYNONYM Bob_WorksOn FOR system.WorksOn@connectToSystem;

-- Create the first fragment for Bob's tasks
CREATE TABLE bob_tasks_part1 AS
SELECT * FROM bob_WorksOn
WHERE emp_id = 102 AND project_id <= 3;

-- Create the second fragment for Bob's tasks
CREATE TABLE bob_tasks_part2 AS
SELECT * FROM bob_WorksOn
WHERE emp_id = 102 AND project_id > 3;

-- Create vertical fragment for Bob's additional information
CREATE TABLE bob_additional_info AS
SELECT emp_id, dept_id, salary
FROM bob_Employee
WHERE emp_id = 102;

-- Create the first combined fragment for Bob's project assignments
CREATE TABLE bob_project_assignments AS
SELECT emp_id, project_id
FROM bob_WorksOn
WHERE emp_id = 102;

-- Assuming there are more columns in WorksOn, create the second combined fragment for detailed task information
CREATE TABLE bob_task_details AS
SELECT emp_id, project_id, task_description, hours_worked
FROM bob_WorksOn
WHERE emp_id = 102;

-- Display
SELECT * FROM bob_tasks_part1;
SELECT * FROM bob_tasks_part2;
SELECT * FROM bob_additional_info;
SELECT * FROM bob_project_assignments;
SELECT * FROM bob_task_details;