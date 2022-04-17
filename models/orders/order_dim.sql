WITH orders_dim AS (

SELECT 
    id AS order_id,
    status AS order_status

FROM {{ref('orders_stg')}}

)

SELECT * FROM orders_dim