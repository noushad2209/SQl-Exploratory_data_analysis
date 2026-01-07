-- Which 5 Products generates the highest revenue
SELECT top 5
	d.product_name,
	sum(f.sales) as Revenue
FROM gold.fact_sales f
left join gold.dim_products d
on	 f.product_key=d.product_key
sum(f.sales)
order by Revenue desc

select * from (
SELECT
	d.product_name,
	sum(f.sales) as Revenue,
	row_number() over(order by sum(f.sales) desc) as rank_products
FROM gold.fact_sales f
left join gold.dim_products d
on	 f.product_key=d.product_key
group by d.product_name)t 
where rank_products <=5
-- What are 5 worst-performing products in terms of sales?
SELECT top 5
	d.product_name,
	sum(f.sales) as Revenue
FROM gold.fact_sales f
left join gold.dim_products d
on	 f.product_key=d.product_key
group by d.product_name
order by Revenue