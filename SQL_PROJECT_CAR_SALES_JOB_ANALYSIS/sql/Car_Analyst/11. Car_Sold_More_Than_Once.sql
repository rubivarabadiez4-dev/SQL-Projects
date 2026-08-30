/*11. Show the car details that is sold more than once*/

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
    total_unique_sale > 1
ORDER BY
    total_unique_sale desc;