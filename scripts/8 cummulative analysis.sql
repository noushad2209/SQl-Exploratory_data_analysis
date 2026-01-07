-- cummulative measure by Date dimenasion
--=======================================
-- Calculate the total sales per month and the running total of sales over time

select
	order_date,
	Total_sales,
	sum(Total_sales) over(partition by order_date order by order_date) as running_total,
	avg(average_price) over(partition by order_date order by average_price) as running_price
from
(
	SELECT
	datetrunc(month,order_date) as order_date,
	sum(sales) as Total_sales,
	avg(price) as average_price
	FROM gold.fact_sales
	where datetrunc(month,order_date) is not null
	group by datetrunc(month,order_date)
)t