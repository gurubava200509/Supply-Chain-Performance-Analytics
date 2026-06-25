
-- SQL BUSINESS ANALYSIS
-- Total Revenue
SELECT ROUND(SUM(Sales),2) AS Total_Revenue
FROM orders_staging;

-- Total Profit
SELECT ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit
FROM orders_staging;

-- Total Orders
SELECT COUNT(*) AS Total_Orders
FROM orders_staging;

-- MARKET PERFORMANCE ANALYSIS
-- Revenue by Market
SELECT
Market,
ROUND(SUM(Sales),2) AS Total_Revenue
FROM orders_staging
GROUP BY Market
ORDER BY Total_Revenue DESC;

-- Profit by Market
SELECT
Market,
ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit
FROM orders_staging
GROUP BY Market
ORDER BY Total_Profit DESC;

-- Market Revenue Ranking
SELECT
Market,
ROUND(SUM(Sales),2) AS Revenue,
RANK() OVER(ORDER BY SUM(Sales) DESC) AS Revenue_Rank
FROM orders_staging
GROUP BY Market;

-- PRODUCT & CATEGORY ANALYSIS
-- Top 10 Categories by Revenue
SELECT
`Category Name`,
ROUND(SUM(Sales),2) AS Total_Revenue
FROM orders_staging
GROUP BY `Category Name`
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Top 10 Categories by Profit
SELECT
`Category Name`,
ROUND(SUM(`Order Profit Per Order`),2) AS Total_Profit
FROM orders_staging
GROUP BY `Category Name`
ORDER BY Total_Profit DESC
LIMIT 10;

-- Revenue and Profit by Category
SELECT
`Category Name`,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(SUM(`Order Profit Per Order`),2) AS Profit
FROM orders_staging
GROUP BY `Category Name`
ORDER BY Revenue DESC;

-- Top 10 Products by Revenue
SELECT
`Product Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM orders_staging
GROUP BY `Product Name`
ORDER BY Revenue DESC
LIMIT 10;

-- CUSTOMER ANALYSIS
-- Revenue by Customer Segment
SELECT
`Customer Segment`,
ROUND(SUM(Sales),2) AS Revenue
FROM orders_staging
GROUP BY `Customer Segment`
ORDER BY Revenue DESC;

-- Profit by Customer Segment
SELECT
`Customer Segment`,
ROUND(SUM(`Order Profit Per Order`),2) AS Profit
FROM orders_staging
GROUP BY `Customer Segment`
ORDER BY Profit DESC;

-- LOGISTICS & DELIVERY ANALYSIS
-- Delivery Status Distribution
SELECT
`Delivery Status`,
COUNT(*) AS Orders_Count
FROM orders_staging
GROUP BY `Delivery Status`
ORDER BY Orders_Count DESC;

-- Shipping Mode Distribution
SELECT
`Shipping Mode`,
COUNT(*) AS Orders_Count
FROM orders_staging
GROUP BY `Shipping Mode`
ORDER BY Orders_Count DESC;

-- Average Profit by Shipping Mode
SELECT
`Shipping Mode`,
ROUND(AVG(`Order Profit Per Order`),2) AS Avg_Profit
FROM orders_staging
GROUP BY `Shipping Mode`
ORDER BY Avg_Profit DESC;

-- Late Delivery Percentage
SELECT
ROUND(
SUM(CASE WHEN `Late_delivery_risk` = 1 THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS Late_Delivery_Percentage
FROM orders_staging;

--  GEOGRAPHIC ANALYSIS
-- Top 10 Countries by Revenue
SELECT
`Order Country`,
ROUND(SUM(Sales),2) AS Revenue
FROM orders_staging
GROUP BY `Order Country`
ORDER BY Revenue DESC
LIMIT 10;

-- ORDER MANAGEMENT ANALYSIS
-- Order Status Distribution
SELECT
`Order Status`,
COUNT(*) AS Orders_Count
FROM orders_staging
GROUP BY `Order Status`
ORDER BY Orders_Count DESC;

-- TIME SERIES ANALYSIS
-- Monthly Revenue Trend
SELECT
MONTH(`order date (DateOrders)`) AS Month_No,
ROUND(SUM(Sales),2) AS Revenue
FROM orders_staging
GROUP BY Month_No
ORDER BY Month_No;

-- Monthly Profit Trend
SELECT
MONTH(`order date (DateOrders)`) AS Month_No,
ROUND(SUM(`Order Profit Per Order`),2) AS Profit
FROM orders_staging
GROUP BY Month_No
ORDER BY Month_No;
