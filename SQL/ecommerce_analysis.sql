CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

CREATE TABLE ecommerce (
    Order_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Date DATE,
    Age INT,
    Gender VARCHAR(20),
    City VARCHAR(50),
    Product_Category VARCHAR(50),
    Unit_Price DECIMAL(10,2),
    Quantity INT,
    Discount_Amount DECIMAL(10,2),
    Total_Amount DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Device_Type VARCHAR(20),
    Session_Duration_Minutes INT,
    Pages_Viewed INT,
    Is_Returning_Customer BOOLEAN,
    Delivery_Time_Days INT,
    Customer_Rating INT
);

#SELECT VERSION();

USE ecommerce_analysis;

SELECT COUNT(*)
FROM ecommerce;

SELECT *
FROM ecommerce
LIMIT 5;


SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers,
    ROUND(SUM(Total_Amount),2) AS Total_Revenue
FROM ecommerce;

#top cities by revenue
SELECT
    City,
    ROUND(SUM(Total_Amount),2) AS Revenue
FROM ecommerce
GROUP BY City
ORDER BY Revenue DESC;

#Product Category Performance
SELECT
    Product_Category,
    ROUND(SUM(Total_Amount),2) AS Revenue,
    ROUND(AVG(Customer_Rating),2) AS Avg_Rating
FROM ecommerce
GROUP BY Product_Category
ORDER BY Revenue DESC;

#device analysis
SELECT
    Device_Type,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Amount),2) AS Revenue
FROM ecommerce
GROUP BY Device_Type
ORDER BY Revenue DESC;

#Returning vs New Customers
SELECT
    Is_Returning_Customer,
    COUNT(*) AS Orders,
    ROUND(SUM(Total_Amount),2) AS Revenue
FROM ecommerce
GROUP BY Is_Returning_Customer;