/*
3. What is the number of sales and average price of car per month?
- Identify the highest month in terms of total sales including the average month price
- Purpose: To focus on what month or season in selling cars to generate higher income.
*/

SELECT
    month_sale,
    SUM(selling_price) AS total,
    count(*) as total_number_sales,
    round(avg(selling_price),0) as average_price
FROM
    car_data
GROUP BY
    month_sale
ORDER BY
    total, total_number_sales;