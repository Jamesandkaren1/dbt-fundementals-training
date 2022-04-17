with stripe_stg AS(

    select * from raw.stripe.payment
)

select * from stripe_stg