with
    customer_sales as (
        select
            s.customer_id,
            sum(s.quantit_sold) as total_purchases,
            sum(s.total_amount) as total_spend
        from{{ref("stg_retail__fact_sales")}} s
        group by s.customer_id
    )

select
    cs.customer_id,
    cs.total_purchases,
    cs.total_spend,
    case
        when cs.total_purchases >= 50
        then 'High-Value'
        when cs.total_purchases between 20 and 49
        then 'Mid-Value'
        when cs.total_purchases < 50
        then 'Low-Value'
        else 'Unknown'
    end as customer_segment
from customer_sales cs
