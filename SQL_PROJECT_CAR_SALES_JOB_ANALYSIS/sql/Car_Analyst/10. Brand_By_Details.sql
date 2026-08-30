/*10. Show the type of brands with there corresponding details*/

SELECT
    make,
    count(DISTINCT model) as total_model,
    count(*) as total_sales,
    min(selling_price) as min_price,
    max(selling_price) as max_price,
    round(avg(selling_price),0) as average_price
FROM
    car_data
GROUP BY
    make
ORDER BY
    make;