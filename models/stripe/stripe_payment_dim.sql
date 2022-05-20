with stripe_payment_dim AS 
(
select
    row_number () OVER (ORDER BY (payment_method))  as method_id,
    payment_method
from
    (select
        distinct paymentmethod AS payment_method
    from {{ref('stripe_stg')}}
    )

)

select * from stripe_payment_dim
