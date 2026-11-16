-- Write your PostgreSQL query statement below
with cte as(
    select
    visited_on,
    sum(amount) as days_sum
    from customer
    group by visited_on
    order by visited_on 
)
select 
visited_on,
sum(days_sum) over(rows between 6 preceding and current row)as amount,
round(avg(days_sum)over(rows between 6 preceding and current row),2)as average_amount
from cte
offset 6;