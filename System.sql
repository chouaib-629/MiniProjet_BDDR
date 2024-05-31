-- Create tables
CREATE TABLE Department (	  dept_id NUMBER PRIMARY KEY, 
							              dept_name VARCHAR2(50));

CREATE TABLE Employee (		  emp_id NUMBER PRIMARY KEY, 
							              dept_id NUMBER REFERENCES Department(dept_id), 
                         	  name VARCHAR2(50), 	
							              salary NUMBER(8,2));

CREATE TABLE Project (      project_id NUMBER PRIMARY KEY, 
                            project_name VARCHAR2(100));

CREATE TABLE WorksOn (      emp_id NUMBER REFERENCES Employee(emp_id), 
                            project_id NUMBER REFERENCES Project(project_id), 
                            PRIMARY KEY (emp_id, project_id));

CREATE TABLE Product (      product_id NUMBER PRIMARY KEY, 
                            product_name VARCHAR2(100), 
                            price NUMBER(8,2));

CREATE TABLE Customer (     customer_id NUMBER PRIMARY KEY, 
                            name VARCHAR2(50), 
                            address VARCHAR2(100));

CREATE TABLE Order (        order_id NUMBER PRIMARY KEY, 
                            customer_id NUMBER REFERENCES Customer(customer_id), 
                            order_date DATE);

CREATE TABLE OrderLine (    order_id NUMBER REFERENCES Order(order_id), 
                            product_id NUMBER REFERENCES Product(product_id), 
                            quantity NUMBER, 
                            PRIMARY KEY (order_id, product_id));

-- Insert sample data
INSERT INTO Department (dept_id, dept_name) VALUES
  (1, 'Marketing'), 
  (2, 'Sales'), 
  (3, 'Engineering'), 
  (4, 'Human Resources'), 
  (5, 'Finance');

INSERT INTO Employee (emp_id, dept_id, name, salary) VALUES
  (101, 1, 'Alice Dupont', 3500.00), 
  (102, 2, 'Bob Martin', 4200.50), 
  (103, 3, 'Claire Bernard', 3800.75), 
  (104, 4, 'David Robert', 3100.00), 
  (105, 5, 'Emily Jones', 4000.25), 
  (106, 1, 'Fiona Taylor', 3700.00), 
  (107, 2, 'George Brown', 4500.50), 
  (108, 3, 'Hannah Wilson', 3900.75), 
  (109, 4, 'Ivy Clark', 3200.00), 
  (110, 5, 'Jack White', 4100.25);

INSERT INTO Project (project_id, project_name) VALUES
  (1, 'New Website'), 
  (2, 'CRM System Upgrade'), 
  (3, 'Mobile App Development'), 
  (4, 'Product Launch Campaign'), 
  (5, 'Server Migration');

INSERT INTO WorksOn (emp_id, project_id) VALUES 
  (101, 1), (102, 2), (103, 3), 
  (104, 4), (105, 5), (106, 1), 
  (107, 2), (108, 3), (109, 4), 
  (110, 5),(103, 1), (101, 2), 
  (105, 3), (102, 4), (104, 5);

INSERT INTO Product (product_id, product_name, price) VALUES
  (1, 'Laptop', 899.99), 
  (2, 'Desktop PC', 649.99), 
  (3, 'Wireless Headset', 79.99), 
  (4, 'Gaming Monitor', 299.99), 
  (5, 'Wireless Mouse', 39.99), 
  (6, 'Tablet', 499.99), 
  (7, 'Smartphone', 699.99), 
  (8, 'Smartwatch', 199.99), 
  (9, 'Bluetooth Speaker', 99.99), 
  (10, 'USB-C Cable', 19.99), 
  (11, 'Portable Charger', 29.99), 
  (12, 'External Hard Drive', 79.99), 
  (13, 'Webcam', 59.99), 
  (14, 'Keyboard', 49.99), 
  (15, 'Mouse Pad', 9.99);

INSERT INTO Customer (customer_id, name, address) VALUES
  (1001, 'John Smith', '123 Main St'), 
  (1002, 'Jane Doe', '456 Elm St'), 
  (1003, 'Michael Lee', '789 Oak Ave'), 
  (1004, 'Sarah Garcia', '1011 Pine Blvd'), 
  (1005, 'David Miller', '1213 Maple St'), 
  (1006, 'Chris Brown', '1415 Walnut St'), 
  (1007, 'Diana Ross', '1617 Cedar St'), 
  (1008, 'Ethan Hunt', '1819 Spruce St'), 
  (1009, 'Faith Hill', '2021 Willow Blvd'), 
  (1010, 'Gary Clark', '2223 Aspen Ave'), 
  (1011, 'Helen Carter', '2425 Birch Rd'), 
  (1012, 'Ian Thompson', '2627 Cedar Rd'), 
  (1013, 'Jennifer Lopez', '2829 Pine Rd'), 
  (1014, 'Kevin Baker', '3031 Maple St'), 
  (1015, 'Linda Harris', '3233 Oak St');

INSERT INTO Order (order_id, customer_id, order_date) VALUES
  (2001, 1001, SYSDATE - 5), 
  (2002, 1002, SYSDATE - 3), 
  (2003, 1003, SYSDATE - 1), 
  (2004, 1004, SYSDATE), 
  (2005, 1005, SYSDATE + 2), 
  (2006, 1006, SYSDATE - 4), 
  (2007, 1007, SYSDATE - 2), 
  (2008, 1008, SYSDATE - 1), 
  (2009, 1009, SYSDATE), 
  (2010, 1010, SYSDATE + 1), 
  (2011, 1011, SYSDATE - 6), 
  (2012, 1012, SYSDATE - 5), 
  (2013, 1013, SYSDATE - 3), 
  (2014, 1014, SYSDATE - 2), 
  (2015, 1015, SYSDATE + 2);

INSERT INTO OrderLine (order_id, product_id, quantity) VALUES
  (2001, 1, 1), 
  (2002, 2, 2), 
  (2003, 3, 1), 
  (2004, 4, 1), 
  (2005, 5, 2),
  (2001, 4, 1), 
  (2002, 1, 1), 
  (2006, 6, 1), 
  (2007, 7, 1), 
  (2008, 8, 2), 
  (2009, 9, 3), 
  (2010, 10, 4), 
  (2006, 7, 2), 
  (2007, 8, 1), 
  (2008, 9, 2), 
  (2009, 10, 1), 
  (2010, 6, 1), 
  (2011, 11, 1), 
  (2012, 12, 2), 
  (2013, 13, 1), 
  (2014, 14, 1), 
  (2015, 15, 1), 
  (2011, 12, 1), 
  (2012, 13, 2), 
  (2013, 14, 1), 
  (2014, 15, 3), 
  (2015, 11, 2);

-- Create users
CREATE USER user1 IDENTIFIED BY user_password1;
CREATE USER user2 IDENTIFIED BY user_password2;
CREATE USER user3 IDENTIFIED BY user_password3;
CREATE USER user4 IDENTIFIED BY user_password4;
CREATE USER user5 IDENTIFIED BY user_password5;

-- Grant access to users
GRANT CREATE SESSION TO user1, user2, user3, user4, user5; 
GRANT CREATE ANY TABLE TO user1, user2, user3, user4, user5; 
GRANT CREATE DATABASE LINK TO user1, user2, user3, user4, user5; 
GRANT CREATE SYNONYM TO user1, user2, user3, user4, user5;
ALTER USER system ACCOUNT UNLOCK;