with order_payment_dim as (
    select 
        orderid,
        sum(amount) as payment_amount
    from {{ref('stripe_stg')}}
    group by 1
)
select * from order_payment_dim