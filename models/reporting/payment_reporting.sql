select

    payment_date, 
    paymentid,
    payment_method,
    orderid,
    payment_status,
    payment_amount,
    payment_fail_amount

from {{ref ('payment_fact')}} as pf
left join {{ref ('stripe_payment_dim')}} as stripe_payment_dim on stripe_payment_dim.method_id = pf.method_id