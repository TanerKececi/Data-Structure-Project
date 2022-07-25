use test_yourself;

delete from `user` where user.email = 'ayigit@metu.edu.tr';
delete from `user` where user.email = 'taner@metu.edu.tr';
delete from `user` where user.email = 'mete@metu.edu.tr';

select * from `user`;