# I. Introduction
This is a data analysis to provide insights for a car sales. This project explores the in demand car in relationship to it's price and specifications.

For SQL queries used, check all the files using the link:
[Job_Analys](/SQL_PROJECT_CAR_SALES_JOB_ANALYSIS/sql/Car_Analyst/)

# II. Background
The purpose for this analysis is to understand how price and demand changes depending on the car's properties and specifications.

## Questions that is needed to answer to thoroughly investigate the data:

1. What are the sales and average state prices in each state?
2. What are the top models for each body type and for every maker?
3. What are the top models for each body type and for every maker?
4. What are the car model sold at higher price compared to its average selling price?
5. What is the relationship of condition and odometer to the selling price and number of sales?
6. Show the car details that is sold more than once.


# III. Tools Used
To analyze the data available for the job postings, I used the following tools:

1. **SQL:** The core for data analysis, allowing me to query the database to obtain the needed insights.
2. **POSTGRESQL:** The chosen database management system for handling the data.
3. **VISUAL STUDIO CODE:** My chosen software to execute the queries from the database.
4. **GIT & GITHUB:** Used as a platform to share my project specifically SQL scripts and queries needed for the project.
5. **CHATGPT:** To use as quick ai tool for further analyzation and graphical representaion to the query result.

# IV. Analysis
This section will be the query results to answer the questions needed to provide insights in the analysis.

First of all, creating table was necessary to import the data from csv file into the database.
```sql
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
```

Second, data cleaning is needed in order to eliminate noise data that are not needed. It affects the insights since some of the data are incomplete.
Creating view as a table in order not to affect the original data while querying to answer the questions needed.
```sql
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
```


### 1. What are the sales and average state prices in each state?
To focus on what state in selling cars to generate higher income.

```sql
SELECT
    state,
    count(*) as total_sales,
    sum(selling_price) as total,
    round(avg(selling_price),0) as average_price,
    round(sum(selling_price) / count(*),2) as state_average_order_value
FROM
    car_data
GROUP BY
    state
ORDER BY
    state_average_order_value DESC;
```


### 2. What are the top models for each body type and for every maker?
To focus on what type of cars that has high volume of sales.

2.1 SQL
```sql
SELECT
    make,
    model,
    count(*) as total_sales
FROM
    car_data
GROUP BY
    make, model
ORDER BY
    total_sales desc;
```

2.2 SQL
```sql
SELECT
    *
FROM
    (
        SELECT
            make,
            model,
            body,
            count(*) as total_sales,
            rank() OVER(PARTITION BY body ORDER BY count(*) desc) as body_rank
        FROM
            car_data
        GROUP BY
            make, model, body
        ORDER BY
            body, total_sales desc
    )
WHERE
    body_rank <= 5
ORDER BY
    model;
```


### 3. What are the top models for each body type and for every maker?
To focus on what month or season in selling cars to generate higher income.

```sql
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
```


### 4. What are the car model sold at higher price compared to its average selling price?
To sell cars that has the highest ratio for higher average order value.

```sql
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
```


### 5. What is the relationship of condition and odometer to the selling price and number of sales?
To prioritize the selling of cars in relation to its condition and odometer.

2.1 SQL
```sql
SELECT
    CASE
        when cast(condition as integer) between 0 and 10 then '0-10'
        when cast(condition as integer) between 11 and 20 then '11-20'
        when cast(condition as integer) between 21 and 30 then '21-30'
        when cast(condition as integer) between 31 and 40 then '31-40'
        when cast(condition as integer) between 41 and 50 then '41-50'
    end as group_condition,
    count(*) as total_sales,
    round(avg(selling_price),0) as avg_price
FROM
    car_data
GROUP BY
    group_condition
ORDER BY
    avg_price desc;
```

2.2 SQL
```sql
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
```


### 6. Show the car details that is sold more than once.
To determine the brands that can be sold more than once.

```sql
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
    total_unique_sale > 3
ORDER BY
    total_unique_sale desc;
```

# V. What I Learned
1. Enhance my skill into an advance level specially in querying data from the database. This also includes cleaning of the raw data.
2. Mastering my sql skills specially in data definition language (creating tableds), subquery and window functions.
3. Develop new skill through git and github by showing my projects into the public.
4. Improve my critical thinking skills through giving insights base on queried data.

# VI. Conclusions & Insights

There are different factors affecting price of cars. In order to maximize sales and income, the following factors should be considered:

### State:
Volume alone or average price alone can't be considered as main driving factor to focus on a specific state. For example, FL has the highest volume however it's average price was only rank 14. In average price, ON is the highest but rank 26 on volume. This means that increasing the volume and average price for these factor can increase the profit. As of now, the best state that should maintain it's sales are PA, IL and TN due to it's high volume and high average price of cars.

### Make & Model:
The top 3 highest selling maker of cars are Ford, Nissan and Toyota. It implies that the stocks of these cars should maintain a high level in order to maintain the sales that provide high profit.

### Seasonality:
The best months months in terms of sales are early of months of the year (January & February) and mid year (May & June). This is possibly due to the holiday promotions and mid-year promotions. In order to increase the sales for the rest of the year, strategic technique should be followed in the same way of early year and mid-year.

### Higher Price Than Average:
The highest sell-price ratio is Ford which is about 16x to it's average price even Ford is not a luxury brand. A high ratio doesn't mean a luxury brand. One thing is for sure, the buyers are more interested to the reliable brands which is also supports to the one of the highest selling maker.

### Condition & Mileage:
Base on condition and mileage, mileage has more clear trend to the average price and total sales. The queried result shows that buyers are more interested with low mileage and are willing to pay higher price for these cars. We can also conclude that selling should focus on brand new cars compared to second hand ones which has already accumulated mileage.

### Reselling:
Using vehicle identification number to determine the cars that are sold more than once. The data shows that cars that are sold more that 3x are mostly luxury cars. Out of 7, 5 are luxury maker and model which accounts of 71%. This means that reselling of luxury cars has higher volume compared to ordinary one.