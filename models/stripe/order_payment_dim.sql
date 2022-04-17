with order_payment_dim as (
    select 
        orderid,
        sum(payment_amount) as payment_amount
    from {{ref('payment_fact')}}
    group by 1
)
select * from order_payment_dim