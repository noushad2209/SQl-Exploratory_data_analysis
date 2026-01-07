-- Find the Total Sales.
SELECT sum(sales) as Total_sales FROM gold.fact_sales

-- Find how many items are sold.
SELECT sum(qunatity) as Total_quantity FROM gold.fact_sales

-- Find the average selling price.
SELECT avg(price) as Avg_price FROM gold.fact_sales

-- Find the Total number of Orders.
SELECT count(sls_ord_num) as Total_orders FROM gold.fact_sales
SELECT count(distinct(sls_ord_num)) as Total_orders FROM gold.fact_sales

-- Find the Total number of Products.
SELECT count(distinct(product_name)) as Total_products FROM gold.dim_products

-- Find the Total number of customers.
SELECT count(distinct(customer_key)) as Total_orders FROM gold.dim_customers

-- Find the Total number of Customers that has placed and order.
SELECT count(distinct(customer_key)) as Total_orders FROM gold.dim_customers

-- Genearte a report that shows asll key matics of the business.
SELECT 'Total Sales' as Measure_name ,sum(sales) as Measure_Value FROM gold.fact_sales
union all
SELECT 'Total Qunatity', sum(qunatity) FROM gold.fact_sales
union all
SELECT 'Average Price', avg(price) as Avg_price FROM gold.fact_sales
union all
SELECT 'Total Orders', count(distinct(sls_ord_num)) as Total_orders FROM gold.fact_sales
union all
SELECT 'Total Products',count(distinct(product_name)) as Total_products FROM gold.dim_products
union all
SELECT 'Total Customers',count(distinct(customer_key)) as Total_orders FROM gold.dim_customers
union all
SELECT 'Total customers_placed_orders',count(distinct(customer_key)) as Total_orders FROM gold.dim_customers
