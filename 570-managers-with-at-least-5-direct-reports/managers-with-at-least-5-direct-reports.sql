-- Write your PostgreSQL query statement below
select e.name from Employee e
join Employee m on m.managerId=e.id
group by e.name,e.id
having count(e.id)>=5;