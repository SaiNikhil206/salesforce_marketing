-- generating model for source('meepaisa_sales_data', 'customers_data')...

{{
    config(
        materialized='table'
    )
}}

with customers_data as (
    select * from {{ source('meepaisa_sales_data', 'customers_data') }}
),
final as(
    select customer_id,customer_age,customer_gender from customers_data
)
select * from final