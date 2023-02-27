create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class
(
    class_id int not null auto_increment primary key,
    class_name varchar(60) not null,
    start_date datetime    not null,
    `Status` bit
);
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
select * from class;
create table student
(
    student_id   int         not null auto_increment primary key,
    student_name varchar(30) not null,
    address     varchar(50),
    phone       varchar(20),
    `status`      bit,
    class_id     int         not null,
    foreign key (class_id) references class (class_id)
);
INSERT INTO Student (student_name, address, phone, `status`, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (student_name, address, `status`, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (student_name, address, phone, `status`, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
select * from student;
create table `subject`
(
    sub_id   int         not null auto_increment primary key,
    sub_name varchar(30) not null,
    credit  tinyint    not null default 1 CHECK ( Credit >= 1 ),
    `status`  bit default 1
);
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
create table mark
(
    mark_id    int not null auto_increment primary key,
    sub_id     int not null,
    student_id int not null,
    mark      FLOAT   default 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references `subject` (sub_id),
    foreign key (student_id) references student (student_id)
);
INSERT INTO Mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);