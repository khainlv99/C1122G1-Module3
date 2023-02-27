create database c1022g1_module2;
drop database c1022g1_module2;
create database my_database;
create database my_database1;
drop database my_database;
create database student_management;
use student_management;
create table student (
	`id` int primary key not null,
    `name` varchar(45) null,
    `age` int null,
    `country` varchar(45) null
);
create table class(
	`id` int primary key not null,
    `name` varchar(45) null
);
insert into class(id,name) value (1,'Nguyen Le Van Khai');
insert into class(id,name) value (2,'Le Van Phat Dat');
insert into class(id,name) value (3,'Thai Quang Truong');
insert into class(id,name) value (4,'Duong Minh Truong');
select * from class;
select id from class;
select name from class;
delete from class where id = 1;
create table teacher(
	`id` int primary key not null,
    `name` varchar(45) null,
    `age` int null,
    `country` varchar(45) null
);
insert into teacher(id,name,age,country) value (1,'Le Van Phat Dat', 12,'Dep trai');
insert into teacher(id,name,age,country) value (2,'Nguyen Le Van Khai', 12,'Dep trai');
insert into teacher(id,name,age,country) value (3,'Phan Van Dong', 12,'Dep trai');
insert into teacher(id,name,age,country) value (4,'Duong Minh Truong', 12,'Dep trai');
select * from teacher;
select id from teacher;
select name from teacher where id = 2;
select age from teacher where id = 1;
select country from teacher where id = 1;
delete from class where id = 1;