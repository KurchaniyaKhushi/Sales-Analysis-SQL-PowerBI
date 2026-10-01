-- Q1. Display all records from AGENTS.
 
 SELECT *
FROM AGENTS;


-- Q2. Display customer code, customer name and country of all customers.

SELECT
    CUST_CODE,
    CUST_NAME,
    CUST_COUNTRY
FROM CUSTOMER;


-- Q3. Display all unique customer countries.

SELECT DISTINCT
    CUST_COUNTRY
FROM CUSTOMER;


-- Q4. Display customers who belong to India.

SELECT *
FROM CUSTOMER
WHERE CUST_COUNTRY = 'India';


-- Q5. Find customers whose grade is greater than 1.

SELECT
    CUST_CODE,
    CUST_NAME,
    GRADE
FROM CUSTOMER
WHERE GRADE > 1;


-- Q6. Find customers whose grade is between 1 and 2.

SELECT *
FROM CUSTOMER
WHERE GRADE BETWEEN 1 AND 2;


-- Q7. Find customers from India or USA.

SELECT
    CUST_CODE,
    CUST_NAME,
    CUST_COUNTRY
FROM CUSTOMER
WHERE CUST_COUNTRY IN ('India', 'USA');


-- Q8. Find customers whose name starts with 'S'.

SELECT *
FROM CUSTOMER
WHERE CUST_NAME LIKE 'S%';


-- Q9. Find customers whose name contains 'an'.

SELECT *
FROM CUSTOMER
WHERE CUST_NAME LIKE '%an%';


-- Q10. Display the top 5 customers with the highest outstanding amount.

SELECT
    CUST_CODE,
    CUST_NAME,
    OUTSTANDING_AMT
FROM CUSTOMER
ORDER BY OUTSTANDING_AMT DESC
LIMIT 5;


-- Q11. Find the total number of customers.

SELECT COUNT(*) AS Total_Customers
FROM CUSTOMER;


-- Q12. Find the total number of orders.

SELECT COUNT(*) AS Total_Orders
FROM ORDERS;


-- Q13. Find the total order amount.

SELECT SUM(ORD_AMOUNT) AS Total_Order_Amount
FROM ORDERS;


-- Q14. Find the average order amount.

SELECT AVG(ORD_AMOUNT) AS Average_Order_Amount
FROM ORDERS;


-- Q15. Find the highest and lowest order amount.

SELECT
    MAX(ORD_AMOUNT) AS Highest_Order,
    MIN(ORD_AMOUNT) AS Lowest_Order
FROM ORDERS;


-- Q16. Find the total order amount for each customer.

SELECT
    CUST_CODE,
    SUM(ORD_AMOUNT) AS Total_Order_Amount
FROM ORDERS
GROUP BY CUST_CODE;


-- Q17. Find the number of orders placed by each customer.

SELECT
    CUST_CODE,
    COUNT(*) AS Number_of_Orders
FROM ORDERS
GROUP BY CUST_CODE;


-- Q18. Find the total order amount handled by each agent.

SELECT
    AGENT_CODE,
    SUM(ORD_AMOUNT) AS Total_Sales
FROM ORDERS
GROUP BY AGENT_CODE
ORDER BY Total_Sales DESC;


-- Q19. Find customers whose total order amount is greater than 5000.

SELECT
    CUST_CODE,
    SUM(ORD_AMOUNT) AS Total_Order_Amount
FROM ORDERS
GROUP BY CUST_CODE
HAVING SUM(ORD_AMOUNT) > 5000;


-- Q20. Find agents who have handled more than 2 orders.

SELECT
    AGENT_CODE,
    COUNT(*) AS Number_of_Orders
FROM ORDERS
GROUP BY AGENT_CODE
HAVING COUNT(*) > 2;


-- Q21. Display customer name along with their agent name.

SELECT
    C.CUST_NAME,
    A.AGENT_NAME
FROM CUSTOMER C
INNER JOIN AGENTS A
    ON C.AGENT_CODE = A.AGENT_CODE;


-- Q22. Display order number, order amount and customer name.

SELECT
    O.ORD_NUM,
    O.ORD_AMOUNT,
    C.CUST_NAME
