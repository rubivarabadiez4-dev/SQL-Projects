/*3. What are the average state prices?*/

SELECT
    state,
    round(avg(selling_price),0) as average_price
FROM
    car_data
GROUP BY
    state
ORDER BY
    average_price desc;