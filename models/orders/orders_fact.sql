WITH order_fact AS (

    SELECT
        order_date,
        id AS order_id,
        user_id AS customer_id,
        NULL AS order_amount

    FROM {{ref('orders_stg')}}
    
)

SELECT 
    order_fact.order_date,
    order_fact.order_id,
    order_fact.customer_id,
    order_dim.order_status


FROM order_fact as order_fact
left join {{'order_dim'}} as order_dim on order_dim.order_id = order_fact.order_id