FROM ORDERS O
INNER JOIN CUSTOMER C
    ON O.CUST_CODE = C.CUST_CODE;


-- Q23. Display order number, customer name and agent name.

SELECT
    O.ORD_NUM,
    C.CUST_NAME,
    A.AGENT_NAME
FROM ORDERS O
INNER JOIN CUSTOMER C
    ON O.CUST_CODE = C.CUST_CODE
INNER JOIN AGENTS A
    ON O.AGENT_CODE = A.AGENT_CODE;


-- Q24. Display customer name, country and their agent's working area.

SELECT
    C.CUST_NAME,
    C.CUST_COUNTRY,
    A.WORKING_AREA
FROM CUSTOMER C
INNER JOIN AGENTS A
    ON C.AGENT_CODE = A.AGENT_CODE;


-- Q25. Find orders handled by agents working in Bangalore.

SELECT
    O.ORD_NUM,
    O.ORD_AMOUNT,
    A.AGENT_NAME,
    A.WORKING_AREA
FROM ORDERS O
INNER JOIN AGENTS A
    ON O.AGENT_CODE = A.AGENT_CODE
WHERE A.WORKING_AREA = 'Bangalore';


-- Q26. Display every customer and their agent name,
-- including customers even if an agent is not available.

SELECT
    C.CUST_CODE,
    C.CUST_NAME,
    A.AGENT_NAME
FROM CUSTOMER C
LEFT JOIN AGENTS A
    ON C.AGENT_CODE = A.AGENT_CODE;


-- Q27. Find customers who have placed at least one order.

SELECT DISTINCT
    C.CUST_CODE,
    C.CUST_NAME
FROM CUSTOMER C
INNER JOIN ORDERS O
    ON C.CUST_CODE = O.CUST_CODE;


-- Q28. Find customers who have NOT placed any order.

SELECT
    C.CUST_CODE,
    C.CUST_NAME
FROM CUSTOMER C
LEFT JOIN ORDERS O
    ON C.CUST_CODE = O.CUST_CODE
WHERE O.CUST_CODE IS NULL;


-- Q29. Find total sales handled by each agent
-- along with agent name.

SELECT
    A.AGENT_CODE,
    A.AGENT_NAME,
    SUM(O.ORD_AMOUNT) AS Total_Sales
FROM AGENTS A
INNER JOIN ORDERS O
    ON A.AGENT_CODE = O.AGENT_CODE
GROUP BY
    A.AGENT_CODE,
    A.AGENT_NAME
ORDER BY Total_Sales DESC;


-- Q30. Find total sales for each customer
-- along with customer name and country.

SELECT
    C.CUST_CODE,
    C.CUST_NAME,
    C.CUST_COUNTRY,
    SUM(O.ORD_AMOUNT) AS Total_Sales
FROM CUSTOMER C
INNER JOIN ORDERS O
    ON C.CUST_CODE = O.CUST_CODE
GROUP BY
    C.CUST_CODE,
    C.CUST_NAME,
    C.CUST_COUNTRY
ORDER BY Total_Sales DESC;


-- Q31. Categorize customers based on outstanding amount:
-- 0-5000 = Low
-- 5001-10000 = Medium
-- Above 10000 = High

SELECT
    CUST_CODE,
    CUST_NAME,
    OUTSTANDING_AMT,
    CASE
        WHEN OUTSTANDING_AMT <= 5000 THEN 'Low'
        WHEN OUTSTANDING_AMT <= 10000 THEN 'Medium'
        ELSE 'High'
    END AS Outstanding_Category
FROM CUSTOMER;


-- Q32. Categorize orders based on order amount:
-- Below 1000 = Small
-- 1000-3000 = Medium
-- Above 3000 = Large

SELECT
    ORD_NUM,
    ORD_AMOUNT,
    CASE
        WHEN ORD_AMOUNT < 1000 THEN 'Small'
        WHEN ORD_AMOUNT <= 3000 THEN 'Medium'
        ELSE 'Large'
    END AS Order_Category
FROM ORDERS;


-- Q33. Find customers whose outstanding amount
-- is greater than the average outstanding amount.

SELECT
    CUST_CODE,
    CUST_NAME,
    OUTSTANDING_AMT
