WITH customer_stg AS (

SELECT * FROM {{source('jaffle_shop', 'customers')}}

)

SELECT * FROM customer_stg

