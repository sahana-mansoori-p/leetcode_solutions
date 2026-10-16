with cte as(
    select
    id,name,salary,rank() over (partition by departmentid order by salary desc) as rank,departmentid
    from employee
)
select d.name as department,c.name as employee,c.salary
from cte c
join department d on c.departmentid=d.id
where c.rank=1;