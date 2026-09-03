create TABLE car_sales_data
(
    year int,
    make text,
    model text,
    trim text,
    body text,
    transmission text,
    vin text,
    state text,
    condition text,
    odometer int,
    color text,
    interior text,
    seller text,
    mmr int,
    selling_price int,
    saledate text
);

create view car_data AS
    SELECT
        year,
        make,
        model,
        trim,
        initcap(body) as body,
        transmission,
        vin,
        state,
        condition,
        odometer,
        color,
        interior,
        seller,
        mmr,
        selling_price,
        saledate,
        cast(CASE
            when SUBSTRING(saledate, 5, 3) = 'Jan' then 1
            when SUBSTRING(saledate, 5, 3) = 'Feb' then 2
            when SUBSTRING(saledate, 5, 3) = 'Mar' then 3
            when SUBSTRING(saledate, 5, 3) = 'Apr' then 4
            when SUBSTRING(saledate, 5, 3) = 'May' then 5
            when SUBSTRING(saledate, 5, 3) = 'Jun' then 6
            when SUBSTRING(saledate, 5, 3) = 'Jul' then 7
            when SUBSTRING(saledate, 5, 3) = 'Aug' then 8
            when SUBSTRING(saledate, 5, 3) = 'Sep' then 9
            when SUBSTRING(saledate, 5, 3) = 'Oct' then 10
            when SUBSTRING(saledate, 5, 3) = 'Nov' then 11
            when SUBSTRING(saledate, 5, 3) = 'Dec' then 12
        end as integer) as month_sale,
        SUBSTRING(saledate, 12, 4) as year_sale,
        SUBSTRING(saledate, 9, 2) as day_sale
    FROM
        car_sales_data
    WHERE
        body != 'Navitgation' AND
        saledate is not null AND
        condition is not null AND
        odometer is not null;