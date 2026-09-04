SELECT
    customer.value:customer_id::STRING AS customer_id,
    customer.value:name::STRING AS customer_name,
    customer.value:email::STRING AS email,

    order_data.value:order_id::STRING AS order_id,
    order_data.value:date::DATE AS order_date,
    order_data.value:total::NUMBER AS order_total,

    product.value:product_id::STRING AS product_id,
    product.value:name::STRING AS product_name,
    product.value:price::NUMBER AS price,
    product.value:qty::NUMBER AS quantity,
    product.value:price::NUMBER * product.value:qty::NUMBER AS line_total

FROM MY_DATABASE.MY_SCHEMA.BRONZE_CUSTOMERS_RAW,

LATERAL FLATTEN(
    INPUT => RAW_DATA:customers
) AS customer,

LATERAL FLATTEN(
    INPUT => customer.value:orders
) AS order_data,

LATERAL FLATTEN(
    INPUT => order_data.value:products
) AS product