-- Q25. Daily report containing Date, Total Orders, Total Items, Completed Orders, Cancelled Orders, Total Revenue

SELECT 
    o.order_date::date AS report_date,       
    COUNT(DISTINCT o.order_id) AS total_orders, 
    SUM(foi.quantity) AS total_items,       
    
    
    SUM(CASE WHEN o.status = 'Completed' THEN 1 ELSE 0 END) AS completed_orders,
    SUM(CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(SUM(foi.quantity * dp.unit_price), 2) AS total_revenue
	
FROM public."FactOrders" o

JOIN public."FactOrderItems" foi ON o.order_id = foi.order_id
JOIN public."DimProducts" dp ON foi.product_id = dp.product_id

GROUP BY o.order_date::date
ORDER BY report_date DESC;