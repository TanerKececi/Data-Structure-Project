use test_yourself;
#list the student who created most of the tickets
select st.student_email , count(st.student_email) as numb
from student_ticket st
group by st.student_email
order by numb desc
LIMIT 1