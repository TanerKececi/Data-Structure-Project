use test_yourself;
#list the most watched instructor in the system 
select w.instructor_email, count(w.instructor_email) AS numb
from watch w
group by w.instructor_email
order by numb desc
LIMIT 1

