SELECT
    customer_id,
    customer_name,
    email,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(line_total) AS total_spent,
    SUM(quantity) AS total_items
FROM {{ ref('silver_customers_orders') }}
GROUP BY
    customer_id,
    customer_name,
    email
