 

with cte as (
    select p.product_id,p.product_name from product p
    join sales s on p.product_id=s.product_id
    group by s.product_id,p.product_id,p.product_name
    having max(s.sale_date)<='2019-03-31'
    and min(sale_date)>='2019-01-01'

)
select c.product_id,c.product_name from cte c;
 
