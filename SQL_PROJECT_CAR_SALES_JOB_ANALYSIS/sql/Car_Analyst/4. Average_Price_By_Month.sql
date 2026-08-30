/*4. What are the average price per month?*/

SELECT
    month_sale,
    year_sale,
    round(avg(selling_price),0) as average_price
FROM
    car_data
GROUP BY
    month_sale, year_sale
ORDER BY
    year_sale, month_sale;