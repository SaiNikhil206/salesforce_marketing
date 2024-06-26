-- generating model for source('meepaisa_sales_data', 'orders_data')...

{{
    config(
        materialized='table'
    )
}}
with order_data as (
    select * from {{ source('meepaisa_sales_data','orders_data') }}
),
final as (
    select order_date,city,shipping_address,order_id from order_data
)
select * from final
