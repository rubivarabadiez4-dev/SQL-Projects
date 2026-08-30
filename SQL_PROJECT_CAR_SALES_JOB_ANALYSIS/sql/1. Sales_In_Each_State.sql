/*1. What are the sales in each state?*/

SELECT
    state,
    count(*) as total_sales
FROM
    car_data
GROUP BY
    state
ORDER BY
    total_sales DESC;