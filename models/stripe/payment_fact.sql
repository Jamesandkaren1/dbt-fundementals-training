with payment_fact as (
    select
        created as payment_date,
        id as paymentid,
        method_id,
        orderid,
        payment_status,
        COALESCE((case when payment_status = 'success' then {{ cents_to_dollars() }} end), 0) as payment_amount,
        COALESCE((case when payment_status = 'fail' then {{ cents_to_dollars() }}  end),0) as payment_fail_amount
    from {{ref('stripe_stg')}} 
)

select * from payment_fact

