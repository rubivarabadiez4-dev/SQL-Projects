/*
1. What are the sales and average state prices in each state?
- Identify the highest state in terms of total sales including the average state price
- Purpose: To focus on what state in selling cars to generate higher income.
*/

SELECT
    state,
    count(*) as total_sales,
    sum(selling_price) as total,
    round(avg(selling_price),0) as average_price,
    round(sum(selling_price) / count(*),2) as state_average_order_value
FROM
    car_data
GROUP BY
    state
ORDER BY
    state_average_order_value DESC;