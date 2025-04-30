with
    sales_by_month as (
        select
            extract(year from sales_date) as year,
            extract(month from sales_date) as month,
            sum(total_amount) as total_sales,
            count(distinct sales_id) as total_transactions
        from {{ ref("stg_retail__fact_sales") }}
        group by year, month
    )

select
    year,
    month,
    total_sales,
    total_transactions,
    total_sales / total_transactions as avg_sales_per_transaction
from sales_by_month
order by month
