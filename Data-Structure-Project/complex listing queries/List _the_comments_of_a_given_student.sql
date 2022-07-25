use test_yourself;
#assuming subscribed student name is 'username13' and surname is 'usersurname13'
select c.`text` , u.name, u.surname from `comment` c, `subs_student` s, `user` u 
where u.surname = 'usersurname13'
and u.name = 'username13' 
and u.email = s.subs_student_email
and s.subs_student_email = c.sub_student_email;