-- Q17. Which payment methods are used most frequently?
SELECT 
    method,                      
    COUNT(*) AS frequently_count  
FROM public."FactPayment"
	GROUP BY method                       
ORDER BY frequently_count DESC; 

-- Q18. Relationship between payment method and order status.
SELECT p.method as payment_method,
	   fo.status as order_status,
	       COUNT(*) AS total_order
		   from public."FactPayment" p
		   join public."FactOrders" fo on p.order_id =  fo.order_id
		   	GROUP BY p.method,
	                  fo.status                      
ORDER BY
payment_method DESC,
total_order DESC; 


-- Q19. Do cities prefer specific payment methods?
SELECT 
    dc.city,                        
    p.method AS payment_method,     
    COUNT(*) AS total_orders     
FROM public."FactPayment" p

JOIN public."FactOrders" fo ON p.order_id = fo.order_id

JOIN public."DimCustomers" dc ON fo.customer_id = dc.customer_id
GROUP BY dc.city, 
         p.method                        
ORDER BY dc.city ASC,                    
         total_orders DESC;     

-- Q20. Are higher-value orders associated with specific payment methods?
SELECT 
    p.method AS payment_method,
    ROUND(AVG(foi.quantity * dp.unit_price), 2) AS avg_item_spend,
    ROUND(MAX(foi.quantity * dp.unit_price), 2) AS max_item_spend	
FROM public."FactPayment" p

JOIN public."FactOrderItems" foi ON p.order_id = foi.order_id
JOIN public."DimProducts" dp ON foi.product_id = dp.product_id
GROUP BY p.method
ORDER BY avg_item_spend DESC; 



-- Q21. Average number of items per order by payment method.
SELECT 
    p.method AS payment_method,
    ROUND(AVG(foi.quantity), 2) AS avg_item_quantity_per_row
FROM public."FactPayment" p
JOIN public."FactOrderItems" foi ON p.order_id = foi.order_id
GROUP BY p.method
ORDER BY avg_item_quantity_per_row DESC; 











































