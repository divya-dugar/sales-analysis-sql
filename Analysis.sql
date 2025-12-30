-- DATA OVERVIEW
-- Total sales records 
select Count(*) AS Total_Sales_records
from sales;
-- Data range covered
select 
min(sale_date) as first_sale_date,
max(sale_date) as last_sale_date
from sales;
-- unique counts
select 
count(distinct product_name) as total_products,
count(distinct category) as total_categories,
count(distinct region) as total_regions 
from sales ;

-- KEY KPIs
-- Total revenue
select
sum(sale_amount) as total_revenue
from sales;
-- Avgerage sale value 
select
avg(sale_amount) as avg_sale_value
from sales;

-- REVENUE BREAKDOWN
-- Revenue by product
select 
product_name,
sum(sale_amount) as product_revenue
from sales 
group by product_name 
order by product_revenue desc;
-- Revenue by category
select
category,
sum(sale_amount) as category_revenue
from sales 
group by category 
order by category_revenue desc ;
-- Revenue by region 
select 
region,
sum(sale_amount) as region_revenue
from sales 
group by region  
order by region_revenue desc ;

-- products with above average total revenue 
select * from (select 
product_name,
sum(sale_amount) as total_revenue,
avg(sum(sale_amount)) over () as avg_total_revenue
from sales
group by product_name)t
where total_revenue> avg_total_revenue;
--  regions which contribute more than 30% of total revenue 
select * from (select region,
sum(sale_amount) as region_revenue,
sum(sum(sale_amount)) over() as total_revenue
from sales 
group by region )t where 
region_revenue * 1.0/total_revenue >0.3;
-- PARETO(80-20) ANALYSIS
select * from (select product_name,
sum(sale_amount) as product_total,
sum(sum(sale_amount)) over (order by sum(sale_amount) desc) as running_revenue,
sum(sum(sale_amount)) over() as total_revenue
from sales 
group by product_name)t 
where running_revenue/total_revenue <=0.8;

-- TIME ANALYSIS
-- daily revenue
select sale_date,
sum(sale_amount) as daily_revenue
from sales 
group by sale_date 
order by daily_revenue desc;
-- peak revenue day
select sale_date,
sum(sale_amount) as total_revenue
from sales 
group by sale_date 
order by total_revenue
limit 1;
-- 3-day moving average of daily revenue
select *, 
round(avg(total_revenue) over (order by sale_date rows between 2 preceding and current row),2)
as moving_avg_3_days 
 from (select 
sale_date,
sum(sale_amount) as total_revenue
from sales 
group by sale_date)t
order by sale_date;

-- SALES TREND ANALYSIS
select 
product_name,sale_date,sale_amount,
lag(sale_amount,1,0) over (partition by product_name order by sale_date) as previous_value,
sale_amount - lag(sale_amount,1,0) over (partition by product_name order by sale_date) as diff_from_previous
from sales
order by product_name;
-- CASE
select *,
case 
when previous_value is null then 'No previous data'
when sale_amount>previous_value then 'Increase'
when sale_amount< previous_value then 'decrease'
end as sales_trend
from(
select 
product_name,sale_date,sale_amount,
lag(sale_amount) over (partition by product_name order by sale_date) as previous_value,
sale_amount - lag(sale_amount) over (partition by product_name order by sale_date) as diff_from_previous
from sales)t;
