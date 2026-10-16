(select distinct ON(product_id) product_id ,new_price as price from products
where change_date<='2019-08-16'
order by product_id, change_date DESC 
)
union all

select product_id, 10 as price from products
group by product_id
having min(change_date)>'2019-08-16'
;