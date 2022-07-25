use test_yourself;
#assuming current user is 'useremail10'
select Email, name, surname, credit_card_no, expire_month, expire_year, security_number from user where user.email = 'useremail10';