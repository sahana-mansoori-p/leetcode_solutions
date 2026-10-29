-- Write your PostgreSQL query statement below
with cte as(
    select student_id,subject,exam_date,
    count(*) over(partition by student_id,subject ) as exam_count,
    first_value(score) over( partition by student_id,subject order by exam_date asc) first_score,
    first_value(score) over( partition by student_id,subject order by exam_date desc) latest_score
    from scores)
select distinct student_id,subject,first_score,latest_score
from cte
where exam_count>1 and latest_score>first_score
order by student_id,subject;