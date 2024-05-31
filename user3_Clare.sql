CREATE DATABASE LINK connectToSystem 
CONNECT TO system IDENTIFIED BY admin 
USING 'localhost:1521/XE';

CREATE SYNONYM Claire_Customer FOR system.Customer@connectToSystem;
CREATE SYNONYM Claire_Order FOR system.Order@connectToSystem;
CREATE SYNONYM Claire_OrderLine FOR system.OrderLine@connectToSystem;
CREATE SYNONYM Claire_Product FOR system.Product@connectToSystem;

-- Create a table with customer's orders
CREATE TABLE Claire_MyCustomerOrders AS
SELECT c.customer_id, c.name, o.order_id, o.order_date, ol.product_id, ol.quantity
FROM Claire_Customer c
JOIN Claire_Order o ON c.customer_id = o.customer_id
JOIN Claire_OrderLine ol ON o.order_id = ol.order_id;

-- Create a combined table with customer orders and product sales information for Clare
CREATE TABLE Clare_CombinedOrdersAndSales AS
SELECT c.customer_id, c.name AS customer_name, o.order_id, o.order_date, 
       ol.product_id, p.product_name, ol.quantity, (ol.quantity * p.price) AS total_price
FROM Claire_Customer c
JOIN Claire_Order o ON c.customer_id = o.customer_id
JOIN Claire_OrderLine ol ON o.order_id = ol.order_id
JOIN Claire_Product p ON ol.product_id = p.product_id;

-- Display
SELECT * FROM Claire_MyCustomerOrders;
SELECT * FROM Clare_CombinedOrdersAndSales;