CREATE OR REPLACE VIEW view_logistics_performance AS

WITH raw_metrics AS (
    SELECT 
        o.order_id,
        c.customer_city AS city,
        c.customer_state AS state, 
        o.order_purchase_timestamp, 
        o.order_delivered_customer_date, 
        o.order_estimated_delivery_date,
        
        -- order to delivery lead time calculations
        DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp) AS total_delivery_days,
        -- estimate vs actual delivery date, positive means it was delivered before
        DATEDIFF(o.order_estimated_delivery_date, o.order_delivered_customer_date) AS estimated_actual_date,
        -- seller processing time calculation
        DATEDIFF(o.order_delivered_carrier_date, o.order_purchase_timestamp) AS seller_processing_time,
        -- carrier transit time
        DATEDIFF(o.order_delivered_customer_date, o.order_delivered_carrier_date) AS carrier_transit_time,
        -- freight-to-sales 
        SUM(oi.price) AS order_value,
        SUM(oi.freight_value) AS freight_value
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY o.order_id, c.customer_city, c.customer_state, o.order_delivered_customer_date, o.order_purchase_timestamp, o.order_estimated_delivery_date, o.order_delivered_carrier_date
)
SELECT 
    *,
    -- 1. Categorize delivery performance
    CASE 
        WHEN estimated_actual_date > 0 THEN 'Early/On-Time'
        WHEN estimated_actual_date = 0 THEN 'Exact Day'
        ELSE 'Late'
    END AS delivery_status,

    -- 3. Calculate the Ratio at the final step to ensure accuracy
    ROUND((freight_value / NULLIF(order_value, 0)), 4) AS freight_ratio_pct
FROM raw_metrics;