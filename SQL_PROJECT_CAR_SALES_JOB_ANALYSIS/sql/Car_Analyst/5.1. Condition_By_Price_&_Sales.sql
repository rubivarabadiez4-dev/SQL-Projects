/*
5.1. What is the relationship of condition and odometer to the selling price and number of sales?
- Identify the best condition and odometer in terms of sales and average price.
- Purpose: To prioritize the selling of cars in relation to its condition and odometer.
*/

SELECT
    CASE
        when cast(condition as integer) between 0 and 10 then '0-10'
        when cast(condition as integer) between 11 and 20 then '11-20'
        when cast(condition as integer) between 21 and 30 then '21-30'
        when cast(condition as integer) between 31 and 40 then '31-40'
        when cast(condition as integer) between 41 and 50 then '41-50'
    end as group_condition,
    count(*) as total_sales,
    round(avg(selling_price),0) as avg_price
FROM
    car_data
GROUP BY
    group_condition
ORDER BY
    avg_price desc;