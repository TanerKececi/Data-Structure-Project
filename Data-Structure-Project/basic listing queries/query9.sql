use test_yourself;
#assuming instructor email is 'useremail4'
select u.* from `user` u, rate r where r.instructor_email = 'useremail4' and u.email = r.sub_student_email;