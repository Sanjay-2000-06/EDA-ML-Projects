create database orders;
use orders;
select * from orders;

#find top 10 highest reveue generating products 
select product_id,sum(sale_price) as sales
from orders
group by product_id
order by sales desc
limit 10;

#find top 5 highest selling products in each region
select distinct region from orders;
with cte as (
select region,product_id,sum(sale_price) sales
from orders group by region,product_id )
select * from(
select *, row_number() over(partition by region order by sales desc) rn
from cte) t
where rn <=5;

#find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
with cte as (
select year(order_date) order_year,month(order_date) order_month,sum(sale_price) sales from orders
group by year(order_date),month(order_date)
#order by year(order_date),month(order_date)
)
select order_month,
sum(case when order_year= 2022 then sales else 0 end) sales_2022,
sum(case when order_year=2023 then sales else 0 end) sales_2023
 from cte
 group by order_month
 order by order_month;
 
#for each category which month had highest sales 
with cte as (
select category,format(order_date,'yyyyMM') order_year_month, sum(sale_price) sales
 from orders
 group by category,format(order_date,'yyyyMM')
)
select * from(
select *,
row_number() over(partition by category order by sales desc) rn
from cte) t
where rn = 1;

#which sub category had highest growth by profit in 2023 compare to 2022
with cte as (
select sub_category,
year(order_date) order_year,sum(sale_price) sales from orders
group by sub_category,year(order_date)
#order by year(order_date),month(order_date)
)
,cte2 as(
select sub_category,
sum(case when order_year= 2022 then sales else 0 end) sales_2022,
sum(case when order_year=2023 then sales else 0 end) sales_2023
 from cte
 group by sub_category
 ),
 cte3 as(
 select *
 ,(sales_2023-sales_2022)*100/sales_2022,
 row_number() over(order by (sales_2023-sales_2022)*100/sales_2022 desc) rn
 from cte2
 )
 select * from cte3 
 where rn =1;

