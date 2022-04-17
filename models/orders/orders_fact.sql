WITH order_fact AS (

    SELECT
        order_date,
        id AS order_id,
        user_id AS customer_id,
        NULL AS order_amount

    FROM {{ref('orders_stg')}}
)

SELECT * FROM order_fact