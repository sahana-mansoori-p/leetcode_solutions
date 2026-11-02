-- Write your PostgreSQL query statement below
with cte as (
    select
        product_id,
        min(year) as first_year
    from sales
    group by product_id
)
select
    p.product_id,
    c.first_year,
    p.quantity,
    p.price
from sales p
join cte c
on p.product_id=c.product_id
and p.year=c.first_year;