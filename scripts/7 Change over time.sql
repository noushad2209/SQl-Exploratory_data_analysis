-- Analyze sales peroformance over time	
SELECT
	year(order_date) as order_year,
	month(order_date) as order_month,
	sum(sales) as Sales_amount,
	count(distinct(customer_key)) as total_customers,
	sum(qunatity) as total_quantity
FROM gold.fact_sales
where order_date is not null
group by month(order_date),year(order_date)
order by year(order_date),month(order_date)

-- Analyze sales peroformance over time	
SELECT
	DATETRUNC(month,order_date) as order_date,
	sum(sales) as Sales_amount,
	count(distinct(customer_key)) as total_customers,
	sum(qunatity) as total_quantity
FROM gold.fact_sales
where order_date is not null
group by DATETRUNC(MONTH,order_date)
order by DATETRUNC(MONTH,order_date)