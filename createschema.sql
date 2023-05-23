create table area(
area_name varchar(255) NOT NULL,
CONSTRAINT areaPK PRIMARY KEY(area_name));
DESCRIBE area;


create table department(
dept_name varchar(255) NOT NULL,
building varchar(255) NOT NULL,
CONSTRAINT departmentPK PRIMARY KEY(dept_name));
DESCRIBE department;


create table student(
s_ID integer NOT NULL,
s_name varchar(255) NOT NULL,
dept_name varchar(255) NOT NULL,
CONSTRAINT studentPK PRIMARY KEY(s_ID),
FOREIGN KEY (dept_name)
REFERENCES department (dept_name));
DESCRIBE student;


create table professor(
p_ID varchar(255) NOT NULL,  -- ex) 'B302837'
p_name varchar(255) NOT NULL,
dept_name varchar(255) NOT NULL,
CONSTRAINT professorPK PRIMARY KEY(p_ID),
FOREIGN KEY (dept_name)
REFERENCES department (dept_name));
DESCRIBE professor;


create table club(
club_name varchar(255) NOT NULL,
area_name varchar(255) NOT NULL,
club_president varchar(255) NOT NULL,
club_room varchar(255) NOT NULL,
club_budget integer NOT NULL,
CONSTRAINT clubPK PRIMARY KEY(club_name),
FOREIGN KEY (area_name)
REFERENCES area (area_name));
DESCRIBE club;


create table participates(
s_ID integer NOT NULL,
club_name varchar(255) NOT NULL,
FOREIGN KEY (s_ID)
REFERENCES student (s_ID)
ON DELETE CASCADE,
FOREIGN KEY (club_name)
REFERENCES club (club_name)
ON DELETE CASCADE);
DESCRIBE participates;


create table guides(
p_ID varchar(225) NOT NULL,
club_name varchar(255) NOT NULL,
FOREIGN KEY (p_ID)
REFERENCES professor (p_ID),
FOREIGN KEY (club_name)
REFERENCES club (club_name)
ON DELETE CASCADE);
DESCRIBE guides;


create table activity(
club_name varchar(255) NOT NULL,
location varchar(255) NOT NULL,
day varchar(255) NOT NULL,
start_time time NOT NULL,
FOREIGN KEY (club_name)
REFERENCES club (club_name)
ON DELETE CASCADE);
DESCRIBE activity;
