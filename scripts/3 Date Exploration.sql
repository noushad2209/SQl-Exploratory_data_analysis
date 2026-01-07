-- Find the date of the first and last order
SELECT 
	min(order_date) as first_order_date,
	max(order_date) as last_order_date,
	datediff(year,min(order_date),max(order_date)) as Order_range_year
from gold.fact_sales


--Find the youngest and the oldest customers
SELECT 
	min(birstdate) as oldest_customer,
	max(birstdate) as youngest_customer,
	datediff(year,min(birstdate),GETDATE()) as oldest_customer_age,
	datediff(year,max(birstdate),GETDATE()) as youngest_customer_age
FROM gold.dim_customers