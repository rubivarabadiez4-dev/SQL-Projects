/*6. What are the top models for each body type?*/

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
    body_rank <= 5;