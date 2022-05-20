{%  set payment_type = ['credit_card', 'bank_tranfer', 'gift_card', 'coupon'] %}

with payment_order_pivot as (
    select 
        orderid,
        {%  for paymentmethod in payment_type  %}

        sum(case when paymentmethod = '{{ paymentmethod }}' then amount else 0 end) as {{ paymentmethod }}_amount
        {% if not loop.last %}
            ,
        {%  endif  %}

        {%  endfor  %}

        -- sum(case when paymentmethod = 'bank_tranfer' then amount else 0 end) as bank_transfer,
        -- sum(case when paymentmethod = 'gift_card' then amount else 0 end) as gift_card,
        -- sum(case when paymentmethod = 'coupon' then amount else 0 end) as coupon
    from {{ref  ('stripe_stg')}}
    where status = 'success'
    group by 1
)

select * from payment_order_pivot