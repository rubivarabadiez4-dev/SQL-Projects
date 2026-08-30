/*7. What are the car model sold at higher price compared to its average selling price?*/

SELECT
    make,
    model,
    month_sale,
    year_sale,
    selling_price,
    round(avg_price,0) as avg_price,
    round(selling_price / avg_price,2) as sell_price_ratio
FROM
    (
    SELECT
        make,
        model,
        month_sale,
        year_sale,
        selling_price,
        avg(selling_price) over(PARTITION BY make, model) as avg_price
    FROM
        car_data
    )
WHERE
    selling_price > avg_price
ORDER BY
    sell_price_ratio desc;