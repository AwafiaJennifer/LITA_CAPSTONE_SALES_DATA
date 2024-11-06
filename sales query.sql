-- Total sales for each product category
SELECT 
    product,
    SUM(quantity * unit_price) AS total_sales
FROM 
    sales_data
GROUP BY 
    product
ORDER BY 
    total_sales DESC;

-- Number of sales transaction per region
SELECT 
    region,
    COUNT("orderID") AS sales_transactions
FROM 
    sales_data
GROUP BY 
    region
ORDER BY 
    sales_transactions DESC;

-- Highest selling product by total sales
SELECT 
    product,
    SUM(quantity * unit_price) AS total_sales
FROM 
    sales_data
GROUP BY 
    product
ORDER BY 
    total_sales DESC
LIMIT 1;

-- Total revenue per product
SELECT 
    product,
    SUM(quantity * unit_price) AS total_revenue
FROM 
    sales_data
GROUP BY 
    product
ORDER BY 
    total_revenue DESC;

-- Monthly sales for the current year
SELECT 
    TO_CHAR("order_date", 'Month') AS month,
    SUM(quantity * unit_price) AS monthly_sales
FROM 
    sales_data
WHERE 
    EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY 
    month
ORDER BY 
	month;
	
-- Top 5 customers by total purchase amount
SELECT 
    "customerID",
    SUM(quantity * unit_price) AS total_purchase
FROM 
    sales_data
GROUP BY 
    "customerID"
ORDER BY 
    total_purchase DESC
LIMIT 5;

-- Percentage of total sales by each region
SELECT 
    region,
    SUM(quantity * unit_price) AS region_sales,
    ROUND(SUM(quantity * unit_price) * 100.0 / (
		SELECT SUM(quantity * unit_price) FROM sales_data), 2
		 ) AS sales_percentage
FROM 
    sales_data
GROUP BY 
    region
ORDER BY 
    sales_percentage DESC;

-- Products with no sales in the last quater
SELECT 
    DISTINCT product
FROM 
    sales_data
WHERE 
    product NOT IN (
        SELECT 
            DISTINCT product
        FROM 
            sales_data
        WHERE 
            order_date >= DATE_TRUNC('quarter', CURRENT_DATE) - INTERVAL '3 months'
            AND order_date < DATE_TRUNC('quarter', CURRENT_DATE)
    );
