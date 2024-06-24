with payment as (
    SELECT 
    payment_method,
    SUM(total_price) AS total_sales
    from {{ ref('transformed_data') }}
    group by payment_method
)

select
    *
from payment