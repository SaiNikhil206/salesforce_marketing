-- generating model for source('meepaisa_sales_data', 'invoice_data')...

{{
    config(
        materialized='table'
    )
}}
with invoice_data as (
    select * from {{ source('meepaisa_sales_data', 'invoice_data') }}
),

final as (
    select
        customer_id,
        order_id,
        quantity,
        total_price,
        item_name,
        unit_price,
        invoice_number,
        payment_method,
        invoice_date,
        status
    from invoice_data
)

select * from final
