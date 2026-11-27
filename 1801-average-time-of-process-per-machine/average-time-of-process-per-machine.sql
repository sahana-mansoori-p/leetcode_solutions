select
machine_id,
round(avg(
    case 
    when activity_type='start' then -timestamp
    else timestamp
    end
    )::decimal*2,3) as processing_time
from activity
group by machine_id
order by machine_id asc;