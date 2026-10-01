# Sales Data Analysis Using SQL & Power BI

## Project Overview

This project focuses on analyzing sales data using MySQL and Power BI. It uses a relational database containing customer details, sales agent information, and order records to explore sales performance and answer business-related questions.

I created 50 SQL analysis questions to practice querying the database, comparing sales, analyzing customers and agents, and identifying useful patterns. I also developed a Power BI dashboard with four DAX measures to present key sales metrics in a visual and easy-to-understand format.

## Problem Statement

Sales databases contain useful information about customers, orders, and sales agents, but raw records can be difficult to interpret directly.

The goal of this project is to use SQL to explore the data, answer business questions, and understand different aspects of sales performance. Power BI is then used to present important metrics through a dashboard, making the results easier to understand.

## Business Objectives

* Analyze customer purchasing behavior.
* Understand sales and order performance.
* Compare sales across customers and agents.
* Identify high-value customers.
* Analyze order frequency and average order value.
* Find customers who have not placed any orders.
* Explore monthly sales patterns.
* Examine customer outstanding amounts.
* Present key sales metrics through a Power BI dashboard.

## Database Structure

The project uses a relational sales database with three main tables.

### 1. AGENTS

Stores information about sales agents.

**Key columns:**

* `AGENT_CODE`
* `AGENT_NAME`
* `WORKING_AREA`
* `COMMISSION`
* `PHONE_NO`
* `COUNTRY`

### 2. CUSTOMER

Stores customer details, assigned agents, and financial information.

**Key columns:**

* `CUST_CODE`
* `CUST_NAME`
* `CUST_CITY`
* `WORKING_AREA`
* `CUST_COUNTRY`
* `GRADE`
* `OPENING_AMT`
* `RECEIVE_AMT`
* `PAYMENT_AMT`
* `OUTSTANDING_AMT`
* `PHONE_NO`
* `AGENT_CODE`

### 3. ORDERS

Stores sales order details.

**Key columns:**

* `ORD_NUM`
* `ORD_AMOUNT`
* `ADVANCE_AMOUNT`
* `ORD_DATE`
* `CUST_CODE`
* `AGENT_CODE`
* `ORD_DESCRIPTION`

## Database Relationships

The tables are connected through the following columns:

* `AGENTS.AGENT_CODE` → `CUSTOMER.AGENT_CODE`
* `AGENTS.AGENT_CODE` → `ORDERS.AGENT_CODE`
* `CUSTOMER.CUST_CODE` → `ORDERS.CUST_CODE`

These relationships allow customer and agent information to be analyzed alongside order records.

## SQL Analysis

I worked on 50 SQL analysis questions covering different querying techniques and business scenarios.

### SQL Concepts Used

* SELECT, WHERE, and DISTINCT
* BETWEEN, IN, and LIKE
* ORDER BY and LIMIT
* Aggregate functions such as SUM, COUNT, AVG, MIN, and MAX
* GROUP BY and HAVING
* INNER JOIN and LEFT JOIN
* CASE statements
* Subqueries and correlated subqueries
* Common Table Expressions (CTEs)
* Window functions
* ROW_NUMBER(), RANK(), and DENSE_RANK()
* PARTITION BY
* Date functions
* COALESCE()

### Analysis Performed

The SQL queries cover the following areas:

* Customer analysis
* Order analysis
* Agent sales analysis
* Customer-wise and agent-wise sales
* Order frequency
* Average order value
* High-value customer identification
* Outstanding amount analysis
* Monthly sales analysis
* Customer ranking
* Highest-value order analysis
* Customer performance categorization
* Customers with no orders

## Power BI Dashboard

I created a Power BI dashboard to present key sales metrics and make sales performance easier to understand.

The dashboard uses KPI measures to summarize important information about revenue, orders, customers, and average order value.

### DAX Measures Created

**1. Total Revenue**

Measures the total sales amount.

**2. Total Orders**

Measures the number of orders.

**3. Total Customers**

Measures the number of distinct customers.

**4. Average Order Value**

Measures the average sales amount per order.

These measures are used to display key performance indicators in the dashboard.

### Dashboard Preview

Add your Power BI dashboard screenshot here.

![Sales Dashboard](screenshots/dashboard_preview.png)

## Tools and Technologies

* **MySQL** — Querying and analyzing relational sales data.
* **MySQL Workbench** — Creating and managing the database and executing SQL queries.
* **SQL** — Data exploration, aggregation, joins, and business analysis.
* **Power BI** — Dashboard development and data visualization.
* **DAX** — Creating measures for sales performance metrics.

## Project Files

The repository contains the following project files:

* `Sales_Database_Setup.sql` — SQL script for creating the database, tables, relationships, and sample data.
* `Sales_Analysis_50_Queries.sql` — SQL analysis questions and their queries.
* `Sales_Database_Model.mwb` — MySQL Workbench database model.
* `screenshots/database_schema.png` — Database schema diagram.
* `screenshots/dashboard_preview.png` — Power BI dashboard screenshot.
* `dashboard/Sales_Dashboard.pbix` — Power BI dashboard file.

## How to Run the Project

1. Install MySQL and open MySQL Workbench.
2. Run `Sales_Database_Setup.sql` to create the database and tables.
3. Select the `Sales` database.
4. Open `Sales_Analysis_50_Queries.sql`.
5. Execute the queries individually to explore the sales data.
6. Open the Power BI dashboard file to view the report, if it is included in the repository.

## What I Learned

Through this project, I practiced writing SQL queries against related tables, using joins and aggregations, applying subqueries and window functions, and analyzing sales-related business questions.

I also gained practical experience creating DAX measures and presenting key metrics in Power BI.

## Author

**Khushi Kurchaniya**

Aspiring Data Analyst | SQL | Power BI

