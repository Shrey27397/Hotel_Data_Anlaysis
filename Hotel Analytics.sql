-- Creating Database for Hotel Revenue Analysis

Create Database Hotel_Revenue;

Use Hotel_Revenue;

-- combining all the data tables into one temporary table
Create view hotels as(
Select * from hotel_revenue_2018
union
Select * from hotel_revenue_2019
union
Select * from hotel_revenue_2020
);

-- checking if the revenue is growing over the years or not by hotel type

Select arrival_date_year, hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr))as revenue
from hotels
group by arrival_date_year, hotel;

-- joining table meal_cost and market_segment with hotels
Select round(sum((stays_in_week_nights+stays_in_weekend_nights)*(adr*discount)))as revenue  from hotels
left join market_segment 
on hotels.market_segment = market_segment.market_segment
left join meal_cost
on meal_cost.meal = hotels.meal;





