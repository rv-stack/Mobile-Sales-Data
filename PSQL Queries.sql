-- View a sample of the data
SELECT * FROM mobile LIMIT 5;

-- Get total number of transactions in the dataset
SELECT COUNT(*) FROM mobile;

------------------------------------------------------------

-- 1. Monthly Total Revenue
-- Objective: Analyze total revenue generated each month
-- Purpose: Understand seasonal trends and plan sales, marketing, and inventory accordingly
SELECT 
    TO_CHAR(TO_DATE(date, 'MM/DD/YY'), 'Month') AS month_name,
    EXTRACT(MONTH FROM TO_DATE(date, 'MM/DD/YY')) AS month_number,
    SUM(total) AS total_revenue
FROM mobile
GROUP BY month_name, month_number
ORDER BY month_number;

------------------------------------------------------------

-- 2. Top 5 Best-Selling Mobile Brands
-- Objective: Identify brands that generated the highest sales revenue
-- Purpose: Prioritize stock, partnerships, and marketing efforts around top-performing brands
SELECT
    brand,
    SUM(total) AS total_sales
FROM mobile
GROUP BY brand
ORDER BY total_sales DESC
LIMIT 5;

------------------------------------------------------------

-- 3. Revenue by City
-- Objective: Determine which cities contributed the most to total revenue
-- Purpose: Focus promotional campaigns, logistics, and regional expansion on high-performing cities
SELECT 
    city,
    SUM(total) AS city_revenue
FROM mobile
GROUP BY city
ORDER BY city_revenue DESC;

------------------------------------------------------------

-- 4. Brand with the Highest Average Customer Rating
-- Step: Rename column for consistent SQL usage
ALTER TABLE mobile RENAME COLUMN "customer ratings" TO customer_ratings;

-- Objective: Identify the brand with the best customer satisfaction
-- Purpose: Guide promotion of high-rated products and understand brand loyalty
SELECT
    brand,
    AVG(customer_ratings) AS average_rating
FROM mobile
GROUP BY brand
ORDER BY average_rating DESC
LIMIT 1;

------------------------------------------------------------

-- 5. Do Credit Card Users Buy More Expensive Phones?
-- Step: Rename columns for standard naming convention
ALTER TABLE mobile RENAME COLUMN "payment method" TO payment_method;
ALTER TABLE mobile RENAME COLUMN "price per unit" TO price_unit;

-- Objective: Compare average product prices by payment method
-- Purpose: Determine if credit card users prefer premium models, useful for targeting financing options
SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    AVG(price_unit) AS average_unit_price
FROM mobile
GROUP BY payment_method
ORDER BY average_unit_price DESC;

------------------------------------------------------------

-- 6. Average Order Value by City
-- Step: Rename "units sold" column for clarity
ALTER TABLE mobile RENAME COLUMN "units sold" TO quantity;

-- Objective: Measure average revenue per transaction in each city
-- Purpose: Identify cities with high spending behavior for tailored pricing and offers
SELECT
    city,
    COUNT(*) AS total_transactions,
    AVG(total) AS average_order_value
FROM mobile
GROUP BY city
ORDER BY average_order_value DESC;

------------------------------------------------------------

-- End of SQL Queries for Mobile Sales Analysis Now Go -- Power Bi Intractive Dashbord






