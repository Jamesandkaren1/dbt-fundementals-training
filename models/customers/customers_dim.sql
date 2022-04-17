WITH customer_dim AS

(
    SELECT 
    
     id AS customer_id,
     first_name,
     last_name
    
    FROM {{ref('customer_stg')}}
)

SELECT * FROM customer_dim