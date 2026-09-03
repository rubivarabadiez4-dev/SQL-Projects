/*
4. What are the car model sold at higher price compared to its average selling price?
- Identify the selling price ratio in terms of it's average price.
- Purpose: To sell cars that has the highest ratio for higher average order value.
*/

SELECT
    make,
    model,
    selling_price,
    round(avg_price,0) as avg_price,
    round(selling_price / avg_price,2) as sell_price_ratio
FROM
    (
    SELECT
        make,
        model,
        selling_price,
        avg(selling_price) over(PARTITION BY make, model) as avg_price
    FROM
        car_data
    )
WHERE
    selling_price > avg_price
ORDER BY
    sell_price_ratio desc
LIMIT 50;