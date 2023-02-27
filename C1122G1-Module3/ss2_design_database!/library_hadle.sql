create database library;
use library;
create table category(
	id int primary key auto_increment,
    name varchar(45) null
);
create table authors(
	id int primary key auto_increment,
    name varchar(45) null
);
create table students(
	id int primary key auto_increment,
    name varchar(45) null,
    birthday varchar(45) null,
    class_name varchar(45) null
);
create table books(
	id int primary key auto_increment,
    name varchar(45) null,
    page_size int null,
    author_id int,
    category_id int,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);
drop table books;
create table borrows(
	id int primary key auto_increment,
    student_id int,
    book_id int,
    borrow_date varchar(45) null,
    return_date varchar(45) null,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (book_id) REFERENCES books(id)
);