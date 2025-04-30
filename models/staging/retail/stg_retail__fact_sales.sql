with 

source as (

    select * from {{ source('retail', 'fact_sales') }}

),

stg_fact_sales as (

    select
        sales_id,
        customer_id,
        product_id,
        store_id,
        sales_date,
        quantit_sold,
        total_amount

    from source

)

select * from stg_fact_sales
