/*9. What is the relationship of odometer to the selling price?*/

SELECT
    CASE
        WHEN odometer BETWEEN 0 and 100000 then '0-100000'
        WHEN odometer BETWEEN 100001 and 200000 then '100001-200000'
        WHEN odometer BETWEEN 200001 and 300000 then '200001-300000'
        WHEN odometer BETWEEN 300001 and 400000 then '300001-400000'
        WHEN odometer BETWEEN 400001 and 500000 then '400001-500000'
        WHEN odometer BETWEEN 500001 and 600000 then '500001-600000'
        WHEN odometer BETWEEN 600001 and 700000 then '600001-700000'
        WHEN odometer BETWEEN 700001 and 800000 then '700001-800000'
        WHEN odometer BETWEEN 800001 and 900000 then '800001-900000'
        WHEN odometer BETWEEN 900001 and 1000000 then '900001-1000000'
    end as odometer_group,
    round(avg(selling_price),0) as avg_price,
    count(*) as total_sales
FROM
    car_data
GROUP BY
    odometer_group;