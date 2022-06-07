with source as (

    select * from {{source("FIXER_API", "FOREX")}}
)

select 

    date,
    rates:GBP as gbp,
    rates:USD as usd,
    rates:BRL as brl,
    rates:INR as inr
    
    from source