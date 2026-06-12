-- 02_Sales_Product_Analysis

-- Q2. Which cities generate  highest number of orders & revenue?


SELECT dc. city,
    COUNT(DISTINCT o.order_id) AS total_order,
    SUM(foi.quantity * dp.unit_price) AS total_revenue
FROM "DimCustomers" dc
JOIN "FactOrders" o ON o.customer_id = dc.customer_id
JOIN "FactOrderItems" foi ON o.order_id = foi.order_id
JOIN public."DimProducts" dp ON foi.product_id = dp.product_id
GROUP BY dc. city
ORDER BY total_revenue DESC;



-- Q6. What is  total revenue generated?

SELECT 
sum(foi.quantity*dp.unit_price) as Total_revenue
from"FactOrderItems" foi
join public."DimProducts" dp ON foi.product_id = dp.product_id;


-- Q7. Which product categories contribute most to revenue?

SELECT dp.category,
sum(foi.quantity*dp.unit_price) as Total_revenue
from"FactOrderItems" foi
join public."DimProducts" dp ON foi.product_id = dp.product_id
group by dp.category
order by Total_revenue  DESC;


-- Q8. Which individual products generate highest revenue?

SELECT dp.product_name,
	   -- dp.category,[If i need  individual products with there category]
sum(foi.quantity*dp.unit_price) as Total_revenue
from"FactOrderItems" foi
join public."DimProducts" dp ON foi.product_id = dp.product_id
group by dp.product_name, 
		-- dp.category
order by Total_revenue  DESC;



-- Q9. Average Order Value (AOV) & Average Basket Size.

SELECT
sum(foi.quantity*dp.unit_price)/count (DISTINCT foi.order_id) as average_order_value,
sum(foi.quantity)/count (DISTINCT foi.order_id) as average_Basket_Size
from "FactOrderItems" foi
join public."DimProducts" dp ON foi.product_id = dp.product_id;












