with stripe_stg AS(

    select
        id, 
        orderid,
        case 
            when paymentmethod = 'bank_transfer' then 1
            when paymentmethod = 'coupon' then 2
            when paymentmethod = 'credit_card' then 3
            when paymentmethod = 'gift_card' then 4
        end as method_id,
        paymentmethod,
        status as payment_status,
        amount,
        created

             from raw.stripe.payment as raw_data
)

select * from stripe_stg