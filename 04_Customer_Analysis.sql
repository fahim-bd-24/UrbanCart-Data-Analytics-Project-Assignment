-- Q3. What percent of customers use Gmail?


SELECT 
    ROUND( (COUNT(CASE WHEN email ILIKE '%gmail%' THEN 1 END) * 100.0) / COUNT(*), 2) AS gmail_customer_percentage
FROM public."DimCustomers";



-- Q11. Which customers contribute highest total revenue?

SELECT 
    dc.customer_id,
    dc.full_name,
    ROUND(SUM(foi.quantity * dp.unit_price), 2) AS total_revenue
FROM 
    "FactOrderItems" foi
JOIN public."FactOrders" o ON foi.order_id = o.order_id
JOIN public."DimCustomers" dc ON o.customer_id = dc.customer_id
JOIN public."DimProducts" dp ON foi.product_id = dp.product_id
GROUP BY 
    dc.customer_id, 
    dc.full_name
ORDER BY total_revenue DESC 
LIMIT 10;



-- Q14. How customer purchasing behavior changes over time since account creation?

SELECT 
    EXTRACT(YEAR FROM AGE(o.order_date::date, dc.created_at::date)) * 12 + 
    EXTRACT(MONTH FROM AGE(o.order_date::date, dc.created_at::date)) AS months_since_registration,
    
    COUNT(DISTINCT o.order_id) AS total_orders,
    
    ROUND(AVG(foi.quantity * dp.unit_price), 2) AS avg_order_value
FROM public."FactOrderItems" foi
JOIN public."FactOrders" o ON foi.order_id = o.order_id
JOIN public."DimCustomers" dc ON o.customer_id = dc.customer_id
JOIN public."DimProducts" dp ON foi.product_id = dp.product_id
GROUP BY months_since_registration
ORDER BY months_since_registration ASC;