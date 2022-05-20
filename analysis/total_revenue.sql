with total_revenue as (
    select 
        sum(case when status = 'success' then amount end) as total_revenue

    from {{ref('stripe_stg')}}
)

select * from total_revenue