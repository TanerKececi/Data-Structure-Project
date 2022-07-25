use test_yourself;
update `user` set user.`name` = 'yusuf yigit'
where user.email = 'ayigit@metu.edu.tr';

update `user` set user.`name` = 'TANER TANER'
where user.email = 'taner@metu.edu.tr';

update `user` set user.`name` = 'KETE METE'
where user.email = 'mete@metu.edu.tr';
select * from `user`;