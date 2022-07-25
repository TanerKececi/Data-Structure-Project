use test_yourself;
#list all subscribed students(emails, grade, watched_date, comment(text)) who subs, watched and commentted on video named 'video name 14'
select s.subs_student_email, st.grade , w.watched_date, c.`text` from `student` st, `subs_student` s, `watch` w, `comment` c, test t, solution_video sv 
where st.student_email=s.subs_student_email 
and s.subs_student_email=w.sub_student_email 
and s.subs_student_email=c.sub_student_email 
and c.video_name=sv.video_name 
and w.video_name=sv.video_name 
and t.test_name=sv.tst_name 
and sv.video_name="video name 14";