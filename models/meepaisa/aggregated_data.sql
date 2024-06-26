SELECT 
    customer_gender,
    SUM(total_price) AS total_sales
FROM 
    {{ ref('transformed_data') }}
GROUP BY 
    customer_gender