FROM CUSTOMER
WHERE OUTSTANDING_AMT >
(
    SELECT AVG(OUTSTANDING_AMT)
    FROM CUSTOMER
);


-- Q34. Find orders whose amount is greater
-- than the average order amount.

SELECT
    ORD_NUM,
    ORD_AMOUNT
FROM ORDERS
WHERE ORD_AMOUNT >
(
    SELECT AVG(ORD_AMOUNT)
    FROM ORDERS
);


-- Q35. Find the customer(s) having the highest outstanding amount.

SELECT
    CUST_CODE,
    CUST_NAME,
    OUTSTANDING_AMT
FROM CUSTOMER
WHERE OUTSTANDING_AMT =
(
    SELECT MAX(OUTSTANDING_AMT)
    FROM CUSTOMER
);


-- Q36. Find customers who have placed more orders
-- than the average number of orders per customer.

SELECT
    CUST_CODE,
    COUNT(*) AS Order_Count
FROM ORDERS
GROUP BY CUST_CODE
HAVING COUNT(*) >
(
    SELECT AVG(Order_Count)
    FROM
    (
        SELECT COUNT(*) AS Order_Count
        FROM ORDERS
        GROUP BY CUST_CODE
    ) AS X
);


-- Q37. Find customers whose outstanding amount
-- is greater than the average outstanding amount
-- of customers from the same country.

SELECT
    C1.CUST_CODE,
    C1.CUST_NAME,
    C1.CUST_COUNTRY,
    C1.OUTSTANDING_AMT
FROM CUSTOMER C1
WHERE C1.OUTSTANDING_AMT >
(
    SELECT AVG(C2.OUTSTANDING_AMT)
    FROM CUSTOMER C2
    WHERE C2.CUST_COUNTRY = C1.CUST_COUNTRY
);


-- Q38. Using a CTE, calculate total sales for each customer
-- and display customers with sales above 5000.

WITH CustomerSales AS
(
    SELECT
        CUST_CODE,
        SUM(ORD_AMOUNT) AS Total_Sales
    FROM ORDERS
    GROUP BY CUST_CODE
)
SELECT
    CUST_CODE,
    Total_Sales
FROM CustomerSales
WHERE Total_Sales > 5000;


-- Q39. Using a CTE, calculate total sales handled
-- by each agent and display agent details.

WITH AgentSales AS
(
    SELECT
        AGENT_CODE,
        SUM(ORD_AMOUNT) AS Total_Sales
    FROM ORDERS
    GROUP BY AGENT_CODE
)
SELECT
    A.AGENT_CODE,
    A.AGENT_NAME,
    A.WORKING_AREA,
    ASL.Total_Sales
FROM AGENTS A
INNER JOIN AgentSales ASL
    ON A.AGENT_CODE = ASL.AGENT_CODE
ORDER BY ASL.Total_Sales DESC;


-- Q40. Assign a row number to orders based on
-- highest order amount.

SELECT
    ORD_NUM,
    ORD_AMOUNT,
    ROW_NUMBER() OVER (
        ORDER BY ORD_AMOUNT DESC
    ) AS Row_Numbers
FROM ORDERS;

-- Q41. Rank orders based on order amount using RANK().

SELECT
    ORD_NUM,
    ORD_AMOUNT,
    RANK() OVER (
        ORDER BY ORD_AMOUNT DESC
    ) AS Order_Rank
FROM ORDERS;


-- Q42. Rank orders based on order amount using DENSE_RANK().

SELECT
    ORD_NUM,
    ORD_AMOUNT,
    DENSE_RANK() OVER (
        ORDER BY ORD_AMOUNT DESC
    ) AS Dense_Order_Rank
FROM ORDERS;


-- Q43. Rank customers according to their total sales.

SELECT
    CUST_CODE,
    SUM(ORD_AMOUNT) AS Total_Sales,
    RANK() OVER (
        ORDER BY SUM(ORD_AMOUNT) DESC
    ) AS Sales_Rank
FROM ORDERS
GROUP BY CUST_CODE;


-- Q44. Show each order along with the total sales
-- of that customer's orders.

