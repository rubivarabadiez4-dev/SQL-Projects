/*
2.2. What are the top models for each body type and for every maker?
- Identify the highest count of sales
- Purpose: To focus on what type of cars that has high volume of sales.
*/

SELECT
    *
FROM
    (
        SELECT
            make,
            model,
            body,
            count(*) as total_sales,
            rank() OVER(PARTITION BY body ORDER BY count(*) desc) as body_rank
        FROM
            car_data
        GROUP BY
            make, model, body
        ORDER BY
            body, total_sales desc
    )
WHERE
    body_rank <= 5
ORDER BY
    model;