with stripe_pament_dim AS 

(select 
    distinct paymentmethod AS payment_method
from {{ref('stripe_stg')}}
)

select * from stripe_pament_dim