SELECT
    ORD_NUM,
    CUST_CODE,
    ORD_AMOUNT,
    SUM(ORD_AMOUNT) OVER (
        PARTITION BY CUST_CODE
    ) AS Customer_Total_Sales
FROM ORDERS;


-- Q45. Show each order along with the average order amount
-- of that customer.

SELECT
    ORD_NUM,
    CUST_CODE,
    ORD_AMOUNT,
    AVG(ORD_AMOUNT) OVER (
        PARTITION BY CUST_CODE
    ) AS Customer_Average_Order
FROM ORDERS;


-- Q46. Find the highest-value order for each customer
-- using ROW_NUMBER().

WITH RankedOrders AS
(
    SELECT
        ORD_NUM,
        CUST_CODE,
        ORD_AMOUNT,
        ROW_NUMBER() OVER (
            PARTITION BY CUST_CODE
            ORDER BY ORD_AMOUNT DESC
        ) AS rn
    FROM ORDERS
)
SELECT
    ORD_NUM,
    CUST_CODE,
    ORD_AMOUNT
FROM RankedOrders
WHERE rn = 1;


-- Q47. Find the total sales for each month.

SELECT
    YEAR(ORD_DATE) AS Order_Year,
    MONTH(ORD_DATE) AS Order_Month,
    SUM(ORD_AMOUNT) AS Total_Sales
FROM ORDERS
GROUP BY
    YEAR(ORD_DATE),
    MONTH(ORD_DATE)
ORDER BY
    Order_Year,
    Order_Month;


-- Q48. Find the top 3 customers based on total sales,
-- showing customer name, country and total sales.

WITH CustomerSales AS
(
    SELECT
        C.CUST_CODE,
        C.CUST_NAME,
        C.CUST_COUNTRY,
        SUM(O.ORD_AMOUNT) AS Total_Sales
    FROM CUSTOMER C
    INNER JOIN ORDERS O
        ON C.CUST_CODE = O.CUST_CODE
    GROUP BY
        C.CUST_CODE,
        C.CUST_NAME,
        C.CUST_COUNTRY
),
RankedCustomers AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY Total_Sales DESC
        ) AS rn
    FROM CustomerSales
)
SELECT
    CUST_CODE,
    CUST_NAME,
    CUST_COUNTRY,
    Total_Sales
FROM RankedCustomers
WHERE rn <= 3;


-- Q49. Find each agent's total sales,
-- number of orders and average order amount.

SELECT
    A.AGENT_CODE,
    A.AGENT_NAME,
    COUNT(O.ORD_NUM) AS Number_of_Orders,
    SUM(O.ORD_AMOUNT) AS Total_Sales,
    AVG(O.ORD_AMOUNT) AS Average_Order_Amount
FROM AGENTS A
LEFT JOIN ORDERS O
    ON A.AGENT_CODE = O.AGENT_CODE
GROUP BY
    A.AGENT_CODE,
    A.AGENT_NAME
ORDER BY Total_Sales DESC;


-- Q50. Create a complete customer performance report
-- showing customer name, country, agent name,
-- number of orders, total sales, average order value
-- and performance category.

SELECT
    C.CUST_CODE,
    C.CUST_NAME,
    C.CUST_COUNTRY,
    A.AGENT_NAME,
    COUNT(O.ORD_NUM) AS Number_of_Orders,
    COALESCE(SUM(O.ORD_AMOUNT), 0) AS Total_Sales,
    COALESCE(AVG(O.ORD_AMOUNT), 0) AS Average_Order_Value,
    CASE
        WHEN COALESCE(SUM(O.ORD_AMOUNT), 0) >= 7000
            THEN 'High Value'
        WHEN COALESCE(SUM(O.ORD_AMOUNT), 0) >= 3000
            THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Performance_Category
FROM CUSTOMER C
LEFT JOIN AGENTS A
    ON C.AGENT_CODE = A.AGENT_CODE
LEFT JOIN ORDERS O
    ON C.CUST_CODE = O.CUST_CODE
GROUP BY
    C.CUST_CODE,
    C.CUST_NAME,
    C.CUST_COUNTRY,
    A.AGENT_NAME
ORDER BY Total_Sales DESC;