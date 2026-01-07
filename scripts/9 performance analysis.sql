-- current{measure} - target{measure}
--=================================================

/*--Analyize the yearly performance of product by comaparing thier sales
    to both the avergae sales performance of the product and the previous year's sales
*/

with yearly_product_sales as (
select
	year(s.order_date) as order_date,
	p.product_name,
	sum(s.sales) as current_sales
from gold.fact_sales s
left join gold.dim_products p
on	 s.product_key=p.product_key
where year(s.order_date) is not null
group by year(s.order_date),product_name
)

select 
	order_date,
	product_name,
	current_sales,
	avg(current_sales)over(partition by product_name) as avg_sales,
	current_sales-avg(current_sales)over(partition by product_name) as sales_diff,
	case when current_sales-avg(current_sales)over(partition by product_name)> 0 then 'Above Avg'
		 when current_sales-avg(current_sales)over(partition by product_name)<0 then 'Below Avg'
		 else 'Avg'
	end as sales_diff_flag,
	lag(current_sales) over(partition by product_name order by order_date) as prv_sales,
	current_sales-lag(current_sales) over(partition by product_name order by order_date) as pvs_sales_diff,
	case when current_sales-lag(current_sales) over(partition by product_name order by order_date)>0 then 'Increased'
		 when current_sales-lag(current_sales) over(partition by product_name order by order_date)<0 then 'Decreased'
		 else 'No change'
	end as prv_sales_falg
from yearly_product_sales
order by product_name,order_date