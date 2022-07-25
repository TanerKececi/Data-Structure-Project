#list a partitular instructor's name surname and total duration of his/her solution videos
use test_yourself;
SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(sv.duration))) as 'Total Time', sv.instructor_email, usr.name, usr.surname
FROM solution_video sv, `user` usr where sv.instructor_email = 'useremail1' and usr.email = sv.instructor_email;
