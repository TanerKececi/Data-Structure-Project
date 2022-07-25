use test_yourself;

insert into `user` (email, password, surname, name, phone_number, security_number, expire_year, expire_month, credit_card_no, address, dob)
values 
('taner@metu.edu.tr', 'tanerpassword123', 'Kececi', 'Ziya Taner', '123123123', 888, 2024, 01,123456, 'Antalya', '1997-03-10'),
('ayigit@metu.edu.tr', '123yigit123', 'Kaleli', 'Yigit', '333344444', 999, 2025, 02,1231234, 'istanbul', '1998-02-19'),
('mete@metu.edu.tr', '666mete666', 'Kabakci', 'Yusuf Mete', '555522222', 777, 2026, 03,557744, 'ankara', '1996-11-16');

select * from `user`;