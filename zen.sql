-- The Following are the tables has to be in your database & model deisgn:
-- users
-- codekata
-- attendance
-- topics
-- tasks
-- company_drives
-- mentors
-- students_activated_courses
-- courses

DROP DATABASE IF EXISTS zen_class;

-- The following are the queries need to be executed
CREATE DATABASE IF NOT EXISTS zen_class;

USE zen_class;
-- 1. Create tables for the above list given
-- users
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(30) NOT NULL,
    user_first_name  VARCHAR(30) DEFAULT NULL,
    user_last_name  VARCHAR(30) DEFAULT NULL,
    email VARCHAR(50) NOT NULL,
    mobile INT NOT NULL,
	user_join_date DATETIME DEFAULT NULL,
	date_of_birth DATE DEFAULT NULL,
    PRIMARY KEY (id)
)ENGINE=INNODB;

-- codekata
CREATE TABLE IF NOT EXISTS codekata (
	id INT NOT NULL AUTO_INCREMENT,
    problem_title VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    problem_statement VARCHAR(255) NOT NULL,
    test_case VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS students_solved_problems (
	id INT NOT NULL AUTO_INCREMENT,
	problem_id INT NOT NULL, 
	student_id INT NOT NULL,
    student_solution VARCHAR(500) DEFAULT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(problem_id) REFERENCES codekata (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(student_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

-- topics
CREATE TABLE IF NOT EXISTS topics (
	id INT NOT NULL AUTO_INCREMENT,
	topic_title VARCHAR(50) NOT NULL,
	category VARCHAR(50) NOT NULL,
    topic_content VARCHAR(255) NOT NULL,
    pre_req VARCHAR(255) NOT NULL,
    pre_read VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB;

-- tasks
CREATE TABLE IF NOT EXISTS tasks (
	id INT NOT NULL AUTO_INCREMENT,
	topic_id INT NOT NULL,
    task_title VARCHAR(255) NOT NULL,
    task_desc VARCHAR(255) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(topic_id) REFERENCES topics (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS students_completed_task (
    id INT NOT NULL AUTO_INCREMENT,
	task_id INT NOT NULL,
	student_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(task_id) REFERENCES tasks (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(student_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

-- company_drives
CREATE TABLE IF NOT EXISTS company_drives (
	id INT NOT NULL AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    role_desc VARCHAR(500) NOT NULL,
    qualification_desc VARCHAR(500) NOT NULL,
    exprience VARCHAR(50) NOT NULL,
    ctc VARCHAR(50) NOT NULL,
    drive_venue  VARCHAR(255) NOT NULL,
    drive_date DATE NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS students_attended_company_drives (
    id INT NOT NULL AUTO_INCREMENT,
	company_drive_id INT NOT NULL,
	student_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(company_drive_id) REFERENCES company_drives (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(student_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

-- mentors
CREATE TABLE IF NOT EXISTS mentors (
    id INT NOT NULL AUTO_INCREMENT,
    mentor_name VARCHAR(30) NOT NULL,
    mentor_first_name  VARCHAR(30) DEFAULT NULL,
    mentor_last_name  VARCHAR(30) DEFAULT NULL,
    email VARCHAR(50) NOT NULL,
    mobile INT NOT NULL,
	date_of_birth DATE DEFAULT NULL,
    mentor_role VARCHAR(255),
	mentor_join_date DATETIME DEFAULT NULL,
    PRIMARY KEY (id)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS students_assigned_mentor (
    id INT NOT NULL AUTO_INCREMENT,
	mentor_id INT NOT NULL,
	student_id INT NOT NULL, 
    PRIMARY KEY(id),
    FOREIGN KEY(mentor_id) REFERENCES mentors (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(student_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

-- courses
CREATE TABLE IF NOT EXISTS courses (
	id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(255) NOT NULL,
    course_desc VARCHAR(255) NOT NULL,
    course_duration VARCHAR(50) NOT NULL,
    course_duration_in_days INT NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB;

-- students_activated_courses
CREATE TABLE IF NOT EXISTS students_activated_courses (
	id INT NOT NULL AUTO_INCREMENT,
	student_id  INT NOT NULL,
	course_id  INT NOT NULL,
	date_of_join DATE NOT NULL NOT NULL,
    date_of_course_end DATE NOT NULL NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(student_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(course_id) REFERENCES courses (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

-- attendance
CREATE TABLE IF NOT EXISTS attendance (
	id INT NOT NULL AUTO_INCREMENT,
	user_id  INT NOT NULL,
    date_of_day DATE NOT NULL,
    present_absent BIT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=INNODB;

SET SQL_SAFE_UPDATES=0;
-- 2. insert at least 5 rows of values in each table
INSERT INTO users (user_name, user_first_name, user_last_name, email, mobile, date_of_birth, user_join_date) VALUES 
	("Meyazhagan", "First name", "last name", "meyazhagan@gmail.com", 987654321, "1999-01-01", "2021-10-31 18:24:00"),
    ("xyz", "First name", "last name", "xyz@gmail.com", 987654321, "1999-04-28", "2021-10-31 18:24:00"),
    ("user", "First name", "last name", "user@gmail.com", 987654321, "1999-04-08", "2021-10-31 18:24:00"),
    ("student", "First name", "last name", "student@gmail.com", 987654321, "1999-08-09", "2021-10-31 18:24:00"),
    ("john", "First name", "last name", "john@gmail.com", 987654321, "1999-05-25", "2021-10-31 18:24:00"),
    ("Student1", "First name", "last name", "Student1@gmail.com", 987654321, "1999-01-01", "2021-10-31 18:24:00"),
    ("Student2", "First name", "last name", "Student2@gmail.com", 987654321, "1999-04-28", "2021-10-31 18:24:00"),
    ("Student3", "First name", "last name", "Student3@gmail.com", 987654321, "1999-04-08", "2021-10-31 18:24:00"),
    ("Student4", "First name", "last name", "Student4@gmail.com", 987654321, "1999-08-09", "2021-10-31 18:24:00"),
    ("Student5", "First name", "last name", "Student5@gmail.com", 987654321, "1999-05-25", "2021-10-31 18:24:00");

INSERT INTO mentors (mentor_name, mentor_first_name, mentor_last_name, email, mobile, date_of_birth, mentor_join_date, mentor_role) VALUES 
    ("mentor1", "First name", "last name", "mentor1@gmail.com", 987654321, "1999-01-01", "2021-10-31 18:24:00", "HTML, CSS"),
    ("mentor2", "First name", "last name", "mentor2@gmail.com", 987654321, "1999-04-28", "2021-10-31 18:24:00", "AWS"),
    ("mentor3", "First name", "last name", "mentor3@gmail.com", 987654321, "1999-04-08", "2021-10-31 18:24:00", "DSA"),
    ("mentor4", "First name", "last name", "mentor4@gmail.com", 987654321, "1999-08-09", "2021-10-31 18:24:00", "JAVASCRIPT, REACT"),
    ("mentor5", "First name", "last name", "mentor5@gmail.com", 987654321, "1999-05-25", "2021-10-31 18:24:00", "NODE JS");

INSERT INTO students_assigned_mentor (mentor_id, student_id) VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 2),
    (2, 4),
    (3, 2),
    (4, 2),
    (4, 3),
    (4, 4),
    (5, 4),
    (5, 5);


INSERT INTO courses (course_title, course_desc, course_duration, course_duration_in_days) VALUES 
    ("Full Stack Development", "Tech Stack - MERN Stack", "3 months - weekdays", 90),
    ("Full Stack Development", "Tech Stack - MERN Stack", "6 months - weekends", 180),
    ("Full Stack Development", "Tech Stack - MEAN Stack", "3 months - weekdays", 90),
    ("Full Stack Development", "Tech Stack - MEAN Stack", "6 months - weekends", 180),
    ("Data Analytics", "Python, Data Visualization, ML", "6 months - weekends", 180);

INSERT INTO students_activated_courses (student_id, course_id, date_of_join, date_of_course_end) VALUES 
    (1, 1, "2021-07-01", "2021-10-01"),
    (2, 2, "2021-07-01", "2022-01-01"),
    (3, 3, "2021-08-01", "2021-11-01"),
    (4, 4, "2021-08-01", "2022-02-01"),
    (5, 5, "2021-09-01", "2022-03-01"),
    (6, 1, "2021-07-01", "2021-10-01"),
    (7, 2, "2021-07-01", "2022-01-01"),
    (8, 3, "2021-08-01", "2021-11-01"),
    (9, 4, "2021-08-01", "2022-02-01"),
    (10, 5, "2021-09-01", "2022-03-01");

INSERT INTO topics (topic_title, topic_content, category, pre_req, pre_read) VALUES 
    ("Introduction to HTML", "HTML Tags like H1, H2 etc..", "HTML", "NA", "NA"),
    ("CSS", "CSS Selectors","CSS", "Basic understanding of HTMl", "CSS features"),
    ("Javascript", "DOM manipulation","JS", "Basic understanding of HTML and CSS",  "Basic understanding of es6 Features"),
    ("React", "Building components", "REACT", "core concepts of javascript es6", "es6 Features"),
    ("Node Js", "Javascript in Server side", "NODEJS", "Basic understanding of Networks", "Node package manager");

INSERT INTO tasks (topic_id, task_title, task_desc) VALUES 
    (1, "HTML Task", "Create an basic HTML file"),
    (2, "CSS Task", "Create an user card"),
    (3, "Javascript Task", " Dynamically load data"),
    (4, "React", "Create counter component"),
    (5, "Node Js", "Create server for posts");
    
INSERT INTO students_completed_task (student_id, task_id) VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 3),
    (3, 4),
    (4, 1),
    (4, 5),
    (5, 1),
    (5, 3),
    (5, 4);

INSERT INTO codekata (problem_title, problem_statement, category, test_case) VALUES 
    ("Two sum", "Find two index to get target", "ARRAY", "[{I:[2,3,4,5]\n7,O:[0,3]}]"),
    ("Fibonacci series", "Find fibonacci numbers", "RECCURSION", "[{I:5,O:1 1 2 3 5}]"),
    ("Is Even", "Find the Given number is even", "ARRAY", "[{I:5,O:not even}]"),
    ("Is Prime", "Find the Given number is prime", "ARRAY", "[{I:5,O:is prime}]"),
    ("Is Palindrome", "Find the Given word is palindrome", "ARRAY", "[{I:madam,O:yes}]");
    
INSERT INTO students_solved_problems (student_id, problem_id) VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (2, 1),
    (2, 2),
    (3, 1),
    (3, 3),
    (3, 4),
    (4, 1),
    (4, 5),
    (5, 1),
    (5, 3),
    (5, 4);

INSERT INTO company_drives 
    (company_name,
    role_desc, 
    qualification_desc,
    exprience,
    ctc,
    drive_venue,
    drive_date) VALUES 
    ("PAYPAL", "MERN Stack developer","B.E, B.Tech", "0-2 years", "7LPA", "Chennai", "2021-08-10"),
    ("JUSPAY", "Full Stack developer","B.E, B.Tech", "0-2 years", "10LPA", "Chennai", "2021-10-10"),
    ("INFOSYS", "Software developer","B.E, B.Tech", "0-2 years", "4LPA", "Chennai", "2021-09-10"),
    ("TCS", "Front end developer","B.E, B.Tech", "0-2 years", "6LPA", "Chennai", "2021-07-10"),
    ("ZOHO", "Back end developer","B.E, B.Tech", "0-2 years", "9LPA", "Chennai", "2021-06-10");
    
INSERT INTO students_attended_company_drives (student_id, company_drive_id) VALUES
	(1, 1),
    (1, 3),
    (1, 5),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (3, 1),
    (3, 3),
    (4, 1),
    (4, 2),
    (4, 3),
    (4, 4),
    (4, 5),
    (5, 1),
    (5, 3),
    (5, 4);

INSERT INTO attendance (user_id, date_of_day, present_absent) VALUES 
    (1, "2021-10-28", 1),
    (2, "2021-10-28", 1),
    (3, "2021-10-28", 1),
    (4, "2021-10-28", 1),
    (5, "2021-10-28", 1),
    (1, "2021-10-29", 1),
    (2, "2021-10-29", 0),
    (3, "2021-10-29", 1),
    (4, "2021-10-29", 0),
    (5, "2021-10-29", 1),
    (1, "2021-10-30", 0),
    (2, "2021-10-30", 1),
    (3, "2021-10-30", 0),
    (4, "2021-10-30", 1),
    (5, "2021-10-30", 1);
-- 3. get number problems solved in codekata by combining the users

SELECT student_id, user_name, count(*) as no_of_problems_solved 
FROM students_solved_problems as l
JOIN users as r
ON l.student_id=r.id
GROUP BY student_id;

-- -- 4. display the no of company drives attended by a user
SELECT student_id, user_name , count(*) as no_of_company_drives_attended
FROM students_attended_company_drives as s
JOIN users as u
ON s.student_id=u.id
GROUP BY student_id;

-- -- 5. combine and display students_activated_courses and courses for a specific user groping them based on the course
SELECT course_id,student_id, user_name, course_title, course_desc, course_duration
FROM students_activated_courses AS s
JOIN users AS u
ON s.student_id=u.id
JOIN courses AS c
ON s.course_id=c.id
ORDER BY course_id;

-- -- 6. list all the mentors
 SELECT * FROM mentors;

-- -- 7. list the number of students that are assigned for a mentor
SELECT mentor_id, mentor_name , count(*) as no_of_students_assigned
FROM students_assigned_mentor as s
JOIN mentors as m
ON s.mentor_id=m.id
GROUP BY mentor_id;