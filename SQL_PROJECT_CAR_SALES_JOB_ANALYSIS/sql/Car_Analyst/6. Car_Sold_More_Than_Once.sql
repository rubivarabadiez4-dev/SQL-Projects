/*
6. Show the car details that is sold more than once.
- Purpose: To determine the brands that can be sold more than once.
*/

SELECT
    *
FROM
    (
    SELECT
        *,
        count(*) OVER(PARTITION BY vin) as total_unique_sale
    FROM
        car_data
    )
WHERE
    total_unique_sale > 3
ORDER BY
    total_unique_sale desc;