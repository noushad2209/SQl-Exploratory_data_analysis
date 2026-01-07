-- Explore All Countries our customers comoe from.
SELECT DISTINCT country FROM gold.dim_customers


-- Explore All catgories "The major Division".
SELECT DISTINCT category, sub_category, product_name FROM gold.dim_products