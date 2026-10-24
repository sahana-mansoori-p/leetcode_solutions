with cte as(select d.name as Department ,e.name as Employee,e.salary as Salary,dense_rank()over (partition by d.name order by e.salary desc)as rank
from Employee e
left join department d
on e.departmentId=d.id
)
select 
department,
employee,
salary
from cte
where rank<=3;