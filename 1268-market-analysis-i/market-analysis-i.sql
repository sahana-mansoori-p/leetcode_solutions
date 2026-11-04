-- Write your PostgreSQL query statement below
with cte as (
    select buyer_id , order_date 
    from orders 
    where extract(year from order_date)=2019
)
select distinct u.user_id as buyer_id,u.join_date,count(c.order_date) as orders_in_2019
from users u
left join cte c on u.user_id=c.buyer_id
group by u.user_id,u.join_date;