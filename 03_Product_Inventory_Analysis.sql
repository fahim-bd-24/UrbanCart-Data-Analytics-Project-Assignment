-- Q5. What is the Completed, Pending & Cancelled Rate
SELECT 
    status AS order_status,                  
	COUNT(*) AS total_orders,                    
	ROUND((COUNT(*)::NUMERIC / (SELECT COUNT(*) FROM public."FactOrders")) * 100, 2) AS status_rate_percentage
FROM public."FactOrders"
GROUP BY status
ORDER BY status_rate_percentage DESC;         
	

-- Q10. Products at risk of stock-out.

SELECT product_id,
	   product_name,
	   category,
	   stock
from "DimProducts"
where stock < 200
order by stock;

-- Q13. Male vs Female purchasing pattern by category.

SELECT
dc."Gender",
dp.category,
sum (foi.quantity) AS TOTAL_Buy
from "FactOrderItems" foi
JOIN public."FactOrders" o ON foi.order_id = o.order_id
join public."DimCustomers" dc On o.customer_id = dc.customer_id
JOIN public."DimProducts" dp ON foi.product_id = dp.product_id
group by 
dc."Gender",
dp.category
ORDER BY 
    dc."Gender" DESC,
    TOTAL_Buy DESC;



-- Q22. Category average price vs product price difference.
SELECT 
    product_name,
    category,
    unit_price,
    Round(AVG(unit_price) OVER(PARTITION BY category),2) AS category_avg_price,
    Round(unit_price - AVG(unit_price) OVER(PARTITION BY category),2) AS price_difference
FROM 
    public."DimProducts"
ORDER BY 
    category, 
    price_difference DESC;

	

-- Q23. Product pairs frequently purchased together.

SELECT 
    p1.product_name AS product_a,
    p2.product_name AS product_b,
    COUNT(*) AS times_purchased_together
	FROM  "FactOrderItems" foi1

JOIN public."FactOrderItems" foi2 ON foi1.order_id = foi2.order_id 
                                AND foi1.product_id < foi2.product_id
JOIN public."DimProducts" p1 ON foi1.product_id = p1.product_id
JOIN public."DimProducts" p2 ON foi2.product_id = p2.product_id
GROUP BY p1.product_name, 
         p2.product_name
ORDER BY times_purchased_together DESC
LIMIT 10;


-- Q24. Product pairs generating highest revenue together.


SELECT 
    p1.product_name AS product_a,
    p2.product_name AS product_b,
ROUND(SUM((foi1.quantity * p1.unit_price) + (foi2.quantity * p2.unit_price)), 2) AS total_combined_revenue
	FROM  "FactOrderItems" foi1

JOIN public."FactOrderItems" foi2 ON foi1.order_id = foi2.order_id 
                                AND foi1.product_id < foi2.product_id
JOIN public."DimProducts" p1 ON foi1.product_id = p1.product_id
JOIN public."DimProducts" p2 ON foi2.product_id = p2.product_id
GROUP BY p1.product_name, 
         p2.product_name
ORDER BY total_combined_revenue DESC
LIMIT 10;






















