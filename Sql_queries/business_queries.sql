-- Some columns data types to be altered for analytical purposes
ALTER TABLE olist_orders
ALTER COLUMN order_purchase_timestamp
TYPE TIMESTAMP
USING order_purchase_timestamp::timestamp;

ALTER TABLE olist_orders
ALTER COLUMN payment_value
TYPE NUMERIC
USING payment_value::numeric;

ALTER TABLE olist_orders
ALTER COLUMN price TYPE NUMERIC USING price::numeric;

ALTER TABLE olist_orders
ALTER COLUMN freight_value TYPE NUMERIC USING freight_value::numeric;

ALTER TABLE olist_orders
ALTER COLUMN delivery_time_days
TYPE NUMERIC
USING delivery_time_days::numeric;

-- Monthly Revenue Trend

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    ROUND(SUM(payment_value), 2) AS monthly_revenue
FROM olist_orders
GROUP BY month
ORDER BY month;

-- Revenue shows seasonal growth

-- Average revenue per order

SELECT
     ROUND(SUM(payment_value), 2) AS total_revenue,
     ROUND(
         SUM(payment_value) / COUNT(DISTINCT order_id),
         2
     ) AS avg_order_value
FROM olist_orders;
-- Gives the overall idea on business size and customer spend

-- TOP 10 Product Categories by Revenue
SELECT
     product_category_name_english AS category,
     ROUND(SUM(payment_value), 2) AS revenue
FROM olist_orders
 WHERE product_category_name_english IS NOT NULL
 GROUP BY category
 ORDER BY revenue DESC
 LIMIT 10;
-- Identifies key revenue-generating product categories

-- Revenue by payment method
 SELECT
     payment_type,
     ROUND(SUM(payment_value), 2) AS revenue 
 FROM olist_orders
 WHERE payment_value IS NOT NULL
 GROUP BY payment_type
 ORDER BY revenue DESC;
-- shows the customer payment preferences
-- New vs Repeat Customers
 SELECT
     customer_type,
     COUNT(DISTINCT order_id) AS total_orders,
     ROUND(
         COUNT(DISTINCT order_id) * 100.0 /
         SUM(COUNT(DISTINCT order_id)) OVER(),
         2
     ) AS percentage
 FROM olist_orders
 GROUP BY customer_type;
-- clearly gives the idea of retention vs acquisition

-- Average Delivery Time
 SELECT
     ROUND(AVG(delivery_time_days), 2) AS avg_delivery_days
 FROM olist_orders
 WHERE delivery_time_days IS NOT NULL;
-- To view the logistics performance of the company

--late vs on-time deliveries
 SELECT
     CASE
         WHEN delivery_delay > 0 THEN 'Late'
         ELSE 'On Time'
     END AS delivery_status,
     round(COUNT(*) *
	 100 / 
	 SUM(count(*)) OVER(),2)
	 AS total_orders
 FROM olist_orders
 WHERE delivery_delay IS NOT NULL
 GROUP BY delivery_status;
 -- shows delivery efficiency

-- checking relation between delivery Time and Review Score
 SELECT
     review_score,
     ROUND(AVG(delivery_time_days), 2) AS avg_delivery_days,
     COUNT(*) AS orders
 FROM olist_orders
 WHERE review_score IS NOT NULL
 GROUP BY review_score
 ORDER BY review_score;
-- asserts customer satisfaction to delivery speed

-- Top 10 customers by lifetime value
 SELECT
     customer_unique_id,
     ROUND(SUM(payment_value), 2) AS lifetime_value,
     COUNT(DISTINCT order_id) AS total_orders
 FROM olist_orders
 GROUP BY customer_unique_id
 ORDER BY lifetime_value DESC
 LIMIT 10;
-- Identifies high-value customers


SELECT * FROM olist_orders