/*2. What are the sales for make and model?*/

SELECT
    make,
    model,
    count(*) as total_sales
FROM
    car_data
GROUP BY
    make, model
ORDER BY
    total_sales desc;