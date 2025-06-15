-- Row_number()
SELECT customer_id, sale_date, amount,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY sale_date) AS row_num
FROM sales;

-- Rank()
SELECT product_id, sale_id, amount,
RANK() OVER (PARTITION BY product_id ORDER BY amount DESC) AS rank_product
FROM sales;

-- Dense_rank()
SELECT product_id, sale_id, amount,
DENSE_RANK() OVER (PARTITION BY product_id ORDER BY amount DESC) AS denserank_product
FROM sales;

-- First_value()
SELECT customer_id, sale_date, amount,
FIRST_VALUE(amount) OVER (PARTITION BY customer_id ORDER BY sale_date) AS first_amount
FROM sales;

-- Last_value()
SELECT customer_id, sale_date, amount,
LAST_VALUE(amount) OVER (
  PARTITION BY customer_id ORDER BY sale_date 
  RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS last_amount
FROM sales;

-- Nth_value()
SELECT customer_id, sale_date, amount,
NTH_VALUE(amount, 2) OVER (
  PARTITION BY customer_id ORDER BY sale_date 
  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS second_amount
FROM sales;

-- Listagg()
SELECT customer_id,
LISTAGG(product_id, ', ') WITHIN GROUP (ORDER BY product_id) AS products
FROM sales
GROUP BY customer_id;

-- Lead()
SELECT customer_id, sale_date, amount,
LEAD(amount) OVER (PARTITION BY customer_id ORDER BY sale_date) AS next_amount
FROM sales;

-- Lag()
SELECT customer_id, sale_date, amount,
LAG(amount) OVER (PARTITION BY customer_id ORDER BY sale_date) AS previous_amount
FROM sales;

-- Avg() OVER
SELECT customer_id, sale_date, amount,
AVG(amount) OVER (PARTITION BY customer_id) AS avg_amount
FROM sales;

-- Min() OVER
SELECT customer_id, sale_date, amount,
MIN(amount) OVER (PARTITION BY customer_id) AS min_amount
FROM sales;

-- Max() OVER
SELECT customer_id, sale_date, amount,
MAX(amount) OVER (PARTITION BY customer_id) AS max_amount
FROM sales;

