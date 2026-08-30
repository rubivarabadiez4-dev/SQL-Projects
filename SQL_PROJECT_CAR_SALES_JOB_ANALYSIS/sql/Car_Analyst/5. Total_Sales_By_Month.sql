/*5. What is the number of sales of car per month?*/

SELECT
    month_sale,
    count(*) as total_number_sales
FROM
    car_data
GROUP BY
    month_sale
ORDER BY
    month_sale;