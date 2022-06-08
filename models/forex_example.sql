with source as (

    select * from {{ref ('dim_forex') }}
)

select date, usd from source