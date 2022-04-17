with payment_fact as (
    select
        created as payment_date,
        id as paymentid,
        orderid,
        status,
        COALESCE((case when status = 'success' then amount end), 0) as payment_amount,
        COALESCE((case when status = 'fail' then amount end),0) as payment_fail_amount
    from {{ref('stripe_stg')}}    
)

select * from payment_fact