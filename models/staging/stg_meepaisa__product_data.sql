-- generating model for source('meepaisa_sales_data', 'meepaisa_sales')...
{{
    config(
        materialized='table'
    )
}}

with products_data as (
    select * from {{ source('meepaisa_sales_data','meepaisa_sales')}}
),
final as(
    select customer_ids,quantity,
total_price,
item_price,
item_name,
purchase_date,
payment_method from products_data
order by customer_ids
)
select * from final