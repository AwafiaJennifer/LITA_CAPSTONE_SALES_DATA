# LITA CAPSTONE PROJECT

## Project Title: Data_Analysis_of_a_Retail_Sales_Store

- [Project Overview](#Project-Overview)
- [Introduction](#Introduction)
- [Tools used](#Tools-used)
- [Process](#Process)
- [Key Insights](#Key-Insights)
- [Key Features](#Key-Features)
- [Conclusion](#Conclusion)

## Project Overview

Welcome to my Retail Sales Data Analysis project. This report details the analysis of a sales store that was given to me by LITA. With the aim to uncover valuable insights from retail sales data, by leveraging analytic techniques and visualizations, this project will highlight trends, identify key performance indicators, and much more. Join me on this journey to transform this raw data into meaningful insights.

## Introduction

This retail store was interested in understanding its sales performance. The analysis was carried out using three analytic tool to explore the sales data.

## Process

- The dataset was initially provided as an Excel file, making it easy to view in Excel.
- **Excel** was used to create Pivot Tables for various insights on the sales data.
- The dataset was converted to a **CSV file** to enable extraction in SQL.
- **SQL** was used to extract key insights based on specific business questions.
- The analyzed data in **SQL** and **Excel** was exported to **PowerBI** for visualization of insights.

## Tools used

### Excel
- Used for cleaning and formatting, calculating metrics.
- Used for inspection and handling duplicates.
- Pivot Tables were created, and a sales report was also generated.

![Screenshot (6)](https://github.com/user-attachments/assets/1a6a870f-58b2-4dbd-b833-c562fa00bf79)
![Screenshot (8)](https://github.com/user-attachments/assets/79108aa0-7054-4bb1-a9b1-398141e0ebe9)

### SQL
Used for querying data to derive key insights.

Example of SQL queries:
- **Total sales for each product category**:
    ```sql
    SELECT 
        product,
        SUM(quantity * unit_price) AS total_sales
    FROM 
        sales_data
    GROUP BY 
        product
    ORDER BY 
        total_sales DESC;
    ```

- **Number of sales transactions per region**:
    ```sql
    SELECT 
        region,
        COUNT("orderID") AS sales_transactions
    FROM 
        sales_data
    GROUP BY 
        region
    ORDER BY 
        sales_transactions DESC;
    ```

- **Highest selling product by total sales**:
    ```sql
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
    ```

- **Total revenue per product**:
    ```sql
    SELECT 
        product,
        SUM(quantity * unit_price) AS total_revenue
    FROM 
        sales_data
    GROUP BY 
        product
    ORDER BY 
        total_revenue DESC;
    ```

- **Monthly sales for the current year**:
    ```sql
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
    ```

- **Top 5 customers by total purchase amount**:
    ```sql
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
    ```

- **Percentage of total sales by each region**:
    ```sql
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
    ```

- **Products with no sales in the last quarter**:
    ```sql
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
    ```

### PowerBI
Used for creating an interactive dashboard to visualize the insights.

This tool provides insights into:
- Customer behavior
- Product success
- Regional sales performance

![Screenshot (29)](https://github.com/user-attachments/assets/2fe753be-1acb-4925-a0f4-3d00caecfa54)
![Screenshot (30)](https://github.com/user-attachments/assets/bc7e9b28-0240-4a32-b214-77265fd1161e)


## Key Insights

The analysis revealed the following insights:
- Some products consistently outperformed others across various regions.
- Regional sales showed variability, suggesting opportunities for targeted marketing efforts.
- Monthly sales trends highlighted peak sales periods, which could help inform inventory planning.

## Key Features

- **SQL Queries**: Aggregation and analysis using SQL, allowing efficient data handling.
- **Excel Dashboards**: Created Pivot Tables to generate insights.
- **PowerBI**: For beautiful visualizations.
- **Actionable Insights**: Uncovered high-revenue customers, top-selling products, and high-growth regions.

## Conclusion

The sales data analysis provides valuable insights into product performance and regional sales patterns. Shoes generated the most revenue due to their higher price, while hats were the most frequently purchased, indicating a strong customer preference. The South region led in sales, highlighting potential for targeted marketing in that area. February saw the highest sales, likely driven by seasonal events. Applying these insights can guide future marketing efforts and inventory planning, helping to optimize sales and revenue across product categories.
