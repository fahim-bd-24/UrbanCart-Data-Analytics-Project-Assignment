--Order_Analysis
-- (Order & Operational Performance)
-- Q1.Q4.Q12.Q15.Q16



-- Q1.How many total orders has UrbanCart received so far?

select count(order_id) as total_orders from public."FactOrders";






-- Q4.What is the monthly trend of total orders over time?

select  to_char(order_date::date, 'YYYY-MM') as oder_month,
	count (order_id) as total_orders
	from "FactOrders"
group by to_char(order_date::date, 'YYYY-MM')
order by order_month;





-- Q12.Generate a list of cancellation rates by city;  

SELECT  dc. city,
    COUNT(fo.order_id) AS total_orders,
    SUM(CASE WHEN fo.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND( 100.0 * SUM(CASE WHEN fo.status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(fo.order_id),2) AS cancellation_rate_percent
FROM "FactOrders"  fo
JOIN public."DimCustomers"  dc ON fo.customer_id = dc.customer_id
GROUP BY  dc. city
ORDER BY cancellation_rate_percent DESC;





-- also the cancellation rate for customers.

SELECT dc.full_name,
    COUNT(fo.order_id) AS total_orders,
    SUM(CASE WHEN fo.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(100.0 * SUM(CASE WHEN fo.status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(fo.order_id),2) AS cancellation_rate_percent
FROM "FactOrders"  fo
JOIN public."DimCustomers"  dc ON fo.customer_id = dc.customer_id
GROUP BY dc.full_name
ORDER BY cancellation_rate_percent DESC;





-- Q15. Generate a list of customers who ordered in October but didn’t order in December.



SELECT 
    dc.customer_id, 
    dc.full_name, 
    dc.email,
	fo.order_date

FROM "DimCustomers" dc
JOIN public."FactOrders"  fo ON dc.customer_id = fo.customer_id
WHERE EXTRACT(MONTH FROM fo.order_date::date) = 10 AND EXTRACT(YEAR FROM fo.order_date::date) = 2025
AND dc.customer_id NOT IN (
        SELECT customer_id 
        FROM  public."FactOrders"
        WHERE EXTRACT(MONTH FROM order_date::date) = 12 AND EXTRACT(YEAR FROM order_date::date) = 2025)
		group by  dc.customer_id ,dc.full_name, dc.email,fo.order_date
		order by dc.customer_id,fo.order_date;





-- Q16. Generate a list of customers who ordered both in October & December.



SELECT 
    dc.customer_id, 
    dc.full_name, 
    dc.email,
    fo.order_date
FROM "DimCustomers" dc
JOIN public."FactOrders"  fo ON dc.customer_id = fo.customer_id
WHERE EXTRACT(MONTH FROM fo.order_date::date) in (10,12) AND EXTRACT(YEAR FROM fo.order_date::date) = 2025

		group by  dc.customer_id ,dc.full_name, dc.email,fo.order_date
		order by dc.customer_id,fo.order_date;



