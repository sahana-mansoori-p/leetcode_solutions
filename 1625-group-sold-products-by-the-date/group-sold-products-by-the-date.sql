-- Write your PostgreSQL query statement below
select distinct sell_date,count(distinct product) as num_sold,STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
from activities
group by sell_date
order by sell_date;