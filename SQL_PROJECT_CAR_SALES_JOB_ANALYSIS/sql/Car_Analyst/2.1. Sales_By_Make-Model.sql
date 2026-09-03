/*
2.1. What are the top models for each body type and for every maker?
- Identify the highest count of sales
- Purpose: To focus on what type of cars that has high volume of sales.
*/

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