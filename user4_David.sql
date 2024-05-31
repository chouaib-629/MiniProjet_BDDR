CREATE DATABASE LINK connectToSystem 
CONNECT TO system IDENTIFIED BY admin
USING 'localhost:1521/XE';

CREATE SYNONYM David_Product FOR system.Product@connectToSystem;
CREATE SYNONYM David_Order FOR system.Order@connectToSystem;
CREATE SYNONYM David_OrderLine FOR system.OrderLine@connectToSystem;
CREATE SYNONYM David_Customer FOR system.Customer@connectToSystem;

-- Create a table with product sales
CREATE TABLE David_MyProductSales AS
SELECT p.product_id, p.product_name, SUM(ol.quantity) AS total_quantity_sold, SUM(ol.quantity * p.price) AS total_sales
FROM David_Product p
JOIN David_OrderLine ol ON p.product_id = ol.product_id
GROUP BY p.product_id, p.product_name;

-- Create a table with detailed customer order information for David's products
CREATE TABLE David_CustomerOrders AS
SELECT c.customer_id, c.name AS customer_name, c.address, o.order_id, o.order_date, p.product_id, p.product_name, ol.quantity
FROM David_Customer c
JOIN David_Order o ON c.customer_id = o.customer_id
JOIN David_OrderLine ol ON o.order_id = ol.order_id
JOIN David_Product p ON ol.product_id = p.product_id; 

-- Display
SELECT * FROM David_MyProductSales;
SELECT * FROM David_CustomerOrders;