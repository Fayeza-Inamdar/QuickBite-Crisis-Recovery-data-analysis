USE quickbite;

-- Total Orders Before vs After Crisis --
SELECT phase, COUNT(order_id) AS total_orders
FROM orders
GROUP BY phase;

-- Total Revenue Before vs After Crisis--
SELECT phase, ROUND(SUM(order_amount),2) AS total_revenue
FROM orders
GROUP BY phase;

-- Weekly Orders Trend--
SELECT week, COUNT(order_id) AS total_orders
FROM orders
GROUP BY week
ORDER BY week;

-- Weekly Revenue Trend--
SELECT week, ROUND(SUM(order_amount),2) AS total_revenue
FROM orders
GROUP BY week
ORDER BY week;

-- Average Rating Trend--
SELECT week, ROUND(AVG(rating),2) AS avg_rating
FROM reviews
GROUP BY week
ORDER BY week;

-- Total Orders by Monthly Trend--
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS yearmonth,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY yearmonth
ORDER BY yearmonth;

-- % orders by city --
SELECT 
    city,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS percentage_orders
FROM orders
GROUP BY city
ORDER BY percentage_orders DESC;


-- Average Customer Rating by YearMonth--
SELECT 
    city,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS percentage_orders
FROM orders
GROUP BY city
ORDER BY percentage_orders DESC;

-- Delivery Performance
SELECT delivery_status, COUNT(*) AS total_orders
FROM orders
GROUP BY delivery_status;

-- Top 5 Restaurants by Orders
SELECT restaurant_name, COUNT(order_id) AS total_orders
FROM orders
GROUP BY restaurant_name
ORDER BY total_orders DESC
LIMIT 5;




