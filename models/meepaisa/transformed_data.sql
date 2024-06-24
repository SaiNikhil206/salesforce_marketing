{{ config(materialized="table") }}

with
    customers_sales as (select * from {{ ref("stg_meepaisa__customers_data") }}),
    products_sales as (select * from {{ ref("stg_meepaisa__product_data") }}),
    orders_sales as (select * from {{ ref("stg_meepaisa__order_data") }}),
    invoice_sales as (select * from {{ ref("stg_meepaisa__invoice_data") }}),

    final as (
        select
            p.purchase_date,
            c.customer_id,
            c.customer_age,
            c.customer_gender,
            p.item_name,
            p.quantity,
            p.item_price,
            p.total_price,
            p.payment_method
        from customers_sales c
        inner join products_sales p on c.customer_id = p.customer_ids
        order by c.customer_id

    )
select *
from final
