CREATE DATABASE test_yourself;
use test_yourself;
CREATE TABLE `user` (
  `email` varchar(40) PRIMARY KEY,
  `password` VARCHAR(40) NOT NULL,
  `surname` VARCHAR(40) NOT NULL,
  `name` VARCHAR(40) NOT NULL,
  `phone_number` VARCHAR(13),
  `security_number` INT NOT NULL,
  `expire_year` INT NOT NULL,
  `expire_month` INT NOT NULL,
  `credit_card_no` INT NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `dob` DATE NOT NULL
  );
  
  CREATE TABLE `instructor` (
  `instructor_email` varchar(40) PRIMARY KEY,
  foreign key(`instructor_email`) references `user`(`email`) ON DELETE CASCADE
);

CREATE TABLE `student` (
  `student_email` varchar(40) PRIMARY KEY,
  `grade` INT NOT NULL,
  foreign key(`student_email`) references `user`(`email`) ON DELETE CASCADE
);

CREATE TABLE `admin` (
  `admin_email` varchar(40) PRIMARY KEY,
  foreign key(`admin_email`) references `user`(`email`) ON DELETE CASCADE
);

CREATE TABLE `instructor_subject` (
  `Ins_email` varchar(40) NOT NULL,
  `subject` varchar(40) NOT NULL,
  PRIMARY KEY(`Ins_email`, `subject`),
  foreign key(`Ins_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE
);

CREATE TABLE `instructor_diploma` (
  `Ins_email` varchar(40) NOT NULL,
  `diploma` varchar(40) NOT NULL,
  PRIMARY KEY(`Ins_email`, `diploma`),
  foreign key(`Ins_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE
);

CREATE TABLE `subs_student` (
  `subs_student_email` varchar(40) primary key,
  `subs_date` DATE NOT NULL,
  foreign key(`subs_student_email`) references `student`(`student_email`) ON DELETE CASCADE
);

CREATE TABLE `not_subs_student` (
  `not_subs_student_email` varchar(40) PRIMARY KEY,
  `grade` INT NOT NULL,
  foreign key(`not_subs_student_email`) references `student`(`student_email`) ON DELETE CASCADE
);

CREATE TABLE `rate` (
  `instructor_email` varchar(40) NOT NULL,
  `sub_student_email` varchar(40) NOT NULL,
  `stars` INT NOT NULL,
  PRIMARY KEY(`instructor_email`,`sub_student_email`),
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE,
  foreign key(`sub_student_email`) references `subs_student`(`subs_student_email`) ON DELETE CASCADE
);

CREATE TABLE `ticket` (
  `ticket_id` INT PRIMARY KEY auto_increment,
  `category` varchar(40) NOT NULL,
  `content` varchar(40) NOT NULL,
  `admin_email` varchar(40),
  `check_date` date,
  foreign key(`admin_email`) references `admin`(`admin_email`) ON DELETE CASCADE
);

CREATE TABLE `student_ticket` (
  `ticket_id` INT PRIMARY KEY auto_increment,
  `student_email` varchar(40) NOT NULL,
  foreign key(`student_email`) references `student`(`student_email`) ON DELETE CASCADE,
  foreign key(`ticket_id`) references `ticket`(`ticket_id`) ON DELETE CASCADE
);

CREATE TABLE `instructor_ticket` (
  `ticket_id` INT PRIMARY KEY auto_increment,
  `instructor_email` varchar(40) NOT NULL,
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE,
  foreign key(`ticket_id`) references `ticket`(`ticket_id`) ON DELETE CASCADE
);

CREATE TABLE `test` (
  `test_name` varchar(40) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `num_of_questions` INT NOT NULL,
  `upload_date` date NOT NULL,
  primary key(`test_name`,`instructor_email`),
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE
);

CREATE TABLE `solution_video` (
  `video_name` varchar(40) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `duration` time NOT NULL,
  `add_date` date NOT NULL,
  `tst_name` varchar(40) NOT NULL,
  primary key(`video_name`,`instructor_email`),
  foreign key(`tst_name`) references `test`(`test_name`) ON DELETE CASCADE,
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE
);

CREATE TABLE `question` (
  `question_number` INT NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `image` BLOB,
  `question_subject` varchar(40) NOT NULL,
  `question_body` varchar(200) NOT NULL,
  `tst_name` varchar(40) NOT NULL,
  primary key(`question_number`,`instructor_email`),
  foreign key(`tst_name`) references `test`(`test_name`) ON DELETE CASCADE,
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE
);

CREATE TABLE `option` (
  `option_letter`  VARCHAR(1) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `question_number` INT NOT NULL ,
  `option_body` varchar(200) NOT NULL,
  primary key(`option_letter`,`instructor_email`, `question_number`),
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE,
  foreign key(`question_number`) references `question`(`question_number`) ON DELETE CASCADE
);

CREATE TABLE `wrong_option` (
  `w_option_letter`  VARCHAR(1) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `question_number` INT NOT NULL ,
  primary key(`w_option_letter`,`instructor_email`, `question_number`),
  foreign key(`w_option_letter`) references `option`(`option_letter`) ON DELETE CASCADE,
  foreign key(`question_number`) references `question`(`question_number`) ON DELETE CASCADE,
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE
);

CREATE TABLE `correct_option` (
  `c_option_letter`  VARCHAR(1) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `question_number` INT NOT NULL ,
  primary key(`c_option_letter`,`instructor_email`, `question_number`),
  foreign key(`c_option_letter`) references `option`(`option_letter`) ON DELETE CASCADE,
  foreign key(`question_number`) references `question`(`question_number`) ON DELETE CASCADE,
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE
);

CREATE TABLE `comment` (
  `sub_student_email`  VARCHAR(40) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `text` varchar(200) NOT NULL,
  `video_name` varchar(40) NOT NULL,

  primary key(`sub_student_email`,`instructor_email`,`video_name`),
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE,
  foreign key(`video_name`) references `solution_video`(`video_name`) ON DELETE CASCADE,
  foreign key(`sub_student_email`) references `subs_student`(`subs_student_email`) ON DELETE CASCADE
);

CREATE TABLE `watch` (
  `sub_student_email`  VARCHAR(40) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `time_spent` time NOT NULL,
  `watched_date` date NOT NULL,
  `video_name` varchar(40) NOT NULL,

  primary key(`sub_student_email`,`instructor_email`,`video_name`),
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE,
  foreign key(`video_name`) references `solution_video`(`video_name`) ON DELETE CASCADE,
  foreign key(`sub_student_email`) references `subs_student`(`subs_student_email`) ON DELETE CASCADE
);

CREATE TABLE `solve` (
  `sub_student_email`  VARCHAR(40) NOT NULL,
  `instructor_email` varchar(40) NOT NULL,
  `solve_duration` time NOT NULL,
  `test_name` varchar(40) NOT NULL,

  primary key(`sub_student_email`,`instructor_email`,`test_name`),
  foreign key(`instructor_email`) references `instructor`(`instructor_email`) ON DELETE CASCADE,
  foreign key(`test_name`) references `test`(`test_name`) ON DELETE CASCADE,
  foreign key(`sub_student_email`) references `subs_student`(`subs_student_email`) ON DELETE CASCADE
);