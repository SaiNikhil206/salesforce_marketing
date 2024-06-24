{% snapshot meepaisa_snapshots %}
    {{
        config(
            target_schema='snapshots',
            target_database='hive_metastore',
            unique_key='order_id',
            strategy='timestamp',
            invalidate_hard_deletes=False,
            updated_at='order_date'
        )
    }}

    select * from {{ source('meepaisa_sales_data', 'orders_data') }}
 {% endsnapshot %